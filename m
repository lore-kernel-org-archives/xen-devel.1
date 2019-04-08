Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FF1C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 12:25:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A88CA2087F
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 12:25:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cardoe.com header.i=@cardoe.com header.b="aB0c+1Us"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A88CA2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cardoe.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDTKU-0008D8-NH; Mon, 08 Apr 2019 12:24:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9Tza=SK=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1hDTKT-0008D3-TV
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 12:24:49 +0000
X-Inumbo-ID: 4cd20787-59f9-11e9-92d7-bc764e045a96
Received: from mail-yw1-xc44.google.com (unknown [2607:f8b0:4864:20::c44])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4cd20787-59f9-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 12:24:48 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id w66so4834247ywd.4
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2019 05:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=97GtsDfymcUzR/D2w9h+nH04h3T7qjgpeeFeL7AvQ3E=;
 b=aB0c+1Us1sM3kw/MIp7FMOGtRN8EZAykUGfNeJJ28/JbVwuvAJBaZQ0EUwH3tTDCjv
 0V/rB/VSZ8htR2z7zT+RxGfjv0hOHoQvoW95ZctcATLuNBIGcMBpRVR55nz2E2Et5MdO
 pA5dg/261LOQh5lXK7yzc/vkLarHVc3l40Fgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=97GtsDfymcUzR/D2w9h+nH04h3T7qjgpeeFeL7AvQ3E=;
 b=JqDuWDeucGNf4fPWYljBFaaJRsi1cCas6/jD1u5OifNi+VQaaUq68gHsmvkyh1Jowy
 NzJtmVjAmyM/ofmRtlu9XmrCl7MquHNLYXyV7gkJ3rFufLL/eWI/n5wS2yT51MGKiybr
 Ufmvc3Xyku7EtvOPhgP/Q+e9S81e0dV1OX/riak3LN+JePPxGEwz01cZFJ1ebG2WcXdt
 nuNC7b5HnX1wHocU5k4X2Jxpa3nzIKOhK6v8+KUARxkictWW5QLAKabtf2L6po8w4K/R
 LYWhlzrE3r6TrvDIx0taGFs6SiufaOw48YajZczytforSiwDbSSMgsQKc03NQBggcpH0
 RxtQ==
X-Gm-Message-State: APjAAAVoz4qRX70VQBMPv4E5kEP/y31PelL8puYCkooXVltlCEIAB/fs
 DHU0hlqIlyKvrSskVljEneNKONMEAfs=
X-Google-Smtp-Source: APXvYqyTMic+Cj5KuIoZhD6X/Mveg097xXktJ1Z6b5tmVPK+UwCynGbvtQ3JDpgotmoOdjgteiQeyQ==
X-Received: by 2002:a81:f85:: with SMTP id 127mr23437852ywp.348.1554726287765; 
 Mon, 08 Apr 2019 05:24:47 -0700 (PDT)
Received: from ?IPv6:2600:1700:7b90:52f0:b578:f6d0:8ba9:f5f0?
 ([2600:1700:7b90:52f0:b578:f6d0:8ba9:f5f0])
 by smtp.gmail.com with ESMTPSA id e198sm1243969ywe.0.2019.04.08.05.24.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Apr 2019 05:24:47 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Doug Goldstein <cardoe@cardoe.com>
X-Mailer: iPhone Mail (16E227)
In-Reply-To: <20190408115031.27127-1-wei.liu2@citrix.com>
Date: Mon, 8 Apr 2019 07:24:46 -0500
Message-Id: <79329C0D-1F0B-4318-AB69-D4A035F8E597@cardoe.com>
References: <20190408115031.27127-1-wei.liu2@citrix.com>
To: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [Xen-devel] [PATCH] gitlab-ci: use git clean -ffdx in build
 each commit test
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408122446.lXn5uMdNbg0iCJ99__Vml-ZxhdnSG6AEKuViU0FHhMY@z>

Cj4gT24gQXByIDgsIDIwMTksIGF0IDY6NTAgQU0sIFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+IHdyb3RlOgo+IAo+IFRoZSBidWlsZCBzY3JpcHQgaW52b2tlZCBpcyBkZXNpZ25lZCB0byBy
dW4gaW4gYSBwcmlzdGluZSBjaGVja291dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgoKQWNrZWQtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2Fy
ZG9lLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
