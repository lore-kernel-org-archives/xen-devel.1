Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B8ACD4F50
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2026 07:02:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1311545.1581658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOrzM-0002hg-Bq; Mon, 18 May 2026 07:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311545.1581658; Mon, 18 May 2026 07:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOrzM-0002hZ-9H; Mon, 18 May 2026 07:02:08 +0000
Received: by outflank-mailman (input) for mailman id 1311545;
 Mon, 18 May 2026 07:02:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOrzK-0002hT-Lg
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 07:02:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOrzI-008fGW-D6
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 09:02:04 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ab965-e002-0a2a0a5209dd-0a2a450ce9c0-32
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:02:04 +0200
Received: from [209.85.208.181] (helo=mail-lj1-f181.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ab96b-62f1-0a2a450c0019-d155d0b5c856-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:02:04 +0200
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-395317d8852so16741131fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 00:02:03 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779087723; cv=none;
        d=google.com; s=arc-20240605;
        b=bO1NMkOr2DgIas/e7Eqg/hPYoHOXZrLEAhAAsON/mQoSH+6u/55/NNEmXlJkKC/l5l
         KrPHtRIUjxCxX5o92ayC66gVEAJV9ipxVE5NdeELKvUct7HFO0f3dBB3yMOjoUj//TgQ
         O4oxYz8l0AKsJYwcA4C0l4MAkvHrRLPgsugUwJhZ20vGwM7Mu8Ewi1aJGeyVtmrwdEmi
         wvVL06wMF/QeMZoF4y9RLYVO789Ls6qVYbNmWUdSHSOUa3Yzym2EVdrat4ailnnuo7my
         N0sVpN7ESvzC3RVYnXgWknARm+Qyov8bgjciUSKuxHTMU+7Q1ot/6pgdYJZm/m/S1IfE
         B2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3JCLiVjrYoxp8pn/kEH3Tc+0tuKlpKYXcQZg2b2QSAQ=;
        fh=m+LyBnxXZUS5is0QhmwZhMCJ+Zjiv6ewBPbyK6zvFHc=;
        b=WijZKnrONpvMyJHh+Ez+cpn7eLZRwC5KQyOsQ4+S+ICbS1jnIVrCKOw6vZ3uemqEak
         ZFw6e9K3PaiUoZuLbjL3OQDzbiGMKJXJ9hLF59CkSeaNkX1juASmJGJWmgZ111X0TPIi
         qEJu+qjYPowbuvzGyQAARD96+VzmY4sjvfAVkzBqmggsapm7SHI3MhsL2rp68+pB6miU
         CDgBOb0LajPVNcHShMM35Neka5dBXwXAm2W3OY7iKGwNulHOR2oOfLE9qolAp5QpBZxI
         Lkf+kDNi1szGhIlcaWiXnglfONPYdgSTqcQxMQTWtn3/Q7BmncS8CeIuOnPU5H90uHzA
         IUnQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779087723; x=1779692523; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JCLiVjrYoxp8pn/kEH3Tc+0tuKlpKYXcQZg2b2QSAQ=;
        b=IszNxIm6vycQ3iCqE6oniFeuB/uqQbyNOJjqdPZPrCPGWCbjBg19dCLMsPKgt2KvRh
         6hCgSVoOZFPjQLqPPr85MRQGxJMV2MEVZFqUag9+vpx8S6aHZNOPD14Cy7LlCkjdgiWe
         Atd3EuDdIh3XcBVIHlqzHlkd1UkDxh5TQZb7VcGGIz2Mfwcbhyn9YjIxkPRqOqj/OhVY
         /YhQ28rYk8nvZ9npH9aP3+X0ILVQ3bNR0ltGd5EA4Sx8iF7VK3Ogmz7mhEJPjqxC05Dm
         5ujhNWBiqIQbm1+7DfX1ZajPXfd/jGqHabzP3S45lLgSLu1ttWR1gL9R/oqM7XdgfDyY
         vgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779087723; x=1779692523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3JCLiVjrYoxp8pn/kEH3Tc+0tuKlpKYXcQZg2b2QSAQ=;
        b=QKl7U5RcuCnTJwVsnyZaM0DOGzq7Q+b3HprfbStzW9UJVdgL3RrLIpi1HrYP1Bkb2y
         g6qXMW2HbqGRdgLnGjKkkUd5HInGVG/mq9qMR8KLgCdmKOVckgC+eHgjun9RiYNzjZtv
         MVUN4RA3OH+rt1LDnLXyRjsGjLLnhaG/XSlefedsH4nUFDTNcLA5bu64mHxBMbzcvA02
         6G1Y/N6Otx7ixSQsZVvTuLt8GmMOFmeXZSH00cxFCxBddkc55goxZG87M+ea4Bgjk+Ll
         Fmh1X5Q3zg3mg0Hkq1c3HGf/jRg3E0xXjmLOGraTqD5rqVtgUIMDV+ivcqEjrl05tl6+
         UCBA==
X-Forwarded-Encrypted: i=1; AFNElJ9hTNSAz/nIX28i8d3U1QFfZmXH942wdk2TL4vEPO7eMWGU+BUaKh3xD6et/Ge95sAVNwGAACu/kz8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHLf6ET/Ac+jkNVigri6Mj/981w3CZ+u7yphOD8xtMojBvzI0V
	497sczEFI0YJyJLz/NLj+18BJIumJ5xQCUkJoEB3hvHy65Sbk3vnpX50D78cdU8DufD0QwyAc4m
	vuI8+YyEHc9YBgJvHdIIMY10u/OD0nmQ=
X-Gm-Gg: Acq92OHDTbByuu8NLivuBet27n6ckdoIq1qnT+hB70eFBcNqzouNy5QffXfSsfV15+G
	BEGhnLeQfwWFDT24M3hcci68qobpCCN2cXBR9y/Kx++j5gz+ksUnIlk7ZtTSHxFS+5LLysPSGLS
	BIF0gBuV7/75RFHWMC9D4MybdD7LKwnyP2yCsdEjSb2gEDeyZfYJcApbSXdPCIGcr+zivY/ljfp
	hAnBFlWhTjxNtCj6LRYi/oPGexWLSBxaEIyLbBL45OFDkRrjMOXkLMSvj9h78656mu4EL619uoX
	rmx9
X-Received: by 2002:a2e:2e19:0:b0:38e:90b9:ce98 with SMTP id
 38308e7fff4ca-39561c0cd6bmr30917351fa.6.1779087723146; Mon, 18 May 2026
 00:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778925998.git.mykola_kvach@epam.com> <d9db51c5-97a1-4131-8575-dca1ae2cf52c@suse.com>
 <CAGeoDV9DitsH629pWGe+X=0VM+oi1BfSgWMxE+t32CCR5gMgtw@mail.gmail.com> <a5d1dc32-c505-4f42-8d48-ba2710d7b831@suse.com>
In-Reply-To: <a5d1dc32-c505-4f42-8d48-ba2710d7b831@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 May 2026 10:01:51 +0300
X-Gm-Features: AVHnY4Il-7plXvdnaNWH4cvOEinsjaCQG5yoBNwLoJYksIrFr_kF7vQmHArWgw4
Message-ID: <CAGeoDV_8BNRPy9tbe1ArgR4Lj8YHZPwo_7D59oJJSiSqNQFNFQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] xen/common: llc-coloring parser fixes
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	Carlo Nonato <carlo.nonato@minervasys.tech>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1779087724-E0567CF5-94D462E1/0/0
X-purgate-type: clean
X-purgate-size: 3051

