Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361F6606A89D
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gm28Ha6j
Received: from list by lists.xenproject.org with outflank-mailman.1489012.1690817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSEDc-0003SE-Pt; Sat, 14 Nov 2026 13:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1489012.1690817; Sat, 14 Nov 2026 13:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSEDc-0003S7-ND; Sat, 14 Nov 2026 13:55:00 +0000
Received: by outflank-mailman (input) for mailman id 1489012;
 Sat, 14 Nov 2026 13:54:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bot+bpf-ci@kernel.org>) id 1xSEDb-0003Rz-Gz
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 13:54:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSEDa-0085Iv-Ct
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 14:54:58 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bot+bpf-ci@kernel.org>)
 id 6af86832-2eae-0a2a0a5409dd-0a2a450b9b94-0
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:54:58 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bot+bpf-ci@kernel.org>)
 id 6af86831-b7e8-0a2a450b0019-ac6904fed8e2-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 14:54:58 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4FB086020C;
 Sat, 14 Nov 2026 13:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC8EC1F000C4;
 Sat, 14 Nov 2026 13:54:52 +0000 (UTC)
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
	s=k20260515; t=1794664496;
	bh=I6J+1H3vQpLdJ7UVpJ/tC85ye3HYuCATNIJGMbrXQJM=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=gm28Ha6jFbZAVZELeCoAiv8yQmKhg2t27IzqaM5E6DHf1m/iHwaa05oOee2NvjSBl
	 kc6ZaW7X7pNIXQAoh9xnp9MBMni3b8MRxZdEx/eTPDoUQsu/YruOICy0eelWOEyqgn
	 3P8g8niOi/8NoL9V5UYuZAEp6DyvrAtH4YeuzU3fc3guDfP87KZmI3TI0lTfqozu4+
	 ZpGn4biS09ByqImLH4ZYYUNpv6w1MO+E82dAPetup0Rc/sR/ssg0FbIV+aiwW6MIcv
	 EBQr5L1AgJXIgzU68vHxaHLJx8/fkvXF+Z3xx/GTGkbG1HInFcXsLmVQOWzwu1EgJY
	 hMWqsgyXoIXvw==
Content-Type: multipart/mixed; boundary="===============4078380530865713043=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <bf4a6d1a8af90f3fac8754638a5f9b02fb40c0a066237181d456a25ac7f2c606@mail.kernel.org>
In-Reply-To: <20261114-work-loop-pseudo-v2-4-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-4-98639a2286fb@kernel.org>
Subject: Re: [PATCH RFC v2 04/42] fs: add SB_I_PSEUDO
From: bot+bpf-ci@kernel.org
To: brauner@kernel.org,linux-fsdevel@vger.kernel.org
Cc: jannh@google.com,mason@kernel.org,josef@toxicpanda.com,hch@lst.de,linux-block@vger.kernel.org,linux-kernel@vger.kernel.org,linux-nvme@lists.infradead.org,viro@zeniv.linux.org.uk,jack@suse.cz,linux-scsi@vger.kernel.org,target-devel@vger.kernel.org,driver-core@lists.linux.dev,linux-mm@kvack.org,bpf@vger.kernel.org,linux-security-module@vger.kernel.org,selinux@vger.kernel.org,apparmor@lists.ubuntu.com,linux-nfs@vger.kernel.org,netdev@vger.kernel.org,fuse-devel@lists.linux.dev,linux-efi@vger.kernel.org,xen-devel@lists.xenproject.org,ocfs2-devel@lists.linux.dev,linux-s390@vger.kernel.org,linuxppc-dev@lists.ozlabs.org,linux-usb@vger.kernel.org,amir73il@gmail.com,linux-erofs@lists.ozlabs.org,linux-kselftest@vger.kernel.org,brauner@kernel.org,alex@amutable.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Sat, 14 Nov 2026 13:54:52 +0000 (UTC)
X-purgate-ID: tlsNG-42698a/1794664498-19AC09EA-95C2AB25/0/0
X-purgate-type: clean
X-purgate-size: 2216
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4078380530865713043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> fs: add SB_I_PSEUDO

TL;DR: Nit only: the fc_init_pseudo() comment and commit message claim pseudo
filesystems never hold device nodes, but devpts and binderfs do and must clear
SB_I_NODEV; the wording could mislead.

> diff --git a/include/linux/pseudo_fs.h b/include/linux/pseudo_fs.h
> --- a/include/linux/pseudo_fs.h
> +++ b/include/linux/pseudo_fs.h

[ ... ]

> +/*
> + * Common initialization for all pseudo filesystems, mountable or not. Their
> + * regular files are kernel interfaces. They don't store data and pseudo
> + * filesystems never hold executables or device nodes.
> + */
> +static inline void fc_init_pseudo(struct fs_context *fc)
> +{
> +	fc->s_iflags |= SB_I_PSEUDO | SB_I_NOEXEC | SB_I_NODEV;
> +}

This isn't a bug, but is it accurate that pseudo filesystems "never hold
executables or device nodes"?  The same wording is in the commit message.

devpts creates character device inodes in devpts_pty_new():

    init_special_inode(inode, S_IFCHR|opts->mode,
                       MKDEV(UNIX98_PTY_SLAVE_MAJOR, index));

and binderfs does the same with init_special_inode(inode, S_IFCHR | 0600,
...).  Both filesystems are converted to fc_init_pseudo() later in the
series, and both have to undo the flag in their fill_super callbacks:

    s->s_iflags &= ~SB_I_NODEV;

This works because sget_fc() ORs fc->s_iflags into sb->s_iflags before
fill_super runs.  A filesystem that has device nodes and relies on this
comment would not know it needs to clear SB_I_NODEV, and its device nodes
would fail to open with -EACCES from may_open_dev().

Could the comment say that SB_I_NODEV is the default and that pseudo
filesystems with device nodes must clear it in fill_super, or could "never
... device nodes" be dropped?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/43599461726
--===============4078380530865713043==--

