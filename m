Return-Path: <SRS0=p1A9=2C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65968C43603
	for <xen-devel@archiver.kernel.org>; Thu, 12 Dec 2019 18:11:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C469214AF
	for <xen-devel@archiver.kernel.org>; Thu, 12 Dec 2019 18:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C469214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifSvO-0006DA-4w; Thu, 12 Dec 2019 18:10:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=poZg=2C=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1ifSvN-0006D5-5c
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 18:10:53 +0000
X-Inumbo-ID: b6a296b6-1d0a-11ea-a1e1-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6a296b6-1d0a-11ea-a1e1-bc764e2007e4;
 Thu, 12 Dec 2019 18:10:44 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z7so3728751wrl.13
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2019 10:10:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2FkS+4Qqd9YB/yfl4AmGYyT+drz3UF0FpODz0HkSGMA=;
 b=Ojf5p5r9E+Oi+j8J1RFrfY9y9pwcOoosJzOYUfgWPLHxzmkpBK/uBVbUXAlltpZhpZ
 nuYCWmWy6T+gGSGR30R61vR9Zl1KtK+XPN+VvBqV9/UhyDV3d3udNkAA7Yzc4H7I05iD
 l//0rpCFN3ln/BHqc37sc73YpYY5bLDA5XtxzvbtZH9kAdn1Y9jkWQmQzoBlw1CPs5O/
 qdgcdsfxSXobiiPGiialzIC/X1KLhcrjwenmo4sCwYMfCscGXWtLo7Pb5ZQDjqI6rTbw
 63BcN4wg38AaPik5Sf/b50p7X7/QEfB4LX74e8K4p30DK6S43uXqL+QQxyCjBMaKXTgi
 VGqQ==
X-Gm-Message-State: APjAAAVtFVABd5m++NWSHqTPzpBBvdBVN6Crf6qnG8kFJ70ybqWffxn6
 ml2snFIbTn/rsGBU/93+BzA=
X-Google-Smtp-Source: APXvYqw/uME6tOeL7OUNHpp0730NBNHkdBcAqsk97DSNHM6GFRhnhLP9/9ujUjhyVbAVN3av+4I7DA==
X-Received: by 2002:a5d:4d0e:: with SMTP id z14mr7540381wrt.208.1576174243640; 
 Thu, 12 Dec 2019 10:10:43 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id n189sm6278387wme.33.2019.12.12.10.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 10:10:43 -0800 (PST)
Date: Thu, 12 Dec 2019 18:10:41 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191212181041.mjuoy4el6h2jedhv@debian>
References: <20191212123723.21548-1-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212123723.21548-1-pdurrant@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH net] xen-netback: avoid race that can lead
 to NULL pointer dereference
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu@kernel.org>,
 Jakub Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTIsIDIwMTkgYXQgMTI6Mzc6MjNQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IENvbW1pdCAyYWMwNjFjZTk3ZjQgKCJ4ZW4vbmV0YmFjazogY2xlYW51cCBpbml0IGFu
ZCBkZWluaXQgY29kZSIpCj4gaW50cm9kdWNlZCBhIHByb2JsZW0uIEluIGZ1bmN0aW9uIHhlbnZp
Zl9kaXNjb25uZWN0X3F1ZXVlKCksIHRoZSB2YWx1ZSBvZgo+IHF1ZXVlLT5yeF9pcnEgaXMgemVy
b2VkICpiZWZvcmUqIHF1ZXVlLT50YXNrIGlzIHN0b3BwZWQuIFVuZm9ydHVuYXRlbHkgdGhhdAo+
IHRhc2sgbWF5IGNhbGwgbm90aWZ5X3JlbW90ZV92aWFfaXJxKHF1ZXVlLT5yeF9pcnEpIGFuZCBj
YWxsaW5nIHRoYXQKPiBmdW5jdGlvbiB3aXRoIGEgemVybyB2YWx1ZSByZXN1bHRzIGluIGEgTlVM
TCBwb2ludGVyIGRlcmVmZXJlbmNlIGluCj4gZXZ0Y2huX2Zyb21faXJxKCkuCj4gCj4gVGhpcyBw
YXRjaCBzaW1wbHkgcmUtb3JkZXJzIHRoaW5ncywgc3RvcHBpbmcgYWxsIHRhc2tzIGJlZm9yZSB6
ZXJvLWluZyB0aGUKPiBpcnEgdmFsdWVzLCB0aGVyZWJ5IGF2b2lkaW5nIHRoZSBwb3NzaWJpbGl0
eSBvZiB0aGUgcmFjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50
QGFtYXpvbi5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdUBrZXJuZWwub3JnPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
