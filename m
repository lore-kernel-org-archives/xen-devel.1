Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934BBC79F8C
	for <xen-devel@archiver.kernel.org>; Sun,  6 Sep 2026 17:02:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410427.1641352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3GFa-0007am-2E; Sun, 06 Sep 2026 17:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410427.1641352; Sun, 06 Sep 2026 17:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3GFZ-0007ae-UH; Sun, 06 Sep 2026 17:01:49 +0000
Received: by outflank-mailman (input) for mailman id 1410427;
 Sun, 06 Sep 2026 17:01:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1x3GFY-0007aY-0P
 for xen-devel@lists.xenproject.org; Sun, 06 Sep 2026 17:01:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3GFX-00GQhM-7S
 for xen-devel@lists.xenproject.org; Sun, 06 Sep 2026 19:01:47 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a9d9c6e-e002-0a2a0a5209dd-0a2a450cc8a0-6
 for <xen-devel@lists.xenproject.org>; Sun, 06 Sep 2026 19:01:47 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6a9d9c7a-f479-0a2a450c0019-416d716cd4c8-3
 for <xen-devel@lists.xenproject.org>; Sun, 06 Sep 2026 19:01:47 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0FFDD40E01E1; 
 Sun,  6 Sep 2026 17:01:46 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OAwfk7M4z7hs; Sun,  6 Sep 2026 17:01:36 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1FD6A40E00B9;
 Sun,  6 Sep 2026 17:01:19 +0000 (UTC)
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
	t=1788714094; bh=51b2uIj3sChLBhb35/VVuLepNdtIGJ1sMqXdDiS37Is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0nd3Ts689qj7P6JKRDKgJwW5mYJkSTZowCBIaltEgk3wibuedZir76K0Tnqhms+s
	 8In1rBmBQ3Z68uuT7c9k8u1jWTtS3cfSMXjf+UAgLJ9l6uoqVgXgJMaV6u/Sd60/Kf
	 Ow4SW6rWyNymNIrO4OfEbsWTTw3APvpEYqBCUJ9Mn8oqarh91Rlqy7RP1tVLqp4PeP
	 ubRSeyzmvJh6KerZNcYVdtrJd6SuhoP/1knyHPfNpCAB7jkyAI0v6yIy6tiEFiZ7cw
	 BXCm0kKXXZLj4U1zZ22gmeU0+Xr5yHLYEpLYpXUHsPredmfxvTIPM20m+wyH0r8pUW
	 ZuKsdJHDV2yG0TcCwBAw8bhyzpzmr70pVSn2dq4zIQHq6DzA90wiWuO49rjAwVjl+J
	 Uy5a+meD0joxhmnmogwcQXedt3MEMpD7FtKjMzcOgwfzusZr5W0ok+lduv5JAuHGs2
	 lmsNpbGSxBPn0Ki9rTILAXDI8quIosiyRx9OuFU1v8uVtZPoPANcxzZKXjntO/U+m8
	 UQxYYV4t2duz7Ds02CJqeV8OJqTnwJ+aCcGjdI9yrjvrZ7z9uTEzS/A4+XUhXztiAq
	 bTQSP2p3w8S6e3Fbl6aZXAxtkZHuvUQSbOx8KuLCZU56KqdT/H4Z1l4u+FY6mfcVxR
	 pIHMHXtkpn4zUNH1CtrlT41A=
Date: Sun, 6 Sep 2026 10:01:16 -0700
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
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
Message-ID: <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
X-purgate-ID: tlsNG-d25034/1788714107-51538A5B-BCC3AA26/0/0
X-purgate-type: clean
X-purgate-size: 1765

On Sat, Aug 22, 2026 at 03:33:18PM -0300, Mauricio Faria de Oliveira wrote:
> Move the inline memcmp function currently only available in 'boot/string.c'
> into the shared string function header <asm/shared/string.h> to be reused.
> 
> This is not done through <asm/string.h> to avoid pulling unnecessary code
> in 'boot/string.c' that causes build errors in 'boot/compressed/string.c'
> and 'purgatory/purgatory.ro'.

Please drop those '' quotes - it is perfectly clear that those are .c files.

> No functional changes.
> 
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> 
> ---
> 
> Thanks to David Laight for noticing the return value difference between
> inline and regular memcmp().
> ---
>  arch/x86/boot/string.c               | 13 ++-----------
>  arch/x86/include/asm/shared/string.h | 26 ++++++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 11 deletions(-)

...

> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..06c1d5e5013e4d59cfb49866d10e164362d2c4cc
> --- /dev/null
> +++ b/arch/x86/include/asm/shared/string.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_X86_SHARED_STRING_H
> +#define _ASM_X86_SHARED_STRING_H
> +
> +/*
> + * This inline memcmp() returns 0 (equal) or 1 (not equal).
> + * The regular memcmp() returns <0 (less than), 0 (equal), or >0 (greater than)
> + * to indicate ordering as well.

No need to overdo it:

	Returns:	0 (equal)
			1 (not equal)

In contrast, the regular memcmp() follows glibc return value semantics.


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

