Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF96F9EDF6
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2026 15:01:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1290754.1570262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFZ55-0001yg-15; Wed, 22 Apr 2026 15:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290754.1570262; Wed, 22 Apr 2026 15:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFZ54-0001yZ-UJ; Wed, 22 Apr 2026 15:01:34 +0000
Received: by outflank-mailman (input) for mailman id 1290754;
 Wed, 22 Apr 2026 15:01:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wFZ53-0001yT-44
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:01:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFZ52-007ecC-Gq
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 17:01:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69e8e2c0-bab6-0a2a0a5309dd-0a2a450b8da4-36
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 17:01:32 +0200
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69e8e2cc-212f-0a2a450b0019-d155d0b2c82a-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 17:01:32 +0200
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-38e936caafeso55385951fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 08:01:32 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1776870092; cv=none;
        d=google.com; s=arc-20240605;
        b=iPahnxZM8rOR/7LbiUb25qA1gc4xYf4IppJjdmKBybZ3npO93ZeZ6eAdfURLbvcV36
         SFD2+20na4QTRZp/p7AoAas1MMb/I7ERBv20blRyOKyDl/JDjgcvT1YKQ2efpWV7uZ5K
         kTmigdab6TviJpjjukV7qNPaDF1vlATbR8qxDAyDXjYpoJMEVfSFCtjPmm/ilRaTMe0u
         4BqdSOOaldmk9JWIIQ/1q+nZ6BfJ3unXzShc41wWy1qReLP7wWVMx8vlzGz6G1hYsH+S
         mWP8AGdjjVoang76fYolSGuxxvE0QjSSiaJ+6q+L4HQztVPhxwJdOPoP6Aw4gpCm2dzZ
         qvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tjg9IwgC3tR3fMbuIgriuAtu056atsUqX2gwrY6GQYM=;
        fh=zL8KVAj6rSaYbk/102rEWeOa69wm5cw+i9nXMzeM8z8=;
        b=TSGl+xxy84oXPrrtLMHTKkw+wYWycUgCWicBxVcEQXIC2Y5pRhkBaF9URvS6HDC6zF
         7R+yoSYb8KEjyWPdefk4FRPfXOAS7YKBCbfmbS7ICzWCvIEmh7qA/kg8rSBcOAemIQud
         aSe/MmTEpMzUvDqXNkLufrBzdomwoMYJKlmeVvML4ImA5p8jU8UsuxuNkbyMTFLg0xDT
         0uc6xDjgJ38omkdVV7yAddAYI+H1QSvDj9KnMBWlr5q8fvXhqqdylqOep3dkSmqhe2z9
         3E1cFSsB4gxODRdn65lq3LDk1hhfzrsY+teO69JjamUaVYm4UZnQeo86GMY/4/lyv/Ps
         tzdg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776870092; x=1777474892; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjg9IwgC3tR3fMbuIgriuAtu056atsUqX2gwrY6GQYM=;
        b=mA0hEFAZcSVLPQADne2yx/4N4hjGb5gmgAqRk2ztZAr+gkJUiwHD52ernfJ+H5VqIS
         tDck30lWCRm+pIH5+qxc/SLvK312hSygkxww3SWmobU9sL61/iUS/J9FnO0v/L4Ixd1e
         tD2wjiITLCJ/MYMJbjmySvBb/SdemQNsQ8+cqzgn5cAbxnuxnTvdNHfXHAWp1rKsY/b3
         uR2sefLeXDKE44G/nSweMm8ue04gXwPzWlXCrjAnmGQ4iTtCxGkAPWW7gkkkdiO/3xnJ
         tcSnJN42VwZVdGS2aImonXXoyn5fjM+QmNfq0v+jNPG43HWJvTbv2p+EMdo20xalqUGu
         sHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776870092; x=1777474892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjg9IwgC3tR3fMbuIgriuAtu056atsUqX2gwrY6GQYM=;
        b=eIvnFW63hm3Er8HoS1Ht694sNr64ZV66tEJOJ+FahPYojCv/LecB9JG0qhRxlmmuLn
         /cD65DE83Cn1rH7Qkw4L37up+ETTyQIpvlEu9QEZzn8ArejleserzF8gIqch6ymk9YTY
         It/+6GkpWwVzOm9xqf/2iHzYXGVyeqhaPD4wrGiTZqGCvDWKndk6YYNzjq23PKJfbDvX
         uDZztbfVDgLb84Jdkt/asKeiL+s+krcBGokde51jP8/5t+s1J5kr7HOnRDngjKgGU3+W
         6a8cSC2Hn8cUJVY8fJ7MdSxMd26aDo0wh6d9p5K2VPxgKCcRwK023Lli/rGlcaISCLlJ
         DyUg==
