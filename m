From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v3] iommu / p2m: add a page_order parameter
 to iommu_map/unmap_page()...
Date: Wed, 14 Nov 2018 03:02:45 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE49ADC@SHSMSX101.ccr.corp.intel.com>
References: <20181031152142.17049-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=djhp=nz=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gMlSA-0001G0-4r
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 03:02:54 +0000
In-Reply-To: <20181031152142.17049-1-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0KPiBT
ZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMzEsIDIwMTggMTE6MjIgUE0KPiAKPiAuLi5hbmQgcmUt
bmFtZSB0aGVtIHRvIGlvbW11X21hcC91bm1hcCgpIHNpbmNlIHRoZXkgbm8gbG9uZ2VyCj4gbmVj
ZXNzYXJpbHkKPiBvcGVyYXRlIG9uIGEgc2luZ2xlIHBhZ2UuCj4gCj4gVGhlIFAyTSBjb2RlIGN1
cnJlbnRseSBjb250YWlucyBtYW55IGxvb3BzIHRvIGRlYWwgd2l0aCB0aGUgZmFjdCB0aGF0LAo+
IHdoaWxlIGl0IG1heSBiZSByZXF1aXJlIHRvIGhhbmRsZSBwYWdlIG9yZGVycyBncmVhdGVyIHRo
YW4gMCwgdGhlCj4gSU9NTVUgbWFwIGFuZCB1bm1hcCBmdW5jdGlvbnMgZG8gbm90Lgo+IFRoaXMg
cGF0Y2ggYWRkcyBhIHBhZ2Vfb3JkZXIgcGFyYW1ldGVyIHRvIHRob3NlIGZ1bmN0aW9ucyBhbmQK
PiBpbXBsZW1lbnRzCj4gdGhlIG5lY2Vzc2FyeSBsb29wcyB3aXRoaW4uIFRoaXMgYWxsb3dzIHRo
ZSBQMk0gY29kZSB0byBiZSBzdWJzdGFudGlhbGx5Cj4gc2ltcGxpZmllZC4KPiAKPiBUaGlzIHBh
dGNoIGFsc28gYWRkcyBlbWFjcyBib2lsZXJwbGF0ZSB0byB4ZW4vaW9tbXUuaCB0byBhdm9pZCB0
YWJiaW5nCj4gcHJvYmxlbS4KPiAKPiBOT1RFOiBUaGlzIHBhdGNoIGRvZXMgbm90IG1vZGlmeSB0
aGUgdW5kZXJseWluZyB2ZW5kb3IgSU9NTVUKPiAgICAgICBpbXBsZW1lbnRhdGlvbnMgdG8gZGVh
bCB3aXRoIG1vcmUgdGhhbiBhIHNpbmdsZSBwYWdlIGF0IG9uY2UuCj4gCj4gU2lnbmVkLW9mZi1i
eTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
