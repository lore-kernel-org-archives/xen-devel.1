Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA154E88D6E
	for <xen-devel@archiver.kernel.org>; Fri,  3 Apr 2026 23:48:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1273371.1560213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8oF9-0003TV-KQ; Fri, 03 Apr 2026 23:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1273371.1560213; Fri, 03 Apr 2026 23:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8oF9-0003TO-H5; Fri, 03 Apr 2026 23:48:03 +0000
Received: by outflank-mailman (input) for mailman id 1273371;
 Fri, 03 Apr 2026 23:48:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1w8oF7-0003TI-Td
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 23:48:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8oF7-009MjX-9u
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2026 01:48:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69d051af-5cb7-0a2a0a5109dd-0a2a4507bfd6-6
 for <xen-devel@lists.xenproject.org>; Sat, 04 Apr 2026 01:48:01 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <sstabellini@kernel.org>)
 id 69d051af-ba2d-0a2a45070019-aceafc1f8c1a-3
 for <xen-devel@lists.xenproject.org>; Sat, 04 Apr 2026 01:48:00 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D209643BAA;
 Fri,  3 Apr 2026 23:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134E6C4CEF7;
 Fri,  3 Apr 2026 23:47:57 +0000 (UTC)
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
	s=k20201202; t=1775260078;
	bh=A/UuuA1NVFkJMO81wS0G58dAgB2oCFTP3hEqag6xc8c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GJl0pGY4rSCZdff2BVZvDGgyy/PfbnKnWwsgH/4L92t8PypTgMmGCNS58Ab86tTra
	 5NKgnGl1oFDIfLg5xe7Yf3J2iHFHk1dG/uQJIpLQZCr7OY69AvYjJbzqUvwIG5ryxW
	 /zHLZ7IKxVrKRxpWHSJqMKRfyYiC4zkjF00C+Mr/fAQNgp5PD7J8FsmEdIv0nrnPJ7
	 oyCUPGhqIjOsXeb7MNN/AuSy3sJrTQrP8nqmEA0x2ct7z32sJgecpC+AMcB8jxGYdN
	 F8GCcJKKje1tvzAR8OCYbqtAHMk2ve3lIHaBQZiOZtuhLaglBgnEPpP4XEeXVnmdWS
	 Jga7pSoh180UQ==
Date: Fri, 3 Apr 2026 16:47:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: xen: validate hypervisor compatible before parsing
 its version
In-Reply-To: <20260403151502.2-dt-arm-xen-resend-pengpeng@iscas.ac.cn>
Message-ID: <alpine.DEB.2.22.394.2604031637130.2873990@ubuntu-linux-20-04-desktop>
References: <20260403151502.2-dt-arm-xen-resend-pengpeng@iscas.ac.cn>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-ef75cf/1775260081-1274A41E-A6D6C45C/0/0
X-purgate-type: clean
X-purgate-size: 2310

On Fri, 3 Apr 2026, Pengpeng Hou wrote:
> fdt_find_hyper_node() reads the raw compatible property and then
> derives hyper_node.version from a prefix match before later printing it
> with %s. Flat DT properties are external boot input, and this path does
> not prove that the compatible string is NUL-terminated within its
> declared bounds.
> 
> Fetch the first compatible entry with fdt_stringlist_get() so malformed
> unterminated properties are rejected before the version suffix is
> parsed.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  arch/arm/xen/enlighten.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index 4feed2c2498d..f69290a4c639 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -19,6 +19,7 @@
>  #include <asm/efi.h>
>  #include <linux/interrupt.h>
>  #include <linux/irqreturn.h>
> +#include <linux/libfdt.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_fdt.h>
> @@ -218,8 +219,9 @@ static __initdata struct {
>  static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
>  				      int depth, void *data)
>  {
> -	const void *s = NULL;
> +	const char *s = NULL;
>  	int len;
> +	size_t prefix_len = strlen(hyper_node.prefix);
>  
>  	if (depth != 1 || strcmp(uname, "hypervisor") != 0)
>  		return 0;
> @@ -227,10 +229,10 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
>  	if (of_flat_dt_is_compatible(node, hyper_node.compat))
>  		hyper_node.found = true;
>  
> -	s = of_get_flat_dt_prop(node, "compatible", &len);
> -	if (strlen(hyper_node.prefix) + 3  < len &&
> -	    !strncmp(hyper_node.prefix, s, strlen(hyper_node.prefix)))
> -		hyper_node.version = s + strlen(hyper_node.prefix);
> +	s = fdt_stringlist_get(initial_boot_params, node, "compatible", 0, &len);
> +	if (s && len > prefix_len + 2 &&
> +	    !strncmp(hyper_node.prefix, s, prefix_len))
> +		hyper_node.version = s + prefix_len;

I'd prefer to go with:

  s = of_get_flat_dt_prop(node, "compatible", &len);
  if (s && len > 0 && strnlen(s, len) < len &&
      len > prefix_len + 3 &&
      !strncmp(hyper_node.prefix, s, prefix_len))