X-Gm-Message-State: AOJu0Yz4nwTe8bIE8KiYyoQqSBnKSQYVycBk/v6dVw9i85/vHcojrelx
	dkscSZcJe+gq7l7/8stHj3nxEnLy9GhAnK8X+Quc++RcCssuBTAsYmyjD77b84t/ZN3QA5QxWa7
	LLgpdlSL+U+79nV3glrxvKtKUns9mj8c=
X-Gm-Gg: AeBDieuNDiCxaCbnb2PZloCpN2IBu87A5jCcCzyasQWKsruKfS3EGAlAUy39WsYOff3
	SIwuIHt9BIDL1E11UmSq3MCb/UC6fHc0Asv7B9A5DQFoqbXO0B/JVMWFV6kJC9nUqM4ZScMj+cQ
	BfaBT2IMkzh6XFY3WlM446JRXIn8MBTT4F+YxI9sN0FK7n+dIQ6RX8hPvZFMKBD25t+xqylAmtV
	ehVsz1vWqyOGq+fbXrbseiW/ohJXjBSu9HPn8H9afb+EFZ20DBPCYTkz1F1kWm9ZLqr3y/Ov6Cm
	KglzJKlupIDGG5BA
X-Received: by 2002:a2e:320b:0:b0:38b:dbcf:a29f with SMTP id
 38308e7fff4ca-38ec7b4c6eemr57495811fa.28.1776870091164; Wed, 22 Apr 2026
 08:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <459cf46204e86ed3a2ffd79ae649b1a2051f5204.1775812563.git.mykola_kvach@epam.com>
 <c30e0162-aea4-41fe-a077-cb7c6e6b4d33@amd.com>
In-Reply-To: <c30e0162-aea4-41fe-a077-cb7c6e6b4d33@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 22 Apr 2026 18:00:00 +0300
X-Gm-Features: AQROBzD7bgypQk-e0GQKP_KOPKEgD-zypoZyZJU9-IiXfPHN04O4Kyn5ASiX8NY
Message-ID: <CAGeoDV9hQrpTdOUQPOx2a+T_6TF=g0DOeeDpzZghgceRFMRvMA@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: gic-v2: disable interrupt bypass on CPU shutdown
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1776870092-24CB8F3B-BDF2C1CA/0/0
X-purgate-type: clean
X-purgate-size: 2165

Hi Michal,

Thank you for the review.

On Mon, Apr 20, 2026 at 11:38=E2=80=AFAM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
> Hmm, this landed in my junk folder.
>
> On 10/04/2026 11:36, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > The GICv2 CPU shutdown path currently writes 0 to GICC_CTLR.
> >
> > Per IHI0048B.b section 2.3.1, clearing IRQBypDisGrp{0,1} and
> > FIQBypDisGrp{0,1} selects bypass rather than deasserted interrupt
> > outputs when the CPU interface stops driving them. Tables 2-2 and 2-3
> > show that a zeroed GICC_CTLR can fall back to the legacy IRQ/FIQ inputs
> > instead of fully disabling the interface.
> >
> > Fix this by reading GICC_CTLR, setting the bypass-disable bits, and
> > clearing both group-enable bits before writing the value back. Keep the
> > existing GICC_CTL_ENABLE definition for the init path and use a separat=
e
> > mask for the shutdown-side group-enable handling.
> IIUC we don't need to worry about not setting the bypass-disable bits in =
cpu
> init (we only set group 0 and EOI) because they are relevant only when th=
e bit 0
> is disabled i.e. the path this patch changes?

Yes, that is my understanding as well.

In cpu_init(), Xen enables the CPU interface by programming
GICC_CTL_ENABLE | GICC_CTL_EOI. In that state, the GIC CPU interface
drives the interrupt outputs, so leaving the bypass-disable bits clear
does not cause fallback to the legacy bypass path.

The issue is specific to cpu_disable(): once the group-enable bits are
cleared, leaving the bypass-disable bits clear can select the legacy
IRQ/FIQ bypass inputs instead of fully deasserting the outputs.

>
> >
> > Section 2.3.2 also states that wakeup event signals remain available
> > even when both GIC interrupt signaling and interrupt bypass are
> > disabled, so disabling bypass does not break the power-management use
> > case, i.e. suspend modes.
> >
> > Fixes: 5e40a1b4351e ("arm: SMP CPU shutdown")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>
> ~Michal
>

Best regards,
Mykola

