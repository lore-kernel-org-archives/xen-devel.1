Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C32CCD6E79
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2026 09:33:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1332560.1595017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWspb-0000I0-5w; Tue, 09 Jun 2026 09:33:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332560.1595017; Tue, 09 Jun 2026 09:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWspb-0000Ht-1o; Tue, 09 Jun 2026 09:33:11 +0000
Received: by outflank-mailman (input) for mailman id 1332560;
 Tue, 09 Jun 2026 09:33:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wWspZ-0000Hm-ES
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 09:33:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWspY-007Aml-Ed
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 11:33:08 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a27ddd0-5cb7-0a2a0a5109dd-0a2a4502a2a0-20
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 11:33:08 +0200
Received: from [74.125.224.51] (helo=mail-yx1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a27ddd3-af86-0a2a45020019-4a7de033b16e-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 11:33:08 +0200
Received: by mail-yx1-f51.google.com with SMTP id
 956f58d0204a3-66077e90382so4985642d50.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 02:33:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1780997587; cv=none;
        d=google.com; s=arc-20240605;
        b=N9j7MH/eAkcmHuJyK4Hs/wZ9XtkyaRBrRQA884tGHgHX+RqIrzT2JHkeH+qur2ZbaF
         LdX1oxBjKghdnZP70txv0QhM64wwPhvK/4IRsJYvaVmGOTtgYd7gG9ecSnLtQZ6bG/wS
         HDKfSvIppkhpkPddTI8kHwIhU1cGByLabJkY6gOIN4P7qhKNKHdHwm4uneQ26x8wsvbC
         qIsjEn+OqFcKOUjy5XD3Pm1UEwUC8pOFNgtMYveu9Zklo3scWHd7mTJ891m9nkR1lBfc
         NkNexzvRA+j3rR6UJ/1Z7O6N6b/mm6rjZtuZVn9jh8KB2i0VxigNNDnLDRnUQJ1ndQkA
         ARdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GjhGXc3wdtzca4RHEQjHYpjSQng78zDhCNN28ncA3l0=;
        fh=YXyOrzbbuBMjB1laPSTTaglkJ9ItuXSXF5B6orWbM3Y=;
        b=cmYzHcfyT0a7pT4e8io+WboW33veVSCDH9wBZXXQ1BGk0G9ADBJeyKGR6X5tf3N4Yo
         XL6BURqXZrynuV/xU2RWdcA/K5cJsboYJazoEdQBdNXWaltZ0fhVgM1+cocfE+KnZ1Lk
         M/7j1PHYhPMewWXlCxUSjeBVvbmldH7JSvkF2vBYDua74Z08B5cZ+sDALSZ2NzRuF7wX
         uaTNrbVzHEXCdpChVbLRZHEcx0Tw1snsUtupillHinN9kQaDJ6bPOKvujsfxwGpma0O1
         wlVmp+Y6h0S6N4U3Jz1Op/YWfqIBjc+ctph+dupPvdgJpLCx6aarkRKzPdFjk2htQFO+
         VYJQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780997587; x=1781602387; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjhGXc3wdtzca4RHEQjHYpjSQng78zDhCNN28ncA3l0=;
        b=PmsLqcHLPv6yS9pGJlo8KRVEzpxfHW7lLaWMK3HDCx0r1/iHPlmpxFjzqZ64AEzBXu
         G3Ae7zAu980//Rt/8MOtE2wioBmnYRlAwBCKiEsJS9rFE88+IP/IWugS+X3VuvYd/fd4
         YE9MhY7M8u6ZAGgzJqe/uHN/L6HoPuWnQx1skncpxHUJ5W8Vr/415oI+C3SW0y/7cPxT
         G5Bha3sd84WoJU9dyx1f3UDmNviAHHiWlWUKoN5wxyPTKCIdAi7grbPMuCyKq4SZLqqM
         560df0CzCq2cQWctNCvXRE//ha+5m/iLWB33C17RvASLXbMrEaMQVSqNg7be5fhymagm
         1EyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997587; x=1781602387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GjhGXc3wdtzca4RHEQjHYpjSQng78zDhCNN28ncA3l0=;
        b=RGGNzk935BKjsyFqMjg/P9bpXZdffJ0M554ii4MQ+Sy1yIaWyVdoZZWVnpb5ZOd1t+
         34MdCBqDPLOUh7AeFNJU153ZIUQzVfdN4svLmlCjR+HLFzvfEPOKlS/K9PExknUCanB/
         o8t0yudOXu4QCd4HkVnVok2azkngKotA+cfPLpDkkWfrtKDSKuJToU078ZLvN6Jchcv7
         BF9pR3VpuVIvAJy5/FaaPJCFA7l38tRyoz1cpL2eTKw4Hzd3UbOVmLu/WEvoQ8sjBNTT
         cmZnknQK3V9N4Gee0CPieCO9M6qm5OgTBoXKCjUEytRpend/R8SQP7sZHc/jylINNcKn
         ZSnQ==
X-Gm-Message-State: AOJu0Yx2f9iRnLxBGc1UPWnIWa/7QRrQN7GkdyVp9A75INzFOuczkB0W
	Ql7xCsX5u9ejxkVvzUzw7usH2xCPYjUitcq5B0hG+uiuW2CqeSlK8EX1oJitH0w0602m1T4MF39
	1jp6lK6Z+eINvVp9Wqrwml76dGiuLouU=
X-Gm-Gg: Acq92OFfZ5HCMzd1jgqc+Tl9il9rbUhomZAUsZNsPJ3enjYNBUJq2mEBKlIoAX5igK3
	JmdW6liRQKXcVqY0HqWxbiBhFj16nJCAL1xiU30JlGphMPLq9KPBwLI3Qza6LBdtGKBvLJRc1rs
	nHly2dKNicorROKJOw+XosrZWcDCuN1x3zM0fiBWNNsJubWXdw2RI7pUVRgPR4/EKK/NLiDqpdm
	KxL9Dw/xfU/AobQdSRZIEqSbt+Aovy6fb2wfLqWat5a2r3vwlIPbTlsYOvcTKwPw1rBgiI/DTO1
	kUVS5jpo20naijkJ5ZRwJ6RGGILenE65Vp0MWuDoy15DuMztRoN6lyZWCNE=
X-Received: by 2002:a05:690e:130d:b0:651:ba22:fcc3 with SMTP id
 956f58d0204a3-6614f837d12mr1361907d50.61.1780997586587; Tue, 09 Jun 2026
 02:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-6-frediano.ziglio@cloud.com> <ea002cf0-c2cc-4612-af61-8dba7887af61@citrix.com>
In-Reply-To: <ea002cf0-c2cc-4612-af61-8dba7887af61@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 9 Jun 2026 10:32:55 +0100
X-Gm-Features: AVVi8CdYce_dYauxplLOGzNu3qF7eaHexBFIW7AJM6dWFjJkN-W8fi8tQS2vs80
Message-ID: <CAHt6W4e6=uqGHqo+4bdQhZfKh4uqc7=g3iRiAJV4Z_j2MNvxMA@mail.gmail.com>
Subject: Re: [PATCH v4 05/16] libs/guest: allocate various migration arrays
 just once
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, Frediano Ziglio <frediano.ziglio@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1780997588-AA76A161-200F8037/0/0
X-purgate-type: clean
X-purgate-size: 3111

On Mon, 8 Jun 2026 at 16:37, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>
> On 03/06/2026 2:05 pm, Frediano Ziglio wrote:
> > From: Edwin T=C3=B6r=C3=B6k <edwin.torok@citrix.com>
> >
> > Allocate these array just once at the start of migration,
> > using the maximum batch size, and free them at the end.
> >
> > Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@citrix.com>
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> > --
> > Changes since v2:
> > - change prefix in subject.
> >
> > Changes since v3:
> > - fix comment style
>
> These are intentionally freed/reallocated so valgrind can find overflows.
>
> ~Andrew

I understand the value of checking for possible overflow. But this
should not make the programs less efficient.

What about something like this (not tested, just to get the gist):

#if CONFIG_DEBUG && valgrind && whatever
#define MEM_NOACCESS_BUFFER(name, size) uint8_t name[size];
#define MEM_NOACCESS_INIT(field) VALGRIND_MAKE_MEM_NOACCESS(field,
sizeof(field))
#define MEM_UNDEFINED_INIT(field) VALGRIND_MAKE_MEM_UNDEFINED(field,
sizeof(field))
#else
#define MEM_NOACCESS_BUFFER(name, size)
#define MEM_NOACCESS_INIT(field) do {} while(0)
#define MEM_UNDEFINED_INIT(field) do {} while(0)
#endif
...

