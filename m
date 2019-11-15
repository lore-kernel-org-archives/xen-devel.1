Return-Path: <SRS0=w8Ow=ZH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781CFC432C3
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 11:33:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C112072D
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 11:33:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="e8qZxWHd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C112072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVZqv-0001Hv-Ht; Fri, 15 Nov 2019 11:33:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IpEL=ZH=amazon.com=prvs=215a7c561=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iVZqu-0001Hp-OO
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 11:33:24 +0000
X-Inumbo-ID: bbebbfbe-079b-11ea-adbe-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbebbfbe-079b-11ea-adbe-bc764e2007e4;
 Fri, 15 Nov 2019 11:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1573817604; x=1605353604;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QlLKAr+gbckJnjj0CwR8dZXpKwoA7Jy6hz/F/x4yjqc=;
 b=e8qZxWHd+g9tt1az0O8IUxFdbghHlzd77yOMT20I4H5gaUIN+b8hxKlr
 vJMYmHUmFL57yGAJj9LdS1A47UfLR3Ve1apcaE+AjSnhVptQ05WbKZjZt
 Foa8wEaLxxCvIgHJAv0DOhY6xNQd8sLq2NUFQV3NBNMlpSGXqAdtUDIE4 s=;
IronPort-SDR: xACG6+eZFHkbmKf7j3Dhmn8GdoKL1RpyTwd+ztQm69MspCCLJxipvtMIiMS7IZ/PI2wm4S9Qcs
 LfLn1kVznjmw==
X-IronPort-AV: E=Sophos;i="5.68,308,1569283200"; 
   d="scan'208";a="4588669"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 15 Nov 2019 11:33:23 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id C5CE9241D17; Fri, 15 Nov 2019 11:33:22 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 15 Nov 2019 11:33:22 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 15 Nov 2019 11:33:21 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 15 Nov 2019 11:33:21 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v2 0/2] AMD/IOMMU: re-work mode updating
Thread-Index: AQHVmwqlycWKY+rFqEawMIh3cfjNZ6eK60TQgAEMvACAACFCIA==
Date: Fri, 15 Nov 2019 11:33:21 +0000
Message-ID: <503209fd122f46e6b137fe9eef691212@EX13D32EUC003.ant.amazon.com>
References: <8e8866de-33a8-68c0-3352-d6dfeec4a9b6@suse.com>
 <3f17589409b24992a3aac0f357b1cd56@EX13D32EUC003.ant.amazon.com>
 <32bd3ef3-8045-5fda-4a53-70adc20ad37e@suse.com>
