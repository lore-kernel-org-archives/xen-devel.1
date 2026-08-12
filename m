Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD20C5CFCF
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 02:33:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388731.1629714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtymd-00063i-Su; Wed, 12 Aug 2026 02:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388731.1629714; Wed, 12 Aug 2026 02:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtymd-00063b-PB; Wed, 12 Aug 2026 02:33:35 +0000
Received: by outflank-mailman (input) for mailman id 1388731;
 Wed, 12 Aug 2026 02:33:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wtymc-00063U-DK
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 02:33:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtyma-004Whu-Lp
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 04:33:32 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7bdb7b-e002-0a2a0a5209dd-0a2a4507d0b4-2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 04:33:32 +0200
Received: from [209.85.128.169] (helo=mail-yw1-f169.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7bdb7b-b4ea-0a2a45070019-d15580a9c9f4-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 04:33:32 +0200
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-8201447e8cdso6382187b3.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 19:33:32 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1786502011; cv=none;
        d=google.com; s=arc-20260327;
        b=cIhNd+2rRBGz+WXj54BeNngJzf+rLqgczaP5n1ZbwQCAxc8kDAdiA9kDQYE+AIqFhk
         8giI6Vets8tRN5ZtgpytCOKM/5dj4KkSWIuqvTeLkvSG+Lp7cw+INhOZLUudE9huwxLr
         FemyOvZVEljvZP8IkSRnjcVl+4+3nkUBYe17qtCQ3EdW1zVHUBSeNWjuq2RPbnuSlNPB
         oihTHKIZETsBI4gWsDH8mTiUggGbSRq/VGmqZav7QxeE8gx+Z1yhIkzz1jKDobrnoNQC
         gynd0LsH7jJvH09TbmK6MH/KHurqzUrQbK/L5IQHBLQis7k26kuBu6WltCNSUNpVMS3J
         OgEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5TUs5xuISD/vB2CwHDcwdOp26J3qVXBqzemYHGJ3XMM=;
        fh=aU3/UpxH5Blg8M5NzH55q/XY8irYVWQMVJdPeFRWhhg=;
        b=eTr2+kcQH/XqIt6EuybLmKk3Kqt4LI3trqs6RD2xwaNd0d86ceBjulBp3T7PBAn91h
         1L6ovDM5XohrmO1FqkL2GYcCafHeKFviufm/k7R5nH0vRw+aCo8R6Y4/rB+8DuPF6oXO
         TTWq3q9pCvEhpcVjCRW9QiKDJQQxhcwwurYmjQHu9FnnBJIusq1fMmBvgrwHncdm05eV
         So0T1Itot/GveUA2XKiL0BMTP7jAVpUQPWux9DQbYRbyf8tj8Y8+bEKI5KlE2XfrReMu
         Ynnxk6fLc5iuLJjb7YL78cWfDBvcvWip8q3dmA/XI0pRfXqzqoC3DHAAeElVQZU0/SXu
         qv7g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786502011; x=1787106811; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5TUs5xuISD/vB2CwHDcwdOp26J3qVXBqzemYHGJ3XMM=;
        b=rUZUmokjascRkwAMWbwgjpMxm8ku6L6B3PFoGnufpY/UMP007pSJ0P8cXxVbtWpqbq
         msojbLddOpmKSTTXPU62no9I8ccWghKW1evSWBdbcHp3zXVeInx5+r/VglafsZnL+Tsl
         /sGgzPD5wA3b2hrEsQSzYvfSk686xGiKqufAlpThrVkwdVQsnMDwTgIJKDD8EZDWMVQx
         IikmMgrL4SXDloHSCZ8F4znv5mW1qdIftYDh27BgARB1UyhwgxN6PIYZx9p23xx+zUUx
         ZPobTVxqRIl4Qi+XWGloHX58SwvHRKZSaHNipPG6pJJ3LJTc4Udx/QicgnKWeZ23fwl6
         jIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786502011; x=1787106811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5TUs5xuISD/vB2CwHDcwdOp26J3qVXBqzemYHGJ3XMM=;
        b=H/4wgYkj1G+GIsuzuZYhpC0kKjXn70y/gAH+W3yIWxz6qoCEoIOqUaT+9Q560jI98b
         zp9wbFRtMdp4/H9vRE42qu4by01UMHPZHiMeDrOvfvJKYOPlTvuIC+DKt0tAWMRRUci8
         AK33rC1u3ODmbS7eHy1jgEls/EkJiD19zgK3/CUavcVV2Ze6RnyiTR040FvtYOECt2R9
         Ubity80DoAmJtbDkxiFfutKtWpPYSNIIn01xexGTHZ4R1JNs8a/GEd/Q2WN7SfTDT1Yo
         akqk6pKRE97cPxiABjpCahOfaXlFkuJIVxyog0k/HBeKq6AYB+UtKwuUxFfKLVKru7xJ
         OKIw==
X-Gm-Message-State: AOJu0YycmPnMzxtzVOOrdlejXnebcXzG+BUxrBRvERulVACWjaFEAUUl
	scDjbsVc6Ng93+ESlWhW3BPoywzFfakLEwfB+LhrA1t7RtEhqqtIQWZNUvnNyiocMPEeRgEOCHN
	TCy1+BBDdD5fhX0+a/mby9SrRpiEJwsU=
X-Gm-Gg: AR+sD10BE2KrBODO6Wa8C5v+Fa60wOfeaTWeVv2nb7PR7D9G/j7ph6mVwQXl/W1lWtN
	75bQQQi2xvGYpwQMbpGpOnNq71syAw0NAfDbkcDDa6qEcGr206VgY8waECgHXib69CRPepkifPd
	l8fthBX9O94YIzO2ogHUEf0oWI+js28yY1JE2ya8kL5ynMHr3D9V3c+4WIKYL7iogneR3nkoc0a
	DkmNA0sl6RjPNkPHXrBWVhJkPQjkfo2x0ztargoV79kw6ilK1/iBe1c9Qx3vs2dFbg7td7j+JDP
	0j/OGZ14MPCA+0ST0mTIfJ9tFT0lYo1UXzC03alQF3f3dJSWBZTlKo7uOpppuIH7OnRP5JF24jJ
	7
X-Received: by 2002:a05:690c:6:b0:814:585f:73c8 with SMTP id
 00721157ae682-830ffffe960mr11281557b3.0.1786502011144; Tue, 11 Aug 2026
 19:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260810103018.54564-1-frediano.ziglio@citrix.com> <1786448226.8631fc262581453bbf619ec5b2062170.19ff09caa3e000c4f3@vates.tech>
In-Reply-To: <1786448226.8631fc262581453bbf619ec5b2062170.19ff09caa3e000c4f3@vates.tech>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Wed, 12 Aug 2026 03:33:19 +0100
X-Gm-Features: AUfX_mxxkVhwuyHNB75iPDDuNf68KnVejQqT7vqTVfvexNmx1Ll2Ubf-cpYC5ho
Message-ID: <CAHt6W4fFwNJrKvWW_k9ARs9cJq7uUrqsCqSUb0PdY80=TubVCw@mail.gmail.com>
Subject: Re: [PATCH v10 0/10] xenguest optimisations
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1786502012-A76D2AE4-8899F052/0/0
X-purgate-type: clean
X-purgate-size: 1348

On Tue, 11 Aug 2026 at 12:37, Anthony PERARD <anthony.perard@vates.tech> wr=
ote:
>
> On Mon, Aug 10, 2026 at 11:30:03AM +0100, Frediano Ziglio wrote:
> > Edwin T=C3=B6r=C3=B6k (3):
> >   libs/call: cache up to 4 pages in hypercall bounce buffers
> >   libs/guest: allocate various migration arrays just once
> > Frediano Ziglio (6):
> >   libs/guest: move batch_pfns into a separate structure
>
> I've committed these first three patches.
>

Thanks.

> I've notice that `git am` will put the wrong author on your patch, it
> would use the gmail addr instead of the citrix one. Could you fix your
> config so that `git` does the right thing? I think it is just a matter
> of changing the config:
>
>     git config sendemail.from 'Frediano Ziglio <freddy77@gmail.com>'
>
> (with maybe --global or with an identity added to the config option if
> you use that).
>
> This will tell git that the email is send from a different email
> address and it will format the patch appropriately. Otherwise, gmail
> just overwrite the "From:" without telling git. The original "From:" is
> still available in "X-Google-Original-From:" but it's not something git
> should care about.
>

Done. Yes, it looks like it is working. An additional "From; xxx" line
is added at the beginning of the body.

> Cheers,
>
>

Frediano

