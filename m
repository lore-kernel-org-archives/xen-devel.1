From: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH] [v2] xen: hypercall: fix out-of-bounds
	memcpy
Date: Mon, 5 Feb 2018 15:28:23 +0000
Message-ID: <0f6cfd45286247a3b69d46db1bc87fb5__10974.1157190458$1517844418$gmane$org@AcuMS.aculab.com>
References: <20180205150340.328921-1-arnd@arndb.de>
 <67d8f0f1-0846-876d-d36a-c8a9f9366243@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bbrw=e7=aculab.com=david.laight@srs-us1.protection.inumbo.net>)
 id 1eiigK-0002iM-AK
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 15:27:44 +0000
In-Reply-To: <67d8f0f1-0846-876d-d36a-c8a9f9366243@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Andrew Cooper' <andrew.cooper3@citrix.com>, Arnd Bergmann <arnd@arndb.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmV3IENvb3Blcg0KPiBTZW50OiAwNSBGZWJydWFyeSAyMDE4IDE1OjE0DQo+IA0K
PiBPbiAwNS8wMi8xOCAxNTowMywgQXJuZCBCZXJnbWFubiB3cm90ZToNCj4gDQo+IFNuaXBwaW5n
IGRlbGV0ZWQgY29kZSB0byBtYWtlIHRoaW5ncyBjbGVhcmVyOg0KPiANCj4gPiArCWlmIChjbWQg
PiBBUlJBWV9TSVpFKHBoeXNkZXZvcF9sZW4pKQ0KPiA+ICsJCXJldHVybiAtRU5PU1lTOw0KPiA+
DQo+ID4gKwlsZW4gPSBwaHlzZGV2b3BfbGVuW2NtZF07DQo+ID4gKwltZW1jcHkoJm9wLnUsIGFy
ZywgbGVuKTsNCj4gDQo+IFlvdSdsbCB3YW50IGFuIGFycmF5X25vc3BlYygpIG9yIHdoYXRldmVy
IGl0cyBjYWxsZWQgdGhlc2UgZGF5cy7CoCBUaGlzDQo+IGNvZGUgaXMgU1AxLWxlYWt5Lg0KPiAN
Cj4gVXNlcnNwYWNlIGNvbnRyb2xzIGNtZCBhbmQgY2FuIHJldHJpZXZlIGxlbiBieSB0aW1pbmcg
aG93IG1hbnkgYWRqYWNlbnQNCj4gY2FjaGUgbGluZXMgd2VyZSBwdWxsZWQgaW4gbXkgbWVtY3B5
KCkuDQoNCldlbGwsIG1heWJlIGl0IGNhbiByZWFkIGJleW9uZCB0aGUgYm91bmRzIG9mIHBoeXNk
ZXZvcF9sZW5bXS4NCkkgZG91YnQgdGhhdCB0aGUgbWVtY3B5KCkgd2lsbCBwdWxsIGluIG1hbnkg
Y2FjaGUgbGluZXMgc28geW91DQpjYW4gcHJvYmFibHkgb25seSBkZXRlcm1pbmUgd2hldGhlciB0
aGUgdmFsdWUgaXMgMC4uNjMsIDY0Li4xMjcgb3IgMTI4Kw0KTm90IGxpa2VseSB0byBiZSBtdWNo
IHVzZS4NCg0KCURhdmlkDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
