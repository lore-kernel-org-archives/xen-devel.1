Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0081EC531D0
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 22:00:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369629.1618201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn1SQ-00059G-UN; Thu, 23 Jul 2026 21:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369629.1618201; Thu, 23 Jul 2026 21:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn1SQ-000599-Qw; Thu, 23 Jul 2026 21:59:58 +0000
Received: by outflank-mailman (input) for mailman id 1369629;
 Thu, 23 Jul 2026 21:59:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1wn1SO-000593-RX
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 21:59:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wn1SO-0030l2-5N
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 23:59:56 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a628ecc-e002-0a2a0a5209dd-0a2a4508c8e8-12
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 23:59:55 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6a628edb-f659-0a2a45080019-416d716ceb22-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 23:59:55 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DB7A540E014C; 
 Thu, 23 Jul 2026 21:59:54 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WsJnCXk2IarN; Thu, 23 Jul 2026 21:59:45 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A4E7340E00E6;
 Thu, 23 Jul 2026 21:59:31 +0000 (UTC)
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
	t=1784843984; bh=7Jhx3OuJbEDdsSSsXaqPPUx169LpZd6Yo6COE6d5ndA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ax5QKjlE54yydhF+Sfo8H0cW6DIhOqKh71pUTskSTe6OgR0lyRpB/PQahU8BX0MSv
	 ynUhDTvRXKsdcardX/S6szI2T6dCMWVb49nzlUKY8t1nsoAnr85p+gO8nwtDfOlbqh
	 0TxhT4Lt1lliwbJ9RMcZdSh8+76DHSkyhM9i4YAC079uyYKY7w8up0ln88waElX3Ws
	 I1Adh4B0BdIDPzKxRakm7nNJQy/eG7dGxIKIA7BmRdpBcPn3Q5mAqHn8Dz5cIgvGpg
	 /n298iTumHy64OjY0ZJ5tdT3aYIXY28s5+fKOQ9djx9z7zlphgiTZSwTdzy9BPscnp
	 qNaUAluc2L9/P9eXvNn7qiFA/RBkqMar/yId54tn8kyJ25wl8gaMiqk7qz3douKQ9m
	 dNmCgsjkeVJWKEGC5DTNgpwFgtyaxB0LiMr4EaimA6CkR7YBBL7uqvoKcNXoAVg1qu
	 iG0ayGHepCIe8ArU8B8cY3/5wJI5u07gzRn0gthpBi2GQO+RFTozz1zHhUj82jV31m
	 mFwEJFcuXTg9ZtA3OPY5mQ1J5LrmsGqbTYGAtESOvSJeaZKHnouLrEjSygbRDqBH4c
	 qCefy9K+FgVC3S++daKtf+uiVnCNioB32mZUz34TYWb7PODayMYRkqa3PlR2NfWl5M
	 LEjKQ2InfHfeb4zyj6Fw6i0g=
Date: Thu, 23 Jul 2026 14:59:28 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 3/5] x86/asm: group inline string functions
Message-ID: <20260723215928.GBamKOwB3PIaHrQFbs@fat_crate.local>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
 <20260721-pvh-kasan-inline-v7-3-38979a50cef0@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-pvh-kasan-inline-v7-3-38979a50cef0@igalia.com>
X-purgate-ID: tlsNG-c1860d/1784843995-D4B7187B-AE6622F4/0/0
X-purgate-type: clean
X-purgate-size: 1384

On Tue, Jul 21, 2026 at 12:56:44PM -0300, Mauricio Faria de Oliveira wrote:
> Group the __inline string functions in the same header.
> 
> Use <asm/shared/string.h> since __inline_memcmp() must remain there for use
> by arch/x86/boot/string.c.

"No functional changes."

> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> ---
>  arch/x86/include/asm/shared/string.h | 26 ++++++++++++++++++++++++++
>  arch/x86/include/asm/string.h        | 21 +--------------------
>  2 files changed, 27 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
> index 166274e44f3cb49e3dccab3cdac281d67aef5d44..9714fbda8b734e20686bfb88a6ca857bfee59e1a 100644
> --- a/arch/x86/include/asm/shared/string.h
> +++ b/arch/x86/include/asm/shared/string.h
> @@ -2,6 +2,32 @@
>  #ifndef _ASM_X86_SHARED_STRING_H
>  #define _ASM_X86_SHARED_STRING_H
>  
> +/*
> + * The __inline string functions are grouped in this file for consistency and
> + * for use by arch/x86/boot code due to limitations on including asm/string.h.

What limitations?

Either explain them or don't bother adding a comment. asm/shared/ is generally
an understood concept if you grep the tree and you don't really need a comment
here.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

