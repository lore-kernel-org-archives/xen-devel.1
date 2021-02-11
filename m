Return-Path: <SRS0=WbUH=HN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440E2C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 11 Feb 2021 14:16:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D782764D92
	for <xen-devel@archiver.kernel.org>; Thu, 11 Feb 2021 14:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D782764D92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83915.157192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAClq-0001ms-Ek; Thu, 11 Feb 2021 14:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83915.157192; Thu, 11 Feb 2021 14:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAClq-0001ml-Bf; Thu, 11 Feb 2021 14:16:38 +0000
Received: by outflank-mailman (input) for mailman id 83915;
 Thu, 11 Feb 2021 14:16:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qXs=HN=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lAClo-0001mf-B8
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 14:16:36 +0000
Received: from mail-wm1-x332.google.com (unknown [2a00:1450:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d8462a0-f720-47e4-b320-dcc045cfc66c;
 Thu, 11 Feb 2021 14:16:35 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id a16so6026643wmm.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Feb 2021 06:16:35 -0800 (PST)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:f088:412:4748:4eb1])
 by smtp.gmail.com with ESMTPSA id z8sm5045343wrr.55.2021.02.11.06.16.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Feb 2021 06:16:34 -0800 (PST)
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
X-Inumbo-ID: 7d8462a0-f720-47e4-b320-dcc045cfc66c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=Cy7wIsuzTgl3aboWz/KovEJxl9QgfW9V5yGGjiDAWYM=;
        b=ceGtK16iiqXY4tgCK1vcKqBj4841jW8joof8S5SVv23VqEhPPrve3dH08MDFnAW8gT
         eDso9WyJXR0PA6bWE6qzadYTP4IRUv2MiuarZWCROw9k+VeyhRDA9lUEiPOqTwWyHTiA
         8oFIew0jN2w50DFl/edAVtXnvBA8T6ELRsB0yHtWmRNqXdKBax/B6dt4/+sVOkYxBuJZ
         ygiiDkEQOfvXTthd+sIy5RKUovNOzFQ/jzmU/xL8cASUcfaooC4EmBjuVYOfE6UNP6ID
         gzhTYcoWpGzDsu9Fs4152wzszrgjUAZMBh9fNIHMRM4cKAO+x5jqAZUbhdbwVgvcQxl3
         ks5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=Cy7wIsuzTgl3aboWz/KovEJxl9QgfW9V5yGGjiDAWYM=;
        b=kF8fIR/r/v2nDKcHkfRJECLaRQ6EHrXq+C2ZwrhPJypznR9jl0c534XYrjQpN7pafu
         gICbQaRAs4Y3V71KWCHm+BTE9gwM1YwGjcmqGNpBfROUOjYSWpSJEO1q8SEjbXtc8ji5
         Fr7qFDGhpLFhCej3T0nwC9SVTDmQX2bCZnnbiJ48ADh1X2fbGyWzOg+xA36U4XwBvV5M
         FrifKDpwaZlRogYd0IQ33dO/lWfw9Sxd15SKY8/yh4CKeqse9pN5QZzuR83ip2C2UUO8
         4JIwmnlPn0PGGPBcAj9vdJicFeYW+0jR/7rxWCMLA9XxZzuzEScGWb8Csp7+oZisbwjY
         R21g==
X-Gm-Message-State: AOAM5306kzQ/oxuKWaC3ar/WAK/XYT1NDsIGyjlSlmGc63V+0jIMbmWA
	g4sdBXshgxVSr+KAnR16Eag=
X-Google-Smtp-Source: ABdhPJxTbARAJSnDj9FS90ZX4jupockoPgBhbigpLeuBQY+mCo7W/pQ+NNyaOiH3hCn1BLn43MXmKg==
X-Received: by 2002:a05:600c:2d44:: with SMTP id a4mr5294978wmg.95.1613052994868;
        Thu, 11 Feb 2021 06:16:34 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Juergen Gross'" <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>,
	<linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>
Cc: "'Konrad Rzeszutek Wilk'" <konrad.wilk@oracle.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Jens Axboe'" <axboe@kernel.dk>,
	"'Wei Liu'" <wei.liu@kernel.org>,
	"'David S. Miller'" <davem@davemloft.net>,
	"'Jakub Kicinski'" <kuba@kernel.org>,
	"'Boris Ostrovsky'" <boris.ostrovsky@oracle.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>
References: <20210211101616.13788-1-jgross@suse.com> <20210211101616.13788-6-jgross@suse.com>
In-Reply-To: <20210211101616.13788-6-jgross@suse.com>
Subject: RE: [PATCH v2 5/8] xen/events: link interdomain events to associated xenbus device
Date: Thu, 11 Feb 2021 14:16:33 -0000
Message-ID: <001e01d70080$80afd5a0$820f80e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJuRSjpYwlLGVvLkRJGigHTv/cnpwH8bIuTqRSTGoA=

> -----Original Message-----
> From: Juergen Gross <jgross@suse.com>
> Sent: 11 February 2021 10:16
> To: xen-devel@lists.xenproject.org; linux-block@vger.kernel.org; =
linux-kernel@vger.kernel.org;
> netdev@vger.kernel.org; linux-scsi@vger.kernel.org
> Cc: Juergen Gross <jgross@suse.com>; Konrad Rzeszutek Wilk =
<konrad.wilk@oracle.com>; Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>; Jens Axboe <axboe@kernel.dk>; Wei Liu =
<wei.liu@kernel.org>; Paul Durrant
> <paul@xen.org>; David S. Miller <davem@davemloft.net>; Jakub Kicinski =
<kuba@kernel.org>; Boris
> Ostrovsky <boris.ostrovsky@oracle.com>; Stefano Stabellini =
<sstabellini@kernel.org>
> Subject: [PATCH v2 5/8] xen/events: link interdomain events to =
associated xenbus device
>=20
> In order to support the possibility of per-device event channel
> settings (e.g. lateeoi spurious event thresholds) add a xenbus device
> pointer to struct irq_info() and modify the related event channel
> binding interfaces to take the pointer to the xenbus device as a
> parameter instead of the domain id of the other side.
>=20
> While at it remove the stale prototype of =
bind_evtchn_to_irq_lateeoi().
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Reviewed-by: Wei Liu <wei.liu@kernel.org>

Reviewed-by: Paul Durrant <paul@xen.org>


