Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A6BC4450E
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 11:29:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363827.1615323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkKGn-0001TD-1o; Thu, 16 Jul 2026 11:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363827.1615323; Thu, 16 Jul 2026 11:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkKGm-0001T6-V3; Thu, 16 Jul 2026 11:28:48 +0000
Received: by outflank-mailman (input) for mailman id 1363827;
 Thu, 16 Jul 2026 11:28:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wkKGm-0001T0-4Q
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 11:28:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkKGi-00GUxG-W9
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 13:28:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a58c067-5cb7-0a2a0a5109dd-0a2a450ba9c2-14
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 13:28:44 +0200
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a58c06c-b7e8-0a2a450b0019-d155d0b2d018-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 13:28:44 +0200
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-39b3931e259so59382651fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 04:28:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1784201324; cv=none;
        d=google.com; s=arc-20260327;
        b=BZUx6XkU04VmThIOfVZM5W7R9M65muLoVbaWBcqMtUbYmRfDabxe8xY+2kOC1HlM5g
         At8aZb0Ig0giHF6Ge7SVqKELJbWQpSs4QsJXKm4WRMK+W8xnYUHpJTuEAOcgCIaS1pMw
         sRpacR1iyiOKXrZ7/yKoq6xf0ISfIVvXnjLk26/gyDZ3Egf+MLykftFkNcq9+Kxk7VOv
         wDfeDiOFvTCl9/s4h5R+p5QxOBcn32UJaUYU53TzkoMr4sdBRmCtSwZGPTXlYHOEz+cn
         9PiYQNeZX7zpmIzn88aXjJt6TWKj/2ugGoKbXL/xfF9ffU/MVVZWY1kN1U3Rl+rR9h4g
         8BPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V7ZKFbw8uxcrmZnViyuHl7eXWjhdx7bps3bPsLvk2FM=;
        fh=s0jj9NCQJCHGxRSqYVs1l7k0YfT1hsJTj4jfEvIV2eg=;
        b=UmVieUGZkfMUJ7q3Zi9347VXJg3LkVzQL/TMAIns4fbFDHaj9vn2dAuJaV7Pm4yZsf
         d1A3bRVge/SiPi+l6U73RDSUhm3IU6ZTmaJBZZ9fqaol0MS7UT/i9qFYOVLrA9CIZv8S
         n0nWrFUywCWfNvPnNxVbMfKuUZ5IRW6ZavXCKYJI5vUnIJvSfI+1yYU/MNWT9h2foaTq
         Ok9YUr9l5LGdZMmpHqa0j7m6BFY+mWnl7fMJDB3OfIPyh1vH9B2hYfE+TOjPC9QPNhBm
         xLu0qjw+Q4mLoAES4rKUHdlhVsKW2JDMSbcGr7AhH6gTPJmIYmeYl0TlItIJZTuAb10J
         uG6Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784201324; x=1784806124; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V7ZKFbw8uxcrmZnViyuHl7eXWjhdx7bps3bPsLvk2FM=;
        b=n5A18cSjR72+kkB1Av6cwtGroJInHAQgsJDgrjGGHHWWTCgna596ASp+D7ywU1xWhF
         Epzc+MQbXkQfd9rodQijAKqGjxZ7+oFlvRVK3x794wTwVNDx3upnSZtUjO+HH+RkGQK3
         6Ls4RWshtBBpP3WT376pYjFNaTHwR1+wcQ25CKTS7Ucb7qrihZ591IdzT4nlG5zFwdNb
         tybakKbRH2N5iH+NviStNan66ZE8BC+EA23CmCJT/Atu++XxVXNS2OiMGwZrwY3tusUB
         DWPbk05H6XrhGmbDXEwuWhgvVuL3SEkxO9nbdkOxQks9vIJUERb4K2NHrSEx25g2Ez9e
         ocDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201324; x=1784806124;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7ZKFbw8uxcrmZnViyuHl7eXWjhdx7bps3bPsLvk2FM=;
        b=cjaJ+KFrMDpxCYHdCU0nX5eeobobsv8YjzbTTVWmTWiI6Kr8crSMXn50vCm1Sfnei5
         3LjfgajU+HcdY7mQdRSp/IjwQPGSeGqv0KCKXIdWpTRLBd6iFu+Ew+talO+Hh1tlcjpG
         GlV2KxmbSzErwmvaXmKKGYEZLqeuiJ9clK4nweQ9ioN3FDyrrJmJEdSqkxWlFg21OMLI
         6h5yddDyZ5qaIs0i/WU9xRHSUuHNjTgM5IarKoHc9JfY3ZSFZexpV2vPO6Stk7hWZ8HR
         wuVyN5sOP4ePl6UVAQUsRB2pEaIoyKB5Yrmlbkw6KDNPQjkUVTpbv3q+8/kNUtCws/NO
         HRVA==
X-Gm-Message-State: AOJu0Yx5TlxZwQlAK/XtDe9jgv54vOG8Z8Kpm/ovFpnJVZ9ShZuwDPI8
	ehdxjWLOAdB0b7b+ICjK5pJ4iowmS7s4p+IGDhLIW+AcVx12TL2ZkmfRNx2qSxpAOQvvcBB2vjl
	as55y6sAO95M2UQvQgSryWWh6REqXHhA=
