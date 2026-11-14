Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A7E606A333
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 21:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIy92zB+
Received: from list by lists.xenproject.org with outflank-mailman.1489533.1690984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSLi4-00009u-AI; Sat, 14 Nov 2026 21:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1489533.1690984; Sat, 14 Nov 2026 21:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSLi4-00009n-6d; Sat, 14 Nov 2026 21:54:56 +0000
Received: by outflank-mailman (input) for mailman id 1489533;
 Sat, 14 Nov 2026 21:54:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSLi2-00008a-6L
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 21:54:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSLi1-00A3GC-6F
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 22:54:53 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6af8d897-8faa-0a2a0a5109dd-0a2a4506cb94-8
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 22:54:53 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6af8d8ab-195a-0a2a45060019-aceafc1f9742-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 22:54:52 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E15E0447B9;
 Sat, 14 Nov 2026 21:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCA71F000C4;
 Sat, 14 Nov 2026 21:54:43 +0000 (UTC)
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
	s=k20260515; t=1794693290;
	bh=MU5XNgGhJm4qGtdrFglh8iv5ciWWvcUh9TpKkyBJYjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FIy92zB+Q6XXV11Bx9r1d6hblgiehsd1O2WYa4ANqHuoaMNzzpTo/kyfrrl5vWJqU
	 ntQlUQLehZaQBgb5PHB5XgsgvcpzvDKacjzaPI1D0mhsgTUlE44bsX7wUuFZlbKEVy
	 2bf9iGRkxrODGLkzXesChHlOpfKM10Ar21sYj0wFzavx9W02CRh/nVciBf1lbn33of
	 RFNAI7U3T2zGoe8QK8NctZ4IPimWP2/h2Wjo3dajkFGo7hKnMdTyDdQrkd/NIOxJeq
	 4KueXIk2XzkN6Oe+3U49dByhB2/gIMk6xuZPod2J7aymfou+3hjeBLx6QqpqyydE14
	 fsnMkL8jCu8lw==
Date: Sat, 14 Nov 2026 22:54:42 +0100
From: Christian Brauner <brauner@kernel.org>
To: Chris Down <chris@chrisdown.name>
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
	Amir Goldstein <amir73il@gmail.com>, linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Alexander Mikhalitsyn <alex@amutable.com>
Subject: Re: [PATCH RFC v2 17/42] securityfs: use fc_init_pseudo()
Message-ID: <20261114-wohnprojekt-rational-ersetzbar-b338c88cba70@brauner>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
 <20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
 <20261114120555.cbfaf8ab8a92fb25@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261114120555.cbfaf8ab8a92fb25@chrisdown.name>
X-purgate-ID: tlsNG-16d1c6/1794693293-FE87577B-1EECD9B9/0/0
X-purgate-type: clean
X-purgate-size: 862
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 12:05:55PM -0800, Chris Down wrote:
> Not a big deal, but userspace can see that node too, as
> /sys/kernel/security/apparmor/.null. Opening it by path works in current
> kernels and fails with EACCES after this patch. Now, I don't know of
> anything that does that, but selinuxfs gets SB_I_NODEV cleared again in
> the next patch for the same kind of node, so I think we should do the
> same thing here. If not, it would be good to have a line in the
> changelog saying that opening it by path is meant to stop working.

Yeah, seems fine. Though, afaict aa refuses every read and write on
.null in aa_file_perm(). So this change only moves the EACCES from
read()/write() to open(). But I guess open() failing might be an issue,
idk.

I really really dislike this device node abuse on for both lsms. It's
sketchy as hell.

