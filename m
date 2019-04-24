Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EF7C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 14:28:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D71DD20811
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 14:28:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="CMHR62pi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D71DD20811
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJIsk-0002Jm-Si; Wed, 24 Apr 2019 14:28:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5eZ0=S2=amazon.de=prvs=010cd84d8=snu@srs-us1.protection.inumbo.net>)
 id 1hJIsj-0002Jc-5g
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 14:28:17 +0000
X-Inumbo-ID: 31678f8e-669d-11e9-92d7-bc764e045a96
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 31678f8e-669d-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 14:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1556116095; x=1587652095;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:mime-version:content-transfer-encoding;
 bh=RN7NrAidzCciUgLFiBXdvQ7yHDauZ/iF8dyM8y5IaMM=;
 b=CMHR62piAKhZ983jC0PcCK9ZBvN85itjlI5M9jfb4nd4i5NxNe6AsGy6
 6aRU6wU4GrTpmFV2GOXENb+Xk65Z/rHFBmcjr3bsMa/8yDSuJixIjtRtT
 lDQroGoPxzVCQEQ51yTZKawMD9iPVIxUxL5OOySpkzR1b0VgMZhDFb+fn k=;
X-IronPort-AV: E=Sophos;i="5.60,390,1549929600"; d="scan'208";a="393650524"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 24 Apr 2019 14:27:56 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x3OERuom122524
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Wed, 24 Apr 2019 14:27:56 GMT
Received: from EX13D07EUB003.ant.amazon.com (10.43.166.173) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 24 Apr 2019 14:27:55 +0000
Received: from EX13D07EUB004.ant.amazon.com (10.43.166.234) by
 EX13D07EUB003.ant.amazon.com (10.43.166.173) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 24 Apr 2019 14:27:54 +0000
Received: from EX13D07EUB004.ant.amazon.com ([10.43.166.234]) by
 EX13D07EUB004.ant.amazon.com ([10.43.166.234]) with mapi id 15.00.1367.000;
 Wed, 24 Apr 2019 14:27:54 +0000
From: "Nuernberger, Stefan" <snu@amazon.de>
To: "mathieu.tarral@protonmail.com" <mathieu.tarral@protonmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] VMI: singlestep event not received
Thread-Index: AQHU+JH3sennzk29skK752I4zI8yEaZLYqgA
Date: Wed, 24 Apr 2019 14:27:53 +0000
Message-ID: <1556116072.914.54.camel@amazon.de>
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
In-Reply-To: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.160.175]
Content-ID: <B532F90E9A37644386C00FB3D156657E@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] VMI: singlestep event not received
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424142753.Y7wozfLtto4bwJfRjcp6dfhNPbH-pXzvtdJ1-Dzs0zU@z>

T24gU3VuLCAyMDE5LTA0LTIxIGF0IDIyOjI2ICswMDAwLCBNYXRoaWV1IFRhcnJhbCB3cm90ZToN
Cj4gSGksDQo+IA0KPiBJJ20gaGF2aW5nIGFuIGlzc3VlIHdpdGggWGVuJ3MgVk1JIHN1YnN5c3Rl
bS4NCj4gDQo+IE15IGdvYWwgaXMgdG8gYnVpbGQgYSBzbWFsbCBkZWJ1Z2dlciB0aGF0IGNhbiBi
cmVhayBhdCBhbg0KPiBhcHBsaWNhdGlvbidzIGVudHJ5cG9pbnQNCj4gb24gV2luZG93cyBYUCwg
d2hlbiBhIG5ldyBwcm9jZXNzIGlzIGJlaW5nIGNyZWF0ZWQuDQo+IA0KDQpUaGVyZSB3YXMgYW4g
YW5ub3VuY2VtZW50IGEgd2hpbGUgYmFjayBvbiB0aGlzIGxpc3Qgb2YgYSBtb3JlIG1vZGVybg0K
eGVuIGRlYnVnZ2VyIGZvciBWTUkgcHVycG9zZXMuIE1heWJlIHlvdSBhcmUgbW9yZSBsdWNreSB3
aXRoIHRoYXQgb25lPw0KDQpodHRwczovL3d3dy5uY2Nncm91cC50cnVzdC91cy9hYm91dC11cy9u
ZXdzcm9vbS1hbmQtZXZlbnRzL2Jsb2cvMjAxOS9qYQ0KbnVhcnkveGVuZGJnLWEtZnVsbC1mZWF0
dXJlZC1kZWJ1Z2dlci1mb3ItdGhlLXhlbi1oeXBlcnZpc29yLw0KDQpodHRwczovL2dpdGh1Yi5j
b20vbmNjZ3JvdXAveGVuZGJnDQoNCihJIGhhdmUgbm90IHlldCB0cmllZCBpdCwgdGhvdWdoLikN
Cg0KLSBTdGVmYW4NCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICkty
YXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNj
aGxhZWdlciwgUmFsZiBIZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2Vu
IGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
