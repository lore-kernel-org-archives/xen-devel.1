From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6.5 08/26] x86/entry: Erase guest GPR state
 on entry to Xen
Date: Mon, 22 Jan 2018 10:18:37 +0000
Message-ID: <8ca02d70-46c2-fd71-05d8-dc53fbccc437@citrix.com>
References: <1515024955-13390-1-git-send-email-andrew.cooper3@citrix.com>
 <1515024955-13390-9-git-send-email-andrew.cooper3@citrix.com>
 <1516615469.9814.144.camel@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1516615469.9814.144.camel@infradead.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Woodhouse <dwmw2@infradead.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDEvMjAxOCAxMDowNCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIFRodSwgMjAx
OC0wMS0wNCBhdCAwMDoxNSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVmbnMuaAo+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2
L2FzbV9kZWZucy5oCj4+IEBAIC0yMTcsMjIgKzIxNywzNCBAQCBzdGF0aWMgYWx3YXlzX2lubGlu
ZSB2b2lkIHN0YWModm9pZCkKPj4gwqDCoMKgwqDCoMKgwqDCoCBhZGRxwqAgJC0oVVJFR1NfZXJy
b3JfY29kZS1VUkVHU19yMTUpLCAlcnNwCj4+IMKgwqDCoMKgwqDCoMKgwqAgY2xkCj4+IMKgwqDC
oMKgwqDCoMKgwqAgbW92ccKgICVyZGksVVJFR1NfcmRpKCVyc3ApCj4+ICvCoMKgwqDCoMKgwqDC
oCB4b3LCoMKgICVlZGksICVlZGkKPj4gwqDCoMKgwqDCoMKgwqDCoCBtb3ZxwqAgJXJzaSxVUkVH
U19yc2koJXJzcCkKPj4gK8KgwqDCoMKgwqDCoMKgIHhvcsKgwqAgJWVzaSwgJWVzaQo+PiDCoMKg
wqDCoMKgwqDCoMKgIG1vdnHCoCAlcmR4LFVSRUdTX3JkeCglcnNwKQo+PiArwqDCoMKgwqDCoMKg
wqAgeG9ywqDCoCAlZWR4LCAlZWR4Cj4+IMKgwqDCoMKgwqDCoMKgwqAgbW92ccKgICVyY3gsVVJF
R1NfcmN4KCVyc3ApCj4+ICvCoMKgwqDCoMKgwqDCoCB4b3LCoMKgICVlY3gsICVlY3gKPj4gwqDC
oMKgwqDCoMKgwqDCoCBtb3ZxwqAgJXJheCxVUkVHU19yYXgoJXJzcCkKPj4gK8KgwqDCoMKgwqDC
oMKgIHhvcsKgwqAgJWVheCwgJWVheAo+IFlvdSBkaWRuJ3Qgd2FudCB0byBlcmFzZSBhbGwgNjQg
Yml0cz8KClRoaXMgZG9lcyBlcmFzZSBhbGwgNjQgYml0cy7CoCAoV2UncmUgaW4gbG9uZyBtb2Rl
LCBzbyB0aGUgdXBwZXIgMzIgYml0cwphcmUgaW1wbGljaXRseSB6ZXJvZWQsIHdpdGhvdXQgYW4g
YWRkZWQgcmV4IHByZWZpeC4pCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
