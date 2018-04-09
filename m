From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] vhpet: add support for level
 triggered interrupts
Date: Mon, 09 Apr 2018 09:51:17 -0600
Message-ID: <5ACBA81502000078001B9B49@prv1-mh.provo.novell.com>
References: <20180330123600.22716-1-roger.pau@citrix.com>
 <20180330123600.22716-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=shlr=g6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f5Z4m-0006Ra-6F
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 15:51:24 +0000
In-Reply-To: <20180330123600.22716-3-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefan Bader <stefan.bader@canonical.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjAzLjE4IGF0IDE0OjM2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IExldmVsIHRyaWdnZXJlZCBpbnRlcnJ1cHRzIGFyZSBub3QgYW4gb3B0aW9uYWwgZmVhdHVyZSBv
ZiBIUEVULCBhbmQKPiBtdXN0IGJlIGltcGxlbWVudGVkIGluIG9yZGVyIHRvIGNvbXBseSB3aXRo
IHRoZSBIUEVUIHNwZWNpZmljYXRpb24uCj4gCj4gSW1wbGVtZW50IHRoZW0gYnkgYWRkaW5nIGEg
Y2FsbGJhY2sgdG8gdGhlIHRpbWVyIHdoaWNoIHNldHMgdGhlCj4gaW50ZXJydXB0IGJpdCBpbiB0
aGUgZ2VuZXJhbCBpbnRlcnJ1cHQgc3RhdHVzIHJlZ2lzdGVyLiBGdXJ0aGVyCj4gaW50ZXJydXB0
cyAoaW4gY2FzZSBvZiBwZXJpb2RpYyBtb2RlKSB3aWxsIG5vdCBiZSBpbmplY3RlZCB1bnRpbCB0
aGUKPiBiaXQgaXMgY2xlYXJlZC4KPiAKPiBJbiBvcmRlciB0byByZXNldCB0aGUgaW50ZXJydXB0
cyB3aGVuIHRoZSBzdGF0dXMgYml0IGlzIGNsZWFyIFhlbiBtdXN0Cj4gYWxzbyBkZXRlY3QgYWNj
ZXNzZXMgdG8gc3VjaCByZWdpc3Rlci4KCnMvZGV0ZWN0L2hhbmRsZS8gYW5kIHMvc3VjaC90aGUg
c3RhdHVzLyA/Cgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHBldC5jCj4gKysrIGIveGVuL2Fy
Y2gveDg2L2h2bS9ocGV0LmMKPiBAQCAtMjIwLDYgKzIyMCwxNyBAQCBzdGF0aWMgdm9pZCBocGV0
X3N0b3BfdGltZXIoSFBFVFN0YXRlICpoLCB1bnNpZ25lZCBpbnQgdG4sCj4gICAgICBocGV0X2dl
dF9jb21wYXJhdG9yKGgsIHRuLCBndWVzdF90aW1lKTsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQg
aHBldF90aW1lcl9maXJlZChzdHJ1Y3QgdmNwdSAqdiwgdm9pZCAqZGF0YSkKCk5vIG5lZWQgZm9y
IHRoZSBocGV0XyBwcmVmaXggd2hlbiB0aGUgZnVuY3Rpb24gaXMgc3RhdGljLgoKPiArewo+ICsg
ICAgdW5zaWduZWQgaW50IHRuID0gKHVuc2lnbmVkIGludClkYXRhOwoKTW9zdCBnY2MgdmVyc2lv
bnMgSSdtIGF3YXJlIG9mIHdpbGwgd2FybiBhYm91dCBjYXN0cyBiZXR3ZWVuCnBvaW50ZXJzIGFu
ZCBpbnRlZ2VycyBvZiBkaWZmZXJlbnQgc2l6ZSAtIHRoZSBjYXN0IG5lZWRzIHRvIGJlIHRvCnVu
c2lnbmVkIGxvbmcgKHdoaWxlIHRoZSB2YXJpYWJsZSB0eXBlIGNhbiByZW1haW4gYXMgaXMpLiBP
ZGRseQplbm91Z2ggeW91IGdvIHRocm91Z2ggdW5zaWduZWQgbG9uZyB3aGVuIGNhc3RpbmcgaW4g
dGhlIG90aGVyCmRpcmVjdGlvbi4KCj4gQEAgLTM2MCw2ICszNzcsMTkgQEAgc3RhdGljIGludCBo
cGV0X3dyaXRlKAo+ICAgICAgICAgIH0KPiAgICAgICAgICBicmVhazsKPiAgCj4gKyAgICBjYXNl
IEhQRVRfU1RBVFVTOgo+ICsgICAgICAgIC8qIHdyaXRlIDEgdG8gY2xlYXIuICovCj4gKyAgICAg
ICAgd2hpbGUgKG5ld192YWwpCgpNaXNzaW5nIGJsYW5rcy4KCkphbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
