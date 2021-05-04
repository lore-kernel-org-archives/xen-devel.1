Return-Path: <SRS0=Vf37=J7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9519C433B4
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 17:05:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50BA613C4
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 17:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A50BA613C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.122600.231224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldyTm-0000za-Ez; Tue, 04 May 2021 17:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122600.231224; Tue, 04 May 2021 17:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldyTm-0000zT-BN; Tue, 04 May 2021 17:05:02 +0000
Received: by outflank-mailman (input) for mailman id 122600;
 Tue, 04 May 2021 17:05:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMRT=J7=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldyTl-0000zO-6d
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 17:05:01 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2edc572d-e4cb-4bab-bdd7-bd894fc5898d;
 Tue, 04 May 2021 17:05:00 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x2so14332430lff.10
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 10:04:59 -0700 (PDT)
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
X-Inumbo-ID: 2edc572d-e4cb-4bab-bdd7-bd894fc5898d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=0r0tC/MhFmMETe0s08jqzXCoIJHWHVmJwmREtMKC6vc=;
        b=qbfa/S3lo7VCXNpguTZfuIo8ZZjLrZY2EaKDvdNxVLQUdOJr+40bL+waQk5OxpLah8
         ky96tnJRM8dGDZPEQDo34VhwJ6uG5fDECcIlCbaDv9Zgs3IgK6UpN6WviUQkwKfOfw4z
         puY63pU5FqAiWpnQZ73xqGMdVfHrq7vpBl2rW5bw9utYZbvAcBBqUgptlAQGkXAmeH/u
         ACcV/8+sH7gum5+6ZV8WK1IGavnMRnu9Vo9xtFXzl8kns5Yo57+CZIOGg8jGOFJ4zl2X
         bXVq6tvqlH3TWDTvBR37z9Sc35j09NBuIBMO5V053AfIYeVP5tTNYqSuMeBvUDTmeDvR
         6MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=0r0tC/MhFmMETe0s08jqzXCoIJHWHVmJwmREtMKC6vc=;
        b=KfivOtEg3APKhd3p/gmJMa25GewPBgDIzcYqtRq7nw87QhDJBi7corHxx1WIaRA1BP
         hQndViu4Tqe+GAxmaRA9DR6X6HFC+lAm6gnJutNuagRTSt+UbAW7IlHpVO3Ds6HwlPA/
         io0wUGyIX3ZapCKIab4qUUNxhYH65QUDKP7quZO+ILQvRnSeXl7u+Yf3Ij6/DljXkAV6
         KscBrcC0aJCj888JjQAOLOVt0r+NW7VUn7erCcW+s7kqD7xf4rklLr84HashIzaTn6//
         ucJhFmmOwwEPPinWgHF3oc8YEuLsm97aWFRD8zJHs5bM16+XlEA22oaDinW4T2/lWvCm
         ZlgA==
X-Gm-Message-State: AOAM532JL5v3PEJt/+tr3tgYHryEsmdj2h2x5GIZNF72srWKCTpMKfZZ
	Q6wb1jdNwZ5BA+FfWb3x9lruiJgGWJiyCh+UeWM=
X-Google-Smtp-Source: ABdhPJyMLek6re+2+pYqsYJXyl/oyFpvtsky7d+Cv692pS7IG9XKh6KrQOlb/FbFk39iZWLalxMLiG3jklyi4z1U7LE=
X-Received: by 2002:a05:6512:3e7:: with SMTP id n7mr17460446lfq.150.1620147898935;
 Tue, 04 May 2021 10:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210504124842.220445-1-jandryuk@gmail.com> <20210504124842.220445-5-jandryuk@gmail.com>
 <20210504131328.wtoe4swz7nyzyuts@begin>
In-Reply-To: <20210504131328.wtoe4swz7nyzyuts@begin>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 4 May 2021 13:04:47 -0400
Message-ID: <CAKf6xpsVJQ7LeV63hb8Sm_6gq+xjCwMDOkuMKNsn+-vqHF=9rQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] vtpmmgr: Allow specifying srk_handle for TPM2
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, Jason Andryuk <jandryuk@gmail.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 4, 2021 at 9:13 AM Samuel Thibault
<samuel.thibault@ens-lyon.org> wrote:
>
> Jason Andryuk, le mar. 04 mai 2021 08:48:37 -0400, a ecrit:
> > Bypass taking ownership of the TPM2 if an srk_handle is specified.
> >
> > This srk_handle must be usable with Null auth for the time being.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> >  docs/man/xen-vtpmmgr.7.pod |  7 +++++++
> >  stubdom/vtpmmgr/init.c     | 11 ++++++++++-
> >  2 files changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/docs/man/xen-vtpmmgr.7.pod b/docs/man/xen-vtpmmgr.7.pod
> > index 875dcce508..3286954568 100644
> > --- a/docs/man/xen-vtpmmgr.7.pod
> > +++ b/docs/man/xen-vtpmmgr.7.pod
> > @@ -92,6 +92,13 @@ Valid arguments:
> >
> >  =over 4
> >
> > +=item srk_handle=<HANDLE>
>
> Is this actually srk_handle= or srk_handle: ?

Whoops.  It's srk_handle: .  I just copy and pasted here.

> The code tests for the latter. The problem seems to "exist" also for
> owner_auth: and srk_auth: but both = and : work actually because strncmp
> is told not to check for = and :

owner_auth & srk_auth don't check :, but then they don't skip : or =
when passing the string to parse_auth_string.  So they can't work
properly?

srk_handle: does check for that entire string.

> We'd better clean this up to avoid confusions.

Right, so what do we want?  I'm leaning toward standardizing on =
since the tpm.*= options look to parse properly.  Given : doesn't seem
like it could work, we don't need to attempt to maintain backwards
compatibility.

Thanks for the review.

-Jason

