Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436D4C79FA1
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 04:39:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415635.1644897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4t2O-0000El-Gr; Fri, 11 Sep 2026 04:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415635.1644897; Fri, 11 Sep 2026 04:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4t2O-0000Ec-By; Fri, 11 Sep 2026 04:38:56 +0000
Received: by outflank-mailman (input) for mailman id 1415635;
 Fri, 11 Sep 2026 04:38:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1x4t2M-0000E3-7P
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 04:38:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4t2J-0079dY-PR
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 06:38:51 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6aa385a6-bab6-0a2a0a5309dd-0a2a450cae94-48
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 06:38:51 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6aa385db-f479-0a2a450c0019-416d716c91a6-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 06:38:51 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 832BB40E00E8; 
 Fri, 11 Sep 2026 04:38:50 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id FpIopqVKuj8D; Fri, 11 Sep 2026 04:38:40 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C145240E00B9;
 Fri, 11 Sep 2026 04:38:25 +0000 (UTC)
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
	t=1789101520; bh=T7n3csq1h16sUuD8cRvGmtF1Jsj0J38l6tEVY9X+IHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUYyefAdcLKDhek0XZZcuEIHjGff5EZZ+pdDbVpsjpKiJgrGEhlw4vGrfG7894cfp
	 il06hXtV41nlJmUXp5cA0dDZzcIn+U8gra4xN0tnCH9O3N5nqRvpgzvIEqHD9C7Eln
	 FUWtayd86Grx3UAeXbnNm145iaS8Csz2VWrddCIPLg5SuUAGAGToudrdjDnKMq2yVj
	 n4Z1fagj7nihG65GNsUTZKpCRxANhM/Ybr9QhGT5zvqzJDLS7BIQh1ssfo28tIubb9
	 dg9us/aRxXvx1wOHyC7lj89n8MJLzzp1DXI8ZO+oJdZ8sr0l2dMff+UeHxTmISePia
	 3vFwC2/eDIZvu3dzt9qRVd3c9PKOsc0mVEoungLxLYMuDQlSyom4Nxbgl9m90hc61S
	 Fkh7sQW5cP24QxKB2W8kZ/2ycEOjBRbHJIjisgACjwB2pE3MfncBos48Xagqrr3I/v
	 G39l24Ooqd0YfDzagldTXOIMcD3OcVUYxeewhSl6auATMwZhzkK8h8YIE8BNYuA+Dd
	 8ciayjcOb+yGStSKydsjaZvnGHdCeNTvdXpDrrtZG1x2dMpSJBMNod18EkeukIjTDt
	 FlA/jChQ8xXi/XysbOVvPITmtBfmfvAw9H3svhYGJ+yIM5EYclc+IgRC1NkORqzdNd
	 dShvl81qRqWMAZv5t0+3dgDc=
Date: Thu, 10 Sep 2026 21:38:22 -0700
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
Subject: Re: [PATCH v9 4/5] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
Message-ID: <20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
X-purgate-ID: tlsNG-d25034/1789101531-020C1A5B-10284FDD/0/0
X-purgate-type: clean
X-purgate-size: 2217

On Sat, Aug 22, 2026 at 03:33:20PM -0300, Mauricio Faria de Oliveira wrote:
> diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
> index 82eddfa2347b32b76c2ea9b85f005ca5416ac71f..2d9f3d4d63de6e721f275d9e80d372edbdfedf30 100644
> --- a/arch/x86/include/asm/cpuid/api.h
> +++ b/arch/x86/include/asm/cpuid/api.h
> @@ -204,7 +204,7 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
>  		 * from PVH early boot code before instrumentation is set up
>  		 * and memcmp() itself may be instrumented.
>  		 */
> -		if (!__builtin_memcmp(sig, signature, 12) &&
> +		if (!__inline_memcmp(sig, signature, 12) &&

Dunno, did you not think of simply doing it by foot and save yourself all
those gymnastics in patches 1-3?

IOW, something like this totally untested thing below:

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 2d9f3d4d63de..a2db83d17940 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -192,9 +192,10 @@ static __always_inline bool cpuid_function_is_indexed(u32 function)
 #define for_each_possible_cpuid_base_hypervisor(function) \
 	for (function = 0x40000000; function < 0x40010000; function += 0x100)
 
-static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
+static inline u32 cpuid_base_hypervisor(const char *__sig, u32 leaves)
 {
 	u32 base, eax, signature[3];
+	u32 *sig = (u32 *)__sig;
 
 	for_each_possible_cpuid_base_hypervisor(base) {
 		cpuid(base, &eax, &signature[0], &signature[1], &signature[2]);
@@ -204,9 +205,12 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
 		 * from PVH early boot code before instrumentation is set up
 		 * and memcmp() itself may be instrumented.
 		 */
-		if (!__inline_memcmp(sig, signature, 12) &&
-		    (leaves == 0 || ((eax - base) >= leaves)))
-			return base;
+		if (sig[0] == signature[0] &&
+		    sig[1] == signature[1] &&
+		    sig[2] == signature[2]) {
+			if (leaves == 0 || ((eax - base) >= leaves))
+				return base;
+		}
 	}
 
 	return 0;


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

