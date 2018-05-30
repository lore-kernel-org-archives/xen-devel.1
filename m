From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 04/10] Make MEM_ACCESS configurable
Date: Wed, 30 May 2018 13:24:51 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805301322460.23991@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1805221719560.24793@sstabellini-ThinkPad-X260>
 <1527035108-15051-4-git-send-email-sstabellini@kernel.org>
 <5B0D3E8E02000078001C6902@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B0D3E8E02000078001C6902@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Tim Deegan <tim@xen.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyOSBNYXkgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDIzLjA1LjE4
IGF0IDAyOjI1LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiAtLS0gYS94ZW4v
YXJjaC9hcm0vS2NvbmZpZwo+ID4gKysrIGIveGVuL2FyY2gvYXJtL0tjb25maWcKPiA+IEBAIC0y
Niw2ICsyNiw5IEBAIGNvbmZpZyBBUkNIX0RFRkNPTkZJRwo+ID4gIAlkZWZhdWx0ICJhcmNoL2Fy
bS9jb25maWdzL2FybTMyX2RlZmNvbmZpZyIgaWYgQVJNXzMyCj4gPiAgCWRlZmF1bHQgImFyY2gv
YXJtL2NvbmZpZ3MvYXJtNjRfZGVmY29uZmlnIiBpZiBBUk1fNjQKPiA+ICAKPiA+ICtjb25maWcg
SEFTX01FTV9BQ0NFU1MKPiA+ICsJZGVmX2Jvb2wgeQo+IAo+IFRoZSBtb3JlIHRoYXQgeW91J3Jl
IG5vdCBkZWxldGluZyB0aGUgcmVzcGVjdGl2ZSBzZWxlY3QtcywgcGxlYXNlCj4gZG9uJ3QgaW50
cm9kdWNlIHN1Y2ggcGVyLWFyY2guIEtlZXAgdGhlIGFyY2gtbmV1dHJhbCBvbmUsIC4uLgoKT0sK
Cgo+ID4gQEAgLTMwLDYgKzMxLDEyIEBAIGNvbmZpZyBBUkNIX0RFRkNPTkZJRwo+ID4gIAlzdHJp
bmcKPiA+ICAJZGVmYXVsdCAiYXJjaC94ODYvY29uZmlncy94ODZfNjRfZGVmY29uZmlnIgo+ID4g
IAo+ID4gK2NvbmZpZyBIQVNfTUVNX0FDQ0VTUwo+ID4gKwlkZWZfYm9vbCB5Cj4gPiArCj4gPiAr
Y29uZmlnIE1FTV9BQ0NFU1NfQUxXQVlTX09OCj4gPiArCWRlZl9ib29sIHkKPiAKPiAuLi4gbWFr
ZSB0aGlzIG9uZSBzaW1pbGFybHkgYW4gYXJjaC1uZXV0cmFsIG9uZSAoc2VsZWN0LWVkIGZ1cnRo
ZXIgdXAKPiBpbiB0aGlzIGZpbGUpLgoKT0sKCgo+ID4gLS0tIGEveGVuL2NvbW1vbi9LY29uZmln
Cj4gPiArKysgYi94ZW4vY29tbW9uL0tjb25maWcKPiA+IEBAIC0yMCw4ICsyMCwxNSBAQCBjb25m
aWcgSEFTX0RFVklDRV9UUkVFCj4gPiAgY29uZmlnIEhBU19FWF9UQUJMRQo+ID4gIAlib29sCj4g
PiAgCj4gPiAtY29uZmlnIEhBU19NRU1fQUNDRVNTCj4gPiArY29uZmlnIE1FTV9BQ0NFU1MKPiA+
ICAJYm9vbAo+ID4gKwlwcm9tcHQgIk1lbW9yeSBBY2Nlc3MgYW5kIFZNIGV2ZW50cyIgaWYgIU1F
TV9BQ0NFU1NfQUxXQVlTX09OCj4gPiArCWRlZmF1bHQgeQo+IAo+IFBsZWFzZSBjb21iaW5lIGJv
b2wgYW5kIGRlZmF1bHQgdG8gZGVmX2Jvb2wuCgpPSwoKCj4gQWxzbyAtIGRvIHdlIHBlcmhhcHMg
d2FudCB0aGUKPiBwcm9tcHQgdG8gYWRkaXRpb25hbGx5IGhhdmUgYW4gRVhQRVJUIGRlcGVuZGVu
Y3k/IFdpdGhvdXQgeW91IHNheWluZyB3aHkKPiB5b3Ugd2FudCB0aGlzIGNvbmZpZ3VyYWJsZSBJ
IGNhbid0IHRlbGwgd2hldGhlciB0aGlzIHdvdWxkIG1ha2Ugc2Vuc2UuCgpJIGFtIGRvaW5nIHRo
aXMgbW9zdGx5IHRvIHJlZHVjZSB0aGUgY29kZSBzaXplLiBJIHRoaW5rIHdlIHNob3VsZApzZWN1
cml0eSBzdXBwb3J0IGNvbmZpZ3VyYXRpb25zIHdpdGhvdXQgTUVNX0FDQ0VTUy4gSSBhbHNvIGRv
bid0IHRoaW5rCml0IHNob3VsZCB0YWtlIGFuICJleHBlcnQiIHRvIGRpc2FibGUgTUVNX0FDQ0VT
UyBpbiBYZW4uIFRodXMsIG15CnByZWZlcmVuY2UgaXMgdG8gYXZvaWQgYWRkaW5nIHRoZSBFWFBF
UlQgZGVwZW5kZW5jeS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
