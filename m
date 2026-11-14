Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1879606A338
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bfkXAKnv
Received: from list by lists.xenproject.org with outflank-mailman.1489013.1690826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSEDh-0003hS-WD; Sat, 14 Nov 2026 13:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1489013.1690826; Sat, 14 Nov 2026 13:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSEDh-0003hL-TB; Sat, 14 Nov 2026 13:55:05 +0000
Received: by outflank-mailman (input) for mailman id 1489013;
 Sat, 14 Nov 2026 13:55:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bot+bpf-ci@kernel.org>) id 1xSEDg-0003ft-Jo
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:55:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSEDf-001M3h-P4
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:55:03 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bot+bpf-ci@kernel.org>)
 id 6af86837-e002-0a2a0a5209dd-0a2a450c84b4-2
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:55:03 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bot+bpf-ci@kernel.org>)
 id 6af86836-f479-0a2a450c0019-aceafc1f8498-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:55:03 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4EE0E448C9;
 Sat, 14 Nov 2026 13:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36F01F000C6;
 Sat, 14 Nov 2026 13:54:57 +0000 (UTC)
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
	s=k20260515; t=1794664501;
	bh=Xi+Jp34UVw8n6rWUcn3QcZPlSKYiPMqX7yCNJrzL8oU=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=bfkXAKnvyN3NrzfYhrVigeGIKvr/8evEe0tQ8KwSyEafhDf3+AXVoqojleCZ7/Qdh
	 2b013ZilynaxVntPTxgtS9Fyq3b+7yXhPeXkFfQ9ONM2J9MEOM/JQ3B/znTjkCUpqc
	 r0tlhXctgE98kfAt1ITbmi9H0tApXPCL2XTcrVOM5qnz/NrX0rxwji+SmXMUOe8YHy
	 kRbhgqC/kLnhpgS61Qu7Lfu7BuXDWJsHjF+zOY5u5KKN5rR5uvcX/zOV7QTiz8dq9Z
	 GTd5PKapaf6tpFoOvo6qdgngRWS5W1FIZVvnJWAJ8F5DAYQTkJUN/Wbu5kFv6IHajV
	 XPu1vrQEYpCgg==
Content-Type: multipart/mixed; boundary="===============1687560790659556623=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <df03e637354be695652a787563af21ac77b4c61f813ae4491a3397a91df7688e@mail.kernel.org>
In-Reply-To: <20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
Subject: Re: [PATCH RFC v2 17/42] securityfs: use fc_init_pseudo()
From: bot+bpf-ci@kernel.org
To: brauner@kernel.org,linux-fsdevel@vger.kernel.org
Cc: jannh@google.com,mason@kernel.org,josef@toxicpanda.com,hch@lst.de,linux-block@vger.kernel.org,linux-kernel@vger.kernel.org,linux-nvme@lists.infradead.org,viro@zeniv.linux.org.uk,jack@suse.cz,linux-scsi@vger.kernel.org,target-devel@vger.kernel.org,driver-core@lists.linux.dev,linux-mm@kvack.org,bpf@vger.kernel.org,linux-security-module@vger.kernel.org,selinux@vger.kernel.org,apparmor@lists.ubuntu.com,linux-nfs@vger.kernel.org,netdev@vger.kernel.org,fuse-devel@lists.linux.dev,linux-efi@vger.kernel.org,xen-devel@lists.xenproject.org,ocfs2-devel@lists.linux.dev,linux-s390@vger.kernel.org,linuxppc-dev@lists.ozlabs.org,linux-usb@vger.kernel.org,amir73il@gmail.com,linux-erofs@lists.ozlabs.org,linux-kselftest@vger.kernel.org,brauner@kernel.org,alex@amutable.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Sat, 14 Nov 2026 13:54:57 +0000 (UTC)
X-purgate-ID: tlsNG-d25034/1794664503-76ADCA5B-A641CD38/0/0
X-purgate-type: clean
X-purgate-size: 2440
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1687560790659556623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> securityfs: use fc_init_pseudo()

TL;DR: Setting SB_I_NODEV on securityfs may make reopening AppArmor's
inherited .null fd (e.g. open("/dev/stderr")) fail with -EACCES, which used to
work; the commit message may also be inaccurate about device nodes.

> diff --git a/security/inode.c b/security/inode.c
> --- a/security/inode.c
> +++ b/security/inode.c

[ ... ]

> @@ -64,6 +65,7 @@ static const struct fs_context_operations securityfs_context_ops = {
>
>  static int securityfs_init_fs_context(struct fs_context *fc)
>  {
> +	fc_init_pseudo(fc);
>  	fc->ops = &securityfs_context_ops;
>  	return 0;
>  }

The commit message says "AppArmor puts a .null device node into securityfs
but only ever opens it via dentry_open() which doesn't care about
SB_I_NODEV."  Is that the whole picture?

aa_inherit_files() installs that dentry_open()ed file into the task's fd
table:

    devnull = dentry_open(&aa_null, O_RDWR, cred);
    ...
    replace_fd(n - 1, devnull, 0);

The fd is not O_CLOEXEC, and its f_path.mnt is the internal mount from
simple_pin_fs() in aa_mk_null_file(), which never has MNT_NODEV.

Opening /proc/<pid>/fd/N, or /dev/stdout or /dev/stderr, resolves to that
same path and goes through the normal open path:

    do_open() -> may_open()
        case S_IFCHR:
            if (!may_open_dev(path))
                return -EACCES;

may_open_dev() checks path->mnt->mnt_sb->s_iflags & SB_I_NODEV.  That bit
was clear on the securityfs superblock before this patch and is set now.

Can this make open("/dev/stderr") fail with -EACCES for an unconfined task
that inherited the .null fd, for example a helper exec'd through a ux/Ux
transition from a confined task?  That open used to succeed.

Should the commit message say that this reopen path is intended to fail, or
does .null need separate handling?  The statement that "securityfs never
holds ... device nodes" also seems to conflict with the .null node described
in the next paragraph.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/43599461726
--===============1687560790659556623==--

