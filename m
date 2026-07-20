Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C096C44527
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 10:17:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366450.1616335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wll44-0002Mf-5I; Mon, 20 Jul 2026 10:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366450.1616335; Mon, 20 Jul 2026 10:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wll44-0002MY-2X; Mon, 20 Jul 2026 10:17:36 +0000
Received: by outflank-mailman (input) for mailman id 1366450;
 Mon, 20 Jul 2026 10:17:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wll42-0002MR-FS
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:17:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wll41-006I93-OI
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 12:17:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5df5af-e002-0a2a0a5209dd-0a2a45058aba-28
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:17:33 +0200
Received: from [209.85.128.176] (helo=mail-yw1-f176.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5df5bc-4cb1-0a2a45050019-d15580b0f0a9-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:17:33 +0200
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-80bb41f7f3cso62055367b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 03:17:33 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1784542652; cv=none;
        d=google.com; s=arc-20260327;
        b=p6/8ZNg/+uSwfuxAv+Rs91TocFB3uMzuIuHHg/p5YloF/l9NbtdCnGJXlnB2Rb0ISd
         JNLb4KBj7UaDFQCJJWLDww5ye7fl6ClHZ/ImpfadjeRXjhhlGRS/0w1xdpRvRmlD031g
         TyKusQIa1ZqkgvQc0gwtrTY5vs0S518IKidMeMTSd87oApHwCm2f2Y35ccxIs92vXm28
         gnXti2XYIqTN9E3nR5TD69QnVzX78VAikbX5suwXd8qOCnPXWP1nt+ZygwSzSybN34Yr
         +61RoC2dDqaF+DqgqUwEzYnIBou4JMKJeR6WmpPo4CYhcP0mzy7DucIS9wD3lJKwf0CV
         jxcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sIdFPypWdhB+xjF33Q5NKaOAh49ovtZ9d59zSQmPtLw=;
        fh=aU3/UpxH5Blg8M5NzH55q/XY8irYVWQMVJdPeFRWhhg=;
        b=HWrLwcbWEHb28e0fuRacplz2dc5Z+GIX+m0FS//f/AuMz+oJhcN2vu89PW9ouD/Rg1
         RVQRH+xnd344ke08W920EolSXgoFFhJTKUtt00shH/SyxTJFALOdmPzOljO/6T3CwmTR
         ndcwOAxDJZtcAr7veoNyJedu4ulB6G0YBzGTh2iV/rxtAUquW5SWmwIcvJu1+O/L+dC7
         F/arBkn9oCA6y4oNd7OtAm/mlPKczirtQNiTNx7xH3bsVO6Vlq24aD/DaCjRHo63xQkN
         L0nLreSvVCv85mLdifFpg55N97TKJOdqr4QC3V7TUC4poLl+HVBdCuzFGvSIjVZ/G4t/
         rMhg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784542652; x=1785147452; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIdFPypWdhB+xjF33Q5NKaOAh49ovtZ9d59zSQmPtLw=;
        b=kBehtJIwCJwlC6O6WupeSeKjz5592yi+/TKZZdIRXWaK560J4p5PvN1oXA1jngXl4B
         QhiEYXr6Tkfh6IFmVB6mD0xWaYDgjYtZDDTLDP/9SomJTUYFJ57hOy7s155JloSVTVdy
         8yU6UTYZ73D+TMRAFSsRkXLITQ/UFRczEBx/9IkYSTSslDCRVligAs51MYUE/WrFAd+n
         OKQV8UrNx/m1RIWkoXr5wlvL4Hh0FcjNNOh72ENoQg2cf9BUtvnkVKeGUzdHEYtkvJTF
         qxP895Du9OTSD4jErlWfHIj1p8S5GAsf3zd/lATWlSl5dtAiB3uOeCZifOWcJ01h5KOI
         kdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542652; x=1785147452;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sIdFPypWdhB+xjF33Q5NKaOAh49ovtZ9d59zSQmPtLw=;
        b=YVMd3bA1jciX5l0WIHAgS9ykwlduRo+SyBvZI81emShbpjQA1MrPAmZVT+dnzA+X2u
         GsFoFzkmd4gfWhZcBTbvKmBdvnBpNmucUbp027Ucwt9Ra22uByzYCjTVl3JNjD/YBxQh
         unCFkpUjQpsVj5xWWXwUIQ/hme/vYf35vCGquJfAFRp3tKmn/e/uLEqvWSQChgStUFlf
         Brm+nsCFDKgvc+EJsd8SuSfZAxNwXDqmG59ieJ53Y7PkRWqXQ980jtD9kyFSKRheadBt
         xZRsE7mpAWOpkTEMCwfyslJ99gwr4STm5hdk+elbQX5NPJVfsH4j4mPqTSDt0r5+a7Tb
         wpeg==
X-Gm-Message-State: AOJu0Yxa7fUZARfHsp3zFEY4KfBrYRqgplCRLYTC0BCgT0kN6KVP4EAW
	XNRQ+iTLhoD7OLnhst9acxZ3I32MsGxCcnoII7ysXn36emuBPPOouBvd4CW85ZqAnNOSZLJVDuH
	XUsMaskexHogoytZ7rbiQq4CbSPVDZvmWmzY3M9M=
X-Gm-Gg: AR+sD10llLwSYBhZztdIyYk4pf/MwFLG6FUF7bw+HVNqbsL7M4ok5vdVbV8BIeLSUQQ
	rcgTOZiuRCaX1gyn7wzm+VxrTvGMNMtZVzTUb6QYs+lU64fuFQ+NReJzuMtRDOvQUNeARV8B3kt
	FxV5zXx6uDo+1pX3pGaQLZs7K673vMVRJBhpwjVokGQKsiqiWfDd9d7VCfTuONzwaFJVCBKznte
	T4+TBw+VYQJjIJu6I5g4r/DQQUegPhQNaDrotGBSggWHHMqwgXAPlhPDXN9tu9lQpN3pEXfOiTw
	+++ZAxyIk+w13gLVNw==
X-Received: by 2002:a05:690c:9692:b0:81e:be69:821f with SMTP id
 00721157ae682-81ef25151b7mr37466477b3.32.1784542651855; Mon, 20 Jul 2026
 03:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260713204802.105115-1-frediano.ziglio@citrix.com>
 <20260713204802.105115-5-frediano.ziglio@citrix.com> <1784122342.8631fc262581453bbf619ec5b2062170.19f65fa7df1000edb5@vates.tech>
In-Reply-To: <1784122342.8631fc262581453bbf619ec5b2062170.19f65fa7df1000edb5@vates.tech>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 20 Jul 2026 11:17:20 +0100
X-Gm-Features: AUfX_mwJTY94SUnEYKXtPpiQf2YvXYmdBKg8PmVMN6XKmkB0NPP8v5pq2gw3C1g
Message-ID: <CAHt6W4cD0F9GwZVEP=E3mygcQ=yHxgFU4ELg_wd5wb3ado0mxQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] libs/guest: use Valgrind to detect various buffer overflows
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c201ff/1784542653-726B52A1-CFC76D28/0/0
X-purgate-type: clean
X-purgate-size: 4161

