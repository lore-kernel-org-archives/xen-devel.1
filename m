From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v6 12/14] memory: add get_paged_gfn() as a
 wrapper...
Date: Thu, 23 Aug 2018 11:24:38 +0100
Message-ID: <6a3821ea-e99f-6b71-6ffe-1a3ac98f87d1@arm.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-13-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a030=lg=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fsmnF-0005Dm-8F
 for xen-devel@lists.xenproject.org; Thu, 23 Aug 2018 10:24:45 +0000
In-Reply-To: <20180823094711.21376-13-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUGF1bCwKCk9uIDA4LzIzLzIwMTggMTA6NDcgQU0sIFBhdWwgRHVycmFudCB3cm90ZToKPiAu
Li5mb3Igc29tZSB1c2VzIG9mIGdldF9wYWdlX2Zyb21fZ2ZuKCkuCj4gCj4gVGhlcmUgYXJlIG1h
bnkgb2NjdXJlbmNlcyBvZiB0aGUgZm9sbG93aW5nIHBhdHRlcm4gaW4gdGhlIGNvZGU6CgpOSVQ6
IHMvb2NjdXJlbmNlcy9vY2N1cmVuY2VzLwoKWy4uLl0KCj4gK2ludCBnZXRfcGFnZWRfZ2ZuKHN0
cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwgYm9vbCByZWFkb25seSwKPiArICAgICAgICAgICAg
ICAgICAgcDJtX3R5cGVfdCAqcDJtdF9wLCBzdHJ1Y3QgcGFnZV9pbmZvICoqcGFnZV9wKQo+ICAg
ewo+IC0gICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsKPiArICAgIHAybV9xdWVyeV90IHEgPSBy
ZWFkb25seSA/IFAyTV9BTExPQyA6IFAyTV9VTlNIQVJFOwo+ICAgICAgIHAybV90eXBlX3QgcDJt
dDsKPiAtICAgIHZvaWQgKnZhOwo+ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsKPiAgIAo+
IC0gICAgcGFnZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKGQsIGdtZm4sICZwMm10LCBQMk1fVU5TSEFS
RSk7Cj4gKyAgICBwYWdlID0gZ2V0X3BhZ2VfZnJvbV9nZm4oZCwgZ2ZuX3goZ2ZuKSwgJnAybXQs
IHEpOwo+ICAgCj4gICAjaWZkZWYgQ09ORklHX0hBU19NRU1fUEFHSU5HCj4gICAgICAgaWYgKCBw
Mm1faXNfcGFnaW5nKHAybXQpICkKPiAgICAgICB7Cj4gICAgICAgICAgIGlmICggcGFnZSApCj4g
ICAgICAgICAgICAgICBwdXRfcGFnZShwYWdlKTsKPiAtICAgICAgICBwMm1fbWVtX3BhZ2luZ19w
b3B1bGF0ZShkLCBnbWZuKTsKPiAtICAgICAgICByZXR1cm4gLUVOT0VOVDsKPiArCj4gKyAgICAg
ICAgcDJtX21lbV9wYWdpbmdfcG9wdWxhdGUoZCwgZ2ZuX3goZ2ZuKSk7Cj4gKyAgICAgICAgcmV0
dXJuIC1FQUdBSU47Cj4gICAgICAgfQo+ICAgI2VuZGlmCj4gICAjaWZkZWYgQ09ORklHX0hBU19N
RU1fU0hBUklORwo+IC0gICAgaWYgKCBwMm1faXNfc2hhcmVkKHAybXQpICkKPiArICAgIGlmICgg
KHEgJiBQMk1fVU5TSEFSRSkgJiYgcDJtX2lzX3NoYXJlZChwMm10KSApCj4gICAgICAgewo+ICAg
ICAgICAgICBpZiAoIHBhZ2UgKQo+ICAgICAgICAgICAgICAgcHV0X3BhZ2UocGFnZSk7Cj4gLSAg
ICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gKwo+ICsgICAgICAgIHJldHVybiAtRUFHQUlOOwo+ICAg
ICAgIH0KPiAgICNlbmRpZgo+ICAgCj4gICAgICAgaWYgKCAhcGFnZSApCj4gICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+ICAgCj4gKyAgICBpZiAoICFwMm1faXNfcmFtKHAybXQpIHx8ICghcmVh
ZG9ubHkgJiYgcDJtX2lzX3JlYWRvbmx5KHAybXQpKSApCgpwMm1faXNfcmVhZG9ubHkgZG9lcyBu
b3QgZXhpc3Qgb24gQXJtLiBDYW4geW91IHBsZWFzZSBtYWtlIHN1cmUgdGhpcyAKY29kZSBidWls
ZCBvbiBBcm0/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
