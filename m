Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282F0606A32A
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hnZy2toz
Received: from list by lists.xenproject.org with outflank-mailman.1490792.1691745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSvNl-0007RP-OE; Mon, 16 Nov 2026 12:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490792.1691745; Mon, 16 Nov 2026 12:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSvNl-0007RI-L9; Mon, 16 Nov 2026 12:00:21 +0000
Received: by outflank-mailman (input) for mailman id 1490792;
 Mon, 16 Nov 2026 12:00:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bot+bpf-ci@kernel.org>) id 1xSvNj-0007Q3-TE
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:00:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSvNi-007igs-I5
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:00:18 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bot+bpf-ci@kernel.org>)
 id 6afaf04d-e002-0a2a0a5209dd-0a2a45098a90-6
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 13:00:18 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bot+bpf-ci@kernel.org>)
 id 6afaf051-be1a-0a2a45090019-ac6904feb6be-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 13:00:18 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 86E6662928;
 Mon, 16 Nov 2026 12:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04FD1F000C4;
 Mon, 16 Nov 2026 12:00:14 +0000 (UTC)
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
	s=k20260515; t=1794830416;
	bh=gm216H5g8yPIS0hPFinwHy6mVVrhGulY+53WmPc6rN0=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=hnZy2tozWrqXpWLl+o5+qP9GJB7maIdtKambAdlwVeTUYSiv1MRn2/JyDHmnbWh9z
	 9WDgZMPWzEFJyZJLu9/wsHqC4IslySPV7y2m6l1l6Pr8NgVibCFxmyKogUiorVMDDs
	 oSUXCyKp79VfkW+5dB+6SUIEC6UIXRKMD5lFDe0TpDOweWXRS/8hWTozfLGQIQW1P3
	 PpqAtsruCxsT/ZGQgn4L2ujm+ycdGpwnf6KZ9ATazwCNfMJ3LvW1RLCzk2tHDAf+iS
	 l45B1JKOto718M05wX+oTkpRye0x56eTuMcf1pJlfnKjWSS9tECKCjPVeZoo9oaT6o
	 l+RQ5GFUaEe7w==
Content-Type: multipart/mixed; boundary="===============5220694122544816000=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <cb28f09c85a473a23f14c9bd6ef135950197c9fbf966c1f7055d791977d29286@mail.kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-38-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-38-8cbbea1cf34f@kernel.org>
Subject: Re: [PATCH RFC v3 38/44] nvmet: refuse files on pseudo filesystems as namespace backing files
From: bot+bpf-ci@kernel.org
To: brauner@kernel.org,linux-fsdevel@vger.kernel.org
Cc: jannh@google.com,mason@kernel.org,josef@toxicpanda.com,hch@lst.de,linux-block@vger.kernel.org,linux-kernel@vger.kernel.org,linux-nvme@lists.infradead.org,viro@zeniv.linux.org.uk,jack@suse.cz,linux-scsi@vger.kernel.org,target-devel@vger.kernel.org,driver-core@lists.linux.dev,linux-mm@kvack.org,bpf@vger.kernel.org,linux-security-module@vger.kernel.org,selinux@vger.kernel.org,apparmor@lists.ubuntu.com,linux-nfs@vger.kernel.org,netdev@vger.kernel.org,fuse-devel@lists.linux.dev,linux-efi@vger.kernel.org,xen-devel@lists.xenproject.org,ocfs2-devel@lists.linux.dev,linux-s390@vger.kernel.org,linuxppc-dev@lists.ozlabs.org,linux-usb@vger.kernel.org,amir73il@gmail.com,linux-erofs@lists.ozlabs.org,linux-kselftest@vger.kernel.org,brauner@kernel.org,chris@chrisdown.name,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Mon, 16 Nov 2026 12:00:14 +0000 (UTC)
X-purgate-ID: tlsNG-bad1c0/1794830418-39CC7034-FA9A127A/0/0
X-purgate-type: clean
X-purgate-size: 2030
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5220694122544816000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> nvmet: refuse files on pseudo filesystems as namespace backing files

TL;DR: The series may not build: file_check_backing() in fs/read_write.c calls
d_real_data_inode(), which seems undefined anywhere in the tree, so a
prerequisite patch may be missing.

> diff --git a/drivers/nvme/target/io-cmd-file.c b/drivers/nvme/target/io-cmd-file.c
> --- a/drivers/nvme/target/io-cmd-file.c
> +++ b/drivers/nvme/target/io-cmd-file.c
> @@ -47,10 +47,9 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
>  		return ret;
>  	}
>  
> -	if (!ns->file->f_op->read_iter || !ns->file->f_op->write_iter) {
> -		ret = -EINVAL;
> +	ret = file_check_backing(ns->file, FMODE_READ | FMODE_WRITE, S_IFBLK);
> +	if (ret)
>  		goto err;
> -	}

Can this be built?  nvmet_file_ns_enable() now depends on
file_check_backing() from f66083ed0be9, which does:

fs/read_write.c:file_check_backing() {
    ...
	/* Look through stacking filesystems at the inode with the data. */
	real_inode = d_real_data_inode(file->f_path.dentry);
	if (IS_ERR(real_inode))
    ...
}

d_real_data_inode() is not defined or declared anywhere in the tree, and
no commit up to the end of the series adds it.  Only d_real_inode() exists
in include/linux/dcache.h, so fs/read_write.c looks like it fails with an
implicit function declaration.

If d_real_inode() was intended, it does d_inode(d_real(...)) without any
ERR_PTR handling, so the IS_ERR() check would never trigger the error path
the f66083ed0be9 commit message describes.

Is a prerequisite patch adding d_real_data_inode() missing from the series?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/43858134663
--===============5220694122544816000==--

