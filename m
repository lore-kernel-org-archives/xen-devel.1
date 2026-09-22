Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B0EC982DF
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 03:59:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428071.1650770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8reU-0002k9-Sr; Tue, 22 Sep 2026 03:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428071.1650770; Tue, 22 Sep 2026 03:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8reU-0002k2-Pd; Tue, 22 Sep 2026 03:58:42 +0000
Received: by outflank-mailman (input) for mailman id 1428071;
 Tue, 22 Sep 2026 03:58:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1x8reS-0002ju-Ij
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 03:58:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8reQ-001Ji1-VQ
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 05:58:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6ab1fcee-bab6-0a2a0a5309dd-0a2a450aebd8-0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 05:58:38 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6ab1fcee-f2d2-0a2a450a0019-416d716cec86-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 05:58:38 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 010DB40E00E8; 
 Tue, 22 Sep 2026 03:58:38 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id nvhTkD8QdV62; Tue, 22 Sep 2026 03:58:34 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9C87740E01DD;
 Tue, 22 Sep 2026 03:58:19 +0000 (UTC)
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
	t=1790049514; bh=MBq9MKoqYDyi6jKC6qgxnxmzVGaLBF4/RDqvU1A6oxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MD0icsezxahjSvGTzX7FuWBeB30RgBBn2pASpPs5UbhD28SWShZh1cuuJam39GZwS
	 Leo1YpaiXthWZboMxhxUFwUsdViaKjhrZxp4WH9EtpIe0CHu9obPwjWYpN46+CeT45
	 dmeg2+agTy4z79x+WebZLBYYWkldkNgqEgRyB/uhN/5FqCjJMDt9a0gtSTkjc8V82s
	 +teTqJJsO/KCTXjMYhngD517M/Ivi9A8c9MJITaY99PisJGYHhtbelIh/Y42leqgvO
	 SN2oOSrpC7qYV/wJHKhATS9vxorQnilOVpRpwlvfD6fTFwxDtPjsa3NU6R2J/TK6w/
	 iSWA/QbGYuSudg0Z79sVPpYFAFzxDttoyG9Xd2Wv0FWkDjx3gd4p56i8/YAz2mp9By
	 Z1injbFi78Mzzc4c9z0pBRvjoc0yeyPVWQl7yPECF4ahcR6qIOqwt5iaZ0SdRi7MkW
	 iBxT+ISyQi/M+hwCZARNJLwaWsFW0K1HoRZE8y96uJxpOZoTXVF+qBOnG6qeA7Rznn
	 fBw/zstrEUhKUCEaxS3KeaZ4xbUifJ7+11/KViXmXBALyV75IckGDvNDeNR4iWSRgQ
	 Ggnewov4IZGcegK/2w2kQOlDVzVio+nouBuj3xLmhaDl94ZxduZ3VsWm4xAXigikdF
	 n/a/iOXxZ2UB85X1u/Us7llA=
Date: Mon, 21 Sep 2026 20:58:15 -0700
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
Subject: Re: [PATCH v10 0/4] x86/pvh: fix unbootable VMs again (PVH + KASAN)
Message-ID: <20260922035815.GFarH819yHRX8WWnG9@fat_crate.local>
References: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
X-purgate-ID: tlsNG-4011c0/1790049518-4B8D5CFC-0C32788E/0/0
X-purgate-type: clean
X-purgate-size: 1495

On Mon, Sep 21, 2026 at 10:36:31PM -0300, Mauricio Faria de Oliveira wrote:
> The issue of unbootable VMs with CONFIG_PVH due to CONFIG_KASAN is back.
> 
> Booting directly from vmlinux (instead of bzImage) now fails with gcc-14/15
> (but works with gcc-12/13) if CONFIG_KASAN_GENERIC is set, on Ubuntu 25.10.
> 
> The PVH code is required/supposed not to use the KASAN memory access check
> in the kernel entry point as KASAN has not yet been setup, or an exception
> is hit and the boot fails.
> 
> This was previously described and addressed with __builtin_mem{cmp,set}():
> - commit 661362e3dcab ("xen, pvh: fix unbootable VMs (PVH + KASAN - AMD_MEM_ENCRYPT)")
> - commit 416a33c9afce ("x86/cpu: fix unbootable VMs by inlining memcmp() in hypervisor_cpuid_base()")
> - commit fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")
> 
> However, even with __builtin the compiler may decide to use the out of line
> function instead of the inline implementation. So, that does not really fix
> the issue unconditionally; see details below.

So, this whole deal doesn't sound to me like we need to backport it to stable
- it rather looks more like fixing some configs which want to enable KASAN on
PVH guests.

In that case, I'll queue this for 7.4.

If this needs to go to stable, then there better be a pretty good reason for
it.

Right?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

