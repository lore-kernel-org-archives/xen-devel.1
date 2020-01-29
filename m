Return-Path: <SRS0=uIqA=3S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724BBC2D0DB
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jan 2020 12:58:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E1052071E
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jan 2020 12:58:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.co.uk header.i=@amazon.co.uk header.b="dJCuTzd8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E1052071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwmuW-0003gu-QJ; Wed, 29 Jan 2020 12:57:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwmuW-0003gp-6A
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:57:36 +0000
X-Inumbo-ID: ebd34c84-4296-11ea-88b7-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebd34c84-4296-11ea-88b7-12813bfff9fa;
 Wed, 29 Jan 2020 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580302655; x=1611838655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HfKbtwkhjg0VXI0dEC52sltla5xLlrGS8CI7DgwHeeE=;
 b=dJCuTzd8y3agXoqceGgY4rGXtMup9oOfZfIq2ey9eGiu4fyLuObzhRHA
 7ya8r1SAi4UR+HNTA15J5m8z5jNbpJAADVS/EZffwTs+hv1ZN08F0BfpN
 0UnBh4Z+5VjvF0hMfo3Nw9St/MIXSu/CUzDlyw7YtwjllyRx6QLPFbNjR M=;
IronPort-SDR: wZKklZIVRcp36i2FRPd8tBOEXl4h0rYu22hmvSNE4AUetnHO7bQfvn46RCd4I4ktxLuZ8gEqig
 NXVCNKjedyuA==
X-IronPort-AV: E=Sophos;i="5.70,377,1574121600"; d="scan'208";a="14674784"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-2225282c.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 29 Jan 2020 12:57:34 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-2225282c.us-west-2.amazon.com (Postfix) with ESMTPS
 id 65742A2915; Wed, 29 Jan 2020 12:57:33 +0000 (UTC)
Received: from EX13D08UEE002.ant.amazon.com (10.43.62.92) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 12:57:32 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D08UEE002.ant.amazon.com (10.43.62.92) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 12:57:32 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 29 Jan 2020 12:57:31 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [ANNOUNCE] Xen 4.14 Development Update
Thread-Index: AQHV1qC3v/Fua/b59UacJxMyrVG64agBlikAgAAD1jA=
Date: Wed, 29 Jan 2020 12:57:31 +0000
Message-ID: <f7e6f63ef87e44439db006d33fb6dcb9@EX13D32EUC003.ant.amazon.com>
References: <20200129123618.1202-1-pdurrant@amazon.com>
 <20200129124330.GG15453@mail-itl>
In-Reply-To: <20200129124330.GG15453@mail-itl>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.14 Development Update
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "luwei.kang@intel.com" <luwei.kang@intel.com>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQo+IFNlbnQ6IDI5IEph
bnVhcnkgMjAyMCAxMjo0NA0KPiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBE
dXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+DQo+IENjOiBXb29kaG91c2UsIERh
dmlkIDxkd213QGFtYXpvbi5jby51az47IGx1d2VpLmthbmdAaW50ZWwuY29tOw0KPiBhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tOyByb2dlci5wYXVAY2l0cml4LmNvbQ0KPiBTdWJqZWN0OiBSZTog
W0FOTk9VTkNFXSBYZW4gNC4xNCBEZXZlbG9wbWVudCBVcGRhdGUNCj4gDQo+IE9uIFdlZCwgSmFu
IDI5LCAyMDIwIGF0IDEyOjM2OjE4UE0gKzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiAq
ICBMaW51eCBzdHViIGRvbWFpbnMgKFJGQyB2MikNCj4gPiAgIC0gIE1hcmVrIE1hcmN6eWtvd3Nr
aS1Hw7NyZWNraQ0KPiANCj4gVGhlcmUgaXMgdjQgc2VyaWVzIGFscmVhZHkuDQo+IA0KDQpUaGFu
a3MuIFdpbGwgdXBkYXRlIGZvciBuZXh0IHRpbWUuDQoNCiAgUGF1bA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
