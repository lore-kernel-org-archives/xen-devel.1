From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 4/6] mm: introduce a helper to get the
 memory type of a page
Date: Tue, 21 Aug 2018 09:54:49 -0600
Message-ID: <5B7C35C902000078001E0984@prv1-mh.provo.novell.com>
References: <20180821074944.38773-1-roger.pau@citrix.com>
 <20180821074944.38773-5-roger.pau@citrix.com>
 <5B7C0B3102000078001E0801@prv1-mh.provo.novell.com>
 <20180821152627.tpjdkkxz2wtfy4za@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ip0d=le=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fs8zd-0007Zj-Mj
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 15:54:53 +0000
In-Reply-To: <20180821152627.tpjdkkxz2wtfy4za@mac>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA4LjE4IGF0IDE3OjI2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgQXVnIDIxLCAyMDE4IGF0IDA2OjUzOjA1QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjEuMDguMTggYXQgMDk6NDksIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gUmV0dXJucyBhbGwgdGhlIG1lbW9yeSB0eXBlcyBhcHBsaWNhYmxlIHRvIGEg
cGFnZS4KPj4gPiAKPj4gPiBUaGlzIGZ1bmN0aW9uIGlzIHVuaW1wbGVtZW50ZWQgZm9yIEFSTS4K
Pj4gPiAKPj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KPj4gCj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cj4+IAo+PiBCdXQgdGhpcyBzaG91bGQgb25seSBnbyBpbiB0b2dldGhlciB3aXRoIHRoZSBj
b25zdW1lciBvZiB0aGUgbmV3IGZ1bmN0aW9uCj4+IHNlZWluZyB0aGF0IHlvdSBkaWRuJ3QgZm9s
ZCB0aGUgcGF0Y2hlcy4KPiAKPiBPaCwgc29ycnkuIEkndmUgb25seSBmb2xkZWQgdGhlIHZwY2kg
TU1DRkcgcGF0Y2ggaW50byBwYXRjaCA2Lgo+IAo+IFNpbmNlIEkgaGF2ZSB0byByZXNlbmQgdGhp
cyBhbnl3YXkgaW4gb3JkZXIgdG8gYXBwbHkgdGhlIHJlcXVlc3RlZAo+IGNoYW5nZXMgdG8gcGF0
Y2ggNiB3b3VsZCB5b3UgbGlrZSBtZSB0byBmb2xkIHRoaXMgaW50byBwYXRjaCA1IHdoZXJlCj4g
aXQncyBhY3R1YWxseSB1c2VkPwoKTG9naWNhbGx5IGl0IG1pZ2h0IGJlIGJldHRlciwgYnV0IHRo
YXQgcGF0Y2ggaXMgYWxyZWFkeSBwcmV0dHkgYmlnCmFueXdheTsgSSdtIGZpbmUgZWl0aGVyIHdh
eS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
