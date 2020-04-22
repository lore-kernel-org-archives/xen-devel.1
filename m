Return-Path: <SRS0=FTuz=6G=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DE7C55185
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2020 19:58:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EEB420857
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2020 19:58:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/YXNFiZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EEB420857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRLVi-0008Fb-U6; Wed, 22 Apr 2020 19:58:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ldCW=6G=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jRLVg-0008FV-UP
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 19:58:17 +0000
X-Inumbo-ID: 9aa0d8f2-84d3-11ea-b58d-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9aa0d8f2-84d3-11ea-b58d-bc764e2007e4;
 Wed, 22 Apr 2020 19:58:16 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id k28so2759268lfe.10
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2020 12:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XcQb4M+NPUPy07eOdpHWYjbaoG6q04jfoDv78njdn1A=;
 b=i/YXNFiZeiPZluI9S/6tdQtbKRQE7bQBdnQEEbYI157v+bgrlwvpPCvSIgO78tUVkv
 jLFNjLoFCEY6EE3fUrEW2BklBfFQUE32XqeTTiS7RxVA/625ShnTYwtzXg5T6OkgtiSe
 ji6JlJaPmoDEM5j6upU1mNJKDN7ugcZzNgDClxnPT9aL9m0rkOP43QhXai4FHviYOZox
 +DESN/l4rj7H5PI+YY7F6yfBw5CBNR5WlYa6rJyF2g6JIPLcnn5Z3zt0gXO65EW5gt8o
 TfqY5wB5JwuvmAiL8e2E/NmnGs62RObBgvEMWFbyxlwHdeKN4iszyWJcuSrigiubOQcz
 LKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XcQb4M+NPUPy07eOdpHWYjbaoG6q04jfoDv78njdn1A=;
 b=CSuVUnNZH6T4BieppqpmJsLITFfH75rqEte99g95/m7fPmArZH4tikNoHHLyY3J49L
 jubQ8XCpySqbW498LDwc0+6vA0aWqH0sWV7KaYvcYFOib0PmtvyRmlRtkyvEiWJZhhFW
 UlGl70QAznIXM4CGX95sIDOUZh0Cx5bD6IVvFkaFD7WpK1MQwZT6rHkqBFYxhTSyRp1S
 LfarD+qXgBt10qxvzn9UCNruFZD7anl+jvxXduPtaFuytb11fJKnk6t7E1EEn99Vu5ev
 OtWXW3J9gk20QEnIWu8EqrnKOyzQkTMg4KiBlWsiwADsFqqlPBZcIeb8RaY8CeQr5wWv
 Sd+w==
X-Gm-Message-State: AGi0PuZquMgN6eGWCzSJBGZy2UBynlgZ61mf0SzBHVxz9Sqo3khCLIE+
 610JRr/6e/MEC4PdJos4zhG8fzZLGKNFZJNWx8c=
X-Google-Smtp-Source: APiQypJv3u3FZ2BCh+cqU86y5GNTOYOkIb8ZOi28a1gszK3+Ju7HbIkBzlCkjrgH5oBwzvVBD/qF3uBby/uomnQJRPk=
X-Received: by 2002:a05:6512:406:: with SMTP id
 u6mr148439lfk.150.1587585495058; 
 Wed, 22 Apr 2020 12:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
 <87323a6eb60fd908ea2f792c9754cb88b283c5a6.1586727061.git.rosbrookn@ainfosec.com>
 <0A603CD8-2054-413C-9096-F03CEE7B2D5E@citrix.com>
In-Reply-To: <0A603CD8-2054-413C-9096-F03CEE7B2D5E@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Wed, 22 Apr 2020 15:58:03 -0400
Message-ID: <CAEBZRSctbCjPANDcXG=8-1gxE1PQe6tiSBBq7_a1E6omd8dmKg@mail.gmail.com>
Subject: Re: [PATCH 2/4] golang/xenlight: add DeviceNicAdd/Remove wrappers
To: George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> I feel like I want to say here what it is you actually have to fill in to=
 remove the nic; but after 10 minutes of poking around the code, I=E2=80=99=
m not actually sure myself. :-)  (I think it *might* be just Devid and Back=
endDomid.)

IIRC, you can use just the MAC or devid. I was using just the MAC when
I tested it out.

> So I=E2=80=99ll give this for now:
>
> Reviewed-by: George Dunlap <george.dunlap@citrix.com>
>
> And if I find it before I finish reviewing the end of the series, we can =
check it in and look at improving the documentation later.

Sounds good, thanks!

-NR

