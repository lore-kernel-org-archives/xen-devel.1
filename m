From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 04/10] x86/HVM/SVM: Add AVIC
 initialization code
Date: Tue, 22 May 2018 03:19:31 -0600
Message-ID: <5B03E0A302000078001C483D@prv1-mh.provo.novell.com>
References: <20180507210753.2280-1-Janakarajan.Natarajan@amd.com>
 <20180507210753.2280-5-Janakarajan.Natarajan@amd.com>
 <5AFC4E6302000078001C357F@prv1-mh.provo.novell.com>
 <da6ffa0a-38dc-5f35-3813-4d5b15a3767b@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qj7d=ij=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fL3SF-0005EH-2n
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 09:19:39 +0000
In-Reply-To: <da6ffa0a-38dc-5f35-3813-4d5b15a3767b@amd.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, JanakarajanNatarajan <jnataraj@amd.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA1LjE4IGF0IDIwOjQxLCA8am5hdGFyYWpAYW1kLmNvbT4gd3JvdGU6Cj4gT24g
NS8xNi8yMDE4IDEwOjI5IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDcuMDUuMTgg
YXQgMjM6MDcsIDxKYW5ha2FyYWphbi5OYXRhcmFqYW5AYW1kLmNvbT4gd3JvdGU6Cj4+PiArLyoK
Pj4+ICsgKiBOb3RlOgo+Pj4gKyAqIEN1cnJlbnRseSwgc3ZtLWF2aWMgbW9kZSBpcyBub3Qgc3Vw
cG9ydGVkIHdpdGggbmVzdGVkIHZpcnR1YWxpemF0aW9uLgo+Pj4gKyAqIFRoZXJlZm9yZSwgaXQg
aXMgbm90IHlldCBjdXJyZW50bHkgZW5hYmxlZCBieSBkZWZhdWx0LiBPbmNlIHRoZSBzdXBwb3J0
Cj4+PiArICogaXMgaW4tcGxhY2UsIHRoaXMgc2hvdWxkIGJlIGVuYWJsZWQgYnkgZGVmYXVsdC4K
Pj4+ICsgKi8KPj4+ICtib29sIHN2bV9hdmljID0gZmFsc2U7Cj4+PiArCj4+PiArc3RhdGljIGNv
bnN0IGNoYXIgX19zZWN0aW9uKCIuYnNzLnBhZ2VfYWxpZ25lZC5jb25zdCIpIF9fYWxpZ25lZChQ
QUdFX1NJWkUpCj4+PiArICAgIGF2aWNfYmFja2luZ19wYWdlW1BBR0VfU0laRV07Cj4+IFNvIG5v
dGhpbmcgZXZlciB3cml0ZXMgdG8gdGhpcyBwYWdlPyBJIHRoaW5rIGl0IHdvdWxkIGJlIG1pc2xl
YWRpbmcgaWYgQ1BVIHNpZGUKPj4gd3JpdGVzIHdlcmUgcG9zc2libGUsIHlldCB0aGlzIHdhcyBt
YXJrZWQgY29uc3QuCj4gCj4gCj4gQVZJQyBoYXJkd2FyZSB1c2VzIHRoaXMgcGFnZSB0byBsb29r
IGF0IHBlcm1pc3Npb24gYml0cy4gQUZBSUssIG5vdGhpbmcgCj4gd3JpdGVzIHRvIHRoaXMgcGFn
ZS4KPiAKPiAKPj4KPj4gQWxzbyAtIGRvZXMgdGhpcyByZWFsbHkgbmVlZCBhbGxvY2F0aW5nIHN0
YXRpY2FsbHkgKHJhdGhlciB0aGFuIGp1c3Qgb24gCj4gc3lzdGVtcwo+PiBhY3R1YWxseSBuZWVk
aW5nIGl0KT8KPiAKPiAKPiBJJ20gbm90IGF3YXJlIG9mIHN5c3RlbXMgdGhhdCBkb24ndCBoYXZl
IHBlcm1pc3Npb24gYml0cy4KCk9sZGVyIEFNRCBvbmVzPyBJbnRlbCBvbmVzPwoKPj4+ICtpbnQg
c3ZtX2F2aWNfZG9tX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKPj4+ICt7Cj4+PiArICAgIGludCBy
ZXQgPSAwOwo+Pj4gKyAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZzsKPj4+ICsKPj4+ICsgICAgaWYg
KCAhc3ZtX2F2aWMgfHwgIWhhc192bGFwaWMoZCkgKQo+Pj4gKyAgICAgICAgcmV0dXJuIDA7Cj4+
PiArCj4+PiArICAgIC8qCj4+PiArICAgICAqIE5vdGU6Cj4+PiArICAgICAqIEFWSUMgaGFyZHdh
cmUgd2Fsa3MgdGhlIG5lc3RlZCBwYWdlIHRhYmxlIHRvIGNoZWNrIHBlcm1pc3Npb25zLAo+Pj4g
KyAgICAgKiBidXQgZG9lcyBub3QgdXNlIHRoZSBTUEEgYWRkcmVzcyBzcGVjaWZpZWQgaW4gdGhl
IGxlYWYgcGFnZQo+Pj4gKyAgICAgKiB0YWJsZSBlbnRyeSBzaW5jZSBpdCB1c2VzICBhZGRyZXNz
IGluIHRoZSBBVklDX0JBQ0tJTkdfUEFHRSBwb2ludGVyCj4+PiArICAgICAqIGZpZWxkIG9mIHRo
ZSBWTUNCLiBUaGVyZWZvcmUsIHdlIHNldCB1cCBhIGR1bW15IHBhZ2UgZm9yIEFQSUMuCj4+PiAr
ICAgICAqLwo+Pj4gKyAgICBzZXRfbW1pb19wMm1fZW50cnkoZCwgcGFkZHJfdG9fcGZuKEFQSUNf
REVGQVVMVF9QSFlTX0JBU0UpLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgX21mbih2aXJ0
X3RvX21mbihhdmljX2JhY2tpbmdfcGFnZSkpLCBQQUdFX09SREVSXzRLLAo+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcDJtX2FjY2Vzc19ydyk7Cj4+PiArCj4+PiArICAgIC8qIEluaXQgQVZJ
QyBsb2dpY2FsIEFQSUMgSUQgdGFibGUgKi8KPj4+ICsgICAgcGcgPSBhbGxvY19kb21oZWFwX3Bh
Z2UoZCwgTUVNRl9ub19vd25lcik7Cj4+IERvIHlvdSByZWFsbHkgbWVhbiBkIGhlcmUgKGFuZCBi
ZWxvdykgcmF0aGVyIHRoYW4gTlVMTD8KPiAKPiAKPiBXb3VsZG4ndCB0aGUgbG9naWNhbCBhbmQg
cGh5c2ljYWwgQVBJQyBJRCB0YWJsZSBwYWdlcyBiZSBjb25uZWN0ZWQgdG8gCj4gdGhlIGRvbWFp
biBhbmQgaXRzIGhlYXA/CgpOb3Qgd2l0aCBNRU1GX25vX293bmVyIGFmYWljdC4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
