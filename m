From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 8/8] xen: Swich parameter in
 get_page_from_gfn to use typesafe gfn
Date: Wed, 7 Nov 2018 13:08:43 +0000
Message-ID: <a6103e7f-218b-f30a-fe05-57348eb35447@citrix.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-9-julien.grall@arm.com>
 <479bb855-0bb7-dd30-a7a4-692b189cc7c5@citrix.com>
 <edf7fafc10944dbab6379200ee952104@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vh0l=ns=citrix.com=prvs=84296f867=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gKNaK-0001N9-FN
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 13:09:28 +0000
In-Reply-To: <edf7fafc10944dbab6379200ee952104@AMSPEX02CL03.citrite.net>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, Julien Grall <julien.grall@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jun Nakajima <jun.nakajima@intel.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julie.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTEvMTggMDg6NTcsIFBhdWwgRHVycmFudCB3cm90ZToKPj4KPj4+ICBzdGF0aWMgaW5s
aW5lIHN0cnVjdCBwYWdlX2luZm8gKmdldF9wYWdlX2Zyb21fZ2ZuKAo+Pj4gLSAgICBzdHJ1Y3Qg
ZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbiwgcDJtX3R5cGVfdCAqdCwgcDJtX3F1ZXJ5X3Qg
cSkKPj4+ICsgICAgc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCBwMm1fdHlwZV90ICp0LCBw
Mm1fcXVlcnlfdCBxKQo+Pj4gIHsKPj4+ICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsKPj4+
ICsgICAgbWZuX3QgbWZuOwo+Pj4KPj4+ICAgICAgaWYgKCBwYWdpbmdfbW9kZV90cmFuc2xhdGUo
ZCkgKQo+Pj4gLSAgICAgICAgcmV0dXJuIHAybV9nZXRfcGFnZV9mcm9tX2dmbihwMm1fZ2V0X2hv
c3RwMm0oZCksIF9nZm4oZ2ZuKSwgdCwKPj4gTlVMTCwgcSk7Cj4+PiArICAgICAgICByZXR1cm4g
cDJtX2dldF9wYWdlX2Zyb21fZ2ZuKHAybV9nZXRfaG9zdHAybShkKSwgZ2ZuLCB0LCBOVUxMLAo+
PiBxKTsKPj4+ICAgICAgLyogTm9uLXRyYW5zbGF0ZWQgZ3Vlc3RzIHNlZSAxLTEgUkFNIC8gTU1J
TyBtYXBwaW5ncyBldmVyeXdoZXJlICovCj4+PiAgICAgIGlmICggdCApCj4+PiAgICAgICAgICAq
dCA9IGxpa2VseShkICE9IGRvbV9pbykgPyBwMm1fcmFtX3J3IDogcDJtX21taW9fZGlyZWN0Owo+
Pj4gLSAgICBwYWdlID0gbWZuX3RvX3BhZ2UoX21mbihnZm4pKTsKPj4+IC0gICAgcmV0dXJuIG1m
bl92YWxpZChfbWZuKGdmbikpICYmIGdldF9wYWdlKHBhZ2UsIGQpID8gcGFnZSA6IE5VTEw7Cj4+
PiArCj4+PiArICAgIG1mbiA9IF9tZm4oZ2ZuX3goZ2ZuKSk7Cj4+PiArICAgIHBhZ2UgPSBtZm5f
dG9fcGFnZShtZm4pOwo+Pj4gKyAgICByZXR1cm4gbWZuX3ZhbGlkKG1mbikgJiYgZ2V0X3BhZ2Uo
cGFnZSwgZCkgPyBwYWdlIDogTlVMTDsKPj4gVGhpcyBsb29rcyBsaWtlIGl0IHdvdWxkIGJlIGNs
ZWFuZXIgYnkgbm90IHNwbGl0dGluZyBtZm4gb3V0IGludG8gYQo+PiBzZXBhcmF0ZSB2YXJpYWJs
ZS4KPj4KPj4gcGFnZSA9IG1mbl90b19wYWdlKF9tZm4oZ2ZuX3goZ2ZuKSkpOwo+Pgo+PiByZXR1
cm4gbWZuX3ZhbGlkKG1mbikgJiYgZ2V0X3BhZ2UocGFnZSwgZCkgPyBwYWdlIDogTlVMTDsKPiBe
XiBlci4uLiBob3cncyB0aGF0IG1mbl92YWxpZCgpIGdvaW5nIHRvIHdvcms/IFlvdSdkIG5lZWQg
bWZuX3ZhbGlkKHBhZ2VfdG9fbWZuKHBhaGdlKSksIG9yIHNvbWVzdWNoLgoKT29wcyAtIEknbSBi
bGluZC7CoCBTb3JyeSBmb3IgdGhlIG5vaXNlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
