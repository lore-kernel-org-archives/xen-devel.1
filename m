Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB66C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 19:29:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413630.1643736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4NyP-00084U-GO; Wed, 09 Sep 2026 19:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413630.1643736; Wed, 09 Sep 2026 19:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4NyP-00084N-Co; Wed, 09 Sep 2026 19:28:45 +0000
Received: by outflank-mailman (input) for mailman id 1413630;
 Wed, 09 Sep 2026 19:28:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <david.laight.linux@gmail.com>) id 1x4NyO-00084H-O2
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 19:28:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4NyO-008W4u-4I
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 21:28:44 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6aa1b33f-2eae-0a2a0a5409dd-0a2a450bbfa4-26
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 21:28:44 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6aa1b36b-b7e8-0a2a450b0019-d155dd33d5fd-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 21:28:44 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-482f2ee53e7so4620406f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 12:28:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d20fc23fcsm68962995e9.3.2026.09.09.12.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 12:28:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982123; x=1789586923; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3OqLNu4tTJ8NtFG6KAdKCHnZlkuKkQ1EKyLuMpgNzJ0=;
        b=jGOuRffEOTIjYFvlaIXbGmR3UlinipdhkGm7y8PuMAjajRMPwcllMhG7B2t9YbTDGB
         dIhZUMzcdEyoRM5gbYf/56sETsRhpLyueNW74VGECQF3X2+qZt2ki96GU+h6y77DMC30
         aV0ZdfcE3irPnCVtSVja9X9EJ5MxRZ/i9sIk0WvUXC6MZ09AB+OPbM+4j8zJK0GTu7Rw
         +VWkSyUJ8vYA358Sz6o9IwSIR9VdC9Zfxm1zOZ087Y6WT8ElwaNQk/RzXZEZFor9N+X1
         GjnsP5rfKTSwRp61Rj0wuqwMGfeZCR5GK2yHzde39MkME2ndW8VCqlu7uLwKapHLdRRF
         utQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982123; x=1789586923;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OqLNu4tTJ8NtFG6KAdKCHnZlkuKkQ1EKyLuMpgNzJ0=;
        b=VtyUW5ZMGsaGe+RkCl+xNy/tS58j2X2AEn/Pwi+L/59GmwJb9uxEcMmm3Y2vsiQMA+
         mR/NGNwE9gtSa0Sbg0BwNQV+lvjidJXc/COKf/AA61VVFGfRb778gqY9O3+OVDdtT4jN
         Xs/VE6rnSKS2QEH8p6przHUS0eNicrWLxFQ5wX8LTCpCPR1pdokI/4EDmnFXnT4W8UlY
         pboO1meWuajtlQ/W71BbxK6Z9bQJi/UXnakU2jZLa2cucDK9zO3MQQmg+OL6cQKPKk13
         w/YR0i3snujFxokZp6cbmHLlwY9phEfv/yIDnx4sxQyoOklAyt5aSznsZ9J+KqzikLV9
         vUQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlt0jeXOVZVA6MevN1nH3Ad6f97WEeFrNaVl0nCluoQ3p+XrHc5g0sPxiWCE+iAP3pagx7UD40tqY=@lists.xenproject.org
X-Gm-Message-State: AFuF++mhbGIFmO3qukwngP3AxMp3N/Tc93JiVDtXCVlwznZd1ALSVB/R
	RvWXkje2tFXncb9+B/Mt8kMejfvfwL1aTLTgknze7iodYJhP9yDiLsbu
