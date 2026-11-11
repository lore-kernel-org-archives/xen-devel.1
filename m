Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B114606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 09:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=cmZW0raJ
Received: from list by lists.xenproject.org with outflank-mailman.1483269.1686768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR4v9-0006Qw-AY; Wed, 11 Nov 2026 09:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483269.1686768; Wed, 11 Nov 2026 09:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR4v9-0006Qp-77; Wed, 11 Nov 2026 09:47:11 +0000
Received: by outflank-mailman (input) for mailman id 1483269;
 Wed, 11 Nov 2026 09:47:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <leitao@debian.org>) id 1xR4v8-0006Qj-5H
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 09:47:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR4v7-008vBv-Ah
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 10:47:09 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <leitao@debian.org>)
 id 6af43997-e002-0a2a0a5209dd-0a2a4503b7b4-48
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 10:47:09 +0100
Received: from [82.195.75.108] (helo=stravinsky.debian.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <leitao@debian.org>)
 id 6af4399c-fae8-0a2a45030019-52c34b6cd8c6-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 10:47:08 +0100
Received: from authenticated-user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <leitao@debian.org>) id 1xR4up-00D5nW-2D;
 Wed, 11 Nov 2026 09:46:51 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=smtpauto.stravinsky header.d=debian.org header.i="@debian.org" header.h="X-Debian-User:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g4FJ8o8UQUtyD0eGI0sUCpicqPvdI4Vdc4LMM0bmn0w=; b=cmZW0raJpZImC504fK0B0kMd2h
	XJQXfLj15TrbtRxuoXIll7+dYj88ZVAl2AayT9vhDBlAQ57+Eho/cFEk5It94wIbKS4EH4G+cdutI
	0K9jgabrgunrLX95HA3KOWeYRz+hLh5iGe5EyD3w5xx8w9MzCtlstOcNUcfrAtIPd3RxiWEjnELaD
	hbo41pU2e/eygmvhOngKp7971UVKKEY71/mIvuWf0WfaOur34IyUdpGFowB9/oVJFRm81ZxsZDxLw
	5M54Kif6OKPedXxyOCO9YpK4/4uqCIxZE2p81NHj3kV9mf9cnMGZSmbBCsLntHmPvgWT1OTOymjci
	CwvzesXA==;
Date: Wed, 11 Nov 2026 01:46:43 -0800
From: Breno Leitao <leitao@debian.org>
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
Subject: Re: [PATCH RFC 16/41] configfs: use fc_init_pseudo()
Message-ID: <avQ5dv0747H-XKmD@gmail.com>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-16-4c998976c6c7@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-work-loop-pseudo-v1-16-4c998976c6c7@kernel.org>
X-Debian-User: leitao
X-purgate-ID: tlsNG-33051d/1794390428-6D4D74E9-7D33DB5D/0/0
X-purgate-type: clean
X-purgate-size: 350
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 10:14:32AM +0100, Christian Brauner wrote:
> Initialize configfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. configfs never holds executables or
> device nodes.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Acked-by: Breno Leitao <leitao@debian.org>

