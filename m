Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C81F9D0F2
	for <xen-devel@archiver.kernel.org>; Tue, 14 Apr 2026 20:09:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1282070.1564739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCk3q-0002Jy-Dh; Tue, 14 Apr 2026 20:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282070.1564739; Tue, 14 Apr 2026 20:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCk3q-0002Jq-8y; Tue, 14 Apr 2026 20:08:38 +0000
Received: by outflank-mailman (input) for mailman id 1282070;
 Tue, 14 Apr 2026 20:08:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wCk3o-0002JR-Ls
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 20:08:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCk3l-007whr-UN
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 22:08:35 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69de9ea0-5cb7-0a2a0a5109dd-0a2a4502e8ea-32
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 22:08:35 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <sstabellini@kernel.org>)
 id 69de9ec1-42fa-0a2a45020019-aceafc1fe558-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 22:08:34 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C64D1416F8;
 Tue, 14 Apr 2026 20:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4206FC19425;
 Tue, 14 Apr 2026 20:08:32 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776197312;
	bh=yjVCZ3a0MrQZ9xudQupVJGsRXbJe5XDuXlr+v1hQPS8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r2fSS6EPlkY+jyQLBgtliy+sf1NAR9PIAYSdJhLd/2rPvH7J2Zlc34WQr6g8V3A2l
	 Ndwx7RIDMsSqmF2/VCY5dgM+c4RRvSudqZzdmu3LU9leWblj+MAYIQPHSH2iaL6H6V
	 BY6ZPV5017q9iKPxBkq/BaN8VmmKM26b8Kk8sSRg8C2zgrhINye9giYyvRnzOCePMv
	 Ue9YDENRDV8GTI5tVtvrPO7Qyoe9TJ2IZlm62pxaEG33Mozgr/jrzcj1i2Jr8NT+Xa
	 MD2J+gFFhNyiP4lP7Xt8AaZkgq1dp56DeFf0kCIWpnJRoJs1tVG2VDyjZMjICkdhvu
	 C4bYDyONnvOjw==
Date: Tue, 14 Apr 2026 13:08:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Teddy Astie <teddy.astie@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 0/2] time: fix time accounting for x86 HVM guests
In-Reply-To: <20260414103327.7420-1-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2604141308020.1307609@ubuntu-linux-20-04-desktop>
References: <20260414103327.7420-1-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-720697/1776197314-AE524CD1-A6F09630/0/0
X-purgate-type: clean
X-purgate-size: 625

On Tue, 14 Apr 2026, Roger Pau Monne wrote:
> Hello,
> 
> When not emulating the TSC the guest time value calculated by using the
> vCPU time info page in HVM mode would drift between time synchronization
> intervals.  First patch fixes the drift, second patch makes the
> calculation of cpu_khz round up the value for better accuracy.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (2):
>   x86/time: use native TSC scaling factors when TSC is not scaled
>   xen/cpu: round up cpu_khz calculations

Thanks Roger, this fixed an outstanding bug I was seeing!

Tested-by: Stefano Stabellini <sstabellini@kernel.org>

