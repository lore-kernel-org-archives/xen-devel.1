From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 10/17] x86: provide stub for switch_compat
Date: Fri, 12 Oct 2018 15:36:41 +0100
Message-ID: <20181012143641.xxwju6ytgxhrl5hq@zion.uk.xensource.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <7ef6c604e1e5e528f017e7bde6c62c2ba57b5e2e.1538667753.git-series.wei.liu2@citrix.com>
 <5BC0B0CC02000078001F10D2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zta5=my=citrix.com=prvs=8166c57ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gAyYb-0006EB-Th
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 14:36:49 +0000
Content-Disposition: inline
In-Reply-To: <5BC0B0CC02000078001F10D2@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTIsIDIwMTggYXQgMDg6MzM6NDhBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjEwLjE4IGF0IDE3OjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vY29tcGF0LmgKPiA+ICsrKyBiL3hlbi9pbmNs
dWRlL3hlbi9jb21wYXQuaAo+ID4gQEAgLTIyOCw3ICsyMjgsMTYgQEAgc3RydWN0IHZjcHVfcnVu
c3RhdGVfaW5mbzsKPiA+ICB2b2lkIHhsYXRfdmNwdV9ydW5zdGF0ZV9pbmZvKHN0cnVjdCB2Y3B1
X3J1bnN0YXRlX2luZm8gKik7Cj4gPiAgCj4gPiAgc3RydWN0IGRvbWFpbjsKPiA+ICsKPiA+ICsj
aWZkZWYgQ09ORklHX1BWCj4gPiAgaW50IHN3aXRjaF9jb21wYXQoc3RydWN0IGRvbWFpbiAqKTsK
PiA+ICsjZWxzZQo+ID4gKyMgaW5jbHVkZSA8eGVuL2Vycm5vLmg+Cj4gPiArc3RhdGljIGlubGlu
ZSBpbnQgc3dpdGNoX2NvbXBhdChzdHJ1Y3QgZG9tYWluICpkKQo+ID4gK3sKPiA+ICsgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gPiArfQo+ID4gKyNlbmRpZgo+IAo+IEkgc2VlIHR3byBvcHRpb25zIGhl
cmU6IEVpdGhlciB3ZSBnbyB3aXRoIHRoIGFib3ZlLCBidXQgd2l0aCAtRUFDQ0VTCj4gYXMgdGhl
IHJldHVybiB2YWx1ZSAodG8gbWF0Y2ggdGhlIGN1cnJlbnQgb25lIGZvciBIVk0gZG9tYWlucyks
IG9yCj4gdGhlICNpZmRlZiBnb2VzIGFyb3VuZCB0aGUgY2FzZSBibG9jayBpbiBkb21jdGwuYy4g
UGVyc29uYWxseSBJJ2QgcHJlZmVyCj4gdGhlIGxhdHRlci4KClRoaXMgbWFrZXMgbWUgY2h1Y2ts
ZSBiZWNhdXNlIG9yaWdpbmFsbHkgSSBvcHRlZCBmb3Igd2hhdCB5b3Ugd2FudCBoZXJlCmJ1dCBk
ZWNpZGVkIHRvIHN3aXRjaCB0byB1c2luZyBzdHViIGJlZm9yZSBwb3N0aW5nLgoKSSB3aWxsIGRv
IHRoYXQgaW4gdGhlIG5leHQgdmVyc2lvbiBvZiB0aGlzIHNlcmllcy4KCldlaS4KCj4gCj4gSmFu
Cj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
