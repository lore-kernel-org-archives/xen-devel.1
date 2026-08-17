Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36830C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 14:01:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393029.1631931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvxtu-0006Nt-B4; Mon, 17 Aug 2026 14:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393029.1631931; Mon, 17 Aug 2026 14:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvxtu-0006Nm-84; Mon, 17 Aug 2026 14:01:18 +0000
Received: by outflank-mailman (input) for mailman id 1393029;
 Mon, 17 Aug 2026 14:01:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wvxts-0006Ng-9V
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 14:01:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvxtr-006Bk0-5S
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 16:01:15 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a831429-bab6-0a2a0a5309dd-0a2a4509acb2-10
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 16:01:15 +0200
Received: from [209.85.128.182] (helo=mail-yw1-f182.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a83142a-be1a-0a2a45090019-d15580b6b0dc-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 16:01:14 +0200
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-81e6f0b4610so34893427b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 07:01:14 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1786975273; cv=none;
        d=google.com; s=arc-20260327;
        b=L13CqX1/vjfMbCpzbNco1joDiVgOreL1izUBbnrZKmPmHRnNtnnL+kgpOrx+s2vlQr
         Y0KxBRYDdKLO8yHfM2/vAFfOasO+3DAu4spaL6dKc+psDlITUe1eD4ghxVCQUtXRfo2r
         ukCTd3oCLOgnkrcC25N4gXAxChgnlw9L1LvMVsxYO0DSBwBoO0cn9RdCalscWAIuTby2
         P5Quq/7aMaCg6b32v4v5waDSHd/d5hE9nTwjhpFcAeTV/kdwk5BpR8Aw4SsE2mDtphFf
         geh9SL0R/GnR40MnbRJ3hXLoGT+WeR/YiFZu89IatRBjARCanGL3GM/qBbwJWjQU+UTP
         HZBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L8HykWJpsrqIcHbdJMVChSi6jRdfa7iHZ0zT1YCTlM8=;
        fh=9nAqNi8urBxrfozKAqk+9srfdEwt95QqXLH0w/zVALY=;
        b=KGKLrAylGwTieCYycLckelSvsNo9xH4bm/oBzlydSb2Qi8y0Rq3oQubqGL+GvO6q4m
         ZSRUCV6bJ0hEcXkaPgswzasO4FqYv7yf7l61mkEoSofzlCVjx/ph6ycEdZ8k2d/prPgz
         2LLwr8KFBkQLQCY/q0m8sQKOWYK80lFVEvFpHiqFWRzf2QavYHuCMF44hPlMzpT5kSjk
         7Zid3VYjdGV0sLQsHxwiRNfAoOWS1BDL//14uMnaGjnzkVyt2WFU0hqa3gX+BMeKgyjC
         uEL2eJW0wN5PfD1nWuh2V71L4oLiklSQ3MRFxxOzQRH0xPBkGPheX0wMQ9iAxFp8gJzP
         R9YQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786975273; x=1787580073; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8HykWJpsrqIcHbdJMVChSi6jRdfa7iHZ0zT1YCTlM8=;
        b=pScw4foNnxeR5WFhvtYVfGtX2qLwbPrAItTKy2N+VpOJNy1E9GrOp9t9fT7tK3t5ev
         fMTL64afhDi5vHQ5oFBdSB0GfkRxujFAONbcBPXTvU/4RultY8id95CqhR6LZw6nChKB
         fP9jS0f70sXl9UxHf2hqoCMO3drsBgc3R4x7DeiPdohb7k80pimZTwlCcS1Op6PlUAv8
         ZrF/P8cuiS4Z8GFjfCATa/owAOvmSoKYtA+w62tqO/zlsOAU9LU08wk+uSaOZYQIVmmS
         5pOz+vkDrTyhhZ1sjT5gSNWehHyhNqQkqgTir0J4kFW5DZtfKWnIInZonZI/uhEj5VZb
         tBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786975273; x=1787580073;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L8HykWJpsrqIcHbdJMVChSi6jRdfa7iHZ0zT1YCTlM8=;
        b=EG2UQ/xUHlsWUBNzEdkF35Y65vZ9LkQuHT6V8ZSfu6uTS7aXUvzRMeS5M0371tj7Dp
         LndCMAFmgFNWF/4dw2sfZH70udqZWsoaF6ZnCvDn9qGd+twO56hgdRJlMksQOwXjfoJu
         1xDaM8vH8qHWfPMjStSpDtHmKe2FjuUCYL7iPRmSi0MeDP9Jl4hGq2R59BPwGjSE9ECz
         GO1VhflMjeSCwMiyE7RroR3FXrD36Y0VzsrB/rpLTysS96S6Te/v1SQByc8Zfo19ffmk
         LTDFsmqNjpRhYEJSNJaeGuydnnpykL9KHMv2EoqhbEGPcuxjc4lIUcTI4D3NNoh2OPJr
         vjJg==
X-Forwarded-Encrypted: i=1; AHgh+RrNOVQ9i0TnOGPSxZZ41RQH6ws+AH9yQUKwk6iNGHl9sV3WJTOZa/1mfqbafPq7HngkcD4QortFWLE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQBvDu1KdwaoH35Z6RA7qn/MB5tMija0g56NIHQBAb0XCJPmrf
	akAcn2ZBEaDdEcuPy0PZT3CENHgDnGyB54sJ4975Bq07dCWCSWaTf6joJej1zz6/5NDN6kXBtW9
	yMLBVIBTizECjmQECA+p6MVR1zKbvKbp7Zecx6jg=
X-Gm-Gg: AR+sD12EQ9lJ+PtlaS4EuijQDcUWIyd/k4nJelsgOLczxYUnccae2q/wgGnSsKZA5Ra
	mfOhBtrnYW0YfIi+EQskAnQS6WRWP4NMuQytDlxyjBtYlwBvQv3u1dhDNIv5wTnYAAkAST4U8+f
	/k9pZQTqtTPxo9bZwaFkL5Uls3Mm7zuF9bzIwgBvT4FbB/QkiEb1wohg9oiqT/pfoG0CIsfiPjW
	BOX0Omkf/mHOfcVcmM88rqE2PhPzqsAeQSlSy5a9QztIGDe93UBVNoFyKWgHv6zL4UFb8zq/Flt
	kNaskYOFWWBcvHLxe5vDz6/Bzwik6R7yDPpRRTLFC2ScZf3kHF7JKPq0p6EO9hBYPrlmo41dSaA
	xgED3yLBLEpE=
X-Received: by 2002:a05:690c:e3ea:b0:820:a7c:7495 with SMTP id
 00721157ae682-8412cd49584mr3820827b3.3.1786975270637; Mon, 17 Aug 2026
 07:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
 <20260810103018.54564-8-frediano.ziglio@citrix.com> <43d1ce4a-3a49-42c9-b277-47a89698513f@suse.com>
 <CAHt6W4enamC9rVMK98+q=pWCuXQL1DPgNTCGWMVR-Q2NvX8uTw@mail.gmail.com>
 <b10dbef6-a467-49d0-858e-d88f268e2dfd@suse.com> <CAHt6W4dWQvSg1_XtkKowTcznUWs=-ApbvatV4YrQSKR8zJTA0A@mail.gmail.com>
 <e3d4f0a8-e95a-4dc3-8ca0-df857725d60d@suse.com> <CAHt6W4ftLMsk41zdwYUXEwN_JzzXHQG01vhSqutkgk8PO6xAQw@mail.gmail.com>
 <e697b132-8c6a-411b-b91d-2fedba02a9ae@suse.com>
In-Reply-To: <e697b132-8c6a-411b-b91d-2fedba02a9ae@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 17 Aug 2026 15:00:59 +0100
X-Gm-Features: AcwNN1UmMg5O30ftsHfwarH9HZoBcZITt0ns_skJIZ3FY2qtP-8Pnutv3ilTMyE
Message-ID: <CAHt6W4dUe6ozg==rzBcY0zTciXVd0k3sotsTvsHkQrWM1ALWvQ@mail.gmail.com>
Subject: Re: [PATCH v10 7/10] xen: implement new foreign copy hypercall
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-bad1c0/1786975275-BD2CC034-B8EA972B/0/0
X-purgate-type: clean
X-purgate-size: 3407

On Mon, 17 Aug 2026 at 09:04, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 14.08.2026 16:50, Frediano Ziglio wrote:
> > On Fri, 14 Aug 2026 at 15:13, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 14.08.2026 15:47, Frediano Ziglio wrote:
> >>> On Thu, 13 Aug 2026 at 15:22, Jan Beulich <jbeulich@suse.com> wrote:
> >>>> On 13.08.2026 16:03, Frediano Ziglio wrote:
> >>>>> On Thu, 13 Aug 2026 at 10:41, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>> On 10.08.2026 12:30, Frediano Ziglio wrote:
> >>>>>>> --- a/xen/common/memory.c
> >>>>>>> +++ b/xen/common/memory.c
> >>>>>>> @@ -1548,6 +1548,141 @@ static int acquire_resource(
> >>>>>>>      return rc;
> >>>>>>>  }
> >>>>>>>
> >>>>>>> +/*
> >>>>>>> + * The "noinline" qualifier avoids the compiler to create a large function
> >>>>>>> + * consuming quite a lot of stack.
> >>>>>>> + */
> >>>>>>> +static int noinline mem_foreigncopy(
> >>>>>>
> >>>>>> I'm wondering: Is the "mem" prefix really meaningful for a static function in
> >>>>>> a file named memory.c?
> >>>>>>
> >>>>>
> >>>>> Changed
> >>>>>
> >>>>>>> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
> >>>>>>> +{
> >>>>>>> +    struct domain *d, *const currd = current->domain;
> >>>>>>
> >>>>>> With the comment on the new XSM hooks (below) in mind: currd wants to be
> >>>>>> pointer-to-const.
> >>>>>>
> >>>>>
> >>>>> Just rebased on master, all XSM hooks accept no-const pointers to domains.
> >>>>> So the suggested change would create warnings.
> >>>>
> >>>> Well, as per below, I pointed you at a particular pending patch, a single
> >>>> hunk of which could be broken out.
> >>>
> >>> Yes, but my changes would have to have casts from const pointers to
> >>> no-const pointers to avoid warnings and the patch you are pointing to
> >>> would have to remove these casts. I find this less clean than having
> >>> one patch using the current code style (that is no-const pointers) and
> >>> another that changes the style entirely.
> >>> But obviously this is just my opinion.
> >>
> >> Such casts would be unacceptable. What instead I have been trying to convey:
> >> Your patch wants to gain a dependency on my patch. And if my patch would
> >> take too long to make it in, that one hunk could be broken out into a
> >> separate, easy to get in patch.
> >
> > Okay, then the only choice that's left is the code producing warnings
> > as const pointers are passed to functions requiring no-const pointers.
> > Is this acceptable? Apparently as you are suggesting it it is.
>
> That's not acceptable, the more that due to -Werror this would break the
> build. But that's also not what I said, and I'm having a hard time seeing
> how what I said can be mis-interpreted. What exactly is not clear in "Your
> patch wants to gain a dependency on my patch"?
>
> Btw, I'm about to submit v2 of that XSM series, where I've broken out that
> hunk (for the change to then hopefully go in quickly, allowing you to
> simply re-base rather than carrying a prereq patch).
>
> Jan

Okay, being dependent on
https://lists.xenproject.org/archives/html/xen-devel/2026-08/msg00768.html
would be acceptable.
What was not was being dependent on other large series.
That is more in line to what I proposed multiple times, that is having
a preparation patch for constification and code using const pointer on
my patch.

Frediano

