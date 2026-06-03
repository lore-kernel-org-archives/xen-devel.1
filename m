Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E25CD6E55
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2026 05:56:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1325632.1590933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUeao-0002dJ-Uy; Wed, 03 Jun 2026 05:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325632.1590933; Wed, 03 Jun 2026 05:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUeao-0002dC-R3; Wed, 03 Jun 2026 05:56:42 +0000
Received: by outflank-mailman (input) for mailman id 1325632;
 Wed, 03 Jun 2026 05:56:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wUeam-0002cv-QU
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 05:56:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUeam-005jge-7A
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 07:56:40 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1fc213-2eae-0a2a0a5409dd-0a2a4506a04a-2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 07:56:40 +0200
Received: from [209.85.208.182] (helo=mail-lj1-f182.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1fc217-7371-0a2a45060019-d155d0b6b92a-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 07:56:40 +0200
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-39677c80386so38496601fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 22:56:40 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780466199; cv=none;
        d=google.com; s=arc-20240605;
        b=SySGmzCeO9NVSW5osx+mrbeClHeHczGp3Wdv25n9DVmZIr6atVmT1wzjtB1FaUbHfA
         SnvJb6QURbOdb+dw0R/v/4ShlGS2Uy5vGbNt18EfQeziU8LFbjjs6R3PD8AgZYq7iAMI
         8AARdnQBDpvqHX0bKiZrvaTJZu+k8qSOP3qry9Um/hC4M+C8QRJCbxe5QA2vzXaTka1q
         2PByIr4LIctGMysxEF8/bmgGmJ3U24gA62WOsRGtdJFtJBVJo3TbF63qSxbJJVuzGz4r
         d2GNHGRlUdFRM7Hq4P3piQt5Bqh9c8wdP+WJ1f++q6Ip4IT1m6XXXwfTVb3rdBjQR3If
         ZlmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QJsA3hNz+HCuhdRc6PMUcY2k6K+YaAI45jWEO2782fc=;
        fh=URHEk7klKxjqc5bXwxtPgt12zwbJaOVjsCphaVnE7cw=;
        b=F9nW/GEleuTeNxsUnCa0vPeP4tklLpGF19LFg31LWomvdP+2uopVom30tOqnRq0YW0
         w+MvF7/QXVpjeeATmRya8lH6jf0vr0XRgEeUeAOYZEnUa3otA09c86+D/GeTBtElJ24Y
         nBh6ti6HEVhahYCXh20PM347fwRNvYZsMvtTY4T/TCo7Ov00beifswJS0f+qsYP+p/Gg
         PeB/PjjAxETTUnd5u8qCOTEnO1RlTX8HdMNYRsSKEyxrbpVeI6XjQiESIqsWGwqN+3XV
         qXXYZEQ0YJiO4iVXyGfNkzFFucGWGLOs71GIKa+28B8blCuGTeufgjL/ZKIx4XRRJMmy
         d/gA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780466199; x=1781070999; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJsA3hNz+HCuhdRc6PMUcY2k6K+YaAI45jWEO2782fc=;
        b=gjUw6/B/fsmtjvAw0VPRFP96oy1FudFtBnPU0xdSBxLm2eeOzTcgszqIJgEPsI71r2
         uaSlZFkW2wlVTco4Mp7P+RVB3rdFeT8GArLsvzwpQaOkub6L8Dv6Z2NIFj6W0HXp8CBq
         MZNG7pigWiITaihycsHjg0bc72DicYhDwih9lDx9BHh81Lnr10kqpvOOtvzzeKiY+GGT
         JoQMTxie5IM/gwpoBOCX30IVhElhx0VDFgVT4B8yTkKSczTd5oLXMd99085T+ydopgEn
         sdYzrCXVumJQM1CXsyq+wWrm9LMPuW/7I8hGej+3HhTa15MikkXlTCZuNqGEHy2rXkal
         5mvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780466199; x=1781070999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QJsA3hNz+HCuhdRc6PMUcY2k6K+YaAI45jWEO2782fc=;
        b=UGdDGZD/W4ZgCFm6RqG88Mm4mnbTOUnKjGzM7wrERPSaVnzZ6AbRCXMx7/ClWFGuhE
         pJM8/20GB+TxJt3Wj9WUzo4pHOEX425wCNVq+Fg5o/xbgz1dS0pVxKgDJPFRGxeEXVx5
         4TxA8f44pWKHhPfr/sJpgx5w+jEXmAU+djmFoqUkEqhXYNUUfqUvPYsQQayKjdr4kc+g
         WMa2phiMCw/B4vg+J2jCmmWD5M7+9MycR3Zagd2Stj4K1crx1FHLmaefOWiqTMRliJsF
         FmV8zU07ud2QZxETuu5w1YbDHlP0TkkpU5mlb4wsWSR15rf8lyBWrgCeAW24yIDy5eOW
         XstA==
X-Gm-Message-State: AOJu0Yzby5bpLTKs2WEAH56qfFyzbZELQ//GUE08kckc0JlOJ+XfXkQ6
	Is115Wk9R/eECCt15+dBWAEsEDR+TI8+kpeZQmOrg2XzgRRHGenEKl8iR+TBXW6L+OIyghyOvuy
	HKdyxVF2zEPI0XOJssP645ApRAAkRshQ=
X-Gm-Gg: Acq92OE1gR+tsA1FZqmQvkTD5P3mBbU5djXy1/jrGvcP0G0nvitF3VTT+gYsjPKNw9/
	KahIUC23FV55nS8mdrhbe1sABP2w87tUR1RQsQ+nZmqlipgVkdM/VNi4frVAa4iAQpNphOlzeO7
	HeC5nO3tIpc1s5Xd4ZUmhO4Ny+9LSEu8zr7SJbyOqMH8OqRoKBMdyg3c02emn/PPv26DyHlqsrv
	VjNpe/vBICi//oSr62p4HrPSUbbD92eIBqmeFU0KITJhAp9LaUmZzCtstE4mJqcsHXRSqqYDnEi
	Enm1G/1yUm6NAfDA
X-Received: by 2002:a05:651c:1551:b0:396:954c:3536 with SMTP id
 38308e7fff4ca-396af4d432fmr4895711fa.28.1780466199252; Tue, 02 Jun 2026
 22:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1779385072.git.mykola_kvach@epam.com> <95930674d4639727b9cdf4f52b4a23b6df60c3c4.1779385072.git.mykola_kvach@epam.com>
 <E775FD70-C4FB-41BD-AE73-BA6383148546@arm.com>
In-Reply-To: <E775FD70-C4FB-41BD-AE73-BA6383148546@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 3 Jun 2026 08:56:28 +0300
X-Gm-Features: AVHnY4K4THbefPTmyjh1XfUFgh9DzJenSxjuVWbOgJVw7Ji8S0OUIstS3mHqlKU
Message-ID: <CAGeoDV8FFtayxYsNAhf_NeG6234-uU7dTPg+je91NrWJ+JCHbA@mail.gmail.com>
Subject: Re: [PATCH v10 05/13] xen/arm: gic-v3: add ITS suspend/resume support
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1780466200-86F73D75-8A1D90F7/0/0
X-purgate-type: clean
X-purgate-size: 2188

Hi Luca,

Thank you for the review.

On Thu, May 28, 2026 at 9:12=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +int gicv3_its_suspend(void)
> > +{
> > +    struct host_its *its;
> > +    int ret;
> > +
> > +    list_for_each_entry( its, &host_its_list, entry )
> > +    {
> > +        unsigned int i;
> > +        void __iomem *base =3D its->its_base;
> > +
> > +        /*
> > +         * By the time Xen reaches gic_suspend(), every domain is alre=
ady in
> > +         * SHUTDOWN_suspend, so ITS-targeting interrupt sources are ex=
pected
> > +         * to have been quiesced by the owning OS before SYSTEM_SUSPEN=
D.
> > +         */
> > +        /* Preserve saved GITS_CTLR state, excluding read-only QUIESCE=
NT. */
> > +        its->suspend_ctx.ctlr =3D readl_relaxed(base + GITS_CTLR) &
> > +                                ~GITS_CTLR_QUIESCENT;
> > +        ret =3D gicv3_disable_its(its);
> > +        if ( ret )
> > +        {
> > +            writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
>
> This is writing enable from 0 to 1, while quiescent is still 0, which is =
unpredictable,
> however it=E2=80=99s the same happening on Linux, so I would leave it to =
the maintainer preference.

I think you are right, thanks for spotting this.

After gicv3_disable_its() times out, the ITS has already had
GITS_CTLR.Enabled cleared, but GITS_CTLR.Quiescent is still 0. Writing back
the saved CTLR may set Enabled from 0 to 1 while Quiescent is 0, which is
UNPREDICTABLE according to the spec.

So restoring GITS_CTLR in this error path does not look safe. We could exte=
nd
the quiesce timeout if the current 100ms is considered too short, but once =
the
wait has failed there is no architecturally safe way to restore the ITS sta=
te.
In that case I think the suspend path should panic.

This would also let us drop the reverse rollback loop from this patch. The
definition of list_for_each_entry_continue_reverse() can then be moved to t=
he
later SMMUv3 patch, where it is still needed.

What do you think?

Best regards,
Mykola