X-Gm-Gg: AfdE7cki5nzMw9l2Kc+Vs5+kg1HbenJh5Wf4HmROAzBAXM5XOnQNZyGuMrJih9pA3ZS
	RCcyBPkIiiMYrFA1wz0zTEbp3ZnsD9Ew/XUQBxuOEIUrtxwtCaXzk1kE53rzP8HXtHzKRtlf4B1
	1zOIW4zbkuYUTQm4snLlEMGJ5XkIng32UELu0EPSa3NQnYeKmXuDYJBWXwbh9PdqmVCiJlma7N9
	1QRY+6P4w/DxS429vUEgOMNU/76PQizezq1nCQk2RwCsKJkwOrfrOBPwv8V90wEeYB+cg==
X-Received: by 2002:a05:6512:1443:20b0:5ae:ba2b:b469 with SMTP id
 2adb3069b0e04-5b15d77a4acmr1004345e87.18.1784201323823; Thu, 16 Jul 2026
 04:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783671887.git.mykola_kvach@epam.com> <1843da2e028635773638ef73ed10907c7ae7bb53.1783671887.git.mykola_kvach@epam.com>
 <e6468083-f901-4a1e-94d5-d347068fabf0@amd.com> <5gpmoe7cng53rxtxmldvjwe3dnbenoji6anyqy4uxado354hfp@tkdo7pmufaor>
 <6b345ba2-d31d-4317-ab79-aa64267ab283@amd.com>
In-Reply-To: <6b345ba2-d31d-4317-ab79-aa64267ab283@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 16 Jul 2026 14:28:32 +0300
X-Gm-Features: AUfX_mw8ig9CRbREisb6OFReR4e1u920bGTmV8k0u7OMDPb_-AoJ8Jx3DA8GBMg
Message-ID: <CAGeoDV8OMG2gGd4mvsnqjwuq=7OJFzFpg_vxw0j88J3Lb5QF6w@mail.gmail.com>
Subject: Re: [PATCH for-4.22 1/2] xen/arm: validate IRQs before descriptor lookup
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1784201324-19CC79EA-892EDE9E/0/0
X-purgate-type: clean
X-purgate-size: 3591

On Thu, Jul 16, 2026 at 12:20=E2=80=AFPM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
>
>
> On 10-Jul-26 13:14, Mykola Kvach wrote:
> > Hi Michal,
> >
> > Thank you for the review.
> >
> > On Fri, Jul 10, 2026 at 12:10:50PM +0200, Orzel, Michal wrote:
> >>
> >>
> >> On 10-Jul-26 10:31, Mykola Kvach wrote:
> >>> With GICv3 eSPI support, nr_irqs covers the architectural INTID
> >>> namespace up to ESPI_MAX_INTID. That namespace is not backed by a
> >>> single dense irq_desc[] array: regular SPIs use irq_desc[], eSPIs use
> >>> espi_desc[], and the INTIDs in between must not be treated as
> >>> descriptor indices.
> >>>
> >>> A firmware-provided interrupt in the sparse range can therefore pass
> >>> checks based only on nr_irqs and reach irq_to_desc().
> >> What are the possible consequences? You should explain it in the commi=
t msg.
> >> Also, what is your criteria behind protecting irq_to_desc()? There are=
 other
> >> places, where we have unprotected irq_to_desc(). Last but not least I =
think we
> >> should have an ASSERT in __irq_to_desc() to prevent the indexing failu=
re if we
> >> end up there with a sparse IRQ accidentally.
> >
> > I reproduced this on FVP by adding a fake DT interrupt with reserved
> > INTID 3000. This was deliberately malformed fault injection. The only
> > architecturally allocated interrupt class in the 1024-4095 gap is ePPI,
> > which Xen does not currently support. The resulting out-of-bounds acces=
s
> > to irq_desc[] may corrupt Xen memory or crash the hypervisor.
> >
> > There is also a non-synthetic case with CONFIG_GICV3_ESPI=3Dn. An
> > architecturally valid eSPI described in DT reaches:
> >
> >     platform_get_irq() -> irq_set_type() -> irq_set_spi_type()
> >
> > Previously, irq_to_desc() was called before validation, while no
> > espi_desc[] was compiled in. Moving the lookup after gic_is_spi() makes
> > Xen reject the interrupt with -EINVAL instead.
> It does not make much sense to me that is_espi() is protected in
> __irq_to_desc(). I know this is because there is no espi_to_desc() if eSP=
I is
> compiled out but providing a stub is easy. This causes the useful ASSERT =
inside
> it to be unreachable. If is_espi() was meant to be called only under #ifd=
ef, it
> would not have the ASSERT and would not include #ifdef inside it. If we a=
llowed
> for that ASSERT, then ...
>
> >
> > My criterion is to validate externally supplied IRQs at entry points
> > which can return an error. The remaining callers use fixed,
> > GIC-reported, or previously validated IRQs.
> >
> > I will also add:
> >
> >     ASSERT(irq < NR_IRQS);
> ... we would not need this one (the eSPI would also be more meaningful).
>
> Given that we postponed the release, I'd be ok to take this series in,
> provided it's in a correct shape.

Thanks, I understand the intended split now.

I will call is_espi() unconditionally and add an espi_to_desc() stub for
the non-eSPI build, so the assertion inside is_espi() remains reachable.

I also agree that externally supplied IRQs should be rejected at fallible
entry points rather than relying on an assertion in __irq_to_desc().

The assertion in is_espi() only catches the configured-out eSPI range; it
does not cover the sparse 1024..4095 gap. Therefore, before dropping
ASSERT(irq < NR_IRQS), I will verify that every externally supplied path
which can reach irq_to_desc() rejects that gap. The remaining internal
callers should then satisfy the descriptor-backed IRQ invariant.

Best regards,
Mykola

