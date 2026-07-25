Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8734EC531C9
	for <xen-devel@archiver.kernel.org>; Sat, 25 Jul 2026 10:27:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370636.1618711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnZbW-0007bk-PF; Sat, 25 Jul 2026 10:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370636.1618711; Sat, 25 Jul 2026 10:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnZbW-0007bd-Md; Sat, 25 Jul 2026 10:27:38 +0000
Received: by outflank-mailman (input) for mailman id 1370636;
 Sat, 25 Jul 2026 10:27:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <david.laight.linux@gmail.com>) id 1wnZbV-0007Yt-8X
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 10:27:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnZbU-006CtV-Lq
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 12:27:36 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6a648f6c-2eae-0a2a0a5409dd-0a2a4505d4e0-26
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 12:27:36 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6a648f98-4cb1-0a2a45050019-d155dd29b170-3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 12:27:36 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09aaso638668f8f.3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 03:27:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f96d4656bsm14009416f8f.21.2026.07.25.03.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2026 03:27:35 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784975256; x=1785580056; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8BxK+ALhcOgn9zRWf8zuaedc6Ta5UI4jKqzNhpJjiik=;
        b=nU5AmF05Cx29pN3Y7qdcoa2Y0sfeNZZzIrC1Sy7HsqA349dYg83OmTX1kaMBrGNiIy
         7HpnGNGgoPW1RxOCYbYgeYWah2AlhvUnKfLD82z75rTYwqvQFM4ttEixNaeFPX6aGWCt
         glGXXYU8283VH2eWjLtj2vtZbMj0RdWl2TlRS7XzQ3PvP1ZKzlcfVEkX4fiSeL0fcd35
         bYFEJ5iUpFacVIdryHJoONYTtn22+olSXDnsq0wNTRjEVhl8YNwPVvsiIENuVemFs5zQ
         DGATMSv1kD5V75xxt4kUq6xU1358xHxtYNLqEQDcL3gM/jiM96OhhDO2d5Z98pAq4GpX
         iX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784975256; x=1785580056;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8BxK+ALhcOgn9zRWf8zuaedc6Ta5UI4jKqzNhpJjiik=;
        b=h5VY2DBc605mnssdiUVcKOwSKOW/hvsbqnMKFOOvGYiFh4XqcNBPtZo3tPZ/iuqjMZ
         j9M1gHEREipNqPnS0/SmwevLOpc1GGv54wZPwjlBuLOmJNeEQOxEurfo2UaOQTc4qZ7c
         NgUcJL4zDBFPix6Qw19/jJdch4+fthSnUYRVXv1C5aTFp+WvlIn6hHpifOkqgKwlMv4Q
         nPU2i3mkKCm158+Y5jJ5eb1pY9b6fxXn1jybW7kFL76AahpZ32zoxd2wl3zwqvR/KKBA
         JvHkRGfP9PLZD1zkHZ+YcPqpIfngGtvNLP8AcNaOREXhpDdI72tWWirjNbDU/4/j8a1t
         m3pw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1LpbKyaK/1fRCg0iHQDqQzYNLV9tm+4finFXEmeQro7vbUcI2S1GSqVlEgtqCo2mEr7TAzlF2VzI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxDAmJTnwYsagN1IPh8zyGr3K90SsqO6LNdUtaJ+XDgEN6c8Vj
	gFsBKKBaoxhUIvlg4K3ybwqLR4qOZQpH/zc1mo0Beh25Fm4i5GC5RJZN
