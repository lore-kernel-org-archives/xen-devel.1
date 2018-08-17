From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 3/8] iommu: make iommu_inclusive_mapping
 a suboption of dom0-iommu
Date: Fri, 17 Aug 2018 04:46:57 -0600
Message-ID: <5B76A7A102000078001DF5C7@prv1-mh.provo.novell.com>
References: <20180814134336.75539-1-roger.pau@citrix.com>
 <20180814134336.75539-4-roger.pau@citrix.com>
 <5B769DB202000078001DF50E@prv1-mh.provo.novell.com>
 <20180817103221.76zaqe6rjv4fsbd3@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ndfk=la=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqcHW-0008FD-2t
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 10:47:02 +0000
In-Reply-To: <20180817103221.76zaqe6rjv4fsbd3@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDEyOjMyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgQXVnIDE3LCAyMDE4IGF0IDA0OjA0OjM0QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTQuMDguMTggYXQgMTU6NDMsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPj4g
PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+PiA+IEBAIC0xMzA0
LDExICsxMzA0LDkgQEAgc3RhdGljIHZvaWQgX19od2RvbV9pbml0IGludGVsX2lvbW11X2h3ZG9t
X2luaXQoc3RydWN0IGRvbWFpbiAqZCkKPj4gPiAgewo+PiA+ICAgICAgc3RydWN0IGFjcGlfZHJo
ZF91bml0ICpkcmhkOwo+PiA+ICAKPj4gPiAtICAgIGlmICggIWlvbW11X2h3ZG9tX3Bhc3N0aHJv
dWdoICYmIGlzX3B2X2RvbWFpbihkKSApCj4+ID4gLSAgICB7Cj4+ID4gLSAgICAgICAgLyogU2V0
IHVwIDE6MSBwYWdlIHRhYmxlIGZvciBoYXJkd2FyZSBkb21haW4uICovCj4+ID4gLSAgICAgICAg
dnRkX3NldF9od2RvbV9tYXBwaW5nKGQpOwo+PiA+IC0gICAgfQo+PiA+ICsgICAgLyogSW5jbHVz
aXZlIG1hcHBpbmdzIGFyZSBlbmFibGVkIGJ5IGRlZmF1bHQgb24gSW50ZWwgaGFyZHdhcmUgZm9y
IFBWLiAqLwo+PiA+ICsgICAgaWYgKCBpb21tdV9od2RvbV9pbmNsdXNpdmUgPT0gLTEgKQo+PiA+
ICsgICAgICAgIGlvbW11X2h3ZG9tX2luY2x1c2l2ZSA9IGlzX3B2X2RvbWFpbihkKTsKPj4gCj4+
IEhtbSwgSSBkaWRuJ3Qgbm90aWNlIHRoaXMgYmVmb3JlLCBidXQgdGhlcmUncyBhbiBpc3N1ZSBo
ZXJlIGZvciB0aGUKPj4gbGF0ZS1od2RvbSBjYXNlOiBXaGF0IGlmIERvbTAgYW5kIHRoZSBhY3R1
YWwgaGFyZHdhcmUgZG9tYWluCj4+IGRpZmZlciBpbiB0aGVpciBQVi1uZXNzPyBJIHRoaW5rIHlv
dSBuZWVkIHRvIGtlZXAgaXQgYXQgLTEgaGVyZSBhbmQKPj4gdGFrZSB0aGUgc3RpbGwgLTEgdmFs
dWUgaW50byBhY2NvdW50IGluIGFyY2hfaW9tbXVfaHdkb21faW5pdCgpLgo+PiBpb21tdV9od2Rv
bV9pbml0KCkgdGhlbiBhbHNvIHNob3VsZCBub3Qgb3ZlcnJpZGUgaXQuCj4gCj4gQnV0IGlzbid0
IHRoZSBsYXRlLWh3ZG9tIHRoZSBvbmUgdGhhdCB3b3VsZCBiZSBwYXNzZWQgd2hlbiBjYWxsaW5n
Cj4gaW50ZWxfaW9tbXVfaHdkb21faW5pdD8KPiAKPiBPciBlbHNlIGhvdyBpcyBpbnRlbF9pb21t
dV9od2RvbV9pbml0IGdvaW5nIHRvIGRpZmZlcmVudGlhdGUgYmV0d2Vlbgo+IERvbTAgYW5kIGEg
bGF0ZS1od2RvbSBpZiB0aGUgZnVuY3Rpb24gaXMgY2FsbGVkIGZvciBib3RoPwoKT2gsIHlvdSdy
ZSByaWdodCAtIEkgd2FzIHVuZGVyIHRoZSB3cm9uZyBpbXByZXNzaW9uIHRoYXQgdGhlIGZ1bmN0
aW9uCndvdWxkIGJlIGNhbGxlZCBmb3IgYm90aCBEb20wIGFuZCBod2RvbSBpbiB0aGlzIGNhc2Ug
KGFuZCB3b3VsZCBhY3QKaWRlbnRpY2FsbHksIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQgRG9tMCBp
cyBnb2luZyB0byBnbyBhd2F5IHNvb24KYW55d2F5KS4gQXMgYSByZXN1bHQKUmV2aWV3ZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
