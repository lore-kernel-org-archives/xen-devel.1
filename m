From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v14 9/9] mm / iommu: split need_iommu() into
 has_iommu_pt() and need_iommu_pt_sync()
Date: Fri, 05 Oct 2018 08:50:45 -0600
Message-ID: <5BB77A4502000078001EEF11@prv1-mh.provo.novell.com>
References: <20181004104547.32316-1-paul.durrant@citrix.com>
 <20181004104547.32316-10-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vier=mr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g8RRJ-0007Wq-Hn
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 14:50:49 +0000
In-Reply-To: <20181004104547.32316-10-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjEwLjE4IGF0IDEyOjQ1LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFRoZSBuYW1lICduZWVkX2lvbW11KCknIGlzIGEgbGl0dGxlIGNvbmZ1c2luZyBhcyBpdCBz
dWdnZXN0cyBhIGRvbWFpbiBuZWVkcwo+IHRvIHVzZSB0aGUgSU9NTVUgYnV0IHNvbWV0aGluZyBt
aWdodCBub3QgYmUgc2V0IHVwIHlldCwgd2hlbiBpbiBmYWN0IGl0Cj4gcmVwcmVzZW50cyBhIHRy
aS1zdGF0ZSB2YWx1ZSAobm90IGEgYm9vbGVhbiBhcyBtaWdodCBiZSBleHBlY3RlZCkgd2hlcmUK
PiAtMSBtZWFucyAnSU9NTVUgbWFwcGluZ3MgYmVpbmcgc2V0IHVwJyBhbmQgMSBtZWFucyAnSU9N
TVUgbWFwcGluZ3MgaGF2ZQo+IGJlZW4gZnVsbHkgc2V0IHVwJy4KPiAKPiBUd28gZGlmZmVyZW50
IG1lYW5pbmdzIGFyZSBhbHNvIGluZmVycmVkIGZyb20gdGhlIG1hY3JvIGl0IGluIHZhcmlvdXMK
PiBwbGFjZXMgaW4gdGhlIGNvZGU6Cj4gCj4gLSBTb21lIGNhbGxlcnMgd2FudCB0byB0ZXN0IHdo
ZXRoZXIgYSBkb21haW4gaGFzIElPTU1VIG1hcHBpbmdzIGF0IGFsbAo+IC0gU29tZSBjYWxsZXJz
IHdhbnQgdG8gdGVzdCB3aGV0aGVyIHRoZXkgbmVlZCB0byBzeW5jaHJvbml6ZSB0aGUgZG9tYWlu
J3MKPiAgIFAyTSBhbmQgSU9NTVUgbWFwcGluZ3MKPiAKPiBUaGlzIHBhdGNoIHJlcGxhY2VzIHRo
ZSAnbmVlZF9pb21tdScgdHJpLXN0YXRlIHZhbHVlIHdpdGggYSBkZWZpbmVkCj4gZW51bWVyYXRp
b24gYW5kIGFkZHMgYSBib29sZWFuIGZsYWcgJ25lZWRfc3luYycgdG8gc2VwYXJhdGUgdGhlc2Ug
bWVhbmluZ3MsCj4gYW5kIHBsYWNlcyBib3RoIG9mIHRoZXNlIGluIHN0cnVjdCBkb21haW5faW9t
bXUsIHJhdGhlciB0aGFuIGRpcmVjdGx5IGluCj4gc3RydWN0IGRvbWFpbi4KPiBUaGlzIHBhdGNo
IGFsc28gY3JlYXRlcyB0d28gbmV3IGJvb2xlYW4gbWFjcm9zOgo+IAo+IC0gJ2hhc19pb21tdV9w
dCgpJyBldmFsdWF0ZXMgdG8gdHJ1ZSBpZiBhIGRvbWFpbiBoYXMgSU9NTVUgbWFwcGluZ3MsIGV2
ZW4KPiAgIGlmIHRoZXkgYXJlIHN0aWxsIHVuZGVyIGNvbnN0cnVjdGlvbi4KPiAtICduZWVkX2lv
bW11X3B0X3N5bmMoKScgZXZhbHVhdGVzIHRvIHRydWUgaWYgYSBkb21haW4gcmVxdWlyZXMgZXhw
bGljaXQKPiAgIHN5bmNocm9uaXphdGlvbiBvZiB0aGUgUDJNIGFuZCBJT01NVSBtYXBwaW5ncy4K
PiAKPiBBbGwgY2FsbGVycyBvZiBuZWVkX2lvbW11KCkgYXJlIHRoZW4gbW9kaWZpZWQgdG8gdXNl
IHRoZSBtYWNybyBhcHByb3ByaWF0ZQo+IHRvIHdoYXQgdGhleSBhcmUgdHJ5aW5nIHRvIHRlc3Qs
IGV4Y2VwdCBmb3IgdGhlIGluc3RhbmNlIGluCj4geGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNp
LmM6YXNzaWduX2RldmljZSgpIHdoaWNoIGhhcyBzaW1wbHkgYmVlbgo+IHJlbW92ZWQgc2luY2Ug
aXQgYXBwZWFycyB0byBiZSB1bm5lY2Vzc2FyeS4KPiAKPiBOT1RFOiBUaGVyZSBhcmUgc29tZSBj
YWxsZXJzIG9mIG5lZWRfaW9tbXUoKSB0aGF0IHN0cmljdGx5IG9wZXJhdGUgb24KPiAgICAgICB0
aGUgaGFyZHdhcmUgZG9tYWluLiBJbiBzb21lIG9mIHRoZXNlIGNhc2UgYSBtb3JlIGdsb2JhbCBm
bGFnIGlzCj4gICAgICAgdXNlZCBpbnN0ZWFkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVy
cmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gQWNrZWQtYnk6IFJhenZhbiBDb2pvY2Fy
dSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KClByZXN1bWFibHkgYXMgYSByZXN1bHQgb2Yg
bGVhdmluZyBvdXQgcGF0Y2ggNCwgdGhpcyBwYXRjaCBoYWQgcXVpdGUgYQpiaXQgb2YgZnV6eiB3
aGVuIGFwcGx5aW5nLiBXb3VsZCB5b3UgcGxlYXNlIGRvdWJsZSBjaGVjayB0aGF0IEkKZGlkbid0
IHNjcmV3IHRoaW5ncyB1cD8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
