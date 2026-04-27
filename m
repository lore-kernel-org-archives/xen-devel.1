Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C75FF8867
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2026 22:01:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1295356.1572034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHU0n-0003p8-76; Mon, 27 Apr 2026 22:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295356.1572034; Mon, 27 Apr 2026 22:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHU0n-0003p1-4H; Mon, 27 Apr 2026 22:01:05 +0000
Received: by outflank-mailman (input) for mailman id 1295356;
 Mon, 27 Apr 2026 22:01:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <torvalds@linuxfoundation.org>) id 1wHU0l-0003o1-OM
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 22:01:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHU0j-00EGTi-Ja
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 00:01:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <torvalds@linuxfoundation.org>)
 id 69efdc95-5cb7-0a2a0a5109dd-0a2a4504d5aa-18
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 00:01:03 +0200
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <torvalds@linuxfoundation.org>)
 id 69efdbea-1dec-0a2a45040019-d155da34c8a0-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 23:58:02 +0200
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ba7a1cc0380so1770652066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 14:58:02 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bb80b2adc60sm9789066b.30.2026.04.27.14.58.01
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 14:58:01 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-670ab084a39so16198978a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 14:58:01 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linux-foundation.org header.i="@linux-foundation.org" header.h="Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777327082; x=1777931882; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=Tv1hzwTPVGQgPqeCmGGBzHKj1QMyCpTjQ99WSp2q/4NOWDaDJJFf2kbLoRvOiRrdDj
         h8YKoGq6MgybUE3S4XtfpBpqXeShJXDuJR0/o7IG1724FzjsY1EMqNM4i1RF8bomrmor
         M4TOR1nrqrTsEJoX2Hy03LTDC5TE2dRrMVhvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777327082; x=1777931882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=RpmwnNi+h20MnTfQwGSKTgpIMU4YUcg1kR5SviUal5a7icdNawFW7KIR9g6XDxenoM
         sJ+bZ3VhHCVpUbZGpJwkNPoN1N5BMgvJDhfgcJQKhLOO0fSsDynIjcplCAN1H/4j4eDS
         npsb3alcmZNsTMdgNuF9SKvLo9ouinZiuGIWziP5HAsfyX3W3WXDPUaLW2W8qxAOx+cd
         fMAcH9QSFaUx583c/Kamy7LzZBg6ClxVCc9aqnvz/GU/3g5aRDqeDvTXvVFqo+JsDAek
         WNZzOJY3OSLCwmM8R0g+BtfhWFlMAvIyP33gsK5OXkezUWlEapphJy9+DhVH2WbvCQAo
         nN/g==
X-Forwarded-Encrypted: i=1; AFNElJ+iPCOZnMroIXxD/JLE9hgcQY9R40IdSWo0OjPL/ukURIfOoVREc6r//nDlbdvxdVUll48mkSSN12Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOrebCwSOH5cRIZmYdDn4QTuIc7/HHmoi5W7mRph+NhfrVlmke
	ZpoEqf9ByMQdgHj6PWDYnRvb5p059Ot+qP6SODhFQA/RFLA6249RCvKYkTlrlU+M/Wh9ytmKvSL
	lMrxgilAURg==
X-Gm-Gg: AeBDievwTqFmI9x8Y7nneCwrIIEnwEgyv49laLDJmiQy+yN+1yqJ0gWFU0AU0FRUP4N
	fR9fv/6HnC2YfSGB51mYcf6hWnhZL1AopnNx1D3TB2bmySubtjvbbN9sMRSWcw1cL1Jka5YF2vi
	bMUi2M2JpKFE4p0EJawHrr44jtcLFgqRbefcYcjX8OgqO7DZf3cxAewLqelOT3tfYHz45MzL2eL
	kyXf3YSOw+mNc7lBTx1Bp5+qCsNa2bDdCcqEm92pQ3uWmX1bmI4Ayv1g/1Jbbcx2AInb/jN+fkY
	pPv2Xg+AtCzg8czPQE+nS6degYxqHarGmiNu7Yq1IjrThOkw+yyt9fG/y7h+OvWiJhB7iy6utnc
	FVyQ8pSG5Pj4iuMD4inDZyU/poRnVYHv+bSfOqglNN4VAg5GjpKKs7KO3CdZUZrqQYwrgcm59Sy
	ou+Kj4jFCnTi0kjMnfBecRtvVT34CYqbLCBSWI92uX9m65b28Ms6cShD48kOxIneIpUifaRCrP5
	13vd3KVzqQ=
X-Received: by 2002:a17:907:928d:b0:b9c:b069:8ab6 with SMTP id a640c23a62f3a-bb80100e81bmr33655466b.7.1777327081625;
        Mon, 27 Apr 2026 14:58:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Tvq2sxnlgoDfMFkefIWXA3V0QyYTpuG6hxj5AaFAaoc34Tf/CS+F7UJeZlVF3PR92w5i/6mF0z/c=@lists.xenproject.org
X-Received: by 2002:a05:6402:35c2:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-679bb04a8a7mr185115a12.1.1777326742385; Mon, 27 Apr 2026
 14:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury> <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org> <ae-2yLWSGnfeTvh1@yury>
In-Reply-To: <ae-2yLWSGnfeTvh1@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:52:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
X-Gm-Features: AVHnY4LQUFWo9ODz4M3q2vZC9Gn8nsdYr95Nd4ky5ERVHHxIyN_9ZXY5zjebfdc
Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
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
X-purgate-ID: tlsNG-ebf023/1777327082-2B7693FF-D1506192/13/0
X-purgate-type: clean
X-purgate-size: 759

On Mon, 27 Apr 2026 at 12:19, Yury Norov <ynorov@nvidia.com> wrote:
>
> This is what Linus said when added x86 implementation for copy_from_user()
> in c512c69187197:

Note that some things have happily changed in the six+ years since...

>   That's partly because we have no current users of it, but also partly
>   because the copy_from_user() case is slightly different and cannot
>   efficiently be implemented in terms of a unsafe_get_user() loop (because
>   gcc can't do asm goto with outputs).

now everybody can do asm goto with outputs.

Yes, it's disabled on older versions, so it's not *always* available,
but all modern versions do it. And if you care about performance, you
won't be using an old compiler.

             Linus

