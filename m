Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACF9C79FA1
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 04:40:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415642.1644905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4t3j-0001if-N6; Fri, 11 Sep 2026 04:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415642.1644905; Fri, 11 Sep 2026 04:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4t3j-0001iY-KX; Fri, 11 Sep 2026 04:40:19 +0000
Received: by outflank-mailman (input) for mailman id 1415642;
 Fri, 11 Sep 2026 04:40:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1x4t3i-0001iF-Ew
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 04:40:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4t3g-007s1M-EC
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 06:40:16 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6aa385f2-2eae-0a2a0a5409dd-0a2a4503ec4a-42
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 06:40:16 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6aa38630-fae8-0a2a45030019-416d716ce788-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 06:40:16 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B7CAC40E00E8; 
 Fri, 11 Sep 2026 04:40:15 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id njDzaZ9af6w9; Fri, 11 Sep 2026 04:40:06 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5171840E00B8;
 Fri, 11 Sep 2026 04:39:50 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=alien8 header.d=alien8.de header.i="@alien8.de" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789101604; bh=6qo6QIs0b8aAAaNSTcLUnAAWEPHz3aFEX3OTeai0y60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q7q3U/MqLnZqz9eauXKGR5jkGJoQi/xsVneN3cpyobRdrDoSZieIYnY5Kczd77/QS
	 QtW0OuJqp+UpOM2b7qA7NV1xgMtrbpezYey5yKCRtFISka3VbmA+gDHJ2BYxYKYZak
	 +YkuPDvyFQwH2IzESFjNzr/Vw0M+v3EZN4ggIA/R0/j/6hGtAeh1spO/Ll5aLdWoAb
	 RiT3/XxrrFYIl6f5osJRwfV7Oad/wV6+xGO3AfZKqBD7t+jFL5uxietxLquGSpCCxG
	 HlBCvN7rBSTXeB13qllYR/k+GjLH41zoQetUNUrV78FZeqap62y093w9mUkAtnknen
	 zxL/vsCndurZTjncKxdKajbHdAK3SEq68Kn7g3YJbTt+oGPuWegSjC+K/zZzjViwZ2
	 Vjas1VTohdoOfbDzgt9AXegkjm4cOcHyadroTDj3/0wFaeMQLgAEqJlHrdsYkuy1XH
	 Hyl2A2EqO//Ze+yX0xeVWlSaD2OeRnJ0zVSJDZX7F6yyGlT9obDHd6uiwdOZBDFM3n
	 WicAreuz2Vz/+GLvOUp5CvPou5WZn5NGs3QeeOnXcxP76I/z5ttw5J+pG2g00lEpjs
	 jO0/0Iy+D5edRQ3OQjuF1m0wZ1KEFDu/NyvfdYeYte4dJX9EJqXNCnZyH19HQRFBSQ
	 5s/aSZcj+EvMoKdRSTOKTtkQ=
Date: Thu, 10 Sep 2026 21:39:47 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 5/5] x86/pvh: fix unbootable VMs by really inlining
 memset() in xen_prepare_pvh()
Message-ID: <20260911043947.GIaqOGE9DFCHWwc6Ys@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-5-e70ef3b75b6a@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822-pvh-kasan-inline-v9-5-e70ef3b75b6a@igalia.com>
X-purgate-ID: tlsNG-33051d/1789101616-6CEDA4E9-0722017D/0/0
X-purgate-type: clean
X-purgate-size: 1724

On Sat, Aug 22, 2026 at 03:33:21PM -0300, Mauricio Faria de Oliveira wrote:
> Even with __builtin the compiler may decide to use the out of line function
> instead of the inline implementation.
> 
> This particular one (still) generated the inline implementation as expected
> (at least in these compiler versions) but this is not guaranteed to remain.
> 
> Switch the builtin to the inline implementation to address it.
> 
> Fixes: fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/platform/pvh/enlighten.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
> index f2053cbe9b0ce3d2178938269607c652ae8f528e..cb442cbd9d828619421babb281bfe9759edbca8a 100644
> --- a/arch/x86/platform/pvh/enlighten.c
> +++ b/arch/x86/platform/pvh/enlighten.c
> @@ -8,6 +8,7 @@
>  #include <asm/hypervisor.h>
>  #include <asm/e820/api.h>
>  #include <asm/x86_init.h>
> +#include <asm/string.h>
>  
>  #include <asm/xen/interface.h>
>  
> @@ -129,7 +130,7 @@ void __init xen_prepare_pvh(void)
>  	 * This must not compile to "call memset" because memset() may be
>  	 * instrumented.
>  	 */
> -	__builtin_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
> +	__inline_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
>  
>  	hypervisor_specific_init(xen_guest);
>  
> 
> -- 

Why is this a separate patch from 4/5 if it is fixing the same thing?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