On Wed, 15 Jul 2026 at 14:32, Anthony PERARD <anthony.perard@vates.tech> wrote:
>
> On Mon, Jul 13, 2026 at 09:48:02PM +0100, Frediano Ziglio wrote:
> > --- a/tools/libs/ctrl/xc_private.h
> > +++ b/tools/libs/ctrl/xc_private.h
> > @@ -45,8 +45,16 @@
> >  #if defined(HAVE_VALGRIND_MEMCHECK_H) && !defined(NDEBUG) && !defined(__MINIOS__)
> >  /* Compile in Valgrind client requests? */
> >  #include <valgrind/memcheck.h>
> > +#define MEM_NOACCESS_BUFFER(name, size) uint8_t name[size];
> > +#define MEM_NOACCESS_INIT(field) \
> > +    VALGRIND_MAKE_MEM_NOACCESS(field, sizeof(field))
> > +#define MEM_UNDEFINED_INIT(field) \
> > +    VALGRIND_MAKE_MEM_UNDEFINED(field, sizeof(field))
> >  #else
> >  #define VALGRIND_MAKE_MEM_UNDEFINED(addr, len) /* addr, len */
> > +#define MEM_NOACCESS_BUFFER(name, size)
> > +#define MEM_NOACCESS_INIT(field) do {} while(0)
> > +#define MEM_UNDEFINED_INIT(field) do {} while(0)
>
> Why the _INIT suffix in the macros? It looks like something is
> initialised, but that's not the case.
>

