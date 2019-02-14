From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] vm_event: Add a new opcode to get
 VM_EVENT_INTERFACE_VERSION
Date: Thu, 14 Feb 2019 01:13:04 -0700
Message-ID: <5C652310020000780021690F@prv1-mh.provo.novell.com>
References: <cover.1550064196.git.ppircalabu@bitdefender.com>
 <098ff486711f8437eb807614c3f9bf8f52a29141.1550064196.git.ppircalabu@bitdefender.com>
 <5C64377502000078002165D0@prv1-mh.provo.novell.com>
 <78e5f41db3fedf936e1a4c5f6d213965ee3e8586.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1guC9Z-0001iD-Q0
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 08:13:53 +0000
In-Reply-To: <78e5f41db3fedf936e1a4c5f6d213965ee3e8586.camel@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAyLjE5IGF0IDE3OjM2LCA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+IHdy
b3RlOgo+IE9uIFdlZCwgMjAxOS0wMi0xMyBhdCAwODoyNyAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4gPiA+IE9uIDEzLjAyLjE5IGF0IDE0OjI1LCA8cHBpcmNhbGFidUBiaXRkZWZlbmRl
ci5jb20+IHdyb3RlOgo+PiA+IEBAIC04NDMsNyArODQ0LDE1IEBAIHN0cnVjdCB4ZW5fZG9tY3Rs
X3ZtX2V2ZW50X29wIHsKPj4gPiAgICAgIHVpbnQzMl90ICAgICAgIG9wOyAgICAgICAgICAgLyog
WEVOX1ZNX0VWRU5UXyogKi8KPj4gPiAgICAgIHVpbnQzMl90ICAgICAgIG1vZGU7ICAgICAgICAg
LyogWEVOX0RPTUNUTF9WTV9FVkVOVF9PUF8qICovCj4+ID4gIAo+PiA+IC0gICAgdWludDMyX3Qg
cG9ydDsgICAgICAgICAgICAgIC8qIE9VVDogZXZlbnQgY2hhbm5lbCBmb3IgcmluZyAqLwo+PiA+
ICsgICAgdW5pb24gewo+PiA+ICsgICAgICAgIHN0cnVjdCB7Cj4+ID4gKyAgICAgICAgICAgIHVp
bnQzMl90IHBvcnQ7ICAgICAgIC8qIE9VVDogZXZlbnQgY2hhbm5lbCBmb3IgcmluZyAqLwo+PiA+
ICsgICAgICAgIH0gZW5hYmxlOwo+PiA+ICsKPj4gPiArICAgICAgICBzdHJ1Y3Qgewo+PiA+ICsg
ICAgICAgICAgICB1aW50MzJfdCB2YWx1ZTsKPj4gPiArICAgICAgICB9IGdldF9pbnRlcmZhY2Vf
dmVyc2lvbjsKPj4gCj4+IFdoeSB0aGUgd3JhcHBlciBzdHJ1Y3RzPyBIYXZpbmcganVzdCBhICJw
b3J0IiBhbmQgInZlcnNpb24iCj4+IGZpZWxkIGluc2lkZSB0aGUgdW5pb24gd291bGQgYmUgZ29v
ZCBlbm91Z2gsIHdvdWxkbid0IGl0PyBCdXQKPj4gZXZlbiBpZiB5b3Ugd2FudCB0byBzdGljayB0
byB0aGF0LCB0aGUgbmV3IHN0cnVjdHVyZSdzIG5hbWUKPj4gY291bGQgYmUgc2ltcGx5ICJ2ZXJz
aW9uIiwgdGh1cyBhbHNvIGFsbG93aW5nIHJlLXVzZSBmb3IgYQo+PiBoeXBvdGhldGljYWwgInNl
dC12ZXJzaW9uIiBvcGVyYXRpb24gKGluIGNhc2UgbXVsdGlwbGUgdmVyc2lvbnMKPj4gd291bGQg
d2FudC9uZWVkIHRvIGJlIHN1cHBvcnRlZCBnb2luZyBmb3J3YXJkKS4KPiBJIGNob3NlIHRvIHdy
YXAgdGhlICJwb3J0IiBmaWVsZCBpbiBhIHN0cnVjdHVyZSBiZWNhdXNlIGl0J3MgdmFsaWQgb25s
eQo+IGZvciB0aGUgWEVOX1ZNX0VWRU5UX0VOQUJMRSBvcGVyYXRpb24gKEkgaGF2ZSB1c2VkIHRo
ZSB3cmFwcGluZyBzdHJ1Y3RzCj4gaW4gb3JkZXIgdG8gbWF0Y2ggdGhlIG9wZXJhdGlvbiBuYW1l
KS4gCgpJIGd1ZXNzZWQgYXMgbXVjaC4gQnV0IHRoZXJlJ3Mgbm90aGluZyBwcmV2ZW50aW5nIHRo
ZSBmaWVsZApmb3IgYmVjb21pbmcgYXBwbGljYWJsZSB0byBzb21lIGZ1dHVyZSBzdWItb3AuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
