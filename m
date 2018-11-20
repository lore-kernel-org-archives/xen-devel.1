From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [faster-by-no-jump-table] retpoline: disable jump
 tables
Date: Tue, 20 Nov 2018 16:57:04 +0100
Message-ID: <20181120155704.x4p4fiu6lu6e6yk7@mac>
References: <1542728274-29599-1-git-send-email-nmanthey@amazon.de>
 <5BF42BDF02000078001FE1DF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rzwt=n7=citrix.com=prvs=855b39dea=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gP8dd-0007ee-Im
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 16:12:33 +0000
Content-Disposition: inline
In-Reply-To: <5BF42BDF02000078001FE1DF@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Hongjiu Lu <hongjiu.lu@intel.com>, nmanthey@amazon.de, xen-devel <xen-devel@lists.xenproject.org>, David Woodhouse <dwmw2@infradead.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBOb3YgMjAsIDIwMTggYXQgMDg6NDQ6MzFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIwLjExLjE4IGF0IDE2OjM3LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90
ZToKPiA+IFRvIG1pdGlnYXRlIE1lbHRkb3duLCBYZW4gaGFzIGJlZW4gZml4ZWQgd2l0aCBhIHNv
ZnR3YXJlIGZpeCwgbmFtZWx5Cj4gPiB1c2luZyByZXRwb2xpbmUgc2VxdWVuY2VzIGdlbmVyYXRl
ZCBieSB0aGUgY29tcGlsZXIuIFRoaXMgd2F5LCBpbmRpcmVjdAo+ID4gYnJhbmNoZXMgYXJlIHBy
b3RlY3RlZCBhZ2FpbnN0IHRoZSBhdHRhY2suCj4gPiAKPiA+IEhvd2V2ZXIsIHRoZSByZXRwb2xp
bmUgc2VxdWVuY2UgY29tZXMgd2l0aCBhIHNsb3cgZG93bi4gVG8gbWFrZSB1cCBmb3IKPiA+IHRo
aXMsIHdlIHByb3Bvc2UgdG8gYXZvaWQganVtcCB0YWJsZXMgaW4gdGhlIGZpcnN0IHBsYWNlLiBX
aXRob3V0IHRoZQo+ID4gcmV0cG9saW5lIHNlcXVlbmNlcywgdGhpcyBjb2RlIHdvdWxkIGJlIGxl
c3MgZWZmaWNpZW50LiBIb3dldmVyLCB3aGVuCj4gPiByZXRwb2xpbmUgaXMgZW5hYmxlZCwgdGhp
cyBhY3R1YWxseSByZXN1bHRzIGluIGEgc2xpZ2h0IHBlcmZvcm1hbmNlCj4gPiBpbXByb3ZlbWVu
dC4KPiA+IAo+ID4gVGhpcyBjaGFuZ2UgbWlnaHQgYmVjb21lIGlycmVsZXZhbnQgb25jZSB0aGUg
Y29tcGlsZXIgc3RhcnRzIGF2b2lkaW5nCj4gPiBqdW1wIHRhYmxlcyBpbiBjYXNlIHJldHBvbGlu
ZXMgYXJlIHVzZWQ6Cj4gPiBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNn
aT9pZD04Njk1MiAKPiA+IAo+ID4gUmVwb3J0ZWQtYnk6IEp1bGlhbiBTdGVja2xpbmEgPGpzdGVj
a2xpQGFtYXpvbi5kZT4KPiA+IFJlcG9ydGVkLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lw
YXdlbEBhbWF6b24uZGU+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50
aGV5QGFtYXpvbi5kZT4KClNob3VsZG4ndCB0aGlzIHVzZSBjYy1vcHRpb24tYWRkLCBvciBpcyBp
dCBndWFyYW50ZWVkIHRoYXQgZXZlcnkKY29tcGlsZXIgdGhhdCBzdXBwb3J0cyAtbWluZGlyZWN0
LWJyYW5jaC1yZWdpc3RlciB3aWxsIGFsc28gc3VwcG9ydAotZm5vLWp1bXAtdGFibGVzPwoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
