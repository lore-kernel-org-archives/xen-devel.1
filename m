Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4E4606A338
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lC1rRmz7
Received: from list by lists.xenproject.org with outflank-mailman.1489015.1690835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSEDm-0003z2-6R; Sat, 14 Nov 2026 13:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1489015.1690835; Sat, 14 Nov 2026 13:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSEDm-0003yv-2i; Sat, 14 Nov 2026 13:55:10 +0000
Received: by outflank-mailman (input) for mailman id 1489015;
 Sat, 14 Nov 2026 13:55:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bot+bpf-ci@kernel.org>) id 1xSEDk-0003wb-Np
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:55:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSEDk-00D4wN-4s
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:55:08 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bot+bpf-ci@kernel.org>)
 id 6af86838-8faa-0a2a0a5109dd-0a2a4509cc80-8
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:55:08 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bot+bpf-ci@kernel.org>)
 id 6af8683a-be1a-0a2a45090019-aceafc1f9246-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:55:07 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3B2EF45800;
 Sat, 14 Nov 2026 13:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73891F000C5;
 Sat, 14 Nov 2026 13:55:02 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="In-Reply-To:References:Subject:From:To:Cc:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794664506;
	bh=gZCOg3PYW5/XzYktPPO7fZbRJ9jC/nh9/3WC5LHdP9k=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=lC1rRmz7ahj/srEYA2ijCYwgAqxvBpBEiZzJTz1BT/wrTEWhRCAJRjIQUg90ualPp
	 8fNiGIog6yGBq7jcPWwPg3KTZ4hhP7wzOgQinag8fVT+8JrN/YD10tUBIHBk4t50YO
	 lVbRqj+kObH/VFAULApyIEa7KJo13ikHhn4sjSYyAVLzN15VB21GTINJSJZ5zSjoJ2
	 SqbEpuE67Y8c73FjyTC9QAtGI69lnMt18W/xx4/7c8YFqB+lo9IQTij1vjYC2G1yJC
	 gbXcz8wGq7FFvOpMP/hQpyy359bbb1860T3yz8/mr3WEBUyRt+SVvwAJEu6hB8hDoE
	 Jru9mkTF+Jtaw==
Content-Type: multipart/mixed; boundary="===============0802335019258284520=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <91e245da9f3df6d6e61808e72a4ad0213a9a6b838f594d0be74dd70ab228422f@mail.kernel.org>
In-Reply-To: <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
Subject: Re: [PATCH RFC v2 33/42] fs: add file_check_backing()
From: bot+bpf-ci@kernel.org
To: brauner@kernel.org,linux-fsdevel@vger.kernel.org
Cc: jannh@google.com,mason@kernel.org,josef@toxicpanda.com,hch@lst.de,linux-block@vger.kernel.org,linux-kernel@vger.kernel.org,linux-nvme@lists.infradead.org,viro@zeniv.linux.org.uk,jack@suse.cz,linux-scsi@vger.kernel.org,target-devel@vger.kernel.org,driver-core@lists.linux.dev,linux-mm@kvack.org,bpf@vger.kernel.org,linux-security-module@vger.kernel.org,selinux@vger.kernel.org,apparmor@lists.ubuntu.com,linux-nfs@vger.kernel.org,netdev@vger.kernel.org,fuse-devel@lists.linux.dev,linux-efi@vger.kernel.org,xen-devel@lists.xenproject.org,ocfs2-devel@lists.linux.dev,linux-s390@vger.kernel.org,linuxppc-dev@lists.ozlabs.org,linux-usb@vger.kernel.org,amir73il@gmail.com,linux-erofs@lists.ozlabs.org,linux-kselftest@vger.kernel.org,brauner@kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Sat, 14 Nov 2026 13:55:02 +0000 (UTC)
X-purgate-ID: tlsNG-bad1c0/1794664508-FD06B034-272C4650/0/0
X-purgate-type: clean
X-purgate-size: 3206
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0802335019258284520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> fs: add file_check_backing()

TL;DR: file_check_backing() may call d_real_inode() on O_PATH overlayfs files,
which could hit WARN in ovl_d_real() (panic with panic_on_warn) and let the
pseudo-fs check pass wrongly; reachable via fuse backing open, needs
CAP_SYS_ADMIN.

> diff --git a/fs/read_write.c b/fs/read_write.c
> --- a/fs/read_write.c
> +++ b/fs/read_write.c

[ ... ]

> +int file_check_backing(const struct file *file, fmode_t mode, umode_t type)
> +{

[ ... ]

> +	/* Look through stacking filesystems at the inode with the data. */
> +	if (d_real_inode(file->f_path.dentry)->i_sb->s_iflags & SB_I_PSEUDO)
> +		return -EINVAL;

With FMODE_PATH accepted, can d_real_inode() be reached for an O_PATH file
here?  No ->open() has run on such a file.

For an overlayfs metacopy file whose data is in a data-only lower layer,
the lowerdata redirect is only resolved lazily, by ovl_open() via
ovl_verify_lowerdata() or by ovl_d_real().  For an O_PATH file this means
d_real_inode() goes into ovl_d_real(), which does the lookup and verity
check itself:

    err = ovl_verify_lowerdata(dentry);
    if (err)
        goto bug;
    ...
bug:
    WARN(1, "%s(%pd4, %d): real dentry not found\n", __func__, dentry, type);
    return dentry;

ovl_maybe_lookup_lowerdata() treats a failed lookup as a normal runtime
event (pr_warn_ratelimited("lazy lowerdata lookup failed ...")).  It can
also return -EINTR from ovl_inode_lock_interruptible(), and
ovl_maybe_validate_verity() returns -EIO for a missing or wrong digest with
verity=require.  Each of these would hit WARN(1) when reached through this
helper, which panics with panic_on_warn.

In that case ovl_d_real() returns the overlayfs dentry, so the SB_I_PSEUDO
test looks at the overlayfs superblock and passes.  Does the check fail
open there?

Nothing calls the helper in this commit, but later in the series
f79b9e79484f ("fuse: refuse files on pseudo filesystems as passthrough
backing files") adds file_check_backing(file, FMODE_PATH, 0) to
fuse_backing_open_file().  That gets its fd via CLASS(fd_raw), which
accepts O_PATH:

FUSE_DEV_IOC_BACKING_OPEN
  fuse_backing_new()
    fuse_backing_open_file()
      file_check_backing()
        d_real_inode()
          ovl_d_real()
            ovl_verify_lowerdata() fails -> WARN

This needs CAP_SYS_ADMIN and an overlayfs with data-only layers where the
data file is missing, the digest check fails, or the inode lock is
contended while a signal is pending.  No fix for this was found later in
the series.

Could the pseudo filesystem check avoid forcing the lazy lowerdata lookup
on O_PATH files, or should ovl_d_real() stop warning on lookup failures now
that it has callers besides trace_uprobe?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/43599461726
--===============0802335019258284520==--

