From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 12/16] xen/mm: Switch common/memory.c to
 use typesafe MFN
Date: Fri, 02 Mar 2018 08:34:42 -0700
Message-ID: <5A997D2202000078001ADE90@prv-mh.provo.novell.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-13-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221140259.29360-13-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE4IGF0IDE1OjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEBAIC05NSwxMSArMTAxLDE4IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbWF4X29yZGVyKGNvbnN0
IHN0cnVjdCBkb21haW4gKmQpCj4gICAgICByZXR1cm4gbWluKG9yZGVyLCBNQVhfT1JERVIgKyAw
VSk7Cj4gIH0KPiAgCj4gKy8qIEhlbHBlciB0byBjb3B5IGEgdHlwZXNhZmUgTUZOIHRvIGd1ZXN0
ICovCj4gKyNkZWZpbmUgY29weV9tZm5fdG9fZ3Vlc3QoaG5kLCBvZmYsIG1mbikgICAgICAgICAg
ICBcCj4gKyAgICAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gKyAgICAgICAgeGVuX3Bmbl90IG1mbl8gPSBtZm5feChtZm4pOyAgICAgICAgICAgICAg
ICBcCj4gKyAgICAgICAgX19jb3B5X3RvX2d1ZXN0X29mZnNldChobmQsIG9mZiwgJm1mbl8sIDEp
OyBcCj4gKyAgICB9KQoKSG1tLCBub3QgcmVhbGx5IG5pY2UsIGJ1dCB3aGF0IGRvIHlvdSBkby4g
Cgo+ICBzdGF0aWMgdm9pZCBpbmNyZWFzZV9yZXNlcnZhdGlvbihzdHJ1Y3QgbWVtb3BfYXJncyAq
YSkKPiAgewo+ICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsKPiAgICAgIHVuc2lnbmVkIGxv
bmcgaTsKPiAtICAgIHhlbl9wZm5fdCBtZm47Cj4gKyAgICBtZm5fdCBtZm47CgpQbGVhc2UgbW92
ZSB0aGlzIGRlY2xhcmF0aW9uIC4uLgoKPiBAQCAtMTMzLDcgKzE0Niw3IEBAIHN0YXRpYyB2b2lk
IGluY3JlYXNlX3Jlc2VydmF0aW9uKHN0cnVjdCBtZW1vcF9hcmdzICphKQo+ICAgICAgICAgICAg
ICAgIWd1ZXN0X2hhbmRsZV9pc19udWxsKGEtPmV4dGVudF9saXN0KSApCj4gICAgICAgICAgewo+
ICAgICAgICAgICAgICBtZm4gPSBwYWdlX3RvX21mbihwYWdlKTsKCi4uLiBoZXJlLCBtYWtpbmcg
dGhlIGFzc2lnbm1lbnQgaXRzIGluaXRpYWxpemVyLiBPciBldmVuIGF2b2lkIHRoZQpsb2NhbCB2
YXJpYWJsZSBhbHRvZ2V0aGVyLCBhcyB0aGUgbWFjcm8gaGFzIGFscmVhZHkgZ290IG9uZS4gU2Ft
ZQplbHNld2hlcmUgKHdoaWNoZXZlciBvZiB0aGUgdHdvIHZhcmlhbnRzIGZpdHMpLCBhbGJlaXQg
bWF5YmUgaW4gdGhlCm90aGVyIGNhc2VzIHRoZSBzY29wZSBjYW4ndCBiZSBzaHJ1bmsgbXVjaC4K
CkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
