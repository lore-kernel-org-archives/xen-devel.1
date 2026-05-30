Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C956CD6E4C
	for <xen-devel@archiver.kernel.org>; Sat, 30 May 2026 23:49:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1323235.1589098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTTQZ-00035w-JV; Sat, 30 May 2026 23:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323235.1589098; Sat, 30 May 2026 23:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTTQZ-00035p-Gr; Sat, 30 May 2026 23:49:15 +0000
Received: by outflank-mailman (input) for mailman id 1323235;
 Sat, 30 May 2026 23:49:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1wTTQY-00035g-EO
 for xen-devel@lists.xenproject.org; Sat, 30 May 2026 23:49:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTTQX-008GUF-AL
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 01:49:13 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a1b7777-5cb7-0a2a0a5109dd-0a2a4509b9ae-2
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2026 01:49:13 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bp@alien8.de>)
 id 6a1b7778-2497-0a2a45090019-416d716cdb16-3
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2026 01:49:13 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 27FB440E015B; 
 Sat, 30 May 2026 23:49:12 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CuojZA2qaerR; Sat, 30 May 2026 23:49:02 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C124540E015A;
 Sat, 30 May 2026 23:48:47 +0000 (UTC)
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
	t=1780184941; bh=4+MFkyNyrinsu/RKn0dXUHfFSV9ybIhTXQSILLvX/Ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4grmiUmhfVbDVTs4PNwjGXhCN//Yg3GEFQycYhBCoOsmx1C+fScaEheQUEcfvIxb
	 3/pp8kzTw1HkNsiuUwrhcsP5FItKOLbOJwp1ZKHpQ//NSuT9NPLfqyqcKh3qr+e6E3
	 c5FZ/Ye20oI512sH4PUiiRZ2xebt88ystYAk34ypohAv11qXX/13aBWDVncIMuq74r
	 ybO93LfYtbG6cqjkIVCdsz3qXeWIrtA0YMEbjg0HxJ9yfu7QlX9yiLoJX6gLMR5juf
	 kNnU3AkH2L87u+1VtnLTZgOIW6OZKIz55El+FCYoyDeX1kSXMbZc40cGBKIC9fTtUK
	 oxOVf8H0t0LOnapyXLIeZkIMe21htuwRuXY3DcRi/2jVZvFDRYl01IcaBpRQncUnpn
	 N+cvg6t5WzTTz3IivMDPU1KYY/ximCN+Ot1rsapCuTkwmmP4UC3FtUDiMGCRHxRFja
	 dmw+LvnWI1cDfTTBHnhbbkfg2+t9t/GWOAeXeIUzta8Uhs9vPKfQbnCdmvgjingT7E
	 PhuS37z5LngxTun2vBBAN8YgKIOIKDjS9oNLx5jpxXAP98mbN/1QqyB2CDOqLlrBhq
	 93ZaLDkOOQNaxQsqbPji8H4mTFTRwSp/CS+UA6ElKDwz6N5G5GTrxdjPcli6OFxuNp
	 NXzBbTXN4TqlALMLWWegSzNg=
Date: Sat, 30 May 2026 16:48:40 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 1/4] x86/asm: move inline string functions to
 <asm/string_inline.h>
Message-ID: <20260530234840.GBaht3WL8L15zfNvBF@fat_crate.local>
References: <20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com>
 <20260526-pvh-kasan-inline-v4-1-a310e6a25ecd@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526-pvh-kasan-inline-v4-1-a310e6a25ecd@igalia.com>
X-purgate-ID: tlsNG-bad1c0/1780184953-8AB8EA53-283632F6/0/0
X-purgate-type: clean
X-purgate-size: 3464

On Tue, May 26, 2026 at 11:52:33AM -0300, Mauricio Faria de Oliveira wrote:
> In a future patch, 'boot/string.c' will include inline string functions.
> 
> Using the header <asm/string.h> is problematic for a couple of reasons
> (i.e., build errors), which can be addressed, but introduce unnecessary
> complexity and regression risk (beyond these _found_ couple of reasons).
> 
> Using a new header <asm/string_inline.h> is simpler and transparent to
> existing users of <asm/string.h>, with less changes to 'boot/string.c'
> and its users (eg 'boot/compressed/string.c' and 'purgatory/purgatory.ro'),
> which minimize regression risk.
> 
> No functional change intended.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605140922.q7IlUv7o-lkp@intel.com/
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> ---
> (*) Reasons not to include <asm/string.h> in 'boot/string.c':
> 
> 1) 'boot/string.c' is built for 16-bit/real mode thus some type and word
> size errors happen when <asm/string.h> include, e.g., <asm/string_64.h>.
> 
> This can be addressed with '#ifndef _SETUP' (defined by 'boot/Makefile').
> 
> 2) 'boot/string.c' is included by 'boot/compressed/string.c' which is
> the source of 'purgatory/string.o', linked by 'purgatory/purgatory.ro'
> (CONFIG_KEXEC_FILE).
> 
> In 64BIT, <asm/string.h> includes <asm/string_64.h>, which references
> __memset() and __memmove() with KCFI_REFERENCE(), ie, __ADDRESSABLE();
> however, 'purgatory/purgatory.ro' is not linked with implementations.
> 
> So, CONFIG_KEXEC_FILE and CONFIG_CFI without CONFIG_KASAN hit errors:
> 
>   >> ld.lld: error: undefined symbol: __memset
>      >>> referenced by string.c
>      >>>               arch/x86/purgatory/purgatory.ro:\
>                        (__UNIQUE_ID_addressable___memset_0)
>   --
>   >> ld.lld: error: undefined symbol: __memmove
>      >>> referenced by string.c
>      >>>               arch/x86/purgatory/purgatory.ro:\
>                        (__UNIQUE_ID_addressable___memmove_1)
> 
> (Note: this is not hit with CONFIG_KASAN because 'boot/compressed/string.c'
> adds aliases __memset()/__memmove() to memset()/memmove() in that case.)
> 
> This can be addressed with 'CFLAGS_string.o := -D__DISABLE_EXPORTS' so to
> disable KCFI_REFERENCE() in 'purgatory/Makefile' (it removes CC_FLAGS_CFI
> anyway).
> 
> ...
> 
> However, since a change in this series would need more changes to address
> errors it causes, it is reasonable to change the series not to cause them,
> by using a separate header with _just_ inline string functions.

This is very long-winded and it meanders across things. Write it more
disciplined, please, and formulate it such that you're writing the commit
message of a standalone patch. It should have merit on its own and not talk
about future patches and so on.

And yes, the intent to have a separate header which doesn't pull in
nasty deps between decompressor and kernel proper, is ok.

For that, we have arch/x86/include/asm/shared/ which contains functionality
shared between the two objects so I think you should move it there. It'll also
make it a "clean" header which contains solely this stuff and doesn't pull in
any other shit.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

