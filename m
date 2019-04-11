From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3 1/3] x86/mm: Introduce
 altp2m_get_gfn_type_access
Date: Thu, 11 Apr 2019 13:50:26 +0100
Message-ID: <21a454d7-fc0e-5d44-9991-680582752989@citrix.com>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
 <28c52232-536f-d007-4072-fbce95b44d8c@citrix.com>
 <7a64b16b-b7df-2af8-219b-5d3c4a3bf381@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iw/1=SN=citrix.com=prvs=99710a114=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hEZB2-0000Ov-Jp
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 12:51:36 +0000
In-Reply-To: <7a64b16b-b7df-2af8-219b-5d3c4a3bf381@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "tamas@tklengyel.com" <tamas@tklengyel.com>
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8xMS8xOSAxOjE3IFBNLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToKPj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMK
Pj4+IGluZGV4IGI5YmJiOGY0ODUuLmQzOGQ3YzI5Y2EgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vYXJj
aC94ODYvbW0vcDJtLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+Pj4gQEAgLTI2
MjYsNiArMjYyNiw3IEBAIGludCBwMm1fY2hhbmdlX2FsdHAybV9nZm4oc3RydWN0IGRvbWFpbiAq
ZCwgdW5zaWduZWQgaW50IGlkeCwKPj4+ICAgICAgIG1mbl90IG1mbjsKPj4+ICAgICAgIHVuc2ln
bmVkIGludCBwYWdlX29yZGVyOwo+Pj4gICAgICAgaW50IHJjID0gLUVJTlZBTDsKPj4+ICsgICAg
Ym9vbCBjb3BpZWRfZnJvbV9ob3N0cDJtOwo+Pj4gICAKPj4+ICAgICAgIGlmICggaWR4ID49IE1B
WF9BTFRQMk0gfHwgZC0+YXJjaC5hbHRwMm1fZXB0cFtpZHhdID09IG1mbl94KElOVkFMSURfTUZO
KSApCj4+PiAgICAgICAgICAgcmV0dXJuIHJjOwo+Pj4gQEAgLTI2MzYsNyArMjYzNyw3IEBAIGlu
dCBwMm1fY2hhbmdlX2FsdHAybV9nZm4oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlk
eCwKPj4+ICAgICAgIHAybV9sb2NrKGhwMm0pOwo+Pj4gICAgICAgcDJtX2xvY2soYXAybSk7Cj4+
PiAgIAo+Pj4gLSAgICBtZm4gPSBhcDJtLT5nZXRfZW50cnkoYXAybSwgb2xkX2dmbiwgJnQsICZh
LCAwLCBOVUxMLCBOVUxMKTsKPj4+ICsgICAgbWZuID0gYWx0cDJtX2dldF9nZm5fdHlwZV9hY2Nl
c3MoYXAybSwgb2xkX2dmbiwgJnQsICZhLCAmcGFnZV9vcmRlciwgJmNvcGllZF9mcm9tX2hvc3Rw
Mm0pOwo+Pgo+PiBCZWZvcmUsIGlmIG5ld19nZm4gd2FzIElOVkFMSURfR0ZOLCB0aGVuIHRoZSBo
b3N0IHAybSB3YXNuJ3QgcmVhZCBhdAo+PiBhbGwuICBOb3csIHRoZSBob3N0cDJtIHdpbGwgaGF2
ZSBfX2dldF9nZm5fdHlwZV9hY2Nlc3MoKSBjYWxsZWQgd2l0aAo+PiBQMk1fQUxMT0MgfCBQMk1f
VU5TSEFSRS4gIElzIHRoYXQgY2hhbmdlIGludGVudGlvbmFsLCBhbmQgaWYgc28sIHdoeT8KPiAK
PiBUaGlzIGhhcyBiZWVuIHJlcXVlc3RlZCBieSBUYW1hcyBpbiB2Mi4KClRoYXQncyBuaWNlLCBi
dXQgMSkgeW91IHN0aWxsIGhhdmVuJ3QgYW5zd2VyZWQgdGhlIHF1ZXN0aW9uLCBhbmQgMikgaXQn
cwpub3QgaW4gdGhlIGNoYW5nZWxvZy4KCkxpdGVyYWxseSB0d28gd2Vla3MgYWdvIFsxXSB3ZSBo
YWQgYSBzaXR1YXRpb24gd2hlcmUgbmVpdGhlciBhIGNvbW1lbnQKbm9yIHRoZSBjaGFuZ2Vsb2cg
dGhhdCBpbnRyb2R1Y2VkIGEgY2hhbmdlIGV4cGxhaW5lZCB3aHkgYSBkZWNpc2lvbiB3YXMKbWFk
ZSwgYW5kIHRoZSByZXN1bHQgd2FzIGEgaGVhdGVkIGFyZ3VtZW50IGJldHdlZW4gdHdvIG1haW50
YWluZXJzIGFib3V0CnRoZSBzYWZlc3Qgd2F5IHRvIGNoYW5nZSBpdCwgdGhhdCB3YXMgb25seSBy
ZXNvbHZlZCB3aGVuIEkgd2VudCB0aHJvdWdoCnRoZSBtYWlsIGFyY2hpdmVzIGFuZCByZWFkIHRo
cm91Z2ggYSBmYWlybHkgbG9uZyBhbmQgd2luZGluZyB0aHJlYWQgZnJvbQo5IHllYXJzIGFnby4K
ClRoYXQgc2hvdWxkbid0IGhhcHBlbi4gIFRoZSBjb2RlICsgdGhlIGNoYW5nZWxvZyBzaG91bGQg
Z2l2ZSBzb21lb25lCmdlbmVyYWxseSBmYW1pbGlhciB3aXRoIHRoZSBjb2RlYmFzZSBldmVyeXRo
aW5nIHRoZXkgbmVlZCB0byB1bmRlcnN0YW5kCndoYXQncyBnb2luZyBvbiwgYW5kIHdoeSB0aGUg
Y2hhbmdlIHdhcyBtYWRlLgoKIC1HZW9yZ2UKClsxXSBtYXJjLmluZm8vP2k9PDY4OWI4Zjc1LTIw
ZGQtMjRkOS1iZDVmLWYwM2E4MjAxYjJlMkBjaXRyaXguY29tPgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
