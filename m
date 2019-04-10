Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61376C10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:56:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3504320830
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3504320830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEFaQ-00054Q-OH; Wed, 10 Apr 2019 15:56:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EKYK=SM=citrix.com=prvs=996b1c52f=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hEFaO-00053p-R5
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:56:28 +0000
X-Inumbo-ID: 32ee2459-5ba9-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 32ee2459-5ba9-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 15:56:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="88654223"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [PATCH 2/3] xen-bus: allow AioContext to be specified for each
 event channel
Thread-Index: AQHU7h4IPncTeUxY+ESOf6AKMI/BvKY1PAwAgABHK7D//+GTAIAAKsSQ
Date: Wed, 10 Apr 2019 15:56:14 +0000
Message-ID: <748b80facbb246d18fbb627f022439fd@AMSPEX02CL01.citrite.net>
References: <20190408151617.13025-1-paul.durrant@citrix.com>
 <20190408151617.13025-3-paul.durrant@citrix.com>
 <20190410125708.GE1435@perard.uk.xensource.com>
 <582f92f1ddf24985b75c32fe913784df@AMSPEX02CL01.citrite.net>
 <20190410152258.GG1435@perard.uk.xensource.com>
In-Reply-To: <20190410152258.GG1435@perard.uk.xensource.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410155614.KTgvA66zTnzQlQn_m64-dVp9hcT5SI5Tpfrekw-LZ3Y@z>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAxMCBBcHJpbCAyMDE5IDE2OjIz
Cj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1ibG9ja0Bub25nbnUub3JnOyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IFN0ZWZhbm8gU3RhYmVsbGluaQo+IDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPjsgS2V2aW4gV29sZiA8
a3dvbGZAcmVkaGF0LmNvbT47IE1heAo+IFJlaXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDIvM10geGVuLWJ1czogYWxsb3cgQWlvQ29udGV4dCB0byBiZSBzcGVj
aWZpZWQgZm9yIGVhY2ggZXZlbnQgY2hhbm5lbAo+IAo+IE9uIFdlZCwgQXByIDEwLCAyMDE5IGF0
IDA0OjIwOjA1UE0gKzAxMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPiA+ID4gRnJvbTogQW50aG9ueSBQRVJBUkQgW21haWx0bzphbnRob255
LnBlcmFyZEBjaXRyaXguY29tXQo+ID4gPiBTZW50OiAxMCBBcHJpbCAyMDE5IDEzOjU3Cj4gPiA+
IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+ID4gPiBDYzogcWVt
dS1kZXZlbEBub25nbnUub3JnOyBxZW11LWJsb2NrQG5vbmdudS5vcmc7IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZzsgU3RlZmFubwo+IFN0YWJlbGxpbmkKPiA+ID4gPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+OyBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+OyBLZXZp
biBXb2xmIDxrd29sZkByZWRoYXQuY29tPjsKPiBNYXgKPiA+ID4gUmVpdHogPG1yZWl0ekByZWRo
YXQuY29tPgo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10geGVuLWJ1czogYWxsb3cgQWlv
Q29udGV4dCB0byBiZSBzcGVjaWZpZWQgZm9yIGVhY2ggZXZlbnQgY2hhbm5lbAo+ID4gPgo+ID4g
PiBPbiBNb24sIEFwciAwOCwgMjAxOSBhdCAwNDoxNjoxNlBNICswMTAwLCBQYXVsIER1cnJhbnQg
d3JvdGU6Cj4gPiA+ID4gVGhpcyBwYXRjaCBhZGRzIGFuIEFpb0NvbnRleHQgcGFyYW1ldGVyIHRv
IHhlbl9kZXZpY2VfYmluZF9ldmVudF9jaGFubmVsKCkKPiA+ID4gPiBhbmQgdGhlbiB1c2VzIGFp
b19zZXRfZmRfaGFuZGxlcigpIHRvIHNldCB0aGUgY2FsbGJhY2sgcmF0aGVyIHRoYW4KPiA+ID4g
PiBxZW11X3NldF9mZF9oYW5kbGVyKCkuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQ
YXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+
IEBAIC05NDMsNiArOTQ0LDcgQEAgc3RhdGljIHZvaWQgeGVuX2RldmljZV9ldmVudCh2b2lkICpv
cGFxdWUpCj4gPiA+ID4gIH0KPiA+ID4gPgo+ID4gPiA+ICBYZW5FdmVudENoYW5uZWwgKnhlbl9k
ZXZpY2VfYmluZF9ldmVudF9jaGFubmVsKFhlbkRldmljZSAqeGVuZGV2LAo+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFpb0NvbnRleHQgKmN0
eCwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgcG9ydCwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBYZW5FdmVudEhhbmRsZXIgaGFuZGxlciwKPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpvcGFxdWUs
IEVycm9yICoqZXJycCkKPiA+ID4gPiBAQCAtOTY4LDggKzk3MCw5IEBAIFhlbkV2ZW50Q2hhbm5l
bCAqeGVuX2RldmljZV9iaW5kX2V2ZW50X2NoYW5uZWwoWGVuRGV2aWNlICp4ZW5kZXYsCj4gPiA+
ID4gICAgICBjaGFubmVsLT5oYW5kbGVyID0gaGFuZGxlcjsKPiA+ID4gPiAgICAgIGNoYW5uZWwt
Pm9wYXF1ZSA9IG9wYXF1ZTsKPiA+ID4gPgo+ID4gPiA+IC0gICAgcWVtdV9zZXRfZmRfaGFuZGxl
cih4ZW5ldnRjaG5fZmQoY2hhbm5lbC0+eGVoKSwgeGVuX2RldmljZV9ldmVudCwgTlVMTCwKPiA+
ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgY2hhbm5lbCk7Cj4gPiA+ID4gKyAgICBjaGFu
bmVsLT5jdHggPSBjdHg7Cj4gPiA+ID4gKyAgICBhaW9fc2V0X2ZkX2hhbmRsZXIoY2hhbm5lbC0+
Y3R4LCB4ZW5ldnRjaG5fZmQoY2hhbm5lbC0+eGVoKSwgZmFsc2UsCj4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgeGVuX2RldmljZV9ldmVudCwgTlVMTCwgTlVMTCwgY2hhbm5lbCk7Cj4g
PiA+Cj4gPiA+IEkgd29uZGVyIGlmIHRoZSBgJ2lzX2V4dGVybmFsJyBwYXJhbWV0ZXIgb2YgYWlv
X3NldF9mZF9oYW5kbGVyIHNob3VkIGJlCj4gPiA+IGB0cnVlJyBoZXJlLCBpbnN0ZWFkLiBUaGF0
IGZsYWcgc2VlbXMgdG8gYmUgdXNlZCB3aGVuIG1ha2luZyBhIHNuYXBzaG90Cj4gPiA+IG9mIGEg
YmxvY2tkZXYsIGZvciBleGFtcGxlLgo+ID4gPgo+ID4gPiBUaGF0IHdhcyBpbnRyb2R1Y2VkIGJ5
Ogo+ID4gPiBkY2EyMWVmMjNiYTQ4ZjZmMTQyOGM1OWYyOTVhODU3ZTVkYzIwM2M4Xi4uYzA3YmMy
YzE2NThmZmZlZWUwOGViNDY0MDJiMmY2NmQ1NWIwNzU4Ngo+ID4gPgo+ID4gPiBXaGF0IGRvIHlv
dSB0aGluaz8KPiA+Cj4gPiBJbnRlcmVzdGluZy4gSSBhZG1pdCBJIHdhcyBtZXJlbHkgdHJhbnNj
cmliaW5nIHdoYXQgcWVtdV9zZXRfZmRfaGFuZGxlcigpIHBhc3NlcyB3aXRob3V0IHJlYWxseQo+
IGxvb2tpbmcgaW50byB0aGUgdmFsdWVzLiBMb29raW5nIGF0IHRoZSBhcmd1bWVudHMgdGhhdCB2
aXJ0aW8tYmxrIHBhc3NlcyB0byBhaW9fc2V0X2V2ZW50X25vdGlmaWVyKCkKPiB0aG91Z2gsIGFu
ZCB3aGF0ICdpc19leHRlcm5hbCcgbWVhbnMsIGl0IHdvdWxkIGFwcGVhciB0aGF0IHNldHRpbmcg
aXQgdG8gdHJ1ZSBpcyBwcm9iYWJseSB0aGUgcmlnaHQKPiB0aGluZyB0byBkby4gRG8geW91IHdh
bnQgbWUgdG8gc2VuZCBhIHYyIG9mIHRoZSBzZXJpZXMgb3IgY2FuIHlvdSBmaXggaXQgdXA/Cj4g
Cj4gSSdsbCBmaXggdGhhdCB1cC4KClRoYW5rcywKCiAgUGF1bAoKPiAKPiBSZXZpZXdlZC1ieTog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gCj4gVGhhbmtzLAo+
IAo+IC0tCj4gQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
