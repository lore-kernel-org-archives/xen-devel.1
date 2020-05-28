Return-Path: <SRS0=RRgd=7K=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35714C433DF
	for <xen-devel@archiver.kernel.org>; Thu, 28 May 2020 14:59:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 053372075F
	for <xen-devel@archiver.kernel.org>; Thu, 28 May 2020 14:59:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqzQ40hX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 053372075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeJzg-0008Ho-Uf; Thu, 28 May 2020 14:58:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=blJD=7K=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jeJzg-0008Hj-4h
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 14:58:52 +0000
X-Inumbo-ID: bddea902-a0f3-11ea-9947-bc764e2007e4
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bddea902-a0f3-11ea-9947-bc764e2007e4;
 Thu, 28 May 2020 14:58:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r7so11573364wro.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2020 07:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=ot4+TOvce5OZy3rZ+p1nFFmdFUBtszR7HMAwtsAEHc4=;
 b=HqzQ40hXeB1+zgEndPFF0LxgV+BLJHlD4IapBKd9+e6MiCoRaNf4yN4aPnCJaThQHH
 4v9xiKjFfziycw9pJ+QPfZPtXnjQLuj+SarfsNnXLqEnIOO1MX4icCS68ULc0MWSDDOX
 aJaO0OrdvVkVk8ihiRAkLCpSU69+DtMjUzjdh6l0DgWP99xx+FYaXNjqHGLq2pUWDVa8
 VQWfGi5sUkuhp9ulzQaBmp78J41AMvCa7bOIQ3vI1xaa0qLB2PSDMIPPSd6cn0707CKZ
 O6rvHQKy2x3FcKgOCC8/qKfQ9cbMKb+jMYIBYjyty3FEaw+oNaHGrPe2IRXIH4FAJnZ1
 V8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=ot4+TOvce5OZy3rZ+p1nFFmdFUBtszR7HMAwtsAEHc4=;
 b=dbZ39TJM6/YuqE5RntkTipmqHzSS3pPWhM59v9KsBZU4Khh9HPtkYgvOZD1pYjPiTV
 LKbwpxAxDzsnxjWkcocXcmmLZSzUCyWQ9MzaiXw4Ki+SwoZc+C/G7f0i+ESWDkJTBdIX
 jBA4/dqw/KtC099oh8fiH0ynYQh+7Z6znU9rFHl1NoUdXb6DTABmbdN95zqebzLTsQRK
 wr8vsC3HK6V/w+HgctSTxbMvIAibCZleO7JQtthDb1tMA/KiVqm9pZpA15rat18A5Q2N
 xUn8w8EFnFFr3Qqxak8+vI6OngXqJ+yvkD+HfOvf16mErd4WHt20megrrGvhu1FGheam
 2BzA==
X-Gm-Message-State: AOAM530tudGqxIwTS+xlmZqi+/0Hed4uT5qYWfwibkJNhdp44OtGAfS/
 QeGyAzSfIAJxGZzsRa8hd/g=
X-Google-Smtp-Source: ABdhPJyy4QQdwtkPx7fHszy3MGesk7pnTV+0GaWTtp7sVaHuXD4k/JlOyXEECSe9hN/T/OkpZ47yVQ==
X-Received: by 2002:adf:fb0f:: with SMTP id c15mr4165801wrr.410.1590677930778; 
 Thu, 28 May 2020 07:58:50 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id z11sm6017536wrw.67.2020.05.28.07.58.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 May 2020 07:58:50 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>
References: <20200528114801.20241-1-paul@xen.org>
 <24271.53557.114994.926329@mariner.uk.xensource.com>
In-Reply-To: <24271.53557.114994.926329@mariner.uk.xensource.com>
Subject: RE: [PATCH] libxl: stop libxl_domain_info() consuming massive amounts
 of stack
Date: Thu, 28 May 2020 15:58:48 +0100
Message-ID: <000c01d63500$7f00f690$7d02e3b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHpe7CJHLMN88U00yeijiyjwE50VgJzn8buqINsV6A=
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
Cc: 'Anthony Perard' <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 28 May 2020 15:57
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Wei Liu <wl@xen.org>; Anthony
> Perard <anthony.perard@citrix.com>
> Subject: Re: [PATCH] libxl: stop libxl_domain_info() consuming massive amounts of stack
> 
> Paul Durrant writes ("[PATCH] libxl: stop libxl_domain_info() consuming massive amounts of stack"):
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > Currently an array of 1024 xc_domaininfo_t is declared on stack. That alone
> > consumes ~112k.
> 
> Wow.
> 
> > Since libxl_domain_info() creates a new gc this patch simply
> > uses it to allocate the array instead.
> 
> Thanks.
> 
> > +    info = libxl__calloc(gc, 1024, sizeof(*info));
> 
> Wy not GCNEW_ARRAY ?

'Cos I didn't know about that one :-)

> 
> That avoids a possible bug with wrong number of * to sizeof (although
> in this case you seem to have it right...)
> 

Cool. I'll send a v2 in mo'.

  Paul

> Thanks,
> Ian.


