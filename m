Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9167EC44532
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 17:04:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368659.1617917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmaMX-0004mQ-Nr; Wed, 22 Jul 2026 17:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368659.1617917; Wed, 22 Jul 2026 17:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmaMX-0004mJ-LI; Wed, 22 Jul 2026 17:04:05 +0000
Received: by outflank-mailman (input) for mailman id 1368659;
 Wed, 22 Jul 2026 17:04:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1wmaMW-0004mD-2P
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 17:04:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmaMV-00H1TA-CJ
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 19:04:03 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a60f7f6-2eae-0a2a0a5409dd-0a2a4508db70-32
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 19:04:03 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6a60f802-f659-0a2a45080019-416d716ce040-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 19:04:03 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 676B440E014C; 
 Wed, 22 Jul 2026 17:04:02 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XvFiLD8XTnGS; Wed, 22 Jul 2026 17:03:52 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7369240E019E;
 Wed, 22 Jul 2026 17:03:37 +0000 (UTC)
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
	t=1784739830; bh=0TMyZJ+2oYdfk/x6fhwC12KPd/UX0c869fa4clJ+aPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZhtkdSZkxAhyAZ8ADc7HxuMK/GaikUBwGUUA0nbJC7FzNV5bvFxEpYyz3/MTr6daN
	 M5BRpHk8CQRN/vRRnhnUSAcvTGkmJyvGF5ZvOQSWEpm2PJKa/JMub9g++/Qx5X6jw0
	 nn5m5LJ/5gd+PulU9uBaXUigHhG+NB+unF0I4DD0ZyKxlleS48VreKflMcAVaM+3ym
	 hskVZ1cOt9ffyULhkZTCr9Zy75T5AAhRjoM18W9wueHo34+8YJbulLdOOxfCMXRXv/
	 JTHWksTA4AF9+e20kkW865tVMLj4QSouV/YLEoRqQ79a/KX3BvHY71g5EGALYICIxc
	 hhUI2nUJbv582HtR9SqBHyA0xRViXim49oqhtODjWqr5zc+HwRjcvZ0M9+e1MWMJrj
	 RPfuvjl2BLUBnUFhIS+nUOlqOfWq+pyYvs/xVOEH561d31o6K0E1SQWjJuihpYM5RL
	 xDZq5EdtVFDfdj69NZIM7tAh5rPqJ7n+OzxwJEITyTJfrN2ugFVHSiVPZSptKDKKzO
	 mpVnwvEpGostusQwfe29KG6LfHvWwyr/5z5cz6fJMfRj25U1v3RG8SGMvZBuW8kC5S
	 TOfpDb/FiPp1EcDmqacGcvqfWPr57hh+EJvnOTCL2hZuyZHtj3kX86/C9Ntybq0Ypz
	 eXmu+N1uuPDGsbeRX0mtONA0=
Date: Wed, 22 Jul 2026 10:03:34 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 2/5] x86/asm: add volatile, clobbers and zero-length
 check in inline memcmp
Message-ID: <20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
 <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com>
X-purgate-ID: tlsNG-c1860d/1784739843-CDF4787B-8A1AE63E/0/0
X-purgate-type: clean
X-purgate-size: 2120

hpa in To:.

On Tue, Jul 21, 2026 at 12:56:43PM -0300, Mauricio Faria de Oliveira wrote:
> Add the volatile qualifier and clobbers parameter to prevent bugs with
> instruction reordering and optimization.
> 
> Also check the zero-length case, as the 'repe' prefix does not run the
> 'cmpsb' instruction if the 'count' register is zero, which doesn't set

Please use capital letters for insns: REPE, CMPSB and you don't need to put
words in '' - it reads fine without them.

> the condition-code/zero flag, so the result is based on a stale flag.
> 
> Those are pre-existing issues found by Sashiko.
> 
> Link: https://sashiko.dev/#/patchset/20260701-pvh-kasan-inline-v6-0-ba99045dfa9f%40igalia.com
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> ---
>  arch/x86/include/asm/shared/string.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
> index 02b92927553f7b8e1c87e6122bbaa70439e57ea7..166274e44f3cb49e3dccab3cdac281d67aef5d44 100644
> --- a/arch/x86/include/asm/shared/string.h
> +++ b/arch/x86/include/asm/shared/string.h
> @@ -11,8 +11,12 @@ static __always_inline int __inline_memcmp(const void *s1, const void *s2, size_
>  {
>  	bool diff;
>  
> -	asm("repe cmpsb"
> -	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
> +	if (len == 0)
> +		return 0;
> +
> +	asm volatile("repe cmpsb"
> +		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
> +		     : : "cc", "memory");
>  
>  	return diff;
>  }

So this is a fix which should probably go to stable, I think. Going back into
git history, it points to

  62bd0337d0c4 ("Top header file for new x86 setup code")

from 2007. And we have carried it this way through the years and who knows
what hit this or not. So please make this the first patch in your set - you
can even send it separately so that I can get route it through stable.

Then you can base the rest ontop.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