X-Gm-Gg: AYBFou3PGo4TzjxvqrOW2jRosrrpFnS/4k20ikneoVUolGsfcpXQgOV0UPBl46HYgL+
	TYHd2uTOHpkfSNS99dy6FemN26wL2AX2HU1w/PqW23AVaprCnrptMVXiVAmcdpSbMGuljIREZzV
	w/ceFe9Qkzm1eQTuE9xoKIQwKnC16ipbZIwpSwQ6hlJrHNjavrFPFl2kz2BzUf7ZyeNHmagc141
	jd84xmL7uwBVycWkJj7C6o6ZO0M9jCKLO0P1KGScNf5VnLehYvfwH53cq4Q/i3vadvQ7RWwZleL
	Gtj/imZoTZCK2iKP0VyXRagenPJLRJN5NGA6Z9xvzaiZX8ozZz9baID7a5kmmEDD/s+EHfOXGZL
	CbOBoEAvCrbPfOF1UBUGp+dPktD7eMRFRfi0lDeEkor8y/aTY2IZbSMZfAhzUS/Dh+ddj5hBJi/
	v0LDP7jH8P9J28LF7Cd4vj1weJjXyvJrU/uyGel6f6H+Za2ie1j9XH+OAjyduXyCpaUX8bWKQ8S
	w2nuIo0iBfttRPdGUNUX8CZX6zAna6n5syy
X-Received: by 2002:a05:600c:a087:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49cf825a75dmr385537435e9.15.1788982123211;
        Wed, 09 Sep 2026 12:28:43 -0700 (PDT)
Date: Wed, 9 Sep 2026 20:28:38 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>, Mauricio Faria de Oliveira
 <mfo@igalia.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
Message-ID: <20260909202838.28071bff@pumpkin>
In-Reply-To: <8b00b7d2-2bd3-4871-9908-9fe1568d2690@zytor.com>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
	<20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
	<20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
	<E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
	<d1b9ff734b918889eaf8885d64141bc3@igalia.com>
	<20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
	<e74c5a6b-ed9c-40c6-b9d7-ff04ee8c099e@zytor.com>
	<20260909093831.095b89cb@pumpkin>
	<8b00b7d2-2bd3-4871-9908-9fe1568d2690@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1788982124-1A0C59EA-25F09D46/0/0
X-purgate-type: clean
X-purgate-size: 2251

On Wed, 9 Sep 2026 06:43:01 -0700
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On 2026-09-09 01:38, David Laight wrote:
> >>
> >> Here is an out-of-line compact memcmp() which works for both 16/32 and 64 bits:
> >>  
> <broken code removed>
> 
> >>
> >> On 64 bits it compiles to:
> >>
> >> 0000000000000000 <memcmp>:
> >>    0:   48 89 d1                mov    %rdx,%rcx
> >>    3:   31 d2                   xor    %edx,%edx
> >>    5:   31 c0                   xor    %eax,%eax
> >>    7:   f3 a6                   repz cmpsb (%rdi),(%rsi)
> >>    9:   0f 97 c2                seta   %dl
> >>    c:   0f 92 c0                setb   %al
> >>    f:   29 d0                   sub    %edx,%eax  
> > 
> > That isn't the object code from the source ...
> >   
> And that's the ultimate hint that a cut and paste error had happened.
> 
> This was the actual source code.
> 
> int memcmp(const void *s1, const void *s2, size_t len)
> {
>     int lt, gt;
> 
>     /*
>      * Note: for the benefit of 64-bit code, xDI and xSI are reversed
>      * compared with what CMPSB uses; hence SETA and SETB are also reversed.
>      *
>      * The XOR statements set ZF = 1, CF = 0, which is required to handle
>      * the case len == 0 correctly.
>      */
>     asm volatile("xor %[lt],%[lt] ; "
>                  "xor %[gt],%[gt] ; "
>                  "repe cmpsb ; "
>                  "seta %b[lt] ; "
>                  "setb %b[gt]"
>                  : "+D" (s1), "+S" (s2), "+c" (len),
>                    [lt] "=&q" (lt), [gt] "=&q" (gt)
>                  : : "cc", "memory");
>     return gt - lt;
> }
> 

Try:

int memcmp_2(const void *s1, const void *s2, unsigned long len)
{
    signed char lt, gt;

    asm volatile("repe cmpsb ; "
                 "seta %[lt] ; "
                 "setb %[gt]"
                 : "+D" (s1), "+S" (s2), "+c" (len),
                   [lt] "=&q" (lt), [gt] "=&q" (gt)
                 : : "cc", "memory");
    return (signed char)(gt - lt);
}

https://www.godbolt.org/z/6hrxGxb18

Saves the XORs - go away completely in the usual case of 'if (memcpy(....))'.
The 'mess' on the return statement moves the sign extend after the
subtract.

David

