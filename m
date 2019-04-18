Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4B2C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 18:40:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC25A2064A
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 18:40:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gavQLne3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC25A2064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHBxS-0006dV-I7; Thu, 18 Apr 2019 18:40:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tnl2=SU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hHBxQ-0006dQ-Ga
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 18:40:24 +0000
X-Inumbo-ID: 6c659d42-6209-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6c659d42-6209-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 18:40:22 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B886F2064A;
 Thu, 18 Apr 2019 18:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555612822;
 bh=6FsRsPnujO+m87ayU0VZAwQGVScJ39OCh4bLLwVz+eg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=gavQLne3NQc1v1LRTJ02IqYtGh9ezU2pxNF2VeS1s4HvE512wE11Lxd0nSTNiFHut
 H8x47rzb/g3qNzcqdPWMg/4QlebqO8d//+OzGCHS20TxRpkMv3VaaCkllIgdKAjJSW
 e3D+edl4F0Lu/1l7B8JD8PUb/L2y4irOYvHawasA=
Date: Thu, 18 Apr 2019 11:40:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <888ddebb-7019-45b7-aa84-9ba3cf4bfe7e@arm.com>
Message-ID: <alpine.DEB.2.10.1904181131450.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-6-julien.grall@arm.com>
 <2af3ed7f-00d4-2eb7-0dde-c9570578dd4e@citrix.com>
 <bac73177-1ff7-7b7c-6852-832f88707555@arm.com>
 <alpine.DEB.2.10.1904171322560.1370@sstabellini-ThinkPad-X260>
 <888ddebb-7019-45b7-aa84-9ba3cf4bfe7e@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 05/12] xen/arm64: bitops: Match the register
 size with the value size in flsl
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
Cc: "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418184021.i00dJ8GxtYpKN81jEyOLrRmQbkQ3h6W-01_YKgtwXXY@z>

