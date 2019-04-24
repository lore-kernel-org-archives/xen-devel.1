Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66823C282CE
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 11:03:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BA4B218D3
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 11:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BA4B218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJFfv-0003dj-Kw; Wed, 24 Apr 2019 11:02:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rs1d=S2=citrix.com=prvs=010ed0f85=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hJFfu-0003de-SZ
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 11:02:50 +0000
X-Inumbo-ID: 7efd6c22-6680-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7efd6c22-6680-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 11:02:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,389,1549929600"; d="scan'208";a="89223029"
Date: Wed, 24 Apr 2019 13:01:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190424110150.ixk6cl45lfbpwuvy@Air-de-Roger>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <970b4dcfb4e3c04bc9502c7656caa61d2f8c0677.camel@epam.com>
 <8210e96d-c7cd-384e-3277-21fdbfc32105@arm.com>
 <alpine.DEB.2.10.1904161543460.1370@sstabellini-ThinkPad-X260>
 <34d8cf3f-e262-e3ab-b9e3-3c0dcbd75e37@arm.com>
 <92811c0c44411ab28eefce1aa7028bf0c426ea80.camel@epam.com>
 <91a841b7-424a-79a3-b551-15587bf92ed3@arm.com>
 <18f9d557324a69437cd062aeced21e6b4759a968.camel@epam.com>
 <b9051090-b6a6-a0de-d460-0533d300744f@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9051090-b6a6-a0de-d460-0533d300744f@arm.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 00/12] xen/arm: Add support to build with
 clang
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424110150.53DwX8osa6-G3gcJNzuTtBisrZ4gHY6dupFgkn039pU@z>