On Mon, May 18, 2026 at 9:52=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 18.05.2026 08:42, Mykola Kvach wrote:
> > On Mon, May 18, 2026 at 9:20=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 16.05.2026 17:03, Mykola Kvach wrote:
> >>> This small series fixes two issues in parse_color_config().
> >>>
> >>> The first patch makes parse failures leave the caller-visible color c=
ount
> >>> at zero.  This prevents a rejected command-line value from leaving a
> >>> partially parsed configuration behind for later init paths to consume=
.
> >>>
> >>> The second patch rejects empty color tokens.  Previously, delimiters =
in
> >>> places where a color value was expected could be interpreted as color=
 0,
> >>> because simple_strtoul() returns zero without advancing the input poi=
nter.
> >>> The patch checks that each parsed color value consumed input.  It als=
o
> >>> adds the missing newline to the DT color parsing error message.
> >>>
> >>> Mykola Kvach (2):
> >>>   xen/common: llc-coloring: clear color count on parse failure
> >>>   xen/common: llc-coloring: reject empty color tokens
> >>
> >> For both of these, a question which isn't even considered in the reaso=
ning
> >> is whether the present behavior may be intentional. Especially for the=
 2nd
> >> ISTR Stefano(?) not so long ago indicating that the behavior is indeed
> >> intended to be this way. That may have been somewhere on Matrix rather=
 than
> >> on the list, though.
> >
> > Thank you for pointing this out.
> >
> > For the first patch, my reasoning was that returning an error while
> > leaving a partially parsed caller-visible color count behind looks
> > surprising. If the value is rejected, I think later init paths should
> > not be able to consume the partially parsed state.
> >
> > For the second patch, my reasoning was that the current behavior looks
> > accidental rather than an intentional extension of the syntax.
>
> That was my impression as well, hence why I had raised the question back
> then.
>
> > The parser comment says:
> >
> > COLOR_CONFIGURATION ::=3D COLOR | RANGE,...,COLOR | RANGE
> > RANGE ::=3D COLOR-COLOR
> >
> > The user guide also describes this as a comma-separated list of colors
> > or ranges, with ranges written as hyphen-separated inclusive intervals.
> > I don't see an empty-token production there.
>
> What you quote is insufficient to determine: COLOR may be allowed to be
> <nothing>. Iirc the reasoning went in particular towards a range with
> merely the upper end specified being something (halfway) meaningful.

Right, I see your point.

The grammar does not define COLOR explicitly, so it does not by itself
prove that an empty token is invalid. I was implicitly reading COLOR as
a numeric color value, partly because all examples seem to use numeric
values, but I agree that this is not stated there.

If this behavior is intentional, then I agree the second patch should
not go in as-is.

Best regards,
Mykola

