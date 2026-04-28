Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A979FF885D
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2026 09:31:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1295505.1572173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHemf-0002mq-UY; Tue, 28 Apr 2026 09:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295505.1572173; Tue, 28 Apr 2026 09:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHemf-0002mj-RM; Tue, 28 Apr 2026 09:31:13 +0000
Received: by outflank-mailman (input) for mailman id 1295505;
 Tue, 28 Apr 2026 09:31:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1wHeme-0002mN-4e
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 09:31:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHemd-00Gybj-EG
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 11:31:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <geert.uytterhoeven@gmail.com>)
 id 69f07e57-2eae-0a2a0a5409dd-0a2a4502b842-48
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 11:31:11 +0200
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <geert.uytterhoeven@gmail.com>)
 id 69f07e5f-af86-0a2a45020019-d155d02cb111-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 11:31:11 +0200
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-678adefbd26so6416546a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 02:31:11 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-679b6869a6esm515258a12.31.2026.04.28.02.31.09
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2026 02:31:09 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-bb3c4d8cc29so312006266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 02:31:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368671; x=1777973471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=CtwTcIabZ4SB0xcoTSup7RS0xIwQZgzN9vcO1CLdJI5+GJcgPMKT3caCj7xA5NLjS0
         7EnmX42WrtEhIAR/YTOywfWdwGAXoHos+yWLH0ez+5dLTYsmAT3zx1TH00M//gnS6K41
         w/Xu0+36YNwOIG89AF65vp/ZQiG5xv/IUt5uIbhpSpbkxwd4UgyOj1GJo6DpW3kYR5H5
         KmD16BgQ/bLgdycDoE+l+B4TNHNR5oC+7u8B7Y4ECG4UkHGRElSRUKMFdj1c3Qo+l45u
         Fx6utV9fL6sN7gPHIk1Lg2oiKpUI07t9RGot8UzGfQg8+4wdVCc7cvm5ZIsm8kB097k/
         43/g==
X-Forwarded-Encrypted: i=1; AFNElJ8Gl6zHbfejuUjeeJRwzB+KoTol9gMcGmlP7uHgs2Z3CM3C6UvVCKxyhsqJgGMKdPyi/G8MbGGytQQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMBWBKPKM1wHnNFaQYy+T/NxJMVyGq3W3i8w1q2qYRwBYAY5zW
	osLEUoifaXXY+t/6af6iusK9JHqrXCDr/HeolLcowlsvBVLYjWnlpyRpEdZ7e+jX8W0=
X-Gm-Gg: AeBDiest/aP1j8KkPp9/M9n+V4jAiNEHfc1upIAN08tCYnWuCtoCZJEKk9Nxmv63ZNA
	e3zG5VuIi2yIEDkGI+IaJ8JeV8MIKTKxDw7xb5TMgxlI7EbGJADcLjOZN/9DUG+7qChMTwau6g6
	92Mhz4IYACWuebWK6uMYU+lzLP71ap8eLyB+uP0H9pSUrF7DlSsz2Cr64+eMmXGlHUAIGueP9K3
	q+EshIn6ftj9HHZV7RMDYiNdQ7AZ6GPGDnRQ7CqQTKDTjyueTrlyKytnFVzUjmKESy/ID5+qxbo
	p+SvY8vtdi6Uv8TZ+4Lpcj0+hlebnfiqpiS5YR6KtJU+P0CRvvybh43k9HYzrf7BYNhIn44dyft
	gRPAreGV9YIeX2U7CUSQEoEXutouOA/NdhFLXBPeWDnf9ID1KdEday83FY6mXRNer4GS9f2u1QR
	zHeDyemfYVqScMUEBQcL2HBl7i3qV9dyEmIR+/kAMRRlY19QbZueUqgXSiu3a5w2YEsRVcB+k=
X-Received: by 2002:a05:6402:3593:b0:670:8bc2:7fc with SMTP id 4fb4d7f45d1cf-679bb04c0c0mr1157925a12.2.1777368670601;
        Tue, 28 Apr 2026 02:31:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+J0TD+SdKAL4JmhvDeXqGoUo2dtxxas1Q9tM4LyB5EwkoH29HBc5EHdEqpj66HsAVMaUxAmgIoI+Q=@lists.xenproject.org
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-720697/1777368671-88EC8161-EC3A90E3/0/0
X-purgate-type: clean
X-purgate-size: 1293

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

