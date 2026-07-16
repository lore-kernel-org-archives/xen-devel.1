Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5F1C4450A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 14:32:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364183.1615512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkN8X-0001nK-AV; Thu, 16 Jul 2026 14:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364183.1615512; Thu, 16 Jul 2026 14:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkN8X-0001nD-7f; Thu, 16 Jul 2026 14:32:29 +0000
Received: by outflank-mailman (input) for mailman id 1364183;
 Thu, 16 Jul 2026 14:32:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wkN8V-0001mw-ND
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 14:32:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkN8V-006cVc-3W
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 16:32:27 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a58eb6e-bab6-0a2a0a5309dd-0a2a4504bf1a-34
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:32:27 +0200
Received: from [209.85.208.181] (helo=mail-lj1-f181.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a58eb7a-b57f-0a2a45040019-d155d0b5dc37-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:32:26 +0200
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-3997a448ecbso34034761fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 07:32:26 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1784212346; cv=none;
        d=google.com; s=arc-20260327;
        b=GCjp4kvx6Hsw03fL5mR6yw+BrAwxl3oivOJji1u5t5gc34rOpGebk0dx3hF37H+y+Z
         wIZ6Z6Z4b1PFfcrBTVGbPEW5bNbr6dsOgPZfPdslUE73M2xnMjbCb3SKj0itbcZIGS3X
         ID1bPEXnid/JmYetIVdo4DD7faY0B7Wk8A66ZI2EkcM/6YfMCM1DrNA1wGUMQ855y55r
         nYcrFxpUAwBk9eXy16zeV5wuk8uqLx7lfNq/YMdBHsl/bn4aeBNrBFub6uAzX16WN1cW
         oyO+MYBqJ9QI2dusRuoUt5AigAp3dMBwHdWaKqMpueiF+/h+VT/O/ySq+aDo/rsI3ukI
         8EiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qGDa6+1+DnJbq2R2aFaIL9WLM4kgzQ9gt/HFwnLQRb0=;
        fh=CbXQhWZTwQlH/OH1p55PYIW1twR7jST5umoJ4C4PE6c=;
        b=hPPr0WrD2i2NXnjXL2VT00bBDJslqIz7kL0pz1hEpTdXkN/ZsCkx1CNsgvQbnwnD6H
         v5LaVkn+4mEH9Ol4RlOZaM/qx/+nPmqADZHZkPS8fYPWdYiQFIR442uUo1YfT1vlxGKZ
         g1IKx/gbJLQjvpaKbCfxB07kcq2hxf72wLx2J58xg5o2rPbwfjJHZmAl707usiacL7ZU
         0nEtVv1RC4EcAfvBu0oYonC4cOXRW7pevz7rKvJLqDU45MzPVUtV26UkPw0UUWrZ8lp+
         7VVzD39YOQqOrba0rPcXFiijFOL8DWrHJGJaJdjySaGV2GoYGuKPkfwvt56VSLm9pCcp
         XAaA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784212346; x=1784817146; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qGDa6+1+DnJbq2R2aFaIL9WLM4kgzQ9gt/HFwnLQRb0=;
        b=d0JlO4yObyD2krgeMwrLkZcnafNNF8ikPs8E/t6iCal5bjZnQpf6Ynf4zBrPvcXJ5q
         PZgODuB2yFUWXlG2x61MNrjRq4fUssB3BKKJqZMgy1BB3u3TPXy64gJusyVWR8UK38m6
         qOHSBVcfw+pn1a3K60nTEfEEzVHZCeuuZNHuBcMDAF6Vt0AM4qrEQE/udhX3EmeNpAVf
         K4QRgpkXzko2PDXrzHNFcZKeSzUn+RHteHD9mJoQbtHKGvPWVL7/UXsJ1WT7LQv6R0CZ
         VgUMj0zhZuHkg/FTZ5Mq4w7uZAyN2JdeZucA2Y1fF8m2z8mol1MWcISn3ln9Tw0jUbZ3
         WR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212346; x=1784817146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGDa6+1+DnJbq2R2aFaIL9WLM4kgzQ9gt/HFwnLQRb0=;
        b=YHwCEK6b+YFAnodhczZKceDa4wJufz+3c1e1vQLMx6GuZ3Uky2zFLhHwXPgZ+G9Rqu
         Oq4MxIXuOqZ5fCxhpPTnYwPt0KY6kyZ8ENAjKTb0dtQ/Hpc94FcpL1F5P26NVpfanO9K
         m3fgG0S0u2bXxNxycrXS5cjMbUTvBafyQve6iP8RUd3pUImvmKFeTOPYerkvYkoDfUDn
         otpMZpvUd/Y+spIunW1XDOKU9hI/Y702XfTtUEIv5xFfvwUwpFvZE47B6VPjtBPcKaWo
         AHr1G5uxvmnzHINHwsN63XAtGrTUS/q4nX7GJS5wdw3X8/5fUeqid25zHUcXYSuxf4Hy
         pzSw==
X-Forwarded-Encrypted: i=1; AHgh+RoAHDlps33yfxmd2GeGWDIKkYgYj4qnAeKF40PVc2AiFrceMSgNKSCMJlHtJB4GFEIx5csT9p8KOEA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAzHaDUfGb80Po2e69Cu2udGCDxR11wyE53sBS7W3m53XYzuvh
	mkbcPGIwjg3tImbey82z9Jm7kqtj2Fji+jfqlCa7Gnr1pEHZcHuEZEEi4kcCLGKrxjbE+NeKPWY
	VW/236ISPKCyMm3nFEwhCpNmhnEimkd8=
X-Gm-Gg: AfdE7cmmQaZDSLs8TuCnpsXOn2Q2T4hJVUj7ZAamiMyiuQt926wjwNx+LNyRq1cQGZ+
	XrpzQIS8n/vF4sTrH/m4OWyzJStpUYblxuiiW3nAeo8AA72jsOxmwajcM2sl9fdas++SMYnyA6+
	rNgyUUSrMjZB2PEkKxdX9nvJVqqHWsbkjBqGQewMrt59HFMiQgbzuSJJrA9E7BDhgoqMfchyv93
	KZezDGyrYJ/h/3q88Qk47GyTkx2QLOxssGuPZsp+TvmcC35eihNrF0IvaM=
X-Received: by 2002:a05:651c:1687:b0:39b:53f:bf61 with SMTP id
 38308e7fff4ca-39caa872522mr31951941fa.20.1784212345939; Thu, 16 Jul 2026
 07:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783671887.git.mykola_kvach@epam.com> <6d279de6db90c7e8b76fb4da93b8e451a9cf9874.1783671887.git.mykola_kvach@epam.com>
 <134609d4-507d-4485-87b2-c59e2c498f45@amd.com>
In-Reply-To: <134609d4-507d-4485-87b2-c59e2c498f45@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 16 Jul 2026 17:32:14 +0300
X-Gm-Features: AUfX_mwKwFQ9znUugh-KowBIgSJr7Ub6Y8OH8e2FeWYLoQh3qyholTcrHHdL3Ts
Message-ID: <CAGeoDV8V4D7NGYv9cHK=4mqefYiqQtB75B7QP1DUc7k78-tpQA@mail.gmail.com>
Subject: Re: [PATCH for-4.22 2/2] xen/arm: vgic: free eSPIs using the bitmap index
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1784212347-526CAB50-A106B3CC/0/0
X-purgate-type: clean
X-purgate-size: 1733

On Thu, Jul 16, 2026 at 3:03=E2=80=AFPM Orzel, Michal <michal.orzel@amd.com=
> wrote:
>
>
>
> On 10-Jul-26 10:31, Mykola Kvach wrote:
> > Classic vGIC stores eSPIs in allocated_irqs after the regular virtual
> > interrupts. vgic_reserve_virq() therefore translates an eSPI INTID to a
> > compressed bitmap index before test_and_set_bit().
> >
> > vgic_free_virq() still used the raw virtual INTID. Freeing INTID 4096
> > would clear bit 4096 instead of the first eSPI allocation bit, which is
> > outside allocated_irqs for a domain with eSPI support. That can leave
> > the eSPI reserved and may corrupt memory.
> >
> > Add the inverse of idx_to_virq() and use it in both reserve and free, s=
o
> > the allocation bitmap is indexed consistently. Also reject invalid
> > virtual INTIDs before clearing the bitmap.
> I think we can have it in 4.22 given that the release is postponed a bit.
>
> >
> > Fixes: bdde400c6e1b ("xen/arm: vgic: add resource management for extend=
ed SPIs")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >  xen/arch/arm/vgic.c | 27 ++++++++++++++++-----------
> >  1 file changed, 16 insertions(+), 11 deletions(-)
> >
> > diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> > index e5aca17dcb..b85710c6a7 100644
> > --- a/xen/arch/arm/vgic.c
> > +++ b/xen/arch/arm/vgic.c
> > @@ -33,6 +33,16 @@ static inline unsigned int idx_to_virq(struct domain=
 *d, unsigned int idx)
> >      return idx;
> >  }
> >
> > +static inline unsigned int virq_to_idx(struct domain *d, unsigned int =
virq)
> > +{
> > +#ifdef CONFIG_GICV3_ESPI
> Same as for patch 1: is_espi() shouldn't be protected as it protects itse=
lf.

Ack.

Best regards,
Mykola

