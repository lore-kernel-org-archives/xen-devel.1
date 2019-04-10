Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URI_NOVOWEL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5425C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:56:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B2D420830
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B2D420830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEFaP-00053x-FQ; Wed, 10 Apr 2019 15:56:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EKYK=SM=citrix.com=prvs=996b1c52f=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hEFaN-00053h-Ov
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:56:27 +0000
X-Inumbo-ID: 31c47d9b-5ba9-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 31c47d9b-5ba9-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 15:56:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="88654165"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [PATCH] xen-block: support feature-large-sector-size
Thread-Index: AQHU7vL42jGdm/0HCUKcYVWgh638bKY1a1GAgAAiQZA=
Date: Wed, 10 Apr 2019 15:55:24 +0000
Message-ID: <f76a3a96fabc4afbb96586a9b5fe682f@AMSPEX02CL01.citrite.net>
References: <20190409164038.25484-1-paul.durrant@citrix.com>
 <20190410155217.GH1435@perard.uk.xensource.com>
In-Reply-To: <20190410155217.GH1435@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen-block: support feature-large-sector-size
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAxMCBBcHJpbCAyMDE5IDE2OjUy
Cj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBxZW11LWJs
b2NrQG5vbmdudS5vcmc7IFN0ZWZhbm8gU3RhYmVsbGluaQo+IDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPjsgS2V2aW4gV29sZiA8
a3dvbGZAcmVkaGF0LmNvbT47IE1heAo+IFJlaXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4KPiBTdWJq
ZWN0OiBSZTogW1BBVENIXSB4ZW4tYmxvY2s6IHN1cHBvcnQgZmVhdHVyZS1sYXJnZS1zZWN0b3It
c2l6ZQo+IAo+IE9uIFR1ZSwgQXByIDA5LCAyMDE5IGF0IDA1OjQwOjM4UE0gKzAxMDAsIFBhdWwg
RHVycmFudCB3cm90ZToKPiA+IEEgcmVjZW50IFhlbiBjb21taXQgWzFdIGNsYXJpZmllZCB0aGUg
c2VtYW50aWNzIG9mIHNlY3RvciBiYXNlZCBxdWFudGl0aWVzCj4gPiB1c2VkIGluIHRoZSBibGtp
ZiBwcm90b2NvbCBzdWNoIHRoYXQgaXQgaXMgbm93IHNhZmUgdG8gY3JlYXRlIGEgeGVuLWJsb2Nr
Cj4gPiBkZXZpY2Ugd2l0aCBhIGxvZ2ljYWxfYmxvY2tfc2l6ZSAhPSA1MTIsIGFzIGxvbmcgYXMg
dGhlIGRldmljZSBvbmx5Cj4gPiBjb25uZWN0cyB0byBhIGZyb250ZW5kIGFkdmVydGl6aW5nICdm
ZWF0dXJlLWxhcmdlLWJsb2NrLXNpemUnLgo+ID4KPiA+IFRoaXMgcGF0Y2ggbW9kaWZpZXMgeGVu
LWJsb2NrIGFjY29yZGluZ2x5LiBJdCBhbHNvIHVzZXMgYSBzdGFjayB2YXJpYWJsZQo+ID4gZm9y
IHRoZSBCbG9ja0JhY2tlbmQgaW4geGVuX2Jsb2NrX3JlYWxpemUoKSB0byBhdm9pZCByZXBlYXRl
ZCBkZXJlZmVyZW5jaW5nCj4gPiBvZiB0aGUgQmxvY2tDb25mIHBvaW50ZXIsIGFuZCBjaGFuZ2Vz
IHRoZSBwYXJhbWV0ZXJzIG9mCj4gPiB4ZW5fYmxvY2tfZGF0YXBsYW5lX2NyZWF0ZSgpIHNvIHRo
YXQgdGhlIEJsb2NrQmFja2VuZCBwb2ludGVyIGFuZCBzZWN0b3IKPiA+IHNpemUgYXJlIHBhc3Nl
ZCBleHBpY2l0bHkgcmF0aGVyIHRoYW4gaW1wbGljaXRseSB2aWEgdGhlIEJsb2NrQ29uZi4KPiA+
Cj4gPiBUaGVzZSBtb2RpZmljYXRpb25zIGhhdmUgYmVlbiB0ZXN0ZWQgYWdhaW5zdCBhIHJlY2Vu
dCBXaW5kb3dzIFBWIFhFTlZCRAo+ID4gZHJpdmVyIFsyXSB1c2luZyBhIHhlbi1kaXNrIGRldmlj
ZSB3aXRoIGEgNGtCIGxvZ2ljYWwgYmxvY2sgc2l6ZS4KPiA+Cj4gPiBbMV0gaHR0cDovL3hlbmJp
dHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNvbW1pdDtoPTY3ZTFjMDUwZTM2YjJjOTkw
MGNjYTgzNjE4ZTU2MTg5ZWZmYmFkOTgKPiA+IFsyXSBodHRwczovL3dpbnB2ZHJ2YnVpbGQueGVu
cHJvamVjdC5vcmc6ODA4MC9qb2IvWEVOVkJELW1hc3Rlci8xMjYKPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiBk
aWZmIC0tZ2l0IGEvaHcvYmxvY2sveGVuLWJsb2NrLmMgYi9ody9ibG9jay94ZW4tYmxvY2suYwo+
ID4gaW5kZXggZWY2MzViZTRjMi4uMDVlODkwYWQ3OCAxMDA2NDQKPiA+IC0tLSBhL2h3L2Jsb2Nr
L3hlbi1ibG9jay5jCj4gPiArKysgYi9ody9ibG9jay94ZW4tYmxvY2suYwo+ID4gQEAgLTUxLDEx
ICs1MSwyNSBAQCBzdGF0aWMgdm9pZCB4ZW5fYmxvY2tfY29ubmVjdChYZW5EZXZpY2UgKnhlbmRl
diwgRXJyb3IgKiplcnJwKQo+IFsuLi5dCj4gPiArICAgIGlmICh4ZW5fZGV2aWNlX2Zyb250ZW5k
X3NjYW5mKHhlbmRldiwgImZlYXR1cmUtbGFyZ2Utc2VjdG9yLXNpemUiLCAiJXUiLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZmVhdHVyZV9sYXJnZV9zZWN0b3Jfc2l6
ZSkgIT0gMSkgewo+ID4gKyAgICAgICAgZmVhdHVyZV9sYXJnZV9zZWN0b3Jfc2l6ZSA9IDA7Cj4g
PiArICAgIH0KPiA+ICsKPiA+ICsgICAgaWYgKGZlYXR1cmVfbGFyZ2Vfc2VjdG9yX3NpemUgIT0g
MSAmJgo+ID4gKyAgICAgICAgY29uZi0+bG9naWNhbF9ibG9ja19zaXplICE9IFhFTl9CTEtJRl9T
RUNUT1JfU0laRSkgewo+ID4gKyAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAibG9naWNhbF9ibG9j
a19zaXplICE9ICV1IG5vdCBzdXBwb3J0ZWQiLAo+IAo+IE1heWJlIGFkZCAiYnkgZnJvbnRlbmQi
IHRvIHRoZSBlcnJvciBtZXNzYWdlPwoKWWVzLCBJJ20gZmluZSB3aXRoIHRoYXQgYWRkaXRpb24u
Cgo+IAo+ID4gKyAgICAgICAgICAgICAgICAgICBYRU5fQkxLSUZfU0VDVE9SX1NJWkUpOwo+ID4g
KyAgICAgICAgcmV0dXJuOwo+ID4gKyAgICB9Cj4gPiArCj4gCj4gV2l0aCB0aGUgcXVlc3Rpb24g
YW5zd2VyZWQ6Cj4gUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPgo+IAoKVGhhbmtzLAoKICBQYXVsCgo+IFRoYW5rcywKPiAKPiAtLQo+IEFudGhv
bnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
