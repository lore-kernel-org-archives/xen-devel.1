Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3268C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:32:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CDD920818
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CDD920818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEFCW-0002VE-El; Wed, 10 Apr 2019 15:31:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EKYK=SM=citrix.com=prvs=996b1c52f=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hEFCU-0002V9-Th
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:31:46 +0000
X-Inumbo-ID: bebc341d-5ba5-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bebc341d-5ba5-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 15:31:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="88651039"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [PATCH 2/3] xen-bus: allow AioContext to be specified for each
 event channel
Thread-Index: AQHU7h4IPncTeUxY+ESOf6AKMI/BvKY1PAwAgABHK7A=
Date: Wed, 10 Apr 2019 15:20:05 +0000
Message-ID: <582f92f1ddf24985b75c32fe913784df@AMSPEX02CL01.citrite.net>
References: <20190408151617.13025-1-paul.durrant@citrix.com>
 <20190408151617.13025-3-paul.durrant@citrix.com>
 <20190410125708.GE1435@perard.uk.xensource.com>
In-Reply-To: <20190410125708.GE1435@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/3] xen-bus: allow AioContext to be
 specified for each event channel
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
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAxMCBBcHJpbCAyMDE5IDEzOjU3
Cj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1ibG9ja0Bub25nbnUub3JnOyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IFN0ZWZhbm8gU3RhYmVsbGluaQo+IDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPjsgS2V2aW4gV29sZiA8
a3dvbGZAcmVkaGF0LmNvbT47IE1heAo+IFJlaXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDIvM10geGVuLWJ1czogYWxsb3cgQWlvQ29udGV4dCB0byBiZSBzcGVj
aWZpZWQgZm9yIGVhY2ggZXZlbnQgY2hhbm5lbAo+IAo+IE9uIE1vbiwgQXByIDA4LCAyMDE5IGF0
IDA0OjE2OjE2UE0gKzAxMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggYWRk
cyBhbiBBaW9Db250ZXh0IHBhcmFtZXRlciB0byB4ZW5fZGV2aWNlX2JpbmRfZXZlbnRfY2hhbm5l
bCgpCj4gPiBhbmQgdGhlbiB1c2VzIGFpb19zZXRfZmRfaGFuZGxlcigpIHRvIHNldCB0aGUgY2Fs
bGJhY2sgcmF0aGVyIHRoYW4KPiA+IHFlbXVfc2V0X2ZkX2hhbmRsZXIoKS4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+ID4gLS0t
Cj4gPiBAQCAtOTQzLDYgKzk0NCw3IEBAIHN0YXRpYyB2b2lkIHhlbl9kZXZpY2VfZXZlbnQodm9p
ZCAqb3BhcXVlKQo+ID4gIH0KPiA+Cj4gPiAgWGVuRXZlbnRDaGFubmVsICp4ZW5fZGV2aWNlX2Jp
bmRfZXZlbnRfY2hhbm5lbChYZW5EZXZpY2UgKnhlbmRldiwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFpb0NvbnRleHQgKmN0eCwKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBw
b3J0LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
WGVuRXZlbnRIYW5kbGVyIGhhbmRsZXIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB2b2lkICpvcGFxdWUsIEVycm9yICoqZXJycCkKPiA+IEBAIC05
NjgsOCArOTcwLDkgQEAgWGVuRXZlbnRDaGFubmVsICp4ZW5fZGV2aWNlX2JpbmRfZXZlbnRfY2hh
bm5lbChYZW5EZXZpY2UgKnhlbmRldiwKPiA+ICAgICAgY2hhbm5lbC0+aGFuZGxlciA9IGhhbmRs
ZXI7Cj4gPiAgICAgIGNoYW5uZWwtPm9wYXF1ZSA9IG9wYXF1ZTsKPiA+Cj4gPiAtICAgIHFlbXVf
c2V0X2ZkX2hhbmRsZXIoeGVuZXZ0Y2huX2ZkKGNoYW5uZWwtPnhlaCksIHhlbl9kZXZpY2VfZXZl
bnQsIE5VTEwsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgY2hhbm5lbCk7Cj4gPiArICAg
IGNoYW5uZWwtPmN0eCA9IGN0eDsKPiA+ICsgICAgYWlvX3NldF9mZF9oYW5kbGVyKGNoYW5uZWwt
PmN0eCwgeGVuZXZ0Y2huX2ZkKGNoYW5uZWwtPnhlaCksIGZhbHNlLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgeGVuX2RldmljZV9ldmVudCwgTlVMTCwgTlVMTCwgY2hhbm5lbCk7Cj4gCj4g
SSB3b25kZXIgaWYgdGhlIGAnaXNfZXh0ZXJuYWwnIHBhcmFtZXRlciBvZiBhaW9fc2V0X2ZkX2hh
bmRsZXIgc2hvdWQgYmUKPiBgdHJ1ZScgaGVyZSwgaW5zdGVhZC4gVGhhdCBmbGFnIHNlZW1zIHRv
IGJlIHVzZWQgd2hlbiBtYWtpbmcgYSBzbmFwc2hvdAo+IG9mIGEgYmxvY2tkZXYsIGZvciBleGFt
cGxlLgo+IAo+IFRoYXQgd2FzIGludHJvZHVjZWQgYnk6Cj4gZGNhMjFlZjIzYmE0OGY2ZjE0Mjhj
NTlmMjk1YTg1N2U1ZGMyMDNjOF4uLmMwN2JjMmMxNjU4ZmZmZWVlMDhlYjQ2NDAyYjJmNjZkNTVi
MDc1ODYKPiAKPiBXaGF0IGRvIHlvdSB0aGluaz8KCkludGVyZXN0aW5nLiBJIGFkbWl0IEkgd2Fz
IG1lcmVseSB0cmFuc2NyaWJpbmcgd2hhdCBxZW11X3NldF9mZF9oYW5kbGVyKCkgcGFzc2VzIHdp
dGhvdXQgcmVhbGx5IGxvb2tpbmcgaW50byB0aGUgdmFsdWVzLiBMb29raW5nIGF0IHRoZSBhcmd1
bWVudHMgdGhhdCB2aXJ0aW8tYmxrIHBhc3NlcyB0byBhaW9fc2V0X2V2ZW50X25vdGlmaWVyKCkg
dGhvdWdoLCBhbmQgd2hhdCAnaXNfZXh0ZXJuYWwnIG1lYW5zLCBpdCB3b3VsZCBhcHBlYXIgdGhh
dCBzZXR0aW5nIGl0IHRvIHRydWUgaXMgcHJvYmFibHkgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLiBE
byB5b3Ugd2FudCBtZSB0byBzZW5kIGEgdjIgb2YgdGhlIHNlcmllcyBvciBjYW4geW91IGZpeCBp
dCB1cD8KCiAgQ2hlZXJzLAoKICAgIFBhdWwKCj4gCj4gCj4gLS0KPiBBbnRob255IFBFUkFSRAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
