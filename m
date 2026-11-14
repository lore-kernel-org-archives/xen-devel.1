Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2456C606A327
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 10:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ozu7z0Kj
Received: from list by lists.xenproject.org with outflank-mailman.1488568.1690413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSB9l-0001wR-Bj; Sat, 14 Nov 2026 10:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488568.1690413; Sat, 14 Nov 2026 10:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSB9l-0001wJ-6Q; Sat, 14 Nov 2026 10:38:49 +0000
Received: by outflank-mailman (input) for mailman id 1488568;
 Sat, 14 Nov 2026 10:38:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSB9j-0001wD-TQ
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 10:38:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSB9j-006Lq1-AW
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 11:38:47 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af839cb-2eae-0a2a0a5409dd-0a2a450c94d0-22
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 11:38:47 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af83a35-f479-0a2a450c0019-aceafc1fcd7a-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 11:38:46 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 967DE413E2;
 Sat, 14 Nov 2026 10:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CE541F000C4;
 Sat, 14 Nov 2026 10:38:38 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794652724;
	bh=f0g6P6hsNAkBmmk1dhVL/yqmLVxvhNEJRF73P8Hffz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ozu7z0Kj1tHIOD24bkiz6twDQ59H2LG047bnoA597yeAQD+7loV9AVNQq6/EfNxmA
	 RAV43n2Xp3rFswhwCvrdVPjCv2twIaBECTwXwjSyPBKOEecSJccYi16iPUffdcy+kX
	 2KsSYHa0TM5q3kVm9Et0sKjXOYpfJER4fjfggVZYik+Tlk8iLg4VYcTfwPq6hSWTb+
	 FqNtagBKrLecsr9nZyvU/RGWRSqwrFdabGVO12uSaA2rrQgzv6ROpsZEsD9jdN00pG
	 9AVp7r2bVcIF0aGX9qNUD3D/9g7VuGmG+jesekdRYeqNRWWlH0zjJp4ZwQJyQCg3y0
	 VLaLdAkJXNuOg==
Date: Sat, 14 Nov 2026 11:38:35 +0100
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, driver-core@lists.linux.dev, linux-mm@kvack.org, 
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org, 
	ocfs2-devel@lists.linux.dev, linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH RFC 01/41] loop: refuse backing files that aren't open
 for reading
Message-ID: <20261114-erfrieren-vorher-taktieren-ef10b08e210f@brauner>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-1-4c998976c6c7@kernel.org>
 <20261111145555.GA9996@lst.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111145555.GA9996@lst.de>
X-purgate-ID: tlsNG-d25034/1794652727-51F33A5B-3AC01A3A/0/0
X-purgate-type: clean
X-purgate-size: 525
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 03:55:55PM +0100, Christoph Hellwig wrote:
> But i wonder if we want a thin wrapper around ->read_iter/_write_iter
> to do this check so that it matches the normal read/write path?

Yes, I had thought about that as well. We could use
vfs_iocb_iter_{read,write}() for that but it's not thin at all and
brings in the LSM into these codepaths where they shouldn't meddle.

So maybe as a follow-up series with a new
vfs_iocb_iter_{read,write}_raw() or whatever. Feel free to make a
suggestion.

