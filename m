Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E9BC83F27
	for <xen-devel@archiver.kernel.org>; Tue, 22 Jul 2025 23:26:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1053079.1421830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMN4-0001oc-7u; Tue, 22 Jul 2025 23:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053079.1421830; Tue, 22 Jul 2025 23:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMN4-0001oV-4i; Tue, 22 Jul 2025 23:26:06 +0000
Received: by outflank-mailman (input) for mailman id 1053079;
 Tue, 22 Jul 2025 23:26:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X0Ar=2D=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ueMN2-0001oN-Qk
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 23:26:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b13db09-6753-11f0-b894-0df219b8e170;
 Wed, 23 Jul 2025 01:26:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B51035C5828;
 Tue, 22 Jul 2025 23:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5C8C4CEEB;
 Tue, 22 Jul 2025 23:25:59 +0000 (UTC)
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
X-Inumbo-ID: 3b13db09-6753-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753226761;
	bh=97A3QzF1Z0A/oLpJO0Lbp7m6F2bqq2nKY9CgO70Mmfs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PtNgX2s2BDh37u2EMpMPYcukflFDPmE0JkZz7+t4WzK8Q3GPo6t99+IsyGEFmBdnH
	 xE4dfKwc2nw/uq+KSWmHBn/8yDv2hSpe3Wk0MtyKyE6YJclHyeQrWpbAoGYLAARimc
	 Fz5HQr4IQ3akWDfi7vXhTEn/DX3mYtGRoORZYhAnrECk5mVN88gNe3je/MEpIjQLVs
	 1iOnyoCIlmSYT6vUU4394NvqMSfsqv8lwykFsdyodLbNJw/ffXlxYNlGmTvgh7HjTQ
	 wzufQ/b4FLFsO9hBjdp48qvIUlJQSwV7M+3wdPOa4FErXdj654sH0+HlCK7r+AZxxS
	 l/p7ShNjN/I1g==
Date: Tue, 22 Jul 2025 16:25:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
cc: xen-devel@lists.xenproject.org, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 03/10] dom0less: Move asm-generic/dom0less-build.h ->
 xen/dom0less-build.h
In-Reply-To: <20250722115955.57167-4-alejandro.garciavallejo@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507221625460.7043@ubuntu-linux-20-04-desktop>
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com> <20250722115955.57167-4-alejandro.garciavallejo@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Jul 2025, Alejandro Vallejo wrote:
> It's meant to be usable by anyone with CONFIG_DOM0LESS_BOOT.
> 
> While moving, replace an inclusion of public/domctl.h by a forward
> declaration.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


