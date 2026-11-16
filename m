Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E24E606A32A
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 13:08:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1490874.1691817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSwR1-0007TY-2b; Mon, 16 Nov 2026 13:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490874.1691817; Mon, 16 Nov 2026 13:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSwR0-0007TQ-W4; Mon, 16 Nov 2026 13:07:46 +0000
Received: by outflank-mailman (input) for mailman id 1490874;
 Mon, 16 Nov 2026 13:07:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jack@suse.cz>) id 1xSwQz-0007Qt-67
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:07:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSwQy-000n0O-Ip
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:07:44 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jack@suse.cz>)
 id 6afb0013-2eae-0a2a0a5409dd-0a2a4506cc22-42
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:07:44 +0100
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jack@suse.cz>)
 id 6afb0020-195a-0a2a45060019-c387df82d4cc-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:07:44 +0100
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 19E8621DC4;
 Mon, 16 Nov 2026 13:07:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE2B51334C;
 Mon, 16 Nov 2026 13:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BvIgLh8A+2pNEgAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 16 Nov 2026 13:07:43 +0000
Received: by quack.suse.cz (Postfix, from userid 1000)
 id 6CC7424E06; Mon, 16 Nov 2026 14:07:43 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: smtp-out1.suse.de;
	none
Date: Mon, 16 Nov 2026 14:07:43 +0100
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, apparmor@lists.ubuntu.com, 
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org, fuse-devel@lists.linux.dev, 
	linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org, 
	Amir Goldstein <amir73il@gmail.com>, linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v3 35/44] fs: add file_check_backing()
