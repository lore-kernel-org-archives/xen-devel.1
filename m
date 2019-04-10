Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C12C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:24:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBA8420820
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBA8420820
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEF56-0001XC-Bg; Wed, 10 Apr 2019 15:24:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Da5p=SM=citrix.com=prvs=9966e4c82=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hEF55-0001X7-Rf
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:24:07 +0000
X-Inumbo-ID: ad983cfd-5ba4-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ad983cfd-5ba4-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 15:24:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83237225"
Date: Wed, 10 Apr 2019 16:22:58 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190410152258.GG1435@perard.uk.xensource.com>
References: <20190408151617.13025-1-paul.durrant@citrix.com>
 <20190408151617.13025-3-paul.durrant@citrix.com>
 <20190410125708.GE1435@perard.uk.xensource.com>
 <582f92f1ddf24985b75c32fe913784df@AMSPEX02CL01.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <582f92f1ddf24985b75c32fe913784df@AMSPEX02CL01.citrite.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
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

T24gV2VkLCBBcHIgMTAsIDIwMTkgYXQgMDQ6MjA6MDVQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IEFudGhvbnkgUEVS
QVJEIFttYWlsdG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiA+IFNlbnQ6IDEwIEFwcmls
IDIwMTkgMTM6NTcKPiA+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29t
Pgo+ID4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1ibG9ja0Bub25nbnUub3JnOyB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFN0ZWZhbm8gU3RhYmVsbGluaQo+ID4gPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5j
b20+OyBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29tPjsgTWF4Cj4gPiBSZWl0eiA8bXJlaXR6
QHJlZGhhdC5jb20+Cj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10geGVuLWJ1czogYWxsb3cg
QWlvQ29udGV4dCB0byBiZSBzcGVjaWZpZWQgZm9yIGVhY2ggZXZlbnQgY2hhbm5lbAo+ID4gCj4g
PiBPbiBNb24sIEFwciAwOCwgMjAxOSBhdCAwNDoxNjoxNlBNICswMTAwLCBQYXVsIER1cnJhbnQg
d3JvdGU6Cj4gPiA+IFRoaXMgcGF0Y2ggYWRkcyBhbiBBaW9Db250ZXh0IHBhcmFtZXRlciB0byB4
ZW5fZGV2aWNlX2JpbmRfZXZlbnRfY2hhbm5lbCgpCj4gPiA+IGFuZCB0aGVuIHVzZXMgYWlvX3Nl
dF9mZF9oYW5kbGVyKCkgdG8gc2V0IHRoZSBjYWxsYmFjayByYXRoZXIgdGhhbgo+ID4gPiBxZW11
X3NldF9mZF9oYW5kbGVyKCkuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFu
dCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gPiA+IC0tLQo+ID4gPiBAQCAtOTQzLDYgKzk0
NCw3IEBAIHN0YXRpYyB2b2lkIHhlbl9kZXZpY2VfZXZlbnQodm9pZCAqb3BhcXVlKQo+ID4gPiAg
fQo+ID4gPgo+ID4gPiAgWGVuRXZlbnRDaGFubmVsICp4ZW5fZGV2aWNlX2JpbmRfZXZlbnRfY2hh
bm5lbChYZW5EZXZpY2UgKnhlbmRldiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQWlvQ29udGV4dCAqY3R4LAo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcG9ydCwKPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWGVuRXZl
bnRIYW5kbGVyIGhhbmRsZXIsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHZvaWQgKm9wYXF1ZSwgRXJyb3IgKiplcnJwKQo+ID4gPiBAQCAtOTY4
LDggKzk3MCw5IEBAIFhlbkV2ZW50Q2hhbm5lbCAqeGVuX2RldmljZV9iaW5kX2V2ZW50X2NoYW5u
ZWwoWGVuRGV2aWNlICp4ZW5kZXYsCj4gPiA+ICAgICAgY2hhbm5lbC0+aGFuZGxlciA9IGhhbmRs
ZXI7Cj4gPiA+ICAgICAgY2hhbm5lbC0+b3BhcXVlID0gb3BhcXVlOwo+ID4gPgo+ID4gPiAtICAg
IHFlbXVfc2V0X2ZkX2hhbmRsZXIoeGVuZXZ0Y2huX2ZkKGNoYW5uZWwtPnhlaCksIHhlbl9kZXZp
Y2VfZXZlbnQsIE5VTEwsCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICBjaGFubmVsKTsK
PiA+ID4gKyAgICBjaGFubmVsLT5jdHggPSBjdHg7Cj4gPiA+ICsgICAgYWlvX3NldF9mZF9oYW5k
bGVyKGNoYW5uZWwtPmN0eCwgeGVuZXZ0Y2huX2ZkKGNoYW5uZWwtPnhlaCksIGZhbHNlLAo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICB4ZW5fZGV2aWNlX2V2ZW50LCBOVUxMLCBOVUxMLCBj
aGFubmVsKTsKPiA+IAo+ID4gSSB3b25kZXIgaWYgdGhlIGAnaXNfZXh0ZXJuYWwnIHBhcmFtZXRl
ciBvZiBhaW9fc2V0X2ZkX2hhbmRsZXIgc2hvdWQgYmUKPiA+IGB0cnVlJyBoZXJlLCBpbnN0ZWFk
LiBUaGF0IGZsYWcgc2VlbXMgdG8gYmUgdXNlZCB3aGVuIG1ha2luZyBhIHNuYXBzaG90Cj4gPiBv
ZiBhIGJsb2NrZGV2LCBmb3IgZXhhbXBsZS4KPiA+IAo+ID4gVGhhdCB3YXMgaW50cm9kdWNlZCBi
eToKPiA+IGRjYTIxZWYyM2JhNDhmNmYxNDI4YzU5ZjI5NWE4NTdlNWRjMjAzYzheLi5jMDdiYzJj
MTY1OGZmZmVlZTA4ZWI0NjQwMmIyZjY2ZDU1YjA3NTg2Cj4gPiAKPiA+IFdoYXQgZG8geW91IHRo
aW5rPwo+IAo+IEludGVyZXN0aW5nLiBJIGFkbWl0IEkgd2FzIG1lcmVseSB0cmFuc2NyaWJpbmcg
d2hhdCBxZW11X3NldF9mZF9oYW5kbGVyKCkgcGFzc2VzIHdpdGhvdXQgcmVhbGx5IGxvb2tpbmcg
aW50byB0aGUgdmFsdWVzLiBMb29raW5nIGF0IHRoZSBhcmd1bWVudHMgdGhhdCB2aXJ0aW8tYmxr
IHBhc3NlcyB0byBhaW9fc2V0X2V2ZW50X25vdGlmaWVyKCkgdGhvdWdoLCBhbmQgd2hhdCAnaXNf
ZXh0ZXJuYWwnIG1lYW5zLCBpdCB3b3VsZCBhcHBlYXIgdGhhdCBzZXR0aW5nIGl0IHRvIHRydWUg
aXMgcHJvYmFibHkgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLiBEbyB5b3Ugd2FudCBtZSB0byBzZW5k
IGEgdjIgb2YgdGhlIHNlcmllcyBvciBjYW4geW91IGZpeCBpdCB1cD8KCkknbGwgZml4IHRoYXQg
dXAuCgpSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
