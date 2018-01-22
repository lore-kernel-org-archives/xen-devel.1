From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/6] replace vCPU's dirty CPU mask by
	numeric ID
Date: Mon, 22 Jan 2018 02:39:34 -0700
Message-ID: <5A65BF6602000078001A0F24@prv-mh.provo.novell.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
 <5A62257A02000078001A0791@prv-mh.provo.novell.com>
 <e841050d-ab7e-5486-3e4c-2b6cdd574ed0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwx6=er=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edYZt-0003Ft-9N
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 09:39:45 +0000
In-Reply-To: <e841050d-ab7e-5486-3e4c-2b6cdd574ed0@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, GeorgeDunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAxLjE4IGF0IDE4OjQ4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMDEvMTggMTY6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBBdCBtb3N0IG9u
ZSBiaXQgY2FuIGJlIHNldCBpbiB0aGUgbWFza3MsIHNvIGVzcGVjaWFsbHkgb24gbGFyZ2VyIHN5
c3RlbXMKPj4gaXQncyBxdWl0ZSBhIGJpdCBvZiB1bm5lY2Vzc2FyeSBtZW1vcnkgYW5kIHByb2Nl
c3Npbmcgb3ZlcmhlYWQgdG8gdHJhY2sKPj4gdGhlIGluZm9ybWF0aW9uIGFzIGEgbWFzay4gU3Rv
cmUgdGhlIG51bWVyaWMgSUQgb2YgdGhlIHJlc3BlY3RpdmUgQ1BVCj4+IGluc3RlYWQsIG9yIE5S
X0NQVVMgaWYgbm8gZGlydHkgc3RhdGUgZXhpc3RzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gRGVmaW5pdGVseSArMSBmb3IgdGhpcyBj
aGFuZ2UuCj4gCj4gSG93ZXZlciwgdGhlIGNvbXBhcmlzb24gYWdhaW5zdCBucl9jcHVfaWRzIGlz
bid0IGNvbXBsZXRlbHkgb2J2aW91cyBhcwo+IHRvIGl0cyBmdW5jdGlvbi4gIEhvdyBhYm91dCBp
bnRyb2R1Y2luZyBhIHByZWRpY2F0ZSBzdWNoIGFzIHZjcHVfZGlydHkoKQo+IHdoaWNoIHdyYXBz
IHRoZSB1c2Ugb2YgdGhlIGlkPwoKSSBjYW4gZG8gdGhhdC4KCj4gQWxzbywgeW91J2QgZ2V0IGJl
dHRlciBjb2RlIGJ5IHVzaW5nIE5SX0NQVVMgd2hpY2ggaXMgYSBjb21waWxlLXRpbWUKPiBjb25z
dGFudCwgcmF0aGVyIHRoYW4gbnJfY3B1X2lkcyB3aGljaCB3b3VsZCBiZSBhIG1lbW9yeSByZWFk
LgoKSSBkaWQgY29uc2lkZXIgaXQsIGJ1dCBkZWNpZGVkIHRoYXQgdGhlIGNoZWNrIGJlaW5nIG1v
cmUgdGlnaHQgd2hlbgp1c2luZyBucl9jcHVfaWRzIGlzIHByZWZlcmFibGUuIFRoZSBjaGVja3Mg
c2l0IGluIEFTU0VSVCgpcyBvbmx5CmFueXdheSwgaS5lLiBJIGRvbid0IHRoaW5rIHBlcmZvcm1h
bmNlIG1hdHRlcnMgbXVjaC4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
