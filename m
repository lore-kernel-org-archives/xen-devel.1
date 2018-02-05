From: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH] xen: hypercall: fix out-of-bounds memcpy
Date: Mon, 5 Feb 2018 12:11:07 +0000
Message-ID: <1eddce614f604c518b9bf238a2f92e4b__12337.884042836$1517832578$gmane$org@AcuMS.aculab.com>
References: <20180202153240.1190361-1-arnd@arndb.de>
 <aa6e25c7-dc55-a5bf-39cb-8b9453604111@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bbrw=e7=aculab.com=david.laight@srs-us1.protection.inumbo.net>)
 id 1eifbO-0001VH-6u
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 12:10:26 +0000
In-Reply-To: <aa6e25c7-dc55-a5bf-39cb-8b9453604111@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Boris Ostrovsky' <boris.ostrovsky@oracle.com>, Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>
Cc: Andi Kleen <ak@linux.intel.com>, Nicolas Pitre <nico@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQm9yaXMgT3N0cm92c2t5DQo+IFNlbnQ6IDAyIEZlYnJ1YXJ5IDIwMTggMjM6MzQNCi4u
Lg0KPiA+ICAJc3dpdGNoIChjbWQpIHsNCj4gPiArCWNhc2UgRVZUQ0hOT1BfYmluZF9pbnRlcmRv
bWFpbjoNCj4gPiArCQlsZW4gPSBzaXplb2Yoc3RydWN0IGV2dGNobl9iaW5kX2ludGVyZG9tYWlu
KTsNCj4gPiArCQlicmVhazsNCj4gPiArCWNhc2UgRVZUQ0hOT1BfYmluZF92aXJxOg0KPiA+ICsJ
CWxlbiA9IHNpemVvZihzdHJ1Y3QgZXZ0Y2huX2JpbmRfdmlycSk7DQo+ID4gKwkJYnJlYWs7DQo+
ID4gKwljYXNlIEVWVENITk9QX2JpbmRfcGlycToNCj4gPiArCQlsZW4gPSBzaXplb2Yoc3RydWN0
IGV2dGNobl9iaW5kX3BpcnEpOw0KPiA+ICsJCWJyZWFrOw0KPiA+ICAJY2FzZSBFVlRDSE5PUF9j
bG9zZToNCj4gPiArCQlsZW4gPSBzaXplb2Yoc3RydWN0IGV2dGNobl9jbG9zZSk7DQo+ID4gKwkJ
YnJlYWs7DQo+ID4gIAljYXNlIEVWVENITk9QX3NlbmQ6DQo+ID4gKwkJbGVuID0gc2l6ZW9mKHN0
cnVjdCBldnRjaG5fc2VuZCk7DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwljYXNlIEVWVENITk9QX2Fs
bG9jX3VuYm91bmQ6DQo+ID4gKwkJbGVuID0gc2l6ZW9mKHN0cnVjdCBldnRjaG5fYWxsb2NfdW5i
b3VuZCk7DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwljYXNlIEVWVENITk9QX2JpbmRfaXBpOg0KPiA+
ICsJCWxlbiA9IHNpemVvZihzdHJ1Y3QgZXZ0Y2huX2JpbmRfaXBpKTsNCj4gPiArCQlicmVhazsN
Cj4gPiArCWNhc2UgRVZUQ0hOT1Bfc3RhdHVzOg0KPiA+ICsJCWxlbiA9IHNpemVvZihzdHJ1Y3Qg
ZXZ0Y2huX3N0YXR1cyk7DQo+ID4gKwkJYnJlYWs7DQo+ID4gIAljYXNlIEVWVENITk9QX2JpbmRf
dmNwdToNCj4gPiArCQlsZW4gPSBzaXplb2Yoc3RydWN0IGV2dGNobl9iaW5kX3ZjcHUpOw0KPiA+
ICsJCWJyZWFrOw0KPiA+ICAJY2FzZSBFVlRDSE5PUF91bm1hc2s6DQo+ID4gLQkJLyogbm8gb3V0
cHV0ICovDQo+ID4gKwkJbGVuID0gc2l6ZW9mKHN0cnVjdCBldnRjaG5fdW5tYXNrKTsNCj4gPiAg
CQlicmVhazsNCg0KQXJlIHRoZSBFVlRDSE5PUF94eHggdmFsdWVzIGRlbnNlPw0KSW4gd2hpY2gg
Y2FzZSBhbiBhcnJheSBpcyBhbG1vc3QgY2VydGFpbmx5IGJldHRlciB0aGFuIHRoZSBzd2l0Y2gg
c3RhdGVtZW50Lg0KDQoJRGF2aWQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