T24gV2VkLCAxNyBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDQvMTcvMTkgOToy
NCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gV2VkLCAyNyBNYXIgMjAxOSwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBIaSwKPiA+ID4gCj4gPiA+IE9uIDI3LzAzLzIwMTkg
MTk6MDMsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPiA+ID4gT24gMjcvMDMvMjAxOSAxODo0NSwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+ID4gQ2xhbmcgaXMgcGlja2llciB0aGFuIEdDQyBm
b3IgdGhlIHJlZ2lzdGVyIHNpemUgaW4gYXNtIHN0YXRlbWVudC4gSXQKPiA+ID4gPiA+IGV4cGVj
dHMKPiA+ID4gPiA+IHRoZSByZWdpc3RlciBzaXplIHRvIG1hdGNoIHRoZSB2YWx1ZSBzaXplLgo+
ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGUgaW5zdHJ1Y3Rpb24gY2x6IGlzIGV4cGVjdGluZyB0aGUg
dHdvIG9wZXJhbmRzIHRvIGJlIHRoZSBzYW1lIHNpemUKPiA+ID4gPiA+IChpLmUgMzItYml0IG9y
IDY0LWJpdCkuIEFzIHRoZSBmbHNsIGZ1bmN0aW9uIGlzIGRlYWxpbmcgd2l0aCA2NC1iaXQKPiA+
ID4gPiA+IHZhbHVlLCB3ZSBuZWVkIHRvIG1ha2UgdGhlIGRlc3RpbmF0aW9uIHZhcmlhYmxlIDY0
LWJpdCBhcyB3ZWxsLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBXaGlsZSBhdCBpdCwgYWRkIGEgbmV3
bGluZSBiZWZvcmUgdGhlIHJldHVybiBzdGF0ZW1lbnQuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gPiA+ID4g
PiAtLS0KPiA+ID4gPiA+ICAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvYml0b3BzLmggfCAz
ICsrLQo+ID4gPiA+ID4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+ID4gPiA+ID4gCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LWFybS9hcm02NC9iaXRvcHMuaAo+ID4gPiA+ID4gYi94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0
L2JpdG9wcy5oCj4gPiA+ID4gPiBpbmRleCA2YmYxOTIyNjgwLi4wNTA0NWYxMTA5IDEwMDY0NAo+
ID4gPiA+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9iaXRvcHMuaAo+ID4gPiA+
ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9iaXRvcHMuaAo+ID4gPiA+ID4gQEAg
LTM0LDEyICszNCwxMyBAQCBzdGF0aWMgLypfXyovYWx3YXlzX2lubGluZSB1bnNpZ25lZCBsb25n
Cj4gPiA+ID4gPiBfX2Zmcyh1bnNpZ25lZCBsb25nIHdvcmQpCj4gPiA+ID4gPiAgICAgICBzdGF0
aWMgaW5saW5lIGludCBmbHNsKHVuc2lnbmVkIGxvbmcgeCkKPiA+ID4gPiA+ICAgIHsKPiA+ID4g
PiA+IC0gICAgICAgIGludCByZXQ7Cj4gPiA+ID4gPiArICAgICAgICB1aW50NjRfdCByZXQ7Cj4g
PiA+ID4gPiAgICAgICAgICAgICAgIGlmIChfX2J1aWx0aW5fY29uc3RhbnRfcCh4KSkKPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICAgIHJldHVybiBnZW5lcmljX2Zsc2woeCk7Cj4gPiA+ID4gPiAg
ICAgICAgICAgICAgIGFzbSgiY2x6XHQlMCwgJTEiIDogIj1yIiAocmV0KSA6ICJyIiAoeCkpOwo+
ID4gPiA+IAo+ID4gPiA+IEFzIHggaXMgZml4ZWQgYnkgdGhlIEFCSSwgcmV0IHNob3VsZCBiZSB1
bnNpZ25lZCBsb25nIHRvIG1hdGNoLCBzdXJlbHk/Cj4gPiA+IAo+ID4gPiBObyBuZWVkIGZvciBp
dC4gVGhlIHJlc3VsdCBvZiB0aGUgaW5zdHJ1Y3Rpb24gY2x6IHdpbGwgYWx3YXlzIGJlIHNtYWxs
ZXIKPiA+ID4gdGhhbiA2NC4KPiA+ID4gCj4gPiA+IEkgc3VzcGVjdCB0aGV5IHJlcXVpcmUgYSA2
NC1iaXQgcmVnaXN0ZXIganVzdCBmb3Igc2ltcGxpY2l0eSBhcyB0aGV5Cj4gPiA+IGVuY29kZSB0
aGUgc2l6ZSBmb3IgdGhlIDIgcmVnaXN0ZXJzIGluIG9ubHkgYSBzaW5nbGUgYml0IChpLmUgc2Yp
Lgo+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBUaGlzIHdpbGwgY29tcGlsZSBhcyBpdCBpcyBhcm02
NCBzcGVjaWZpYywgYnV0IGl0IGxvb2tzIGp1c3QgYXMgd3JvbmcKPiA+ID4gPiAocGVyIHRoZSBj
b21taXQgbWVzc2FnZSkgYXMgdXNpbmcgaW50IGluIHRoZSBmaXJzdCBwbGFjZS4KPiA+ID4gU2Vl
IGFib3ZlLiBJIGNhbiBjbGFyaWZ5IGl0IGluIHRoZSBjb21taXQgbWVzc2FnZS4KPiA+IAo+ID4g
SSBhZ3JlZSB3aXRoIEFuZHJldzogSSBjYW4gc2VlIHRoYXQgdGhlIGNvZGUgaXMgY29ycmVjdCwg
YnV0IGl0IHJlYWxseQo+ID4gbG9va3Mgd3JvbmcgYXQgZmlyc3Qgc2lnaHQuIFdoeSBub3QgdXNl
IHVuc2lnbmVkIGxvbmc/IFRoaXMgaXMgYW4gYXJtNjQKPiA+IGhlYWRlciBhbnl3YXkuCj4gCj4g
V2hpbGUgdGhpcyBpcyBpbXBsZW1lbnRlZCBpbiBhcm02NCwgdGhpcyBpcyBhIGZ1bmN0aW9uIHVz
ZWQgaW4gY29tbW9uIGNvZGUuLi4KPiBTbyB0aGUgcHJvdG90eXBlIHdvdWxkIGhhdmUgdG8gYmUg
Y2hhbmdlZCBldmVyeXdoZXJlLgo+IAo+IEhvd2V2ZXIsIGFzIEkgcG9pbnRlZCBvdXQgdGhpcyBp
cyBhIGRlc2lnbiBkZWNpc2lvbiBmcm9tIEFybTY0IGFuZCBJIHRoaW5rIGl0Cj4gd291bGQgYmUg
d3JvbmcgdG8gcmV0dXJuIHVuc2lnbmVkIGxvbmcuCj4gCj4gSSBvZmZlcmVkIHRoZSBzdWdnZXN0
aW9uIHRvIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UuIEkgY2FuIGFsc28gYWRkIGEKPiBjb21t
ZW50IGluIHRoZSBjb2RlLgoKUmVhZGluZyB5b3VyIHJlcGx5LCBJIGFtIHByZXR0eSBzdXJlIHRo
YXQgd2UgYXJlIHRhbGtpbmcgYWJvdXQgZGlmZmVyZW50CnRoaW5ncy4gSSBhZ3JlZSB0aGF0IHdl
IGRvbid0IHdhbnQgdG8gY2hhbmdlIHRoZSBwcm90b3R5cGUgZXZlcnl3aGVyZSwKYXJtMzIsIHg4
Ni4gSXQgd291bGQgYmUgZ29vZCB0byBhZGQgYSBjb21tZW50IHRvIHRoZSBjb2RlIG9yIHRoZSBj
b21taXQKbWVzc2FnZSwgSSBsZWF2ZSBpdCB0byB5b3UuCgpNeSBzdWdnZXN0aW9uIHdhcyBiYXNp
Y2FsbHkgImNvZGUgc3R5bGUiLiBJIG9ubHkgbWVhbnQgdGhlIGJlbG93LiBUbyBtZQppdCBsb29r
cyBuaWNlciBiZWNhdXNlIGF0IGxlYXN0IHRoZSByZXQgdmFyIGlzIHRoZSBzYW1lIHR5cGUgb2Yg
dGhlCmFyZ3VtZW50LCBhbmQgaXQgaXMgbW9yZSBpbW1lZGlhdGVseSBvYnZpb3VzIHRoYXQgdGhl
IGNseiBvcGVyYXRpb24gaXMKY29ycmVjdC4gTm90IGEgYmlnIGRlYWwuCgpkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9iaXRvcHMuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0v
YXJtNjQvYml0b3BzLmgKaW5kZXggNmJmMTkyMi4uNDRjY2ViMyAxMDA2NDQKLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLWFybS9hcm02NC9iaXRvcHMuaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2Fy
bTY0L2JpdG9wcy5oCkBAIC0zNCw3ICszNCw3IEBAIHN0YXRpYyAvKl9fKi9hbHdheXNfaW5saW5l
IHVuc2lnbmVkIGxvbmcgX19mZnModW5zaWduZWQgbG9uZyB3b3JkKQogCiBzdGF0aWMgaW5saW5l
IGludCBmbHNsKHVuc2lnbmVkIGxvbmcgeCkKIHsKLSAgICAgICAgaW50IHJldDsKKyAgICAgICAg
dW5zaWduZWQgbG9uZyByZXQ7CiAKICAgICAgICAgaWYgKF9fYnVpbHRpbl9jb25zdGFudF9wKHgp
KQogICAgICAgICAgICAgICAgcmV0dXJuIGdlbmVyaWNfZmxzbCh4KTsKCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
