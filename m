Return-Path: <SRS0=ERFX=CN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7C4C433E2
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2020 18:16:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32616208DB
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2020 18:16:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoETaPoV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32616208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEFXV-0005rs-LN; Fri, 04 Sep 2020 17:30:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6qam=CN=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kEFXU-0005rc-1n
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 17:30:16 +0000
X-Inumbo-ID: b222b89a-71c8-4be4-a7e0-1c9fcb83d584
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b222b89a-71c8-4be4-a7e0-1c9fcb83d584;
 Fri, 04 Sep 2020 17:30:15 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z1so7544293wrt.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2020 10:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=iTfwB4xa2llN+MOlOc5euzrM6jdzHnXINlbXBBq3/o4=;
 b=QoETaPoVslJ0yKoxL92fTb59I1K2YvdhedLz0rAyf2Zyti4IOdaaE3FE/BMs4xJ5/G
 8L9LY61lMTeSmMWsehpinUlvEaUHV1ycvCwoTLOGwINpdKz+TpexHkmtgI04oAY27+AY
 OvC+fN2niTYe1mM+k3sVchbveKwBesmtnBOdLuNSDN10vlfwcdVE2epRbazWEUTVHZlE
 ACcbwgRtNxPeN+7XyyZfolRBwSfzsQE0TA/EY2OrIcoNWe06Gv/uwMKjjl0U1pTLFZuS
 ppgfjRQMSm9aYu+HFIkypZQOXWnPc79iK/GgOB3OrImVcVpZdXxuyMoA1+CqrM3xfA5t
 9USg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=iTfwB4xa2llN+MOlOc5euzrM6jdzHnXINlbXBBq3/o4=;
 b=ayom9RAS8ArzRdeAE+gPy3FYhaQx14xKYtRWZWF/ptQmr2Q5LKr4+4+9lMEF6Y4TZQ
 BmHKvLz0qIwaslpOIf6j6KBWOKfhjhWbd2A6kpdlxESS048tRFs1EpeVlVYLNzJDO7ii
 zAawuqiEOaS0ojhHCG03QsO3ZfH6EzeLzP3HUVXySXvXfvJvAyUStWEp0p2n0QzEh47o
 kDvcX9s3pKEc0K6BVx606zV8oUOjlqaxCzTDBPJt1UCVWYioHJc68neMBsBk76mKJzca
 Ng2+YXfT/hOSX8snKeZeewaKXpY+dWWTgSU5zYTpNaRVs99/5Fgys9mCH9IU90BHAMqx
 8uYw==
X-Gm-Message-State: AOAM533c7AXGcPtWBBRSzmz7diipk/3MjMpuVrNc0BRQoC/x+xJyILwF
 ut1qMga4QuYRwD7AM9LjPME=
X-Google-Smtp-Source: ABdhPJylCJS+pFLsnmeB574Ss6zovfyb7HyM6zq1HrAD8cvRFDmr4pWyoagxeXkCmQnopat/eI94ew==
X-Received: by 2002:adf:f34f:: with SMTP id e15mr8371371wrp.387.1599240614435; 
 Fri, 04 Sep 2020 10:30:14 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:c940:c3c6:26f0:df49])
 by smtp.gmail.com with ESMTPSA id v3sm12323067wmh.6.2020.09.04.10.30.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Sep 2020 10:30:13 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>, "'Paul Durrant'" <pdurrant@amazon.com>,
 "'Julien Grall'" <julien@xen.org>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'George Dunlap'" <george.dunlap@citrix.com>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>, "'Wei Liu'" <wl@xen.org>,
 "'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
References: <20200818103032.3050-1-paul@xen.org>
 <20200818103032.3050-2-paul@xen.org>
 <9873d112-0d87-d871-3911-3527d79a0b56@suse.com>
 <5578c3fb-e35d-bb89-79f7-003e642492ab@suse.com>
In-Reply-To: <5578c3fb-e35d-bb89-79f7-003e642492ab@suse.com>
Subject: RE: [PATCH v7 1/9] xen/common: introduce a new framework for
 save/restore of 'domain' context
Date: Fri, 4 Sep 2020 18:31:03 +0100
Message-ID: <003601d682e1$2aaafdf0$8000f9d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI3t7iXj66qvRdG8GCx2a1a4xz7XAHTJnD7Ad4sR6YB2eEYFqhp+Prw
Content-Language: en-gb
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
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 26 August 2020 14:54
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant =
<pdurrant@amazon.com>; Julien Grall <julien@xen.org>;
> Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap =
<george.dunlap@citrix.com>; Ian Jackson
> <ian.jackson@eu.citrix.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Wei Liu <wl@xen.org>;
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>
> Subject: Re: [PATCH v7 1/9] xen/common: introduce a new framework for =
save/restore of 'domain' context
>=20
> On 26.08.2020 15:32, Jan Beulich wrote:
> > On 18.08.2020 12:30, Paul Durrant wrote:
> >> v7:
> >>  - Add an option to domain_load_end() to ignore unconsumed data, =
which will
> >>    be needed by a subsequent patch
> >
> > May I suggest to name the parameter "ignore_tail" instead of
> > "ignore_data", as typically you don't mean to ignore all of
> > it?
>=20
> Hmm, looking at patch 7 it's indeed all of the body which gets
> ignored. Not sure what the longer term expectations here are.
>=20

I think it is useful to be able to consume as much or as little of a =
record as is needed.

  Paul



