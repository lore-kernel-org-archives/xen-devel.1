Return-Path: <SRS0=CJRG=4P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C53C4BA24
	for <xen-devel@archiver.kernel.org>; Thu, 27 Feb 2020 11:59:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8052424692
	for <xen-devel@archiver.kernel.org>; Thu, 27 Feb 2020 11:59:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="cGXBDR3p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8052424692
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7HpM-0004ES-NT; Thu, 27 Feb 2020 11:59:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3dmp=4P=amazon.com=prvs=3193da5bc=hongyxia@srs-us1.protection.inumbo.net>)
 id 1j7HpK-0004EN-MA
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 11:59:38 +0000
X-Inumbo-ID: 9f488f39-5958-11ea-9657-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f488f39-5958-11ea-9657-12813bfff9fa;
 Thu, 27 Feb 2020 11:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582804777; x=1614340777;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lkVsjLrSWFQb7g+jjQXvkXzwTizYoBT4ar0i86wa1cE=;
 b=cGXBDR3pn/Ik/cvdlNq2kjgyEgh+mei+gOeNQop5kWXKB6rWbsW7iVpq
 SVYKWJXaLzO8d1nZZsmTuP6FEFuJsyU5WqjqisMkM++95dAZjUEKBQ5w9
 ConSlSpZnj5+UgdBVNwUlk+/NAdoryDDCDQopW8sMytPzyox0yceRbjIe A=;
IronPort-SDR: peOlPmWwUMlAp+vVF8BkKcDjlJYAJyl/Lba4LXSB8WpGj04929q89TmAT+vSvWWe76LnQ6UzMI
 HRbUWkiI89eA==
X-IronPort-AV: E=Sophos;i="5.70,492,1574121600"; d="scan'208";a="19461037"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 27 Feb 2020 11:59:34 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 501D4C10A1; Thu, 27 Feb 2020 11:59:30 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 27 Feb 2020 11:59:30 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 27 Feb 2020 11:59:29 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Thu, 27 Feb 2020 11:59:29 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "julien@xen.org" <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] x86/mm: switch to new APIs in arch_init_memory
Thread-Index: AQHV7ViPI3K2dYTfuUOufICss3F3Tagu7bqAgAACT4A=
Date: Thu, 27 Feb 2020 11:59:29 +0000
Message-ID: <8357a3c2b9aac84339465b5bf87ebc48cc85a558.camel@amazon.com>
References: <e8ba0fb1451ef89c36b21a2063590baed2432031.1582799255.git.hongyxia@amazon.com>
 <d7db8364-e34b-4bf3-c166-70483e46eb97@xen.org>
In-Reply-To: <d7db8364-e34b-4bf3-c166-70483e46eb97@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.55]
Content-ID: <88D65C7EC967264DA2B28798C3DDA908@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] x86/mm: switch to new APIs in
 arch_init_memory
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDIwLTAyLTI3IGF0IDExOjUxICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+
IEhpIEhvbmd5YW4sDQo+IA0KPiBPbiAyNy8wMi8yMDIwIDEwOjI3LCBIb25neWFuIFhpYSB3cm90
ZToNCj4gPiAuLi4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2RvbWFpbl9wYWdl
LmgNCj4gPiBiL3hlbi9pbmNsdWRlL3hlbi9kb21haW5fcGFnZS5oDQo+ID4gaW5kZXggMzI2Njlh
MzMzOS4uYmZjM2JmNmFlYiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vZG9tYWlu
X3BhZ2UuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9kb21haW5fcGFnZS5oDQo+ID4gQEAg
LTcyLDQgKzcyLDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZA0KPiA+IHVubWFwX2RvbWFpbl9wYWdl
X2dsb2JhbChjb25zdCB2b2lkICp2YSkge307DQo+ID4gICANCj4gPiAgICNlbmRpZiAvKiAhQ09O
RklHX0RPTUFJTl9QQUdFICovDQo+ID4gICANCj4gPiArI2RlZmluZSBVTk1BUF9ET01BSU5fUEFH
RShwKSBkbyB7ICAgXA0KPiA+ICsgICAgaWYgKCBwICkgeyAgICAgICAgICAgICAgICAgICAgICBc
DQo+ID4gKyAgICAgICAgdW5tYXBfZG9tYWluX3BhZ2UocCk7ICAgICAgIFwNCj4gPiArICAgICAg
ICAocCkgPSBOVUxMOyAgICAgICAgICAgICAgICAgXA0KPiA+ICsgICAgfSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQo+ID4gK30gd2hpbGUgKCBmYWxzZSApDQo+IA0KPiBEbyB3ZSBu
ZWVkIHRvIGtlZXAgdGhlIGRvIHt9IHdoaWxlICgpPw0KDQpJIHRoaW5rIHdlIGRvLiBGb3IgZXhh
bXBsZToNCg0KaWYgKCBjb25kICkNCiAgICBVTk1BUF9ET01BSU5fUEFHRShwKTsNCmVsc2UNCiAg
ICBibGFoX2JsYWhfYmxhaCgpOw0KDQpJZiB3ZSByZW1vdmUgdGhlIGRvLXdoaWxlLCB0aGUgZWxz
ZSBjbGF1c2Ugd2lsbCBiZSBwYWlyZWQgd2l0aCB0aGUgaWYNCmluIFVOTUFQX0RPTUFJTl9QQUdF
KCk7DQoNCkhvbmd5YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
