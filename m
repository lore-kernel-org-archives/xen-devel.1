Return-Path: <SRS0=qyBi=3J=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E49C32771
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jan 2020 23:43:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1528D22522
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jan 2020 23:43:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdemY3hg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1528D22522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itghv-0002iH-0b; Mon, 20 Jan 2020 23:43:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JMHZ=3J=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1itght-0002i9-3Z
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 23:43:45 +0000
X-Inumbo-ID: b1903a64-3bde-11ea-9fd7-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1903a64-3bde-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 23:43:44 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 203so622904lfa.12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 15:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x7DRg7brxlxSpNdwN8CNQlOdoxLbRD21vHOpn+3Cvsk=;
 b=EdemY3hgcngV+7KsOhJhVwhyh58ZdLJzenrUgo8iEt2CGwTzaE/RsV/+/PnsmI0vBZ
 ItlQ/vOG7iRBW7yfFnaKs18zHrhlYtdVoGC635yKjcC1kHHuNJ8w1w7QsLwaMsttpG+Y
 Y5wdxZKA7eI5052Gfo3kRercNkd/mJHf7U3CgcLiXWBkvHddEsPJxWbq9Mff7+HYJYCf
 4H/V1L4Ew9rBZ3UyIh6FwsMGRSqAENsM3N3ApeLJv/YohbCEbxQPRXejc6CakFTeAnhh
 RUoohh04BRKd2sy679Yjvk4BNnofoklOB1UNzvXI3XUdIZ31EpodiQ1Pg4In+s+6YHdz
 pLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x7DRg7brxlxSpNdwN8CNQlOdoxLbRD21vHOpn+3Cvsk=;
 b=Qip5sk0lASy8z7bEJss8Ss6P7LgmwmS6S3tosyhBAhj22Nlt0KAX1DllVOlHhWHh04
 qKsWnQni/VPLEocscS2KtMpc7dEujgouExzCCe28lFyOO+Loqh2y905JPTXN+qQGaxjs
 hxCMTC2bt4awQsxX/jhr1QnXY94OThkaYmYZFclrxmgKU8ctfAbB1F7qRufdeEyKSQPY
 qmoaN/ApH4W1dA+yPm6r59DViTfssj7pmvSkyuS6LGKJ0cInCJoqJl4unCcH+i4BpX1y
 0nk0pf1HWnfFxSo2Kno1oCUs82fbb8AXUNAG7T5U10MhQdmr/GaUsmlkYLCi4KIlAI0z
 0HIQ==
X-Gm-Message-State: APjAAAX4G99LsEQKw4OXRfyIHVV7iE/seV1zcG9RX8uLmRlwonKThvMQ
 KLjyd1q8/qQc7Hdi0kQpXPDUblawl8HcaFNihx4=
X-Google-Smtp-Source: APXvYqz2G/TKNXNb1l/hi6v56q1vqtOgKKRR5yqSq+I3ctLO3BmsoVI8BEDcLEJjxQyCzDU2ry4IirISMEpFC3QsDdU=
X-Received: by 2002:ac2:4214:: with SMTP id y20mr969426lfh.214.1579563823300; 
 Mon, 20 Jan 2020 15:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
 <20200117155734.1067550-6-george.dunlap@citrix.com>
In-Reply-To: <20200117155734.1067550-6-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Mon, 20 Jan 2020 18:43:31 -0500
Message-ID: <CAEBZRSe0a9HbUxhz0tqfLvhhad=eSPtU2hH09RXcLcYkc=yt0g@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 6/8] golang/xenlight: Don't leak memory
 on context open failure
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBJZiBsaWJ4bF9jdHhfYWxsb2MoKSByZXR1cm5zIGFuIGVycm9yLCB3ZSBuZWVkIHRvIGRlc3Ry
b3kgdGhlIGxvZ2dlcgo+IHRoYXQgd2UgbWFkZS4KPgo+IFJlc3RydWN0dXJlIHRoZSBDbG9zZSgp
IG1ldGhvZCBzdWNoIHRoYXQgaXQgY2hlY2tzIGZvciBlYWNoIHJlc291cmNlCj4gdG8gYmUgZnJl
ZWQgYW5kIHRoZW4gZnJlZXMgaXQuICBUaGlzIGFsbG93cyBDbG9zZSgpIHRvIGJlIGNvbWUKPiBp
ZGVtcG90ZW50LCBhcyB3ZWxsIGFzIHRvIGJlIGEgdXNlZnVsIGNsZWFuLXVwIHRvIGEgcGFydGlh
bGx5LWNyZWF0ZWQKPiBjb250ZXh0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogTmljayBSb3Nicm9vayA8cm9z
YnJvb2tuQGFpbmZvc2VjLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
