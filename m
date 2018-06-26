From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] gnttab: silence table expansion message
Date: Tue, 26 Jun 2018 12:14:56 +0100
Message-ID: <f5528c9c-84c6-59a9-355e-24c7d233c5a0@citrix.com>
References: <5B31E99902000078001CDD0D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a3a5=jm=citrix.com=prvs=7081fe03c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fXlw4-00089D-5c
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 11:15:00 +0000
In-Reply-To: <5B31E99902000078001CDD0D@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDYvMTggMDg6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoaXMgY3VycmVudGx5IHNo
b3dzIHVwIGZvciBiYXNpY2FsbHkgZXZlcnkgZG9tYWluLCB3aGVuIG9yaWdpbmFsbHkgaXQKPiB3
YXMgbG9nZ2VkIG9ubHkgd2hlbiBnb2luZyBiZXlvbmQgdGhlIGRlZmF1bHQgdGFibGUgc2l6ZS4g
UmVzdG9yZSB0aGF0Cj4gYmVoYXZpb3IuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4KPiAtLS0gYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPiAr
KysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPiBAQCAtMTc2NCw5ICsxNzY0LDEwIEBAIGdu
dHRhYl9ncm93X3RhYmxlKHN0cnVjdCBkb21haW4gKmQsIHVuc2kKPiAgICAgICAgICByZXFfbnJf
ZnJhbWVzID0gSU5JVElBTF9OUl9HUkFOVF9GUkFNRVM7Cj4gICAgICBBU1NFUlQocmVxX25yX2Zy
YW1lcyA8PSBndC0+bWF4X2dyYW50X2ZyYW1lcyk7Cj4gIAo+IC0gICAgZ2RwcmludGsoWEVOTE9H
X0lORk8sCj4gLSAgICAgICAgICAgICJFeHBhbmRpbmcgZCVkIGdyYW50IHRhYmxlIGZyb20gJXUg
dG8gJXUgZnJhbWVzXG4iLAo+IC0gICAgICAgICAgICBkLT5kb21haW5faWQsIG5yX2dyYW50X2Zy
YW1lcyhndCksIHJlcV9ucl9mcmFtZXMpOwo+ICsgICAgaWYgKCByZXFfbnJfZnJhbWVzID4gSU5J
VElBTF9OUl9HUkFOVF9GUkFNRVMgKQo+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19JTkZPLAo+
ICsgICAgICAgICAgICAgICAgICJFeHBhbmRpbmcgZCVkIGdyYW50IHRhYmxlIGZyb20gJXUgdG8g
JXUgZnJhbWVzXG4iLAo+ICsgICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwgbnJfZ3JhbnRf
ZnJhbWVzKGd0KSwgcmVxX25yX2ZyYW1lcyk7CgpUaGlzIGhhcyBiZWVuIG9uIG15IHRvZG8gbGlz
dCBmb3IgYSB3aGlsZSwgYnV0IEknZCBnbyBvbmUgc3RhZ2UgZnVydGhlcgphbmQgZGVsZXRlIGl0
IGZ1bGx5LgoKRG9tYWlucyBlaXRoZXIgbmV2ZXIgdHJpZ2dlciBpdCwgb3IgZXhwYW5kIHRvIG1h
eC7CoCBJdCBkb2Vzbid0IHByb3ZpZGUKYW55IHVzZWZ1bCBpbmZvcm1hdGlvbiBhdCBhbGwuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
