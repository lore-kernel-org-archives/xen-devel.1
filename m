Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91319C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 12:56:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389996.1630570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuUzA-0004c5-Gv; Thu, 13 Aug 2026 12:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389996.1630570; Thu, 13 Aug 2026 12:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuUzA-0004by-Ct; Thu, 13 Aug 2026 12:56:40 +0000
Received: by outflank-mailman (input) for mailman id 1389996;
 Thu, 13 Aug 2026 12:56:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wuUz8-0004bf-IA
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 12:56:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuUz7-00AKGB-QH
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 14:56:37 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7dbef6-bab6-0a2a0a5309dd-0a2a450a998a-20
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:56:37 +0200
Received: from [209.85.128.181] (helo=mail-yw1-f181.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7dbf04-f2d2-0a2a450a0019-d15580b5cdba-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:56:37 +0200
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-824af9535c8so12438057b3.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 05:56:37 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1786625796; cv=none;
        d=google.com; s=arc-20260327;
        b=ks2xryQh1+UQUU4XEQawZAy72cfItU+PUrJKKOYQO7rH4QHFudzTsPyKJnTDuBEKwF
         hGK9PisWM7D0kLLaNxlYYR1A66AP+NaenmcdVosMG25sAcT+ZrNFPIp4FxykkMrYdI4r
         3aXVst4KHnU+UsD0VvrsDne+7Qwdi/g3ajKP5L7a55J6mPW4qIINZSJPygWsPkIs0r1V
         ZB3noKfvxMIoyPMjPVVGKcSmI15qCeaDuhsKYvo+f8F+I16ml+/3wPSeROM8L9MTiFl0
         MI/d5zm4rM+zs/RS95PhO2LFgzptexlTifIM7Mz3/iAL9Z8eSO5hb7L+zm+JKOhXujwY
         83EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wBkVfFa3I1a4xw0FRjxrPE/2JG7Xw2hq+rikZWfqA0M=;
        fh=9Qi9GuP6RaIdUPqcByINS4Lh6Dqx/46KOIm9RXXqrVw=;
        b=dzQM58jv1Pi55+cz4rAoFrm4Z48D07SpHcN3eHw568/GYUbt47gspWuFZuQBdJuRgt
         0ROJnQP05JziYKdVLjr4a3BWRbSvUPaRBAEdrsxw+TpPGDE2xac1jMrIV+8yDNr0CJp5
         M1DgjOP2J8YohePFTRWLwouua4MuTPxMXfauoCCvM707ewPC3WgCajbozgEmfWldDqwv
         rVfMPu45frH9jIMK5mPwm387yXCJFVhUVFOn/kcMtQkgy8ZEWGVVqGSps9icTK3QEX5j
         jBb9bdKQRj4mmKHoQFaaaup9ibwTB8SzsWMDtxQ6iILF8zxV0gfnBRYl4fFSQR30kyo8
         Sq6g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786625796; x=1787230596; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wBkVfFa3I1a4xw0FRjxrPE/2JG7Xw2hq+rikZWfqA0M=;
        b=pwXFiYmDo2s5oBzs9+tSNRqelhrYv2fvYM2FdD+hGu9smhTrvuEGUNboNQZbM08Biz
         XbRV6abeRKQhoQUpbQ+1QrRp86m9moO/BkjMPaO8LA4X+iVNF7zUnJ/td+rY52oLpFtk
         mPHqBMSz0eo+J/lr+RkWslkD6BV2vaAC9F2qyA6MDFB+O1Qznn9Grv1fD8wVqhoWuavv
         /evn0HiuyDW/rmd/7YtYaiCuoKcZmsxu7Vu1sxb63/oZwWxMbMttSnHAgCBBl95q0e5M
         fQph7SBReNP+QfMdMOpZXCMvkcRSZKNQ4eYaWOH9RlfqmrNHuzY8PDJKMVxyLvt2uk8Q
         oNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786625796; x=1787230596;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wBkVfFa3I1a4xw0FRjxrPE/2JG7Xw2hq+rikZWfqA0M=;
        b=XPmhhVfnLd0ND/2jWU6UKZcXzwEknFfU9TlkRNM+EANlGaldz87uOS7cR3q7rBe7o7
         GxvUdhjRjUgoqZUssXltaJoxQqwU+kz5763wVjc20uecZj7Un+1/a9LknNA8Jwbp+U71
         9AiGYOYz2oFQoh5NEvLFmpDE7p8QsMSkg/zcMvh0//2V7e7Uouf7ztwcE2vjIIE5JyDG
         Taxhdj2lNEelY6d4BKDEsL3z15UXDexO3QSFtd3wDmjRP6YDySf2YH0O9fTQ+t3jmjBi
         udXZn4wNPUNc0pHBO/73kTUHii6j3ebGd9FEuC1n4gbH7JxRcl4Mb7Iw22+1VLvy4PK4
         huaw==
X-Forwarded-Encrypted: i=1; AHgh+RoKa3JCvGcO+89bgqDSsryztfz2Bc3grzpg9q0JeFSJOwXb6HzvxwZ8BQ078BN7M0l5Vvgz6r6JPZ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNU2cZ575Dl+blaZPtum78L1Xak8baldLJdjFcjBzBGjlXlTzG
	U3AYRXpDvFfyFrfCvRKAikBjNZPD7Na235mG1+1TscfGAuTH+r0VgrBWrq7LVY9QG1+g3N3qP1H
	RBxwaB/pivE4wVtjRgnYDAyI1SxUlOzg=
X-Gm-Gg: AR+sD11PX8MGxRwR8QWKxEKMGHsT9sst3jixTpnGMN7YP7mQuq2rwSoc04WoFSP7BtJ
	MsURc2VaCA6wYAcGTAAzIInkiXanuQImFKswK1UiiEsTd57yXNnn6zAb4Hi/VxDX8Wmnlt83a0n
	5SbheMM7qpTp6P7kOv5StgAzPX28vrcI0mf87EMBMERWvBm0jd7jZ4FSIWULv8eEqmYv1HnJmNY
	sFWC9+EYCTAqXNBmJAnItHZLps7BfEepZnf36Z7rxHlXG14nGY0P5E4TXrjy1TyuS82WFpzzMwl
	GeO8MWHWt2KM418wWxeeDT6BAnw1dLnfEF2kXEej0L/7e49QZRIbBiC8f5XSE3jkVxldxoVqnse
	Y
X-Received: by 2002:a05:690c:7482:b0:80b:de9c:8a2c with SMTP id
 00721157ae682-83471fe4b47mr31617347b3.8.1786625796241; Thu, 13 Aug 2026
 05:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
 <20260810103018.54564-3-frediano.ziglio@citrix.com> <d41d0fa2-7273-4723-a5e0-6424d030cf0a@citrix.com>
 <1101df6e-bb36-4766-9b11-365d1043342b@suse.com> <c76d69db-f976-4c7a-b653-ab1f13854db3@citrix.com>
In-Reply-To: <c76d69db-f976-4c7a-b653-ab1f13854db3@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 13 Aug 2026 13:56:25 +0100
X-Gm-Features: AUfX_myvkcqCRqFABV5n8e6MqkECT5YiSTPHktqS8DcTG2KFnh2SXs156X5LrsY
Message-ID: <CAHt6W4dBBKDeSTQnDzjmngU7An_ncJri_oBoTpChz_xQcfsrfQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/10] libs/guest: move batch_pfns into a separate structure
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Frediano Ziglio <frediano.ziglio@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-4011c0/1786625797-4B0D9CFC-1B8CCA08/0/0
X-purgate-type: clean
X-purgate-size: 2333

