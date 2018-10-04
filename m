From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v14 9/9] mm / iommu: split need_iommu() into
 has_iommu_pt() and need_iommu_pt_sync()
Date: Thu, 4 Oct 2018 17:23:21 +0100
Message-ID: <ea81c887-0bca-6a22-84f2-1e68443c20bc@citrix.com>
References: <20181004104547.32316-1-paul.durrant@citrix.com>
 <20181004104547.32316-10-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wqag=mq=citrix.com=prvs=8089523ff=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g86PR-0002Xn-LU
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 16:23:29 +0000
In-Reply-To: <20181004104547.32316-10-paul.durrant@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDQvMjAxOCAxMTo0NSBBTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZSBuYW1lICdu
ZWVkX2lvbW11KCknIGlzIGEgbGl0dGxlIGNvbmZ1c2luZyBhcyBpdCBzdWdnZXN0cyBhIGRvbWFp
biBuZWVkcwo+IHRvIHVzZSB0aGUgSU9NTVUgYnV0IHNvbWV0aGluZyBtaWdodCBub3QgYmUgc2V0
IHVwIHlldCwgd2hlbiBpbiBmYWN0IGl0Cj4gcmVwcmVzZW50cyBhIHRyaS1zdGF0ZSB2YWx1ZSAo
bm90IGEgYm9vbGVhbiBhcyBtaWdodCBiZSBleHBlY3RlZCkgd2hlcmUKPiAtMSBtZWFucyAnSU9N
TVUgbWFwcGluZ3MgYmVpbmcgc2V0IHVwJyBhbmQgMSBtZWFucyAnSU9NTVUgbWFwcGluZ3MgaGF2
ZQo+IGJlZW4gZnVsbHkgc2V0IHVwJy4KPiAKPiBUd28gZGlmZmVyZW50IG1lYW5pbmdzIGFyZSBh
bHNvIGluZmVycmVkIGZyb20gdGhlIG1hY3JvIGl0IGluIHZhcmlvdXMKPiBwbGFjZXMgaW4gdGhl
IGNvZGU6Cj4gCj4gLSBTb21lIGNhbGxlcnMgd2FudCB0byB0ZXN0IHdoZXRoZXIgYSBkb21haW4g
aGFzIElPTU1VIG1hcHBpbmdzIGF0IGFsbAo+IC0gU29tZSBjYWxsZXJzIHdhbnQgdG8gdGVzdCB3
aGV0aGVyIHRoZXkgbmVlZCB0byBzeW5jaHJvbml6ZSB0aGUgZG9tYWluJ3MKPiAgIFAyTSBhbmQg
SU9NTVUgbWFwcGluZ3MKPiAKPiBUaGlzIHBhdGNoIHJlcGxhY2VzIHRoZSAnbmVlZF9pb21tdScg
dHJpLXN0YXRlIHZhbHVlIHdpdGggYSBkZWZpbmVkCj4gZW51bWVyYXRpb24gYW5kIGFkZHMgYSBi
b29sZWFuIGZsYWcgJ25lZWRfc3luYycgdG8gc2VwYXJhdGUgdGhlc2UgbWVhbmluZ3MsCj4gYW5k
IHBsYWNlcyBib3RoIG9mIHRoZXNlIGluIHN0cnVjdCBkb21haW5faW9tbXUsIHJhdGhlciB0aGFu
IGRpcmVjdGx5IGluCj4gc3RydWN0IGRvbWFpbi4KPiBUaGlzIHBhdGNoIGFsc28gY3JlYXRlcyB0
d28gbmV3IGJvb2xlYW4gbWFjcm9zOgo+IAo+IC0gJ2hhc19pb21tdV9wdCgpJyBldmFsdWF0ZXMg
dG8gdHJ1ZSBpZiBhIGRvbWFpbiBoYXMgSU9NTVUgbWFwcGluZ3MsIGV2ZW4KPiAgIGlmIHRoZXkg
YXJlIHN0aWxsIHVuZGVyIGNvbnN0cnVjdGlvbi4KPiAtICduZWVkX2lvbW11X3B0X3N5bmMoKScg
ZXZhbHVhdGVzIHRvIHRydWUgaWYgYSBkb21haW4gcmVxdWlyZXMgZXhwbGljaXQKPiAgIHN5bmNo
cm9uaXphdGlvbiBvZiB0aGUgUDJNIGFuZCBJT01NVSBtYXBwaW5ncy4KPiAKPiBBbGwgY2FsbGVy
cyBvZiBuZWVkX2lvbW11KCkgYXJlIHRoZW4gbW9kaWZpZWQgdG8gdXNlIHRoZSBtYWNybyBhcHBy
b3ByaWF0ZQo+IHRvIHdoYXQgdGhleSBhcmUgdHJ5aW5nIHRvIHRlc3QsIGV4Y2VwdCBmb3IgdGhl
IGluc3RhbmNlIGluCj4geGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmM6YXNzaWduX2Rldmlj
ZSgpIHdoaWNoIGhhcyBzaW1wbHkgYmVlbgo+IHJlbW92ZWQgc2luY2UgaXQgYXBwZWFycyB0byBi
ZSB1bm5lY2Vzc2FyeS4KPiAKPiBOT1RFOiBUaGVyZSBhcmUgc29tZSBjYWxsZXJzIG9mIG5lZWRf
aW9tbXUoKSB0aGF0IHN0cmljdGx5IG9wZXJhdGUgb24KPiAgICAgICB0aGUgaGFyZHdhcmUgZG9t
YWluLiBJbiBzb21lIG9mIHRoZXNlIGNhc2UgYSBtb3JlIGdsb2JhbCBmbGFnIGlzCj4gICAgICAg
dXNlZCBpbnN0ZWFkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJy
YW50QGNpdHJpeC5jb20+Cj4gQWNrZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJp
dGRlZmVuZGVyLmNvbT4KCldvdyAtLSBsb29rcyBsaWtlIGdvb2Qgd29yazoKCng4Ni9wMm0gYml0
czoKCkFja2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
