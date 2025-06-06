Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DE5C5AD49
	for <xen-devel@archiver.kernel.org>; Fri,  6 Jun 2025 23:55:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1009000.1388142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNguD-00007u-63; Fri, 06 Jun 2025 23:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1009000.1388142; Fri, 06 Jun 2025 23:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNguD-00007n-3G; Fri, 06 Jun 2025 23:55:25 +0000
Received: by outflank-mailman (input) for mailman id 1009000;
 Fri, 06 Jun 2025 23:55:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRk0=YV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNguB-00007O-Ir
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 23:55:23 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b48baee3-4331-11f0-b894-0df219b8e170;
 Sat, 07 Jun 2025 01:55:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 37E1860EDF;
 Fri,  6 Jun 2025 23:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91735C4CEEB;
 Fri,  6 Jun 2025 23:55:18 +0000 (UTC)
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
X-Inumbo-ID: b48baee3-4331-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749254119;
	bh=oMpEOIZKt/a1V4QeZJ1oEQ4kNXi9FwkTwzJ09ZlFaR0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NiqBHYNeLm8pokj+NZL1jhAjzMu9R89MWU9itm538lydY+QUJQA4sx6h11rXaUgo4
	 YtJSN8eEL4yhksEABO5U+P8sLL3UpqXYO56xGQJScxfWvPlDpL1suVpbiyV6gvsv50
	 yJeAcq1A7Z5Y2LvcMJ0a2sFc0vGkoKJ2+q/yS2ObLn3J5rlAUpU+KxOxQ9A21PPauQ
	 shV729bguxf4sSDqUkL1Yaoa/b4ht1dYtrwxTQfzsJcYLooZMJ6Cvny4grYL4iIS3Q
	 0v7ko4NShMvie7dPiW6pnYdM2+1OdxSs9Jxn0c2g53xnUKacmOuYRq3Y9e2MWuur5p
	 AUtDhlukjzmFw==
Date: Fri, 6 Jun 2025 16:55:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 14/15] xen/dt: Allow CONFIG_DOM0LESS_BOOT to include
 device-tree/
In-Reply-To: <20250605194810.2782031-15-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506061655080.2495561@ubuntu-linux-20-04-desktop>
References: <20250605194810.2782031-1-agarciav@amd.com> <20250605194810.2782031-15-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Jun 2025, Alejandro Vallejo wrote:
> ... without CONFIG_HAS_DEVICE_TREE
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


