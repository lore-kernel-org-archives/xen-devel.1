From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 08/13] x86: add iommu_op to query
 reserved ranges
Date: Wed, 11 Jul 2018 11:34:01 +0100
Message-ID: <dd660c29-f06c-ee5b-0063-2e0c4dd0099f@citrix.com>
References: <20180707110526.35822-1-paul.durrant@citrix.com>
 <20180707110526.35822-9-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lp25=j3=citrix.com=prvs=7234a998f=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fdCRh-0002le-Gx
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 10:34:05 +0000
In-Reply-To: <20180707110526.35822-9-paul.durrant@citrix.com>
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

T24gMDcvMDcvMjAxOCAxMjowNSBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IEBAIC0zNSwxNyAr
OTMsMzMgQEAgc3RhdGljIHZvaWQgaW9tbXVfb3AoeGVuX2lvbW11X29wX3QgKm9wKQo+ICAKPiAg
aW50IGRvX29uZV9pb21tdV9vcCh4ZW5faW9tbXVfb3BfYnVmX3QgKmJ1ZikKPiAgewo+IC0gICAg
eGVuX2lvbW11X29wX3Qgb3A7Cj4gKyAgICB4ZW5faW9tbXVfb3BfdCBvcCA9IHt9Owo+ICsgICAg
c2l6ZV90IG9mZnNldDsKPiArICAgIHN0YXRpYyBjb25zdCBzaXplX3Qgb3Bfc2l6ZVtdID0gewo+
ICsgICAgICAgIFtYRU5fSU9NTVVPUF9xdWVyeV9yZXNlcnZlZF0gPSBzaXplb2Yoc3RydWN0IHhl
bl9pb21tdV9vcF9xdWVyeV9yZXNlcnZlZCksCj4gKyAgICB9Owo+ICsKPiArICAgIG9mZnNldCA9
IG9mZnNldG9mKHN0cnVjdCB4ZW5faW9tbXVfb3AsIHUpOwo+ICAKPiAtICAgIGlmICggYnVmLT5z
aXplIDwgc2l6ZW9mKG9wKSApCj4gKyAgICBpZiAoIGJ1Zi0+c2l6ZSA8IG9mZnNldCApCj4gICAg
ICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4gIAo+IC0gICAgaWYgKCBjb3B5X2Zyb21fZ3Vlc3QoKHZv
aWQgKikmb3AsIGJ1Zi0+aCwgc2l6ZW9mKG9wKSkgKQo+ICsgICAgaWYgKCBjb3B5X2Zyb21fZ3Vl
c3QoKHZvaWQgKikmb3AsIGJ1Zi0+aCwgb2Zmc2V0KSApCj4gICAgICAgICAgcmV0dXJuIC1FRkFV
TFQ7Cj4gIAo+ICAgICAgaWYgKCBvcC5wYWQgKQo+ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ICAKPiArICAgIGlmICggb3Aub3AgPj0gQVJSQVlfU0laRShvcF9zaXplKSApCj4gKyAgICAgICAg
cmV0dXJuIC1FT1BOT1RTVVBQOwo+ICsKPiArICAgIGlmICggYnVmLT5zaXplIDwgb2Zmc2V0ICsg
b3Bfc2l6ZVtvcC5vcF0gKQo+ICsgICAgICAgIHJldHVybiAtRUZBVUxUOwo+ICsKPiArICAgIGlm
ICggY29weV9mcm9tX2d1ZXN0X29mZnNldCgodm9pZCAqKSZvcC51LCBidWYtPmgsIG9mZnNldCwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcF9zaXplW29wLm9wXSkgKQo+ICsg
ICAgICAgIHJldHVybiAtRUZBVUxUOwoKVGhpcyBsb29rcyBsaWtlIHBhcnQgb2YgYSBwb3RlbnRp
YWwgU1AxIGdhZGdldCwgc28gdGhpcyBuZWVkcyB0byB1c2UKYXJyYXlfaW5kZXhfbm9zcGVjKCku
CgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