In-Reply-To: <32bd3ef3-8045-5fda-4a53-70adc20ad37e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.193]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 0/2] AMD/IOMMU: re-work mode updating
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sander Eikelenboom <linux@eikelenboom.it>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDE1IE5vdmVtYmVyIDIwMTkgMDk6MjkNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
OyBTYW5kZXIgRWlrZWxlbmJvb20gPGxpbnV4QGVpa2VsZW5ib29tLml0PjsNCj4gSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENI
IHYyIDAvMl0gQU1EL0lPTU1VOiByZS13b3JrIG1vZGUgdXBkYXRpbmcNCj4gDQo+IE9uIDE0LjEx
LjIwMTkgMTg6MjksICBEdXJyYW50LCBQYXVsICB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0
cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+IEphbg0KPiA+PiBCZXVsaWNoDQo+ID4+
IFNlbnQ6IDE0IE5vdmVtYmVyIDIwMTkgMTY6NDINCj4gPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiA+PiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjsg
U2FuZGVyIEVpa2VsZW5ib29tDQo+ID4+IDxsaW51eEBlaWtlbGVuYm9vbS5pdD47IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+ID4+IFN1YmplY3Q6IFtYZW4tZGV2
ZWxdIFtQQVRDSCB2MiAwLzJdIEFNRC9JT01NVTogcmUtd29yayBtb2RlIHVwZGF0aW5nDQo+ID4+
DQo+ID4+IHVwZGF0ZV9wYWdpbmdfbW9kZSgpIGluIHRoZSBBTUQgSU9NTVUgY29kZSBleHBlY3Rz
IHRvIGJlIGludm9rZWQgd2l0aA0KPiA+PiB0aGUgUENJIGRldmljZXMgbG9jayBoZWxkLiBUaGUg
Y2hlY2sgb2NjdXJyaW5nIG9ubHkgd2hlbiB0aGUgbW9kZQ0KPiA+PiBhY3R1YWxseSBuZWVkcyB1
cGRhdGluZywgdGhlIHZpb2xhdGlvbiBvZiB0aGlzIHJ1bGUgYnkgdGhlIG1ham9yaXR5DQo+ID4+
IG9mIGNhbGxlcnMgZGlkIGdvIHVubm90aWNlZCB1bnRpbCBwZXItZG9tYWluIElPTU1VIHNldHVw
IHdhcyBjaGFuZ2VkDQo+ID4+IHRvIGRvIGF3YXkgd2l0aCBvbi1kZW1hbmQgY3JlYXRpb24gb2Yg
SU9NTVUgcGFnZSB0YWJsZXMuDQo+ID4NCj4gPiBXb3VsZG4ndCBpdCBiZSBzYWZlciB0byBqdXN0
IGdldCByaWQgb2YgdXBkYXRlX3BhZ2luZ19tb2RlKCkgYW5kIHN0YXJ0DQo+ID4gd2l0aCBhIHJl
YXNvbmFibGUgbnVtYmVyIG9mIGxldmVscz8NCj4gDQo+IEFuZHJldyBkaWQgYmFzaWNhbGx5IGFz
ayB0aGUgc2FtZSwgYnV0IEkgY29udGludWUgdG8gYmUgdW5jb252aW5jZWQ6DQo+IFdlIGNhbid0
IHBpY2sgYSAicmVhc29uYWJsZSIgbGV2ZWwsIHdlIGhhdmUgdG8gcGljayB0aGUgbWF4aW11bSBh
DQo+IGd1ZXN0IG1heSBlbmQgdXAgdXNpbmcuIFlldCB3aHkgd291bGQgd2Ugd2FudCB0byBoYXZl
IGFsbCBndWVzdHMgcGF5DQo+IHRoZSBwcmljZSBvZiBhdCBsZWFzdCBvbmUgdW5uZWNlc3Nhcnkg
cGFnZSB3YWxrIGxldmVsPyBJIGRvbid0IG1lYW4NCj4gdG8gc2F5IEknbSBlbnRpcmVseSBvcHBv
c2VkLCBidXQgdHJhZGluZyBjb2RlIHNpbXBsaWNpdHkgZm9yDQo+IHBlcmZvcm1hbmNlIGlzIGFs
bW9zdCBuZXZlciBhbiBlYXN5IG9yIG9idmlvdXMgZGVjaXNpb24uDQoNCkkgdGhpbmsgaW4gdGhp
cyBjYXNlLCB2ZXJzdXMgdGhlIGhvb3BzIHlvdXIgcGF0Y2hlcyBoYXZlIHRvIGp1bXAgdGhyb3Vn
aCBqdXN0IHRvIHNhdmUgKHBvc3NpYmx5KSBhIGxldmVsIG9mIElPTU1VIHBhZ2Ugd2FsaywgdGhl
IHNpbXBsaWNpdHkgYXJndW1lbnQgaXMgcXVpdGUgY29tcGVsbGluZy4uLiBwYXJ0aWN1bGFybHkg
YXQgdGhpcyBzdGFnZSBpbiB0aGUgcmVsZWFzZSBjeWNsZS4NClRoZSBmYWN0IHRoYXQgd2UgZG9u
J3Qga25vdywgYXQgc3RhcnQgb2YgZGF5LCB3aGF0IHRoZSBtYXggZ2ZuIG9mIHRoZSBndWVzdCBp
cyBnb2luZyB0byBiZSBpcyBhbHNvIHNvbWV0aGluZyB0aGF0IHJlYWxseSBvdWdodCB0byBiZSBm
aXhlZCB0b28uLi4gYnV0IHRoYXQgaXMgYW5vdGhlciBkZWJhdGUuDQoNCiAgUGF1bA0KDQo+IA0K
PiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