Message-ID: <fvmgoq6g3orrcbz5j7xoxrqkz4kc4jiopndjfar4cv45pj2y4g@bfgcucrsffnm>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
 <20261116-work-loop-pseudo-v3-35-8cbbea1cf34f@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-work-loop-pseudo-v3-35-8cbbea1cf34f@kernel.org>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 19E8621DC4
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-purgate-ID: tlsNG-16d1c6/1794834464-FD20877B-934E0FC8/0/0
X-purgate-type: clean
X-purgate-size: 6017
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon 16-11-26 12:05:08, Christian Brauner wrote:
> Loop, zloop, the nvme target, the scsi target, fuse passthrough, the usb
> mass storage gadget, erofs and acct all take a file from userspace and
> use it as storage. Currently, each of them has its own idea of what to
> check before using a file like that:
> 
> - loop and the gadget check for a regular file or a block device, the
>   nvme target, the scsi target and zloop take any file type
> - loop checks the open mode, the gadget checks FMODE_CAN_READ, the nvme
>   target, the scsi target and zloop only check for ->read_iter() and
>   ->write_iter()
> - apart from acct which refuses procfs and sysfs files none of them
>   cares whether the file is a kernel interface
> 
> Add a helper that does all of it in one place. It only accepts regular
> files and, if the caller passes S_IFBLK, block devices. It refuses files
> on pseudo filesystems. And it checks that the file is open for what the
> caller is going to do with it and implements ->read_iter() for reading
> and ->write_iter() for writing.
> 
> O_PATH files are refused unless the caller passes FMODE_PATH. That is
> for callers that only need the path of the file. fuse passthrough is
> one of them and has accepted O_PATH file descriptors since commit
> efad7153bf93 ("fuse: allow O_PATH fd for FUSE_DEV_IOC_BACKING_OPEN").
> 
> Block devices are fine even though bdevfs is a pseudo filesystem. A
> block device that userspace hands in is a device node on devtmpfs or
> some other filesystem. Files on bdevfs only come from
> bdev_file_open_by_*() and never end up here.
> 
> The pseudo filesystem check looks at the inode that actually provides
> the data via d_real_data_inode(). overlayfs accepts sysfs, cgroup2,
> debugfs, tracefs, configfs and securityfs as lower layers and reads of
> such an overlayfs file are served by the file on the pseudo filesystem.
> Checking the overlayfs inode would miss that.
> 
> For an O_PATH file nothing might have looked up the data yet. overlayfs
> only looks up the data of a metacopy file in a data-only layer when the
> file is opened. d_real_data_inode() does the lookup then and if that
> fails we return the error.
> 
> Note that the file type is taken from the inode of the file and not from
> the host of ->f_mapping like loop and the gadget do it. A driver can
> point ->f_mapping somewhere else in ->open(). It makes no difference for
> block devices as both inodes are block devices.
> 
> No functional changes. Nothing calls the helper yet.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/read_write.c    | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fs.h |  2 ++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/fs/read_write.c b/fs/read_write.c
> index 6767283108991..9f1e7bfcbd4f1 100644
> --- a/fs/read_write.c
> +++ b/fs/read_write.c
> @@ -866,6 +866,59 @@ static ssize_t do_loop_readv_writev(struct file *filp, struct iov_iter *iter,
>  	return ret;
>  }
>  
> +/**
> + * file_check_backing - check that the kernel can use a file as storage
> + * @file: file that userspace handed in
> + * @mode: FMODE_READ and/or FMODE_WRITE the kernel will do I/O with, or
> + *        FMODE_PATH if only the path of @file is used
> + * @type: S_IFBLK if a block device is fine as well, 0 otherwise
> + *
> + * Call this where a file from userspace is taken as a backing file. Only
> + * regular files and, if @type is S_IFBLK, block devices are storage. Files
> + * on pseudo filesystems are kernel interfaces and are refused. The file
> + * must be open for @mode and implement ->read_iter() for reading and
> + * ->write_iter() for writing. O_PATH files are only fine with FMODE_PATH.
> + *
> + * Return: 0 on success, -EBADF if @file isn't open for @mode, -EINVAL if it
> + * can't be used as storage, or the error from looking up the data of @file
> + * on a stacking filesystem.
> + */
> +int file_check_backing(const struct file *file, fmode_t mode, umode_t type)
> +{
> +	fmode_t io = mode & (FMODE_READ | FMODE_WRITE);
> +	/* Drivers may point ->f_mapping at something else. */
> +	umode_t fmt = file_inode(file)->i_mode & S_IFMT;
> +	struct inode *real_inode;
> +
> +	/* O_PATH files are only fine for callers that just use the path. */
> +	if ((file->f_mode & FMODE_PATH) && !(mode & FMODE_PATH))
> +		return -EBADF;
> +
> +	if ((file->f_mode & io) != io)
> +		return -EBADF;
> +
> +	if (fmt != S_IFREG && !(type == S_IFBLK && fmt == S_IFBLK))
> +		return -EINVAL;
> +
> +	/* Look through stacking filesystems at the inode with the data. */
> +	real_inode = d_real_data_inode(file->f_path.dentry);
> +	if (IS_ERR(real_inode))
> +		return PTR_ERR(real_inode);
> +	if (real_inode->i_sb->s_iflags & SB_I_PSEUDO)
> +		return -EINVAL;
> +
> +	if ((mode & FMODE_READ) &&
> +	    (!(file->f_mode & FMODE_CAN_READ) || !file->f_op->read_iter))
> +		return -EINVAL;
> +
> +	if ((mode & FMODE_WRITE) &&
> +	    (!(file->f_mode & FMODE_CAN_WRITE) || !file->f_op->write_iter))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(file_check_backing);
> +
>  ssize_t vfs_iocb_iter_read(struct file *file, struct kiocb *iocb,
>  			   struct iov_iter *iter)
>  {
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 99caef43ff3c4..b1c7ebafbadbe 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2553,6 +2553,8 @@ static inline const struct inode *file_user_inode(const struct file *f)
>  	return file_inode(f);
>  }
>  
> +int file_check_backing(const struct file *file, fmode_t mode, umode_t type);
> +
>  static inline struct file *file_clone_open(struct file *file)
>  {
>  	return dentry_open(&file->f_path, file->f_flags, file->f_cred);
> 
> -- 
> 2.53.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

