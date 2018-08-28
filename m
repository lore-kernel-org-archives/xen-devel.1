From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xenforeignmemory: work around bug in older
 privcmd
Date: Tue, 28 Aug 2018 15:12:32 +0100
Message-ID: <fcd947b7-844d-2ddf-71ee-45dfd6cf4566@citrix.com>
References: <20180824121626.27261-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qctd=ll=citrix.com=prvs=771e299fc=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fuejx-0003uL-LN
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 14:13:05 +0000
In-Reply-To: <20180824121626.27261-1-paul.durrant@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDgvMTggMTM6MTYsIFBhdWwgRHVycmFudCB3cm90ZToKPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvbGlicy9mb3JlaWdubWVtb3J5L2xpbnV4LmMgYi90b29scy9saWJzL2ZvcmVpZ25tZW1vcnkv
bGludXguYwo+IGluZGV4IDM2ODZjZjQxZTAuLjAzNjhhYTA5ZjQgMTAwNjQ0Cj4gLS0tIGEvdG9v
bHMvbGlicy9mb3JlaWdubWVtb3J5L2xpbnV4LmMKPiArKysgYi90b29scy9saWJzL2ZvcmVpZ25t
ZW1vcnkvbGludXguYwo+IEBAIC01Myw2ICs1MywyMyBAQCBpbnQgb3NkZXBfeGVuZm9yZWlnbm1l
bW9yeV9vcGVuKHhlbmZvcmVpZ25tZW1vcnlfaGFuZGxlICpmbWVtKQo+ICAgICAgICAgIHJldHVy
biAtMTsKPiAgICAgIH0KPiAgCj4gKyAgICAvKgo+ICsgICAgICogT2xkZXIgdmVyc2lvbnMgb2Yg
cHJpdmNtZCByZXR1cm4gLUVJTlZBTCBmb3IgdW5pbXBsZW1lbnRlZCBpb2N0bHMKPiArICAgICAq
IHNvIHdlIG5lZWQgdG8gcHJvYmUgZm9yIHRoZSBlcnJubyB0byB1c2UgcmF0aGVyIHRoYW4ganVz
dCB1c2luZwo+ICsgICAgICogdGhlIGNvbnZlbnRpb25hbCBFTk9UVFkuCj4gKyAgICAgKi8KPiAr
ICAgIGlmICggaW9jdGwoZmQsIElPQ1RMX1BSSVZDTURfVU5JTVBMRU1FTlRFRCwgTlVMTCkgPj0g
MCApCj4gKyAgICB7Cj4gKyAgICAgICAgeHRsX2xvZyhmbWVtLT5sb2dnZXIsIFhUTF9FUlJPUiwg
LTEsICJ4ZW5mb3JlaWdubWVtb3J5IiwKPiArICAgICAgICAgICAgICAgICJwcml2Y21kIGlvY3Rs
IHNob3VsZCBub3QgYmUgaW1wbGVtZW50ZWQiKTsKClRoaXMgZXJyb3IgcGF0aCBsZWFrcyBmZC4K
Cn5BbmRyZXcKCj4gKyAgICAgICAgcmV0dXJuIC0xOwo+ICsgICAgfQo+ICsgICAgZWxzZQo+ICsg
ICAgewo+ICsgICAgICAgIGZtZW0tPnVuaW1wbF9lcnJubyA9IGVycm5vOwo+ICsgICAgICAgIGVy
cm5vID0gMDsKPiArICAgIH0KPiArCj4gICAgICBmbWVtLT5mZCA9IGZkOwo+ICAgICAgcmV0dXJu
IDA7Cj4gIH0KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
