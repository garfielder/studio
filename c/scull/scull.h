#ifndef _SCULL_H
#define _SCULL_H
#include <linux/init.h>
#include <linux/module.h>
#include <linux/sched.h>

#include <linux/fs.h> // For fop

#include <linux/cdev.h>


// Map kernel callbacks

struct scull_dev 
{
    dev_t devno; 
    struct cdev cdev;

    struct scull_qset *qset;
};



int scull_open(struct inode* inode, struct file* filp);
int scull_release(struct inode* inode, struct file* filp);
ssize_t scull_write(struct file *filp, const char __user *buf, size_t count, loff_t *f_pos);

/* invoked by scull_open when opened for writing */
int scull_trim(struct scull_dev* dev);

static struct file_operations scull_fops = {
    .owner = THIS_MODULE,
    .open = scull_open,
    .write = scull_write,
/*
    .llseek = scull_llseek,
    .read  = scull_read,
    .ioctl = scull_ioctl,
*/
    .release = scull_release
};


struct scull_dev scull_dev = {
   .devno = 0,
};



struct scull_qset {
    void **data;
    struct scull_qset *next;
};




#endif // _SCULL_
