From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/6] x86/hvm: Provide
	XEN_DMOP_add_to_physmap
Date: Thu, 18 Jan 2018 02:40:04 -0700
Message-ID: <5A607984020000780019FC4A@prv-mh.provo.novell.com>
References: <20180112124513.28082-1-ross.lagerwall@citrix.com>
 <20180112124513.28082-3-ross.lagerwall@citrix.com>
 <5A6075E1020000780019FC0A@prv-mh.provo.novell.com>
 <9d161648-b382-8dd1-5eb4-fadfa2355367@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9d161648-b382-8dd1-5eb4-fadfa2355367@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: TimDeegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAxLjE4IGF0IDEwOjMyLCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDEvMTgvMjAxOCAwOToyNCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9u
IDEyLjAxLjE4IGF0IDEzOjQ1LCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4gd3JvdGU6Cj4+
PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2RtX29wLmgKPj4+ICsrKyBiL3hlbi9pbmNs
dWRlL3B1YmxpYy9odm0vZG1fb3AuaAo+Pj4gQEAgLTM2OCw2ICszNjgsMjQgQEAgc3RydWN0IHhl
bl9kbV9vcF9yZW1vdGVfc2h1dGRvd24gewo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAvKiAoT3RoZXIgcmVhc29uIHZhbHVlcyBhcmUgbm90IGJsb2NrZWQpICovCj4+PiAgIH07Cj4+
PiAgIAo+Pj4gKy8qCj4+PiArICogWEVOX0RNT1BfYWRkX3RvX3BoeXNtYXAgOiBTZXRzIHRoZSBH
Rk5zIGF0IHdoaWNoIGEgcGFnZSByYW5nZSBhcHBlYXJzIGluCj4+PiArICogICAgICAgICAgICAg
ICAgICAgICAgICAgICB0aGUgc3BlY2lmaWVkIGd1ZXN0J3MgYWRkcmVzcyBzcGFjZS4gSWRlbnRp
Y2FsIHRvCj4+PiArICogICAgICAgICAgICAgICAgICAgICAgICAgICBYRU5NRU1fYWRkX3RvX3Bo
eXNtYXAgd2l0aAo+Pj4gKyAqICAgICAgICAgICAgICAgICAgICAgICAgICAgc3BhY2UgPT0gWEVO
TUFQU1BBQ0VfZ21mbl9yYW5nZS4KPj4+ICsgKi8KPj4+ICsjZGVmaW5lIFhFTl9ETU9QX2FkZF90
b19waHlzbWFwIDE3Cj4+PiArCj4+PiArc3RydWN0IHhlbl9kbV9vcF9hZGRfdG9fcGh5c21hcCB7
Cj4+PiArICAgIC8qIE51bWJlciBvZiBHRk5zIHRvIHByb2Nlc3MuICovCj4+PiArICAgIHVpbnQz
Ml90IHNpemU7Cj4+PiArICAgIHVpbnQzMl90IHBhZDsKPj4+ICsgICAgLyogU3RhcnRpbmcgR0ZO
IG9mIHRoZSBzb3VyY2UgbWFwcGluZyBwYWdlKHMpLiAqLwo+Pj4gKyAgICB1aW50NjRfYWxpZ25l
ZF90IHNyY19nZm47Cj4+PiArICAgIC8qIFN0YXJ0aW5nIEdGTiB3aGVyZSB0aGUgc291cmNlIG1h
cHBpbmcgcGFnZShzKSBzaG91bGQgYXBwZWFyLiAqLwo+Pj4gKyAgICB1aW50NjRfYWxpZ25lZF90
IGRzdF9nZm47Cj4+PiArfTsKPj4gCj4+IFNvIHdoeSBhZ2FpbiBpcyB0aGlzICJhZGQtdG8tcGh5
c21hcCI/IEl0J3MgbW92aW5nIG1lbW9yeSBhcm91bmQsCj4+IGlzbid0IGl0PyBUaGUgY29tbWVu
dCBhbHNvIGNvdWxkIGJlIG1vcmUgY2xlYXIgaW4gdGhpcyByZWdhcmQuCj4+IEV2ZXJ5dGhpbmcg
ZWxzZSBsb29rcyBmaW5lIHRvIG1lIG5vdy4KPiAKPiBEbyB5b3UgaGF2ZSBhIHByZWZlcmVuY2Ug
Zm9yIHdoYXQgdG8gY2FsbCBpdD8KCkJlc3QgSSBjYW4gdGhpbmsgb2YgaXMgWEVOX0RNT1BfbW92
ZV9nZm5zLCBidXQgSSBkb24ndCBsaWtlIGl0CnZlcnkgbXVjaCwgaGVuY2UgSSBkaWRuJ3Qgc3Vn
Z2VzdCBpdCBpbiBteSBlYXJsaWVyIHJlcGx5LgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