It initializes the memory to be not accessible.

> We could follow the valgrind naming and do, while using something
> different than "mem" to say we don't need a size:
> make_buffer_noaccess and make_buffer_undefined
>
> Or
> mark_buffer_as_noaccess
> mark_buffer_as_undefined
>

It makes sense, but I wanted to be able to remove the buffers entirely
if debug is not enabled.

>
> >  #endif
> >
> >  #if defined(__MINIOS__)
> > diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
> > index c07c6db59e..d3fc7f363e 100644
> > --- a/tools/libs/guest/xg_sr_common.h
> > +++ b/tools/libs/guest/xg_sr_common.h
> > @@ -245,13 +245,21 @@ struct xc_sr_context
> >              xc_hypercall_buffer_t dirty_bitmap_hbuf;
> >              struct xc_sr_context_save_buffers
> >              {
> > +                MEM_NOACCESS_BUFFER(na0, 16);
>
> This first redzone buffer and the last (na7) one looks unnecessary, as
> they are before the beginning of the buffer, and after the end.
>

Before for buffer underflow, after for buffer overflow, but I suppose
you mean that Valgrind/ASAN already add them anyway so it's not really
necessary.
Yes, I'll remove.

> >                  xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
> > +                MEM_NOACCESS_BUFFER(na1, 16);
> >                  xen_pfn_t mfns[MAX_BATCH_SIZE];
> > +                MEM_NOACCESS_BUFFER(na2, 16);
> >                  xen_pfn_t types[MAX_BATCH_SIZE];
> > +                MEM_NOACCESS_BUFFER(na3, 16);
> >                  void *local_pages[MAX_BATCH_SIZE];
> > +                MEM_NOACCESS_BUFFER(na4, 16);
> >                  struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
> > +                MEM_NOACCESS_BUFFER(na5, 16);
> >                  uint64_t rec_pfns[MAX_BATCH_SIZE];
> > +                MEM_NOACCESS_BUFFER(na6, 16);
> >                  int errors[MAX_BATCH_SIZE];
> > +                MEM_NOACCESS_BUFFER(na7, 16);
> >              } *buffers;
> >          } save;
> >
> > diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
> > index 6a77e33a47..25561e369f 100644
> > --- a/tools/libs/guest/xg_sr_save.c
> > +++ b/tools/libs/guest/xg_sr_save.c
> > @@ -123,6 +123,11 @@ static int write_batch(struct xc_sr_context *ctx)
> >      assert(nr_pfns != 0);
> >      assert(nr_pfns <= MAX_BATCH_SIZE);
> >
> > +    MEM_UNDEFINED_INIT(ctx->save.buffers->mfns);
> > +    MEM_UNDEFINED_INIT(ctx->save.buffers->types);
> > +    MEM_UNDEFINED_INIT(ctx->save.buffers->iov);
> > +    MEM_UNDEFINED_INIT(ctx->save.buffers->rec_pfns);
>
> Why is errors not also marked as undefined?
>

I suppose a rebase mistake, later in the series errors field is removed.

> To bad we can't really test this patch, beside check that it build.
>

Indeed, I realize Valgrind support is not that updated at the moment.

I'll add ASAN support as Andrew suggested.

> Thanks,
>
>
> --
> Anthony Perard | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech

Frediano

