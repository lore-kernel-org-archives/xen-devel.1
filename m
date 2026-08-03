Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D050C55182
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 14:24:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381532.1625085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqta0-0002yd-9K; Mon, 03 Aug 2026 14:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381532.1625085; Mon, 03 Aug 2026 14:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqta0-0002yW-6K; Mon, 03 Aug 2026 14:23:48 +0000
Received: by outflank-mailman (input) for mailman id 1381532;
 Mon, 03 Aug 2026 14:23:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wqtZy-0002yQ-P7
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 14:23:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqtZy-008Lpw-0e
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 16:23:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a70a471-e002-0a2a0a5209dd-0a2a4508c968-0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 16:23:45 +0200
Received: from [74.125.224.52] (helo=mail-yx1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a70a470-f659-0a2a45080019-4a7de034a98b-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 16:23:45 +0200
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-664e3ed58bcso5999374d50.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:23:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1785767024; cv=none;
        d=google.com; s=arc-20260327;
        b=qUgfs/2xcuc0cfk1lvM/KQlm+bowFUjBSiFvMt74wYIpCRUiQZiNthI6OlRbtdFPjh
         J7AmKf+MwiQvyXwd3ktWF4CuEgQB8k03W32FyQMVY6GEOG3tWWT/KIhrA9x8B0rNEDjt
         tObewF0j42Tu9dt3DElY09zBfFLZ9JV6vzUhQ1rY6IFDVdgTHabqkWl+We89m4KjslS1
         eB68oACSbiSK5FhYBjItZTaqYQh2/cKYny+ZjzynzAsPY74/q1VajhEU3cPK+UMhkFCq
         XNAWyXG7e1OzK/lOABLQZWuvm6q9wcMvj5X76L859TUJwYBtpXZwllJrbUHle64LOloj
         RBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wJiMbpzbgvUxnGJ9663a2S4Y/6f0ltDGF8OXt0DNfUo=;
        fh=5u7kHD1b/hNtHHJofCBl7jWiqXiR32ui2YCHFqJNZUo=;
        b=hTPn/K9KCAfKPpXLlfaaOjpJ3Ctps0Fk1s42Lm3Unt2ZHHMJQTDWAV2LfGZrcYV7mF
         VBImqNmYAzZmB/4RWOdwgcVGji3Hqxj7XN9HRhPgspZjiowRnjB09BicZvVL5nKIu+ix
         amItkki+1rrSkkI4+sq504Te8gsksS4YD3f8ZLpH0hnmx+H7kYaWYijLOD27u3W1piSN
         mWcCc6NFzfped0Bbj7fVrHfdeExbwbdWgqiLYuKL8A6umqNBGsha2hxsG/+uVt5byXzj
         zJQkwgTsBdMlgn+gOmOVOzIVLpPf2/Pyt6iG4x5fyHDsZW0ToD5M+T+I7VQzOh8gT8tE
         5rCw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767024; x=1786371824; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJiMbpzbgvUxnGJ9663a2S4Y/6f0ltDGF8OXt0DNfUo=;
        b=aKDIFLikEEU2Z3SXKAP059KDA9JCtI0RNdzpcsqmnkElrwe6eKDx5QKpbVV0AYEeXv
         UfHWojekrSMwbwwo8UPjEj/b970kvK/AsjY97ImRPm1adBNzT02NYVsslxJgVLXfqzjx
         ClZx4pOW1SV7AIU+5Z6xxZPa3njzw9RYjzr2g7nTMNCPry7CoH4xm4XDrFHaZb+kYLaM
         UmEBFEPwijgUrCiFT6Mo47Kfaut+Bw8hZEpNilA7mr4awr/elAKqNM0T7k+cu5K7wym6
         7VpZ6Ywd6ogyManzO0PT8SgdO+1oob6hduZ4NTPQXspxghh0dft8NbwqXyiE/XA4VmgP
         RjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767024; x=1786371824;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wJiMbpzbgvUxnGJ9663a2S4Y/6f0ltDGF8OXt0DNfUo=;
        b=ZSrTt5ZjUsGYgHbdpZHWMvSW+jojiFjUIBeIhIVFsp2soBl9Ttjx8Y1ANFffuNucCj
         tu0D1Jtjq03OR2ccXrZli8n4rkfaCZKB4YprBbAo8AY6gP7eqhWtrh48qjdj4FM8NavS
         zIVrx+g/aNGyI2Ig4jfth8t1kAaaZkBmCUwaBTaUv9H+nLERIQbdKKCZSGTzXSX+DOth
         9iPMQRkm3GtwbEwolEoPfDA/bxB1xkJbwYou3AcFGD2DfaRoA+QgOAea/SVffR/zMYXH
         3c1ONMeUHkIF0Hx9udRPVzxOyMeiBUnowWQLyDntm41/bzgl0rYHhbejBFbnd/ammlIp
         JkBw==
X-Gm-Message-State: AOJu0YwSMtqBa3Kpvs1VVW8GyHUZ+vQHJfIxurRqFABBtcOT+BZyZGtq
	+2mPfDfjrOhx8vgvEw7hNfDPoBERjAhs3bbhkmAytrdusbbYmqRmngTN9flDekLGGixrgndg9C7
	82gvoGe27sm6m2QRKjf49AC/Rpp8gQTCirTvuio8=
X-Gm-Gg: AR+sD12DWmm08ldELLKSfRdBxXmJwXaWk6mq16wUyUHlkbZv8jPZVmTlFEtD+Jsgjju
	nGVWKOtYaYsjlrVZ7xvXU7q1ft20UPFYpDws/gff5pH7Ft38n9gd4LtqF5MPVewkMaxDbW/7rDp
	V0Vl9OMaXC35JSkuLXiCFE/Tqf2mXMBPJAG/L0FKHEH9AeI23fFxwmqfmvWZdo4QSnsiSo122Xx
	MLSEm6hAnrtikRsJqgSjV5zxo6YMx2906jWcRtn9Fz1tKGU/MiwAreZPZ+taD2/UOca6nyuRMkF
	2QdOZfGoAFrsQELPQW9t5tsidkbMRtTrx3WErlpoyUpqyO9wzpITDHxEXhHwNI+qxNKWQCUwmHn
	u
X-Received: by 2002:a05:690e:2506:20b0:665:2045:fe47 with SMTP id
 956f58d0204a3-66945bea125mr10911877d50.7.1785767024406; Mon, 03 Aug 2026
 07:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-17-frediano.ziglio@citrix.com> <439c2740-fb84-42cb-b001-cb290684a583@suse.com>
In-Reply-To: <439c2740-fb84-42cb-b001-cb290684a583@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 3 Aug 2026 15:23:33 +0100
X-Gm-Features: AUfX_mz0p6FBcsbJBhjjFHmdqxj5qR1izMtTAZfJP_Yflmxkjgdnunb1POk8ZYU
Message-ID: <CAHt6W4dMZtyvMuAfFVG36z53b=a5m6P5gQ4HONGO3WzOBUJ-qw@mail.gmail.com>
Subject: Re: [PATCH Linux v6 16/16] xen/privcmd: Add new ABI to allow copying
 foreign memory
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c1860d/1785767025-D5D4887B-6A09A46B/0/0
X-purgate-type: clean
X-purgate-size: 2065

On Mon, 3 Aug 2026 at 15:05, Juergen Gross <jgross@suse.com> wrote:
>
> On 19.06.26 15:05, Frediano Ziglio wrote:
> > This new ABI allows to copy foreign domain memory to/from a buffer.
> > This avoids having to map/copy/unmap foreign memory which is
> > expensive.
> > This operation is done particularly when migrating VMs.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>
> While doing a test build I got the following build failures for 32-bit arm:
>
>    CC      arch/arm/xen/enlighten.o
> In file included from /home/gross/korg/src/arch/arm/include/asm/xen/interface.h:1,
>                   from /home/gross/korg/src/include/xen/interface/xen.h:13,
>                   from /home/gross/korg/src/include/xen/xen.h:52,
>                   from /home/gross/korg/src/arch/arm/xen/enlighten.c:2:
> /home/gross/korg/src/include/xen/arm/interface.h:22:35: error: unknown type name
> '__guest_handle_uint8_t'
>     22 | #define GUEST_HANDLE(name)        __guest_handle_ ## name
>        |                                   ^~~~~~~~~~~~~~~
> /home/gross/korg/src/include/xen/interface/memory.h:361:5: note: in expansion of
> macro 'GUEST_HANDLE'
>    361 |     GUEST_HANDLE(uint8_t) buffer;
>        |     ^~~~~~~~~~~~
> make[5]: *** [/home/gross/korg/src/scripts/Makefile.build:289:
> arch/arm/xen/enlighten.o] Error 1
> make[4]: *** [/home/gross/korg/src/scripts/Makefile.build:549: arch/arm/xen] Error 2
> make[3]: *** [/home/gross/korg/src/scripts/Makefile.build:549: arch/arm] Error 2
>
>
> Please fix those.
>
>
> Juergen

Mumble...

I suppose this would fix it

diff --git a/include/xen/arm/interface.h b/include/xen/arm/interface.h
index c3eada2642aa..7e79853b188d 100644
--- a/include/xen/arm/interface.h
+++ b/include/xen/arm/interface.h
@@ -53,6 +53,7 @@ DEFINE_GUEST_HANDLE(int);
 DEFINE_GUEST_HANDLE(void);
 DEFINE_GUEST_HANDLE(uint64_t);
 DEFINE_GUEST_HANDLE(uint32_t);
+DEFINE_GUEST_HANDLE(uint8_t);
 DEFINE_GUEST_HANDLE(xen_pfn_t);
 DEFINE_GUEST_HANDLE(xen_ulong_t);

Frediano