On Thu, 13 Aug 2026 at 12:48, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 13/08/2026 12:27 pm, Jan Beulich wrote:
> > On 13.08.2026 13:08, Andrew Cooper wrote:
> >> On 10/08/2026 11:30 am, Frediano Ziglio wrote:
> >>> Preparation for a followup patch "libs/guest: allocate various migration
> >>> arrays just once".
> >>>
> >>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> >>> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
> >> Coverity thinks this change has memory corruption.  I have to admit that
> >> I'm not completely sure why it's noticed now; possibly because now it
> >> can see the size of batch_pfns[] where previously it couldn't
> > I had looked into that too, and I'm puzzled that ...
> >
> >> ** CID 1700057:       Memory - corruptions  (OVERRUN)
> >> /tools/libs/guest/xg_sr_save.c: 284           in add_to_batch()
> >> _____________________________________________________________________________________________
> >> *** CID 1700057:         Memory - corruptions  (OVERRUN)
> >> /tools/libs/guest/xg_sr_save.c: 284             in add_to_batch()
> >> 278         int rc = 0;
> >> 279
> >> 280         if ( ctx->save.nr_batch_pfns == MAX_BATCH_SIZE )
> >> 281             rc = flush_batch(ctx);
> > ... the tool can't spot that flush_batch() resets ctx->save.nr_batch_pfns
> > to 0 in the success case. And ...
> >
> >> 283         if ( rc == 0 )
> > ... only the success case is what matters.
>
> Hmm.  Both flush_batch() and write_batch() are static, so fully visible
> to Coverity.
>
> I guess this means that Coverity failed to figure out the properties of
> write_batch(); it is a complicated function, even if it has become less
> complicated recently.
>
> I'm still advocating to remove the Valgrind logic rather than extend it
> in patch 3, and that will remove flush_batch() which might simplify things.
>
> ~Andrew

Hi,
   as said by Jan this is a false positive from Coverity.

It's not guaranteed that Coverity will detect that it's not an issue
if either valgrind macro is not called and/or flush_batch calling
write_batch, I would either test the change or simply add an explicit
Coverity comment.
If we decide to remove support for valgrind then what about the
valgrind patch on the series (4/10) ?

Frediano

