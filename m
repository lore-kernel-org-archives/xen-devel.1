From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 39/39] ARM: VGIC: wire new VGIC(-v2)
 files into Xen build system
Date: Thu, 22 Mar 2018 08:16:18 +0000
Message-ID: <903cfbf7-dcb4-d810-981e-6f59542bc6eb@arm.com>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-40-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rlws=gm=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eyvOc-0002sE-WC
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 08:16:27 +0000
In-Reply-To: <20180321163235.12529-40-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAwMy8yMS8yMDE4IDA0OjMyIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jIGIveGVuL2FyY2gvYXJtL3Zn
aWMvdmdpYy5jCj4gaW5kZXggMTMxMzU4YTVhMS4uMjJjNzBmZjdjZCAxMDA2NDQKPiAtLS0gYS94
ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMK
PiBAQCAtOTgxLDYgKzk4MSwxNiBAQCB1bnNpZ25lZCBpbnQgdmdpY19tYXhfdmNwdXMoY29uc3Qg
c3RydWN0IGRvbWFpbiAqZCkKPiAgICAgICByZXR1cm4gbWluX3QodW5zaWduZWQgaW50LCBNQVhf
VklSVF9DUFVTLCB2Z2ljX3ZjcHVfbGltaXQpOwo+ICAgfQo+ICAgCj4gKyNpZmRlZiBDT05GSUdf
SEFTX0dJQ1YzCj4gK3ZvaWQgdmdpY192M19zZXR1cF9odyhwYWRkcl90IGRiYXNlLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG5yX3JkaXN0X3JlZ2lvbnMsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgcmRpc3RfcmVnaW9uICpyZWdpb25zLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGludGlkX2JpdHMpCj4gK3sKPiArICAg
IC8qIER1bW15IGltcGxlbWVudGF0aW9uIHRvIGFsbG93IGJ1aWxkaW5nIHdpdGhvdXQgYWN0dWFs
IHZHSUN2MyBzdXBwb3J0LiAqLwoKT25lIG1ham9yIGluY29udmVuaWVuY2Ugd2l0aCB0aGF0IHNv
bHV0aW9uIGlzIEdJQ3YzIGRyaXZlciBpcyBnb2luZyB0byAKYmUgaW5pdGlhbGl6ZWQgYnV0IHRo
ZW4geW91IGhpdCB0aGUgQlVHX09OKCkgaW4gZG9tYWluX3ZnaWNfcmVnaXN0ZXIuIApUaGlzIGlz
IHJlYWxseSBub3QgbmljZSBmb3IgdGhlIHVzZXIgYnV0IGl0IGlzIG5vdCBvYnZpb3VzIHdoeSB0
aGUgCkJVR19PTigpIGlzIGhpdC4KCkkgYW0gb2sgaWYgeW91IGRvbid0IHdhbnQgdG8gdG91Y2gg
dGhlIEtjb25maWcuIEJ1dCBJIHdvdWxkIGF0IGxlYXN0IAppbXBsZW1lbnQgdGhhdCBoZWxwZXIg
d2l0aCBhIHBhbmljKCJ2R0lDdjMgbm90IHlldCBzdXBwb3J0ZWQgd2l0aCB0aGUgCm5ldyB2R0lD
Iik7CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
