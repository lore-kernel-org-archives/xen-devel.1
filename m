Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0513C88E53
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 19:40:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417844.1646419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x576H-0002Fq-Ha; Fri, 11 Sep 2026 19:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417844.1646419; Fri, 11 Sep 2026 19:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x576H-0002Fi-E0; Fri, 11 Sep 2026 19:39:53 +0000
Received: by outflank-mailman (input) for mailman id 1417844;
 Fri, 11 Sep 2026 19:39:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1x576G-0002FZ-43
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 19:39:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x576F-002ER5-2l
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 21:39:51 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6aa458d0-8faa-0a2a0a5109dd-0a2a4508cb32-24
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 21:39:51 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6aa45905-f659-0a2a45080019-aceafc1f99e4-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 21:39:50 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CC930404B7;
 Fri, 11 Sep 2026 19:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5421F00898;
 Fri, 11 Sep 2026 19:39:47 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789155588;
	bh=/psdj2YLMEmdCz9D5VhRewqtuEdv9ATvtmsLuk3XzfI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=k9Ez1FpUvK4PGlaqmgOmqVif2tzopAFjAYcoB7pajNhBwdstU1Z9owHylMahYXQ+z
	 ZG4M7ztSdXAV4hpI45PEQT9QcM7xv30jkZZMPlo8qHc4FPvHQAccBgxTCP+gghiad8
	 QRYIu68YXGTuTGjFw3qWcwnjx3nl2fhu2/iyG9QKpu2Qh+i/8cl/PV6XONNLmh7w5w
	 bFy967zuR8OD/rNEkMItJr6j1VzgLe3Of41NLWGfuxqPwQU+EDrtsieVRjhJ9B/tJ9
	 go/TwmbvgH1b7ccxdgtT5YJNAVD3jUcizYQOS23kB2NxTJc3Pc9V5bru/0JjbEqAuq
	 eFINiLj0XXD6Q==
Date: Fri, 11 Sep 2026 12:39:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
Subject: Re: [PATCH] arm/xen: Point the comment at the YAML binding
In-Reply-To: <20260907012430.21823-1-kmehltretter@gmail.com>
Message-ID: <c71518ca-53e6-4ae2-d176-a1508a7e7156@kernel.org>
References: <20260907012430.21823-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c1860d/1789155591-D457487B-6281FF35/0/0
X-purgate-type: clean
X-purgate-size: 1125

On Mon, 7 Sep 2026, Karl Mehltretter wrote:
> The binding was converted by commit 4dbfe5467485 ("dt-bindings: arm:
> xen: Convert to DT schema"), so Documentation/devicetree/bindings/arm/
> xen.txt no longer exists.
> 
> Point the comment at the YAML schema.
> 
> Fixes: 4dbfe5467485 ("dt-bindings: arm: xen: Convert to DT schema")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  arch/arm/xen/enlighten.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index 25a0ce3b4584..0b7b7e3417e3 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -251,7 +251,7 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
>  }
>  
>  /*
> - * see Documentation/devicetree/bindings/arm/xen.txt for the
> + * see Documentation/devicetree/bindings/arm/xen.yaml for the
>   * documentation of the Xen Device Tree format.
>   */
>  void __init xen_early_init(void)
> -- 
> 2.53.0
> 

