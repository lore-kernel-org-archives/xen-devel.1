Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3BEF44841
	for <xen-devel@archiver.kernel.org>; Fri, 10 Apr 2026 11:30:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1278791.1563525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBA3z-0007LF-2K; Fri, 10 Apr 2026 11:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278791.1563525; Fri, 10 Apr 2026 11:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBA3y-0007L7-Ux; Fri, 10 Apr 2026 11:30:14 +0000
Received: by outflank-mailman (input) for mailman id 1278791;
 Fri, 10 Apr 2026 11:30:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wBA3y-0007Kx-1I
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:30:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBA3w-00CmGW-Tc
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 13:30:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d8df41-5cb7-0a2a0a5109dd-0a2a4509a49e-18
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 13:30:12 +0200
Received: from [209.85.208.172] (helo=mail-lj1-f172.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d8df44-bf79-0a2a45090019-d155d0acc0b3-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 13:30:12 +0200
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-38dd5f28a4cso16966511fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 04:30:12 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1775820612; cv=none;
        d=google.com; s=arc-20240605;
        b=Vqg0adeastywaMHpoZaJGbYao6nxd4hNPFUZTsSYItNIyiga1D9NStvKNiv/vpXiSj
         gWiRQ/4ivS/EIn3FASrVubdEYGWh2HfTe5Hepsl8GfeghT29wpQ2oxELbS3MsJMJAPRz
         vn6waumH8yGnKuDnSxAsyyGSvxYPZSZk+rBmXYG3VFvAaalZ754UcfAC2QiV2qfrgfP8
         zxdme+E3u6sGHiQAdUE/3W9COMJQxCEOnvHhyfWOb0efEg58CQwoS+gF0DJbkXjtwNXB
         YOFc/YwAh4PZF9yuLS6qQOQrC5hbwiQINg4AlTJRjdR33bJEtFvz4DLnKCuSxTunLC37
         l79Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o8aKtIfyTS7NnNaF2VcHdJIwhnf3j2RavzseU7nAs14=;
        fh=iJqDSrm47fKcrqsUOrnMp/75QLLg5ereb854C+E7XwE=;
        b=GDLRxnWy92x2Dz7BWAH9W9ipEPFs3FGIy6L1RkVHy1T9NHyYr42cFOWqUN6/WVsDGb
         8C8coZbtLwzzU5yYWLxsYQameWUOjtmpFZrOwxRG+poR0GKZt/CRNTr3FXP/bpCeaavq
         SQKE/VrFbfGQCtb8QqZjceHGjLbPwDbzlbtvjubk1dvJ3kHaBRGgTSNoB19IjzchTBTR
         yKTtRwhATO/5a2knxq5AJdqc0vjz8v9maDlMqr/k7kwsX+IlCFvBWaIsWhijaSrF7yQR
         VYZBHEszPNoDnXNRNgigO/NA7yMumueXv2IEUwWQU0uHf0kiEUba3tRXg8/84Awfv3DK
         dt+Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775820612; x=1776425412; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8aKtIfyTS7NnNaF2VcHdJIwhnf3j2RavzseU7nAs14=;
        b=F1y/J9NAIUdpWmlTO+hF05x5RCQgviOl3C98FSssvrf9iNe33aGH+KV4NgGdANQ+Iw
         0hlj93sLIsQ4ICrgXYzawH2CvjMKOxV05KIUGV+T1OloJEJQNPtuAFHaviyJkMlCZROw
         yHF0ZlQuQBOk4qS2wa9FXFuopaXU6C9a7ybG2xtRncek2N+onjAZg6vjXVIf7Z8PH103
         zWKccVA5G3U9U3KsWxInXqGnE4eUhvGeqDYuU9db3kM0l3+ga0EpYUJrxixKmpQhL9YL
         nZ7JVH2TPayc+gGxNwFBfe6tRqePG2dzen7bGj1ioCRsKHnenBg9+IONx9P8byUJZCY7
         2uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775820612; x=1776425412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o8aKtIfyTS7NnNaF2VcHdJIwhnf3j2RavzseU7nAs14=;
        b=VQUCaMnjVOLV9xGU/mUOBOBuoP7Smbx16essCD9aSNKIL32FNX4YPGgFtKc+rA68k5
         khuttRLpmJUSXevz9NBsgsKPmTb8Naex+K2+mlCwVrq9067icRvdYMJAivjP/wL9u8uY
         JIPGPEO2gJ47PE32VEd9AlYAX7LqV3Gg8H9+RiveC7UfpX/M/mC8QbORUdN2eWP0w5Hz
         soUWKzR4ouK2P1arwq6E/QPJ3QDcf04/N5NGFPGRppYmr/EimuCWMX4A2ZoznDjs3/VE
         +yQqnmlmowKP5U8ejvNKpAJLb1bikFwe9c4sXlfwGYiLUj5yF4VzeUC6+jCtqAfAOg02
         sqpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbjJT+ffvL23VrAd/20hd+tHDTsXB9BU7wQojXN0S7YnIWpRNNcs4XiTb1UBlsKYrShdlnZxQqtHU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuO+RGnG2lthtEr41svHJ3f0sa/cWdUCOiVJ/asTK7Ok7rzjMy
	zqMKfpene5DBA+DQAtTpbROr9/JQOoBVH4oNjD7Dc2SRTEdVaVPGLCenPawb1/u3ce6nEjnb/qo
	WKAkmqT3j3g7ueSj3/yTJhC8/wc9lrTc=
X-Gm-Gg: AeBDiesued+RFStT8nzqBdkPyd/UaKY8QamTljavLdEqrPgCqBbwUctUOLjJaCac70p
	CM22Ya30ICW/5BUU0UYkb58JYyuJ/YYOxNcg+tn4wyy0xIxg1EjncBOLDcPIOZTp9yi+PVB+CbG
	FxeqnOopph/RvALtngKmxjRNNMHtJM3KcZt63bhmDybfX3yWspqhSKcBG13RPgJVU9343rECgQl
	km4JflulFwizZEf/2L2xWlfXGOoVxb9SU28AfFWawvJrn5t06dhTXi+QluL70SibRQvreOVUz90
	/X973g==
X-Received: by 2002:a2e:9a0e:0:b0:38d:ea91:f4d7 with SMTP id
 38308e7fff4ca-38e4bf2d161mr8991291fa.25.1775820611690; Fri, 10 Apr 2026
 04:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <dba15db692025c75f8bd3a2c5dab2654eaa4e896.1775801199.git.mykola_kvach@epam.com>
 <0c68ca5e-51d3-42ee-aa27-301ffafefc5f@suse.com>
In-Reply-To: <0c68ca5e-51d3-42ee-aa27-301ffafefc5f@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 10 Apr 2026 14:30:00 +0300
X-Gm-Features: AQROBzAqb3s0urNnGDGKB9WoQ_CZeDMbi7wFJPMGzOUuCb32gCBjOYHWMGQEUE0
Message-ID: <CAGeoDV8OAiZL6d8+qs6T8bRT++H-tpY--8yhb7He1bMgVvHeUg@mail.gmail.com>
Subject: Re: [PATCH] arm/its: Decode BASER cacheability field before comparing
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1775820612-2E155152-0D8F84F7/0/0
X-purgate-type: clean
X-purgate-size: 1147

On Fri, Apr 10, 2026 at 9:40=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 10.04.2026 08:09, Mykola Kvach wrote:
> > --- a/xen/arch/arm/gic-v3-its.c
> > +++ b/xen/arch/arm/gic-v3-its.c
> > @@ -496,7 +496,8 @@ retry:
> >          }
> >          attr =3D regc & BASER_ATTR_MASK;
> >      }
> > -    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <=3D GIC_BASER_CA=
CHE_nC )
> > +    if ( ((regc & GITS_BASER_INNER_CACHEABILITY_MASK) >>
> > +          GITS_BASER_INNER_CACHEABILITY_SHIFT) <=3D GIC_BASER_CACHE_nC=
 )
>
> Are you aware of MASK_EXTR()? This is one of the cases that we have it fo=
r.
> Really all *_SHIFT constants should be purged, as they can be calculated
> from their *_MASK counterparts (leveraging MASK_{EXTR,INSR}() to keep the
> code readable).
>
> Further, doesn't gicv3_lpi_set_proptable() have the same issue with
> GICR_PROPBASER_INNER_CACHEABILITY_MASK?

Is it acceptable to include Fixes tags for two different commits in
a single patch, or would it be better to split it? Both issues are
logically identical, just in different functions.


Best regards,
Mykola

>
> Jan

