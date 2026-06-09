Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAB5CD8CA4
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2026 08:33:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1332483.1594917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWrsz-0001Zo-LW; Tue, 09 Jun 2026 08:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332483.1594917; Tue, 09 Jun 2026 08:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWrsz-0001Zh-Hn; Tue, 09 Jun 2026 08:32:37 +0000
Received: by outflank-mailman (input) for mailman id 1332483;
 Tue, 09 Jun 2026 08:32:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wWrsx-0001Yq-Mc
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 08:32:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWrsw-00FU7Q-Rj
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 10:32:34 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a27cf9d-e002-0a2a0a5209dd-0a2a4503eb44-30
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:32:34 +0200
Received: from [74.125.224.43] (helo=mail-yx1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a27cfa1-672d-0a2a45030019-4a7de02bc00f-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:32:34 +0200
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-6605469c263so407789d50.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 01:32:34 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780993953; cv=none;
        d=google.com; s=arc-20240605;
        b=luDwlafdCOieFXcDNQ6ydq/whRyFp0wbSWuQl3lf4YHZ7Lc10Og4Pz+fp53Gv5g5LT
         hVYVvZzyBPIbbpMvHvn3Ed1MuQanTSQo0XJ8fFXOcamqpFxV5AT7kEAm/K+EbhlUPdOv
         U2c9e8n2OSh93npYUJ25v3yAV8FIiasYrha7n5A8TZiGvY3PksZ2w07JBnD7UcCtG1Ow
         2mrx3r20wFj039xS7qeMZfuVolPRIF3M6l+6DjqsoaGhwm0JmW70qAAT05MlohA6B/P8
         Bf8k+MPPN9ybPaXEKwiPaB4+ZKSyCuHGwvoIh8FxXbgIeoxd2bgRd2GP75B9rdtWPyGH
         TG4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o1JZ9V+W/Tg7UFfDkMU10i7KhRb7QTXq3UPfKhvnuPw=;
        fh=bz012bFXXMSWKBVgaOsf9BhRnV5smxYP7I+E9Nd6XyE=;
        b=jZImJ4RKxAsDzYewkiXQ0Dkys8wKZW7aNHmgy+W2nLr457TLwNtoGX4Qi3f7KjHmpN
         OUgrNIdTBKm/fCQn9r2BFVl/yUtUJzqDMN3T486c2bTmUwr2Oz+9dXwgaY5a33kRkVpv
         Vu+TmkRTnbzczWw8zGKTue+GcqcGLYVY5vXraq1OzGZ5oxQ0HqD9trmS01LHuCRMYwOy
         anwPFNIW8Peto5UtgREvqbtwdUF19vuAFTJkrmDRQgnYDAN5W0Xjifzg315BCjz7sqAF
         OHeARzpubOS9R+1BzYZL/OrIEb3OTrs3HGP0MfyjEk08vVrWfAepjwOH4gj8IlZ8cCSK
         fhPQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780993953; x=1781598753; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1JZ9V+W/Tg7UFfDkMU10i7KhRb7QTXq3UPfKhvnuPw=;
        b=mCfnTcsM0f3U33koROP85BNtPG8p3Z4hD/EKhm2DUIfKvlnHsc285g37FT5DhXHjQ0
         +a92qLb62mZmvpjohjoihmD7jA+ib21WVyfyyblEgsAAUiS5yij+ydLJAQvlAJvvsltU
         3TOHrrdN/3bG/nBtsCDhdrbP1q2ERISakEQUIH5ar7QdBChZ5JVOiCdQcyMVm9YbYnJD
         tqw1H1z5OWi6dOoPLIZo7sf47Bn7Zbjm5EQQ28H+8wasWsTxq2s6T7YBEiIOJKEz9Vvk
         vS9bbEnopEVUpEh2mMfRceR/bjLOCSr4D2rTssohYUDeHh/6j5j0acBY9gBIcZKhKn+3
         jRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993953; x=1781598753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o1JZ9V+W/Tg7UFfDkMU10i7KhRb7QTXq3UPfKhvnuPw=;
        b=lNaDZ4uKCCGPTBpqe6mXb/8IcChSOsKMPZPoF5SM8bWM3bfoZjy1TfEF26E231BFEg
         MbhPec9qR6DqknEEpmfmF3GrGgimA7HgrOO6dx8MXAwDn1IYtjs6KTX4p6wSX2xmGKWz
         GBN0huNRqtdUzprrWsYN6o3WtDWJ7YGBPOs+ffIHPucBYYNu53Y6zClFut0FnpGYCyN5
         7Jct+q7HqaVGgBVcl6pUfDZ28Jpdik6FkOUIOj4611yO/JOVmKThAD4KXUqty5DBeM4a
         bkOlQFl6tOGQhOsRdIceC8D0vDWH1dBcT2UEhF7tl+hI/h/lykuCAjrhprgfL0EzmRh6
         ac+g==
X-Gm-Message-State: AOJu0YwVIpIAyd2Q3nREmdnsPobhm0IVM6j00+MClRDGYzSPAH4F4Mjk
	F67/COqZ/y4dLqvq3BPgd38B2Md5y8E8GS0Lfm9scb66thp09h9ygbG/0APn4+mk0kSJaUZfIVu
	gLl8+ijeoQHKaHrF4hHlpjmC5sVJRcsc=
X-Gm-Gg: Acq92OFvIuLNbc4D4kWNpE9r5f/6EbsHZTwh7Pu0DoeRAj+upG5Z1mEuyBFI7hSjEIX
	BsKRTt09y+cmQoRrn/n78DtUmIT2P/8DS6QV11sUcl1EwDe76bWfwrTFnplrIjpaU0a0lhghx8h
	WSO3DeSXEfXJ+IoQ0pOMbJKCHth5EwlU3UXYLAhVSwPukwAkcz5iV94Txuvq/RfDwafq+Th0XxX
	RlM+5UiaVPzUchXN5Qw1owp0pnURPMxpcJr+Iq+pQ1tBLyLRZiPniKMypsFzg2/H+tuHNpj58y3
	zta4WKCY51Q3NX2LWjQXWRwnJvCkQntI9alFdpDrUFAd1da4
X-Received: by 2002:a05:690e:484b:b0:660:ea4a:48d1 with SMTP id
 956f58d0204a3-66106e9d48fmr11631768d50.27.1780993953187; Tue, 09 Jun 2026
 01:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-2-frediano.ziglio@cloud.com> <aibQPLHlV6-fNtLO@macbook.local>
In-Reply-To: <aibQPLHlV6-fNtLO@macbook.local>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 9 Jun 2026 09:32:22 +0100
X-Gm-Features: AVVi8Cfz705lo4TmPJlISMZ01NM5u0LKouXIylXnRYL3GAH9llmd5IgOlRmk5aU
Message-ID: <CAHt6W4cZuc31kVvAHRHbsejYQqB++=JqKTxd5zkBC-1TTmEu_w@mail.gmail.com>
Subject: Re: [PATCH v4 01/16] libs/guest: Reduce number of parts in write_split_record
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1780993954-38149938-AED58744/0/0
X-purgate-type: clean
X-purgate-size: 1494

On Mon, 8 Jun 2026 at 15:23, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> wr=
ote:
>
> On Wed, Jun 03, 2026 at 02:05:48PM +0100, Frediano Ziglio wrote:
> > From: Frediano Ziglio <frediano.ziglio@citrix.com>
> >
> > Small optimization.
> > There's no much sense to split the header in 2 pieces, it will
> > just take more time and space to reassemble them in the final
> > buffer.
> > This also avoids truncating combined_length to 32 bit in case of
> > 64 bit machines potentially avoiding following record_length check
>
> I'm not sure I understand the sentence above: rec->length is a fixed
> width type uint32_t, and hence it will always be 32bit, regardless of
> whether it's build in 32 or 64 bit modes.
>
> I do get the truncation part, and that using size_t is indeed better.
>

I improved the commit message as

This also avoids truncating combined_length to 32 bit in case of
64 bit machines potentially avoiding following record_length check
(it could still be truncated writing it in xc_sr_rhdr structure
but the following check will catch it).

> > (it could still be truncated writing it in xc_sr_rhdr structure
> > but the following check will catch it).
> > The function become more coherent with following read_record
> > function.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
> With the commit message possibly clarified.
>
> Thanks, Roger.

Frediano

