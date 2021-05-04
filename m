Return-Path: <SRS0=Vf37=J7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5979BC433B4
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 17:05:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1444F613C4
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 17:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1444F613C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.122603.231235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldyUU-000158-Np; Tue, 04 May 2021 17:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122603.231235; Tue, 04 May 2021 17:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldyUU-000151-Kx; Tue, 04 May 2021 17:05:46 +0000
Received: by outflank-mailman (input) for mailman id 122603;
 Tue, 04 May 2021 17:05:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMRT=J7=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldyUT-00014v-Tj
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 17:05:45 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4181a9dc-ea2e-47aa-aad3-fd080edb2212;
 Tue, 04 May 2021 17:05:45 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id n138so14391297lfa.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 10:05:45 -0700 (PDT)
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
X-Inumbo-ID: 4181a9dc-ea2e-47aa-aad3-fd080edb2212
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=tcon4j7AC3gVKmFEWSyXjWC+cBOcg4Zdc/1k3QPFtDY=;
        b=YDRNSyYpZ7k/nWhfWNE01Tnc+lZIzIxcIIVPlH1+EMLvHl82DYJogoN0fLHf8zjWad
         1+lQVTtsVDJh6Lq9UjW5vvwsmIotkQ4MKuVKB1HjECaRUp0kLqWj3M21NXDIKML7MCf2
         4Ja13Nkj0if+jSxy9Ag/AxmNUguKH7Pd/ndgOyzSwediIY7Ti9qvd5Z+Pnym3IpI8vSn
         dE7u+JuoIV0xpESfXIIBSQKzImSAwRVh57CsrNnUV+K37EBv9QnJ3YgldlyZU1E/dyxV
         vUiamwxHMKByU1/oVu85i/CUlB9EGaDQswai/0PWbp6wxfzUFoB2SYW2iAxcz5LVuGWB
         YOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=tcon4j7AC3gVKmFEWSyXjWC+cBOcg4Zdc/1k3QPFtDY=;
        b=tMeicLSzoeHznEpkTm1u6j8KM5oEv4i1cOxB1kHbQy5AxNuOmykuOaSscbTPpjg/2s
         52xHh7IZQHWqf2GqwGLp/juX/RUfEplUQgqt4Dc36FV/YsdCuzKXyYiWW3j63FUe+Nlj
         lyOTYwDeeNbjCL9Cw/BiYu6lNmDCHCWj6WN7AHH/VOjIs4Ml2D8UIRH6VJSbZ4q3pZLK
         0BrFA/kdstam/afvgQD1VahS+mzIcM7l5K2awQDCv+/CSNcNEf6hCPfB1oktmq5oxm0f
         +grdvtKB22Dgq9i1rSQ8DH1mZAR5RbNcMuydwpdHjstOw0fY/DTC/fdUTp/0/Mc8ECUd
         aSwg==
X-Gm-Message-State: AOAM5300dtkZTMM2dAS/9H3Y1VqoIVqbbNlDvI3ZcAmq771z3hRTvpkO
	yOCEtUX/UTtkeGut0Zy57hGOKqwQIr9j7vUnEkTsqs9I
X-Google-Smtp-Source: ABdhPJykU0l+G7JZnihj+z4nWpGgKUrkaB9GXMva3mQFt0zvMYOrYdbKJH3r/92STDkpZjc7agcXHaiOyY+Ni6ZDdc0=
X-Received: by 2002:ac2:5e36:: with SMTP id o22mr8124029lfg.529.1620147944309;
 Tue, 04 May 2021 10:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210504124842.220445-1-jandryuk@gmail.com> <20210504124842.220445-8-jandryuk@gmail.com>
 <20210504131626.h2ylaamk35evw6yg@begin>
In-Reply-To: <20210504131626.h2ylaamk35evw6yg@begin>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 4 May 2021 13:05:33 -0400
Message-ID: <CAKf6xptnmC9FQzZ_2Z1uBaFYS1s0F7VAVu0cm=a_5YKyPSEdxA@mail.gmail.com>
Subject: Re: [PATCH 7/9] vtpmmgr: Flush all transient keys
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, Jason Andryuk <jandryuk@gmail.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
	Quan Xu <quan.xu0@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 4, 2021 at 9:16 AM Samuel Thibault
<samuel.thibault@ens-lyon.org> wrote:
>
> Jason Andryuk, le mar. 04 mai 2021 08:48:40 -0400, a ecrit:
> > We're only flushing 2 transients, but there are 3 handles.  Use <= to also
> > flush the third handle.
> >
> > The number of transient handles/keys is hardware dependent, so this
> > should query for the limit.  And assignment of handles is assumed to be
> > sequential from the minimum.  That may not be guaranteed, but seems okay
> > with my tpm2.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>
> Maybe explicit in the log that TRANSIENT_LAST is actually inclusive?

In the commit message?  Sounds good to me.

> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks,
Jason

