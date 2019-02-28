From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4.1 4/6] xen/x86: Allow stubdom access to
 irq created for msi.
Date: Thu, 28 Feb 2019 03:50:14 -0700
Message-ID: <5C77BCE6020000780021B005@prv1-mh.provo.novell.com>
References: <20190208101559.GA21228@mail-itl>
 <20190208101705.31790-1-marmarek@invisiblethingslab.com>
 <5C766F8A020000780021AA64@prv1-mh.provo.novell.com>
 <20190227151851.GF19265@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mBo3=RD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gzJGh-000439-78
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 10:50:23 +0000
In-Reply-To: <20190227151851.GF19265@mail-itl>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Simon Gaiser <simon@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAyLjE5IGF0IDE2OjE4LCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gT24gV2VkLCBGZWIgMjcsIDIwMTkgYXQgMDQ6MDc6NTRBTSAtMDcwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+PiBPbiAwOC4wMi4xOSBhdCAxMToxNywgPG1hcm1hcmVrQGlu
dmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+PiA+IEBAIC0xOTAsMTkgKzE5MCwxOSBAQCBp
bnQgY3JlYXRlX2lycShub2RlaWRfdCBub2RlKQo+PiA+ICAgICAgICAgIGRlc2MtPmFyY2gudXNl
ZCA9IElSUV9VTlVTRUQ7Cj4+ID4gICAgICAgICAgaXJxID0gcmV0Owo+PiA+ICAgICAgfQo+PiA+
IC0gICAgZWxzZSBpZiAoIGhhcmR3YXJlX2RvbWFpbiApCj4+ID4gKyAgICBlbHNlIGlmICggZG1f
ZG9tYWluICkKPj4gPiAgICAgIHsKPj4gPiAtICAgICAgICByZXQgPSBpcnFfcGVybWl0X2FjY2Vz
cyhoYXJkd2FyZV9kb21haW4sIGlycSk7Cj4+ID4gKyAgICAgICAgcmV0ID0gaXJxX3Blcm1pdF9h
Y2Nlc3MoZG1fZG9tYWluLCBpcnEpOwo+PiAKPj4gRG9lc24ndCB0aGlzIGltcGx5IHRoYXQgRG9t
MCBoYXMgbm8gd2F5IG9mIGNsZWFuaW5nIHVwIGFmdGVyIHRoZQo+PiBndWVzdC9zdHViZG9tIHBh
aXI/IElPVyBJIHdvbmRlciB3aGV0aGVyIGJvdGggZG0gYW5kIGh3ZG9tCj4+IHNob3VsZCBiZSBn
cmFudGVkIGFjY2Vzcy4KPiAKPiBTZWUgZGlzY3Vzc2lvbiB3aXRoIFJvZ2VyIG9uIHRoaXMgdmVy
eSBwYXRjaC4KPiBJbiBzaG9ydDogc2luY2UgcGVybWlzc2lvbnMgYXJlIHN0b3JlZCBpbiBkb21h
aW4gc3RydWN0LCBub3QgaXJxLCB0aGVyZQo+IGlzIG5vdCBtdWNoIHRvIGNsZWFudXAgYWZ0ZXIg
ZG9tYWluIGRlc3RydWN0aW9uLgoKTXkgcG9pbnQgd2Fzbid0IGFib3V0IGNsZWFuaW5nIHVwIHBl
cm1pc3Npb25zLCBidXQgYWJvdXQgY2xlYW5pbmcKdXAgdGhlIElSUXMuIERvbTAgY2FuJ3QgZG8g
YW55dGhpbmcgd2l0aCB0aGVtIHdpdGhvdXQgYmVpbmcKZ2l2ZW4gcGVybWlzc2lvbi4KCj4gQWxz
bywgdG9vbHN0YWNrIGluIGRvbTAKPiBoYXMgbm8gaWRlYSBhYm91dCBJUlFzIGFsbG9jYXRlZCBi
eSBzdHViZG9tYWluLCBzbyBpdCBjb3VsZG4ndCBkbyBzdWNoCj4gY2xlYW51cCBhbnl3YXkuCgpX
ZWxsLCBhIGxhc3QgcmVzb3J0IGNsZWFudXAgY291bGQgYWx3YXlzIGJlIHRvIGl0ZXJhdGUgb3Zl
ciBhbGwgcG9zc2libGUKSVJRcy4gV2hldGhlciB0aGF0J3MgaGVscGZ1bCBvbiB0b3Agb2YgWGVu
IGludGVybmFsIGNsZWFudXAgZGVwZW5kcwpvbiBob3cgbXVjaCB3ZSBjYXJlIGFib3V0IGNsZWFu
aW5nIHVwIHJlc291cmNlcyBvZiB6b21iaWUgZG9tYWlucwphcyBtdWNoIGFzIHBvc3NpYmxlLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
