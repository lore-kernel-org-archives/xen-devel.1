Return-Path: <SRS0=hRpO=EZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF151C56201
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 16:08:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B35722256
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 16:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzn2y6WG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B35722256
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31075.61287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmTq-0007cR-4N; Thu, 19 Nov 2020 16:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31075.61287; Thu, 19 Nov 2020 16:08:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmTq-0007cK-1I; Thu, 19 Nov 2020 16:08:18 +0000
Received: by outflank-mailman (input) for mailman id 31075;
 Thu, 19 Nov 2020 16:08:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d/3C=EZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kfmTo-0007cF-4f
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:08:16 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b1fe409-9fe3-4371-933d-62cf64f628c8;
 Thu, 19 Nov 2020 16:08:15 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id o15so7015193wru.6
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2020 08:08:15 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
 by smtp.gmail.com with ESMTPSA id s2sm442348wmh.37.2020.11.19.08.08.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Nov 2020 08:08:13 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=d/3C=EZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kfmTo-0007cF-4f
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:08:16 +0000
X-Inumbo-ID: 3b1fe409-9fe3-4371-933d-62cf64f628c8
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3b1fe409-9fe3-4371-933d-62cf64f628c8;
	Thu, 19 Nov 2020 16:08:15 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id o15so7015193wru.6
        for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2020 08:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=vlGJvl+n48Fq+TCMCHaQE3qgoeZd8yDDxodtR8YJyuY=;
        b=nzn2y6WGgyWKaJ4Kwk6thNR7PcK3wllxIkC4sY6d7jNyGIR0Ta9ETugwLHScvHMdPj
         bAOM5CuSlTRq0sZcAuL0wN06wRyz75UMPR5F+m0aLhmuCp9qD5T/7fxWQuhRU+KPI8nW
         jA2zBRYbaa+BCva+Q4ZRZoq/iD63TUEysJSYptanQLsmUN3QuMeNU8a3rcZldXW5TIgz
         h00E9FUzjBYYgjmox4CN6EQ9ALVDoqldiNdkrohR1FHhcHc8pbdZ+++vwCyrBZ/OEamW
         yGZUZrdckdnY34Sz4yu3S4FlfsR1HjypqQtQWez+jcYGEGXPEVCQNtAX6jsDdCo+5AKA
         yEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=vlGJvl+n48Fq+TCMCHaQE3qgoeZd8yDDxodtR8YJyuY=;
        b=uL0p2SxtLfJQAjtHa07WoGlE4a2CMMuJyNhywKCrFw2Nd0gdKRjxjHntHqgYI/7uAc
         0cEaID1b7pkZxuF3zWaStIesFk0G71RXwJncCwwq0AOk9J3/UVFFFbtMBf8rBAafuBg4
         EqijC8814lSwmApHq1s4O6DyH9aapTfazcT8hzAwt5nI7fhLPmDzV90ML0nG8R36whXb
         RPjR1yIYiXuXiqJ2Wa8aSNW/UB0O90fkXFz2E9mCtzMZFBJTByoutQOl4RW+ILe/IQEM
         xn39wJ7h+tmTKezW6eu8+8AXtmfq53LoYAnYPqTAaIlAB9hcQjSfUZ3uBxghHNUPps3C
         0Now==
X-Gm-Message-State: AOAM533I9tEIKUnUSgCVRBy6cgGS1NQC7KHuLPWQiXSGv23Epxew+yNX
	BAT7zwqhJFZBeHDPdbPRAvY=
X-Google-Smtp-Source: ABdhPJy2Z7A2iRrNoVU5XUeapMEd1B5B48MbWEw7EzoD3iprlTGrI9wZ6AGOUiFtipalcbjFF7sUFg==
X-Received: by 2002:adf:f382:: with SMTP id m2mr11416060wro.426.1605802094401;
        Thu, 19 Nov 2020 08:08:14 -0800 (PST)
Received: from CBGR90WXYV0 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
        by smtp.gmail.com with ESMTPSA id s2sm442348wmh.37.2020.11.19.08.08.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 08:08:13 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20201111200721.30551-1-paul@xen.org> <20201111200721.30551-6-paul@xen.org> <701b30f9-9552-84c0-63fa-0837b7939f4d@suse.com>
In-Reply-To: <701b30f9-9552-84c0-63fa-0837b7939f4d@suse.com>
Subject: RE: [PATCH 05/10] viridian: use softirq batching in hvcall_ipi()
Date: Thu, 19 Nov 2020 16:08:13 -0000
Message-ID: <00cb01d6be8e$2f138450$8d3a8cf0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIKCyTUSJ7jm2WJ2nMqsy5EhijKogKFZsbGAWFRW+OpSc9NwA==

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 12 November 2020 08:53
> To: Paul Durrant <paul@xen.org>
> Cc: Paul Durrant <pdurrant@amazon.com>; Wei Liu <wl@xen.org>; Andrew =
Cooper
> <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH 05/10] viridian: use softirq batching in =
hvcall_ipi()
>=20
> On 11.11.2020 21:07, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > vlapic_ipi() uses a softirq batching mechanism to improve the =
efficiency of
> > sending a IPIs to large number of processors. This patch modifies =
send_ipi()
> > (the worker function called by hvcall_ipi()) to also make use of the
> > mechanism when there multiple bits set the hypercall_vpmask. Hence a =
`nr`
> > field is added to the structure to track the number of set bits.
>=20
> This is kind of unusual, i.e. we don't do so elsewhere. I take it the
> assumption is that using bitmap_weight() is too much overhead?

It just seemed wasteful in the circumstances. If I move to bitmap copy =
OTOH then I'll have to use bitmap_weight().

>=20
> > @@ -509,6 +510,7 @@ void viridian_domain_deinit(struct domain *d)
> >
> >  struct hypercall_vpmask {
> >      DECLARE_BITMAP(mask, HVM_MAX_VCPUS);
> > +    unsigned int nr;
> >  };
> >
> >  static DEFINE_PER_CPU(struct hypercall_vpmask, hypercall_vpmask);
> > @@ -516,21 +518,24 @@ static DEFINE_PER_CPU(struct hypercall_vpmask, =
hypercall_vpmask);
> >  static void vpmask_empty(struct hypercall_vpmask *vpmask)
> >  {
> >      bitmap_zero(vpmask->mask, HVM_MAX_VCPUS);
> > +    vpmask->nr =3D 0;
> >  }
> >
> >  static void vpmask_set(struct hypercall_vpmask *vpmask, unsigned =
int vp)
> >  {
> > -    __set_bit(vp, vpmask->mask);
> > +    if ( !test_and_set_bit(vp, vpmask->mask) )
> > +        vpmask->nr++;
>=20
> If test_and_set_bit() is the correct thing to use here (rather
> than __test_and_set_bit()), the counter also needs updating
> atomically.
>=20

It doesn't need to be atomic, but I'll probably drop it.

> >  }
> >
> >  static void vpmask_fill(struct hypercall_vpmask *vpmask)
> >  {
> >      bitmap_fill(vpmask->mask, HVM_MAX_VCPUS);
> > +    vpmask->nr =3D HVM_MAX_VCPUS;
> >  }
> >
> >  static bool vpmask_test(struct hypercall_vpmask *vpmask, unsigned =
int vp)
> >  {
> > -    return test_bit(vp, vpmask->mask);
> > +    return vpmask->nr && test_bit(vp, vpmask->mask);
>=20
> Is this in fact an improvement?
>=20

I think so, but it's a moot point if I drop 'nr'.

  Paul

> Jan