T24gVGh1LCBBcHIgMTgsIDIwMTkgYXQgMDc6MzM6MDVQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+ICgrIFJvZ2VyKQo+IAo+IE9uIDE4LzA0LzIwMTkgMTI6MTUsIEFydGVtIE15Z2FpZXYg
d3JvdGU6Cj4gPiBIaSBKdWxpZW4KPiA+IAo+ID4gT24gVGh1LCAyMDE5LTA0LTE4IGF0IDExOjQz
ICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IE9uIDE4LzA0LzIwMTkgMTA6MTUsIEFy
dGVtIE15Z2FpZXYgd3JvdGU6Cj4gPiA+ID4gSGVsbG8gSnVsaWVuLCBTdGVmYW5vCj4gPiA+IAo+
ID4gPiBIaSBBcnRlbSwKPiA+ID4gCj4gPiA+ID4gT24gV2VkLCAyMDE5LTA0LTE3IGF0IDEwOjQy
ICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+ID4gPiBIaSwKPiA+ID4gPiA+IAo+ID4g
PiA+ID4gT24gMTYvMDQvMjAxOSAyMzo0MywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4g
PiA+ID4gPiBPbiBGcmksIDI5IE1hciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+ID4g
PiA+ID4gT24gMjgvMDMvMjAxOSAxMToyNywgQXJ0ZW0gTXlnYWlldiB3cm90ZToKPiA+ID4gPiA+
ID4gPiA+IEhpIEp1bGllbiwKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBIaSBBcnRlbSwK
PiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IE9uIFdlZCwgMjAxOS0wMy0yNyBhdCAxODo0
NSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPiBIaSBhbGwsCj4g
PiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBv
cnQgdG8gYnVpbGQgWGVuIEFybSB3aXRoIGNsYW5nLgo+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIHNl
cmllcyB3YXMKPiA+ID4gPiA+ID4gPiA+ID4gdGVzdGVkCj4gPiA+ID4gPiA+ID4gPiA+IHdpdGgg
Y2xhbmcgOC4wLgo+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gTm90ZSB0aGF0
IEkgb25seSBkaWQgYnVpbGQgZm9yIGFybTY0LiBJIHN0aWxsIG5lZWQgdG8KPiA+ID4gPiA+ID4g
PiA+ID4gbG9vayBhdCB0aGUgYXJtMzIKPiA+ID4gPiA+ID4gPiA+ID4gYnVpbGQuCj4gPiA+ID4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBJIHdvbmRlciBpZiB5
b3UgaGF2ZSB0aW1lIHRvIHRyeSB0aGUgc2VyaWVzIHdpdGggQXJtCj4gPiA+ID4gPiA+ID4gPiBD
b21waWxlciA2PyBJIGFtCj4gPiA+ID4gPiA+ID4gPiBhc2tpbmcgYmVjYXVzZSBBRkFJSyBpdCBp
cyBiYXNlZCBvbiBjbGFuZy9sbHZtIFsxXSBhbmQKPiA+ID4gPiA+ID4gPiA+IHRoZXJlJ3MgYQo+
ID4gPiA+ID4gPiA+ID4gc2FmZXR5LWNvbXBsaWFudCB2ZXJzaW9uIG9mIGl0IGNlcnRpZmllZCBi
eSBUVVYgWzJdLiBJCj4gPiA+ID4gPiA+ID4gPiBkb24ndCBoYXZlIGEKPiA+ID4gPiA+ID4gPiA+
IGxpY2Vuc2UgeWV0IHNvIGNhbm5vdCB0cnkgaXQgbXlzZWxmIGJ1dCBtYXliZSB5b3UgaGF2ZQo+
ID4gPiA+ID4gPiA+ID4gYWNjZXNzLgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEkgZ2F2
ZSBhIHF1aWNrIHRyeSB0byB0aGUgQXJtIENvbXBpbGVyLiBJIGhhZCB0byBoYWNrIGEgYml0Cj4g
PiA+ID4gPiA+ID4gY29uZmlnL1N0ZEdOVS5tawo+ID4gPiA+ID4gPiA+IHRvIHBhc3MgYXJtY2xh
bmcgYW5kIHRoZSBhcHByb3ByaWF0ZSB0YXJnZXQgb3B0aW9uLgo+ID4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiA+IEkgYWxzbyBoYWQgYSBsaW5raW5nIGlzc3VlIGF0IHRoZSBlbmQgd2hlcmUgX18y
c25wcmludGYgd2FzCj4gPiA+ID4gPiA+ID4gbm90IGZvdW5kLiBJdAo+ID4gPiA+ID4gPiA+IHNl
ZW1zIHRoZSBjb21waWxlciByZXBsYWNlIHNucHJpbnRmIHdpdGggX18yc25wcmludGYsIEkKPiA+
ID4gPiA+ID4gPiBoYXZlbid0IGZpZ3VyZWQgb3V0Cj4gPiA+ID4gPiA+ID4gd2h5IHlldC4KPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEJ1dCBhZnRlciB0aGVzZSBjaGFuZ2VzLCBkb2VzIGl0IHdv
cms/Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkgaGF2ZW4ndCB0cmllZCB0byBmaXggdGhlIGxpbmtp
bmcgaXNzdWVzLiBJIG9ubHkgZ2F2ZSBhIHF1aWNrCj4gPiA+ID4gPiB0cnkgYmVjYXVzZSBBcnRl
bQo+ID4gPiA+ID4gYXNrZWQuIEkgaGF2ZSBubyBwbGFuIGF0IHRoZSBtb21lbnQgdG8gZ28gZnVy
dGhlciB0aGFuIHRoYXQgZm9yCj4gPiA+ID4gPiBub3cuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFBh
dGNoZXMgYXJlIHdlbGNvbWVkIHRvIGFkZCBzdXBwb3J0IGZvciBhcm1jbGFuZy4KPiA+ID4gPiA+
IAo+ID4gPiA+IAo+ID4gPiA+IEkgaGF2ZSBpbXBsZW1lbnRlZCBhIGJ1bmNoIG9mIEhBQ0tzIFsx
XSBzbyBjYW4gYnVpbGQgWGVuIG1hc3Rlcgo+ID4gPiA+IHdpdGgKPiA+ID4gPiBhcm1jbGFuZyA2
LjEyLiBOb3QgZXZlbiAic21va2UiLXRlc3RlZCwganVzdCB0cnlpbmcgdG8gaWRlbnRpZnkKPiA+
ID4gPiBtaXNzaW5nCj4gPiA+ID4gcGFyYW1ldGVycyBhbmQgcHJvcGVyIGxpbmtlciBjb25maWd1
cmF0aW9uLgo+ID4gPiAKPiA+ID4gVGhhbmsgeW91IGZvciBsb29raW5nIGF0IGl0LiBTb21lIGNv
bW1lbnRzIGJlbG93Lgo+ID4gPiAKPiA+ID4gPiBOb3QgeWV0IGZpeGVkIHNlY3Rpb24gcGxhY2Vt
ZW50LCBsb3RzIG9mIHdhcm5pbmdzIGZyb20gbGlua2VyIGxpa2U6Cj4gPiA+ID4gV2FybmluZzog
TDYxNzBXOiBNYXBwaW5nIHN5bWJvbCAjNDAgJyR4LjIwJyBpbgo+ID4gPiA+IC5hbHRpbnN0cl9y
ZXBsYWNlbWVudChuczE2NTUwLm86NDIpIGlkZW50aWZpZXMgY29kZSwgYnV0IGlzIGluIGEKPiA+
ID4gPiBzZWN0aW9uIG5vdCBtYXJrZWQgYXMgZXhlY3V0YWJsZS4KPiA+ID4gCj4gPiA+IEluc3Ry
dWN0aW9uIGluIHRoZSBzZWN0aW9ucyAuYWx0aW5zdHJfcmVwbGFjZW1lbnQgYXJlIG5ldmVyIG1l
YW50IHRvCj4gPiA+IGJlIGV4ZWN1dGVkLgo+ID4gPiAKPiA+ID4gSSBndWVzcyB0aGlzIGlzIGNv
bWluZyBmcm9tIGFybWxpbms/IEFueSBwYXJ0aWN1bGFyIHJlYXNvbiB0byB1c2UKPiA+ID4gYXJt
bGluayBhbmQKPiA+ID4gbm90IGxkIGFzIHdlIGRvIG9uIGNsYW5nPwo+ID4gPiAKPiA+IAo+ID4g
WWVzLCBhcm1saW5rIGhhcyBhICJTYWZldHktY2VydGlmaWVkIiB2ZXJzaW9uIG9mIGl0LCB3aGls
ZSBsZCBkb2Vzbid0LAo+ID4gdW5mb3J0dW5hdGVseSA6KAo+IAo+IEkgYW0gbm90IHN1cmUgaWYg
YW55b25lIHRyaWVkIHRvIGJ1aWxkIFhlbiBvdGhlciB0aGFuIHdpdGggbGQgc28gZmFyLiBJIGhh
dmUKPiBDQ2VkIFJvZ2VyIHdobyBtaWdodCBoYXZlIGEgY2x1ZSB3aGV0aGVyIHRoZXJlIGFyZSBv
dGhlciBibG9ja2VyLgoKT24geDg2IHlvdSBjYW4gYnVpbGQgWGVuIGFuZCB0aGUgdG9vbHN0YWNr
IHdpdGggYSBmdWxsIGxsdm0gYmFzZWQKdG9vbGNoYWluIChjbGFuZyArIGxsZCkuIEluIGZhY3Qg
dGhhdCdzIGhvdyB0aGUgWGVuIHBhY2thZ2VzIGZvcgpGcmVlQlNEIGFyZSBidWlsdCwgSUlSQyBs
bGQgYW5kIGNsYW5nIDYgYW5kIGdyZWF0ZXIgc2hvdWxkIHdvcmsgZmluZQp3aXRoIFhlbiA0LjEy
IGFuZCB1cHdhcmRzLgoKSSBoYWQgdG8gZG8gc29tZSBmaXhlcyB0byBsbGQgYW5kIGNsYW5nIGlu
IG9yZGVyIHRvIHVuZGVyc3RhbmQgc29tZSBvZgp0aGUgYXNzZW1ibHkgdHJpY2tzIHRoYXQgWGVu
IGRvZXMsIGJ1dCBpdCB3YXMgcXVpdGUgbWlub3IuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