X-Gm-Gg: AR+sD13Lpqk4le+1yOI+9Z6xD4WGA/8SSzz0XzpTsJVgVdF3tELrgVdmdcGVkw++bY6
	X/gAssMYcJ3lEMlJ9TjvmemxrRIWp7teSort7FvnuNwVLzprdhk3i6JYrMS9nEzhruJVqFQXtEn
	EBSnujnkibbfxXqIQdBd8CeiwYejqbRowm5MJJarrU03pqmfDqX1BQfTZYsvL6y1TSEQVrWsUGz
	ewbIJffqgMf+vny6CkkUFsWYfJilmHqLAZpia/VMsflX2zVS0jV/Ka53Fsqgiu/HolcpgjP/YEL
	cYXQBUWSd/iJfm50ifasjBccg3N6vnJqF9CC59/63YuHr3pie8al7fclzGcQVNTSY70CXc3XwDx
	n6Wy6mjW6xrfvDRdenjLPv65wWWrZ9FfG0RfC8pyJfIqmqBMxLsktrOKvhXJXRRyef2h/GbcJt6
	Hiz+3cZs9tsTMnUZA8T5xf+K7SxLSrPq24QCg1rNs=
X-Received: by 2002:a05:6000:24c5:b0:47f:8cfd:d383 with SMTP id ffacd0b85a97d-47f9fea737dmr1968001f8f.52.1784975255950;
        Sat, 25 Jul 2026 03:27:35 -0700 (PDT)
Date: Sat, 25 Jul 2026 11:27:34 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>, Borislav Petkov
 <bp@alien8.de>, Jan Beulich <jbeulich@suse.com>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, Juergen Gross
 <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 2/5] x86/asm: add volatile, clobbers and zero-length
 check in inline memcmp
Message-ID: <20260725112734.2c65f37e@pumpkin>
In-Reply-To: <f616c114-2727-435a-97f7-57ee6b0b60e4@zytor.com>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
	<20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com>
	<20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
	<0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com>
	<4daed8ac-b533-436f-9f86-6d297b87abbb@suse.com>
	<5e19b195-0ca2-4510-81cb-497b40e4aaf5@zytor.com>
	<8df0340f0dc7f6c303c6a7da78fad7b8@igalia.com>
	<7148BD5B-2E06-4137-B361-18AAF329DDC5@zytor.com>
	<348133f5-8a78-4805-bf0a-b1b08cdc65f2@zytor.com>
	<e52ff0fa-ee19-45e3-9b45-573ec3c5da24@zytor.com>
	<f616c114-2727-435a-97f7-57ee6b0b60e4@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1784975256-245122A1-8E5E0663/0/0
X-purgate-type: clean
X-purgate-size: 1784

On Fri, 24 Jul 2026 17:25:21 -0700
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On 2026-07-24 16:57, H. Peter Anvin wrote:
> > 
> > And of course I got the comparison backwards (negative means a < b, thus we
> > want a - b not b - a). Here is a fixed version.
> > 
> > int memcmp(const void *a, const void *b, size_t size)
> > {
> >         int diff;
> > 
> >         asm volatile("xor %0,%0 ;"      /* Sets ZF for the size = 0 case */
> >                      "repe cmpsb ;"
> >                      "jz 1f ;"          /* When size = 0 loading is unsafe */
> >                      "movb -1(%1),%b0 ;"
> >                      "movzbl -1(%2),%k2 ;"
> >                      "sub %k2,%0 ;"
> >                      "1:"
> >                      : "=&q" (diff), "+D" (a), "+S" (b), "+c" (size)
> >                      : : "memory");
> >         return diff;
> > }
> >   
> For extra credit, this version is even smaller in 16- and 32-bit mode, but
> larger in 64-bit mode (because it depends on the order of the CMPSB operands,

The function is inlined, so it will make no difference.

	David

> which is the inverse of what the x86-64 ABI expects; swapping the order of "a"
> and "b" and adding a cmc instruction improves the x86-64 size, but 64 bits is
> not where the really tight code is...)
> 
> int memcmp(const void *a, const void *b, size_t size)
> {
>         int diff;
> 
>         asm volatile("xor %0,%0 ;"
>                      "repe cmpsb ;"
>                      "jz 1f ;"
>                      "sbb %0,%0 ;"
>                      "or $1,%0 ;"
>                      "1:"
>                      : "=&r" (diff), "+S" (a), "+D" (b), "+c" (size)
>                      : : "memory");
>         return diff;
> }
> 
> 