struct xc_sr_context_save_buffers
{
    MEM_NOACCESS_BUFFER(na0, 16)
    xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
    MEM_NOACCESS_BUFFER(na1, 16)
    xen_pfn_t mfns[MAX_BATCH_SIZE];
    MEM_NOACCESS_BUFFER(na2, 16)
    xen_pfn_t types[MAX_BATCH_SIZE];
    MEM_NOACCESS_BUFFER(na3, 16)
    void *local_pages[MAX_BATCH_SIZE];
    MEM_NOACCESS_BUFFER(na4, 16)
    struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
    MEM_NOACCESS_BUFFER(na5, 16)
    uint64_t rec_pfns[MAX_BATCH_SIZE];
    MEM_NOACCESS_BUFFER(na6, 16)
};
...

    ctx->save.buffers =3D calloc(1, sizeof(*ctx->save.buffers));

    if ( !dirty_bitmap || !ctx->save.deferred_pages ||
!ctx->save.buffers || !dest_buf )
    {
        ERROR("Unable to allocate memory for dirty bitmaps, deferred pages"
              " and various batch buffers");
        rc =3D -1;
        errno =3D ENOMEM;
        goto err;
    }
    ctx->save.batch_pfns =3D ctx->save.buffers->batch_pfns;
    MEM_NOACCESS_INIT(ctx->save.buffers->na0);
    MEM_NOACCESS_INIT(ctx->save.buffers->na1);
    MEM_NOACCESS_INIT(ctx->save.buffers->na2);
    MEM_NOACCESS_INIT(ctx->save.buffers->na3);
    MEM_NOACCESS_INIT(ctx->save.buffers->na4);
    MEM_NOACCESS_INIT(ctx->save.buffers->na5);
    MEM_NOACCESS_INIT(ctx->save.buffers->na6);
...

    /* Mfns of the batch pfns. */
    MEM_UNDEFINED_INIT(ctx->save.buffers->mfns);
    mfns =3D ctx->save.buffers->mfns;
    /* Types of the batch pfns. */
    MEM_UNDEFINED_INIT(ctx->save.buffers->types);
    types =3D ctx->save.buffers->types;
    /* Pointers to locally allocated pages.  Need freeing. */
    MEM_UNDEFINED_INIT(ctx->save.buffers->local_pages);
    local_pages =3D ctx->save.buffers->local_pages;
    memset(local_pages, 0, sizeof(*local_pages) * nr_pfns);
...

Frediano

