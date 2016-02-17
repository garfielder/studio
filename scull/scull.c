#include "scull.h"

MODULE_LICENSE("Dual BSD/GPL");


static int howmany = 4;
module_param(howmany, int, S_IRUGO);

static int scull_init(void)
{
    int         err;

    printk(KERN_ALERT "scull how many is %d!\n", howmany);
    printk(KERN_INFO "The process is %s (pid %i)\n", current->comm, current->pid);

    
    if((err = alloc_chrdev_region(&scull_dev.devno, 0, 1, "scull")))
    {
        printk(KERN_ERR " failed to call devno. Error code %d\n", err);
        return err;
    }
    
    printk("Devnumber %#010x\n", scull_dev.devno);


    // Register file operation
    scull_dev.cdev.owner = THIS_MODULE;
    scull_dev.cdev.ops = &scull_fops;

    scull_dev.qset = NULL;

    cdev_init(&scull_dev.cdev, &scull_fops);

    err = cdev_add(&scull_dev.cdev, scull_dev.devno, 1);

    if(err)
    {
        printk(KERN_NOTICE " rror %d adding scull %d", err, 0);
    }



    return 0;
}

static void scull_exit(void)
{

    unregister_chrdev_region(scull_dev.devno, 1);
    printk(KERN_ALERT "goodbye!\n");
    cdev_del(&scull_dev.cdev);
}

int scull_open(struct inode* inode, struct file* filp)
{
    struct scull_dev  *dev; /* dev info */
    dev = container_of(inode->i_cdev, struct scull_dev, cdev);
    filp->private_data  = dev;  /* For other method */


    printk("lyqflag  %08x \n", filp->f_flags);
    if ((filp->f_flags & O_ACCMODE) == O_WRONLY)
    {
        scull_trim(dev); 
    }

    printk("In Fopen\n");
    return 0;

    // if((filp->f_flags & 0_ACCMODE) == 0_WRONLY){
     
   // }
}

int scull_trim(struct scull_dev* dev)
{
    struct scull_qset *next, *dptr;
    printk("trim is called\n");
}

int scull_release(struct inode* inode, struct file* filp)
{
    printk("Released \n");
    return 0;
}

ssize_t scull_write(struct file *filp, const char __user *buf, size_t count, loff_t *f_pos)
{return 0;}
module_init(scull_init);
module_exit(scull_exit);

