From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v1 5/6] x86/vvmx: correctly report vvmcs size
Date: Tue, 30 Oct 2018 08:06:18 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE2BD84@SHSMSX101.ccr.corp.intel.com>
References: <20181012152800.7921-1-sergey.dyasli@citrix.com>
 <20181012152800.7921-6-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181012152800.7921-6-sergey.dyasli@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBTZXJnZXkgRHlhc2xpIFttYWlsdG86c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tXQo+
IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAxMiwgMjAxOCAxMToyOCBQTQo+IAo+IFRoZSBzaXplIG9m
IFhlbidzIHZpcnR1YWwgdm1jcyByZWdpb24gaXMgNDA5NiBieXRlcy4gQ29ycmVjdGx5IHJlcG9y
dAo+IGl0IHRvIHRoZSBndWVzdCBpbiBjYXNlIHdoZW4gVk1DUyBzaGFkb3dpbmcgaXMgbm90IGF2
YWlsYWJsZSBpbnN0ZWFkIG9mCj4gcHJvdmlkaW5nIEgvVyB2YWx1ZSAod2hpY2ggaXMgdXN1YWxs
eSBzbWFsbGVyKS4KCndoYXQgaXMgdGhlIHByb2JsZW0gb2YgcmVwb3J0aW5nIHNtYWxsZXIgc2l6
ZSBldmVuIHdoZW4gYWN0dWFsCnNpemUgaXMgNDA5Nj8gaXMgTDEgZXhwZWN0ZWQgdG8gYWNjZXNz
IHRoZSBwb3J0aW9uIGJleW9uZCBoL3cKcmVwb3J0ZWQgc2l6ZT8KCj4gCj4gU2lnbmVkLW9mZi1i
eTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgo+IC0tLQo+ICB4ZW4v
YXJjaC94ODYvaHZtL3ZteC92dm14LmMgfCA4ICsrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZt
eC5jCj4gYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMKPiBpbmRleCA4YjY5MWJmYzA0Li4y
YzJiYTM2ZDk0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwo+IEBAIC0yMDY0LDYgKzIwNjQsMTQgQEAg
aW50IG52bXhfbXNyX3JlYWRfaW50ZXJjZXB0KHVuc2lnbmVkIGludCBtc3IsCj4gdTY0ICptc3Jf
Y29udGVudCkKPiAgICAgICAgICBkYXRhID0gKGhvc3RfZGF0YSAmICh+MHVsIDw8IDMyKSkgfAo+
ICAgICAgICAgICAgICAgICAodm1jcy0+dm1jc19yZXZpc2lvbl9pZCAmIDB4N2ZmZmZmZmYpOwo+
ICAgICAgICAgIHVubWFwX2RvbWFpbl9wYWdlKHZtY3MpOwo+ICsKPiArICAgICAgICBpZiAoICFj
cHVfaGFzX3ZteF92bWNzX3NoYWRvd2luZyApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICAv
KiBSZXBvcnQgdm1jc19yZWdpb25fc2l6ZSBhcyA0MDk2ICovCj4gKyAgICAgICAgICAgIGRhdGEg
Jj0gflZNWF9CQVNJQ19WTUNTX1NJWkVfTUFTSzsKPiArICAgICAgICAgICAgZGF0YSB8PSAxVUxM
IDw8IDQ0Owo+ICsgICAgICAgIH0KPiArCj4gICAgICAgICAgYnJlYWs7Cj4gICAgICB9Cj4gICAg
ICBjYXNlIE1TUl9JQTMyX1ZNWF9QSU5CQVNFRF9DVExTOgo+IC0tCj4gMi4xNy4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
