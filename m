Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F102AC369AB
	for <xen-devel@archiver.kernel.org>; Tue, 15 Apr 2025 23:49:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.954685.1348681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4q1F-0008KE-0u; Tue, 15 Apr 2025 23:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954685.1348681; Tue, 15 Apr 2025 23:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4q1E-0008K7-T1; Tue, 15 Apr 2025 23:48:44 +0000
Received: by outflank-mailman (input) for mailman id 954685;
 Tue, 15 Apr 2025 23:48:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wZ1T=XB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u4q1E-00086A-4l
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 23:48:44 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 291c0af1-1a54-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 01:48:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D06DF6115F;
 Tue, 15 Apr 2025 23:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88696C4CEE7;
 Tue, 15 Apr 2025 23:48:39 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 291c0af1-1a54-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744760920;
	bh=0qZyvIR5pEmVnLv2B7Z7cqPj63EYOUL4eiclIuum8kU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IXtsa9iP6chqdiGmigzUf7lG2Irr/aBvRiAuA2q6OYhyCaWF3iZ2hAbh/KILZuviY
	 +zp41o3LLDog1EFRTtL7q+1rflpLVotj07GoIEX5Srk7Ao1SJWVCqejFtQHm/mDvV2
	 78NcBL/ed+r3pkixBpfAHYinJAsX/LU0+Uo1CeA6fsbNZp3XEvXAuwA8EL4a0G/uzn
	 SBOYo6lRG/7iUcgazpXWAJit+aHXpaW7d2GlCHjq+8LfF6QEsx5XMCzCz+TZ0EovAD
	 vVTLn6Zi+ieEvlkiJn+sO96XmNjJPRwXwh5WCgdYxvdaARZxoI/Xoic77GFnRQtRVc
	 s3/Zrr6yCHD3w==
Date: Tue, 15 Apr 2025 16:48:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Jason Andryuk <jason.andryuk@amd.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 2/7] Overhaul how Argo is built and packged
In-Reply-To: <20250414101843.2348330-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2504151645260.8008@ubuntu-linux-20-04-desktop>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com> <20250414101843.2348330-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Apr 2025, Andrew Cooper wrote:
> Right now, the argo artefacts are a pile of files which the test has to turn
> back into something which resembles a filesystem.  Furthermore, because we do
> not build modules for the main kernel, it is extra important to make sure that
> xen-argo.ko doesn't get out of sync.
> 
> Build argo conditionally as part of the linux artefact.  It's ~100kb all
> together, compared to ~14M for the kernel.
> 
> Produce a single argo.cpio.gz with xen-argo.ko in the standard location.
> Prune userspace down to just the executables and libraries.
> 
> This is cribbed from the existing scripts/x86_64-linux-argo.sh, which stays in
> place in the short term until Xen can be updated to use the new scheme.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Do we need to remove x86_64-argo-linux.sh?


