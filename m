From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 3/4] xen/dom0: Drop iommu_hwdom_inclusive
 entirely
Date: Fri, 4 Jan 2019 15:03:27 +0100
Message-ID: <20190104140327.thl3ylvdgm4fzne2@mac.bytemobile.com>
References: <1546269383-32166-1-git-send-email-andrew.cooper3@citrix.com>
 <1546269383-32166-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1546269383-32166-4-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMzEsIDIwMTggYXQgMDM6MTY6MjJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYwo+IGluZGV4IGM2OGE3MjIuLjBj
Y2I3NTQgMTAwNjQ0Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMK
PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYwo+IEBAIC0xNjksMTAg
KzE2OSwxMCBAQCBzdGF0aWMgYm9vbCBfX2h3ZG9tX2luaXQgaHdkb21faW9tbXVfbWFwKGNvbnN0
IHN0cnVjdCBkb21haW4gKmQsCj4gICAgICBkZWZhdWx0Ogo+ICAgICAgICAgIGlmICggdHlwZSAm
IFJBTV9UWVBFX1JFU0VSVkVEICkKPiAgICAgICAgICB7Cj4gLSAgICAgICAgICAgIGlmICggIWlv
bW11X2h3ZG9tX2luY2x1c2l2ZSAmJiAhaW9tbXVfaHdkb21fcmVzZXJ2ZWQgKQo+ICsgICAgICAg
ICAgICBpZiAoICFpb21tdV9od2RvbV9yZXNlcnZlZCApCj4gICAgICAgICAgICAgICAgICByZXR1
cm4gZmFsc2U7Cj4gICAgICAgICAgfQo+IC0gICAgICAgIGVsc2UgaWYgKCBpc19odm1fZG9tYWlu
KGQpIHx8ICFpb21tdV9od2RvbV9pbmNsdXNpdmUgfHwgcGZuID4gbWF4X3BmbiApCj4gKyAgICAg
ICAgZWxzZSBpZiAoIGlzX2h2bV9kb21haW4oZCkgfHwgcGZuID4gbWF4X3BmbiApCj4gICAgICAg
ICAgICAgIHJldHVybiBmYWxzZTsKCkkgdGhpbmsgdGhlIHN3aXRjaCBjYW4gYmUgc2ltcGxpZmll
ZCBhczoKCnN3aXRjaCAoIHR5cGUgPSBwYWdlX2dldF9yYW1fdHlwZShtZm4pICkKewpjYXNlIFJB
TV9UWVBFX0NPTlZFTlRJT05BTDoKICAgIGlmICggaW9tbXVfaHdkb21fc3RyaWN0ICkKICAgICAg
ICByZXR1cm4gZmFsc2U7CiAgICBicmVhazsKCmRlZmF1bHQ6CiAgICBpZiAoICEodHlwZSAmIFJB
TV9UWVBFX1JFU0VSVkVEKSApCiAgICAgICAgcmV0dXJuIGZhbHNlOwogICAgLyogZmFsbHRocm91
Z2guICovCmNhc2UgUkFNX1RZUEVfUkVTRVJWRUQ6CiAgICBpZiAoICFpb21tdV9od2RvbV9yZXNl
cnZlZCApCiAgICAgICByZXR1cm4gZmFsc2U7CiAgICBicmVhazsKfQoKQW5kIHRoZSBtYXhfcGZu
IHBhcmFtZXRlciBpcyBubyBsb25nZXIgbmVlZGVkLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
