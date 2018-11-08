From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/amd: don't set pv_post_outb_hook when
 !CONFIG_PV
Date: Thu, 08 Nov 2018 08:46:11 -0700
Message-ID: <5BE45A4302000078001F9C31@prv1-mh.provo.novell.com>
References: <20181108145809.12232-1-wei.liu2@citrix.com>
 <5BE4578B02000078001F9BF8@prv1-mh.provo.novell.com>
 <20181108153828.zuqwpohzilq2ayme@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e9yk=nt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gKmVb-0007jt-An
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 15:46:15 +0000
In-Reply-To: <20181108153828.zuqwpohzilq2ayme@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjExLjE4IGF0IDE2OjM4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDg6MzQ6MzVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwOC4xMS4xOCBhdCAxNTo1OCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMKPj4gPiArKysgYi94ZW4vYXJj
aC94ODYvY3B1L2FtZC5jCj4+ID4gQEAgLTYzMSw3ICs2MzEsOSBAQCBzdGF0aWMgdm9pZCBpbml0
X2FtZChzdHJ1Y3QgY3B1aW5mb194ODYgKmMpCj4+ID4gIAljYXNlIDB4ZiAuLi4gMHgxNzoKPj4g
PiAgCQlkaXNhYmxlX2MxZShOVUxMKTsKPj4gPiAgCQlpZiAoYWNwaV9zbWlfY21kICYmIChhY3Bp
X2VuYWJsZV92YWx1ZSB8IGFjcGlfZGlzYWJsZV92YWx1ZSkpIHsKPj4gPiArI2lmZGVmIENPTkZJ
R19QVgo+PiA+ICAJCQlwdl9wb3N0X291dGJfaG9vayA9IGFtZF9jaGVja19kaXNhYmxlX2MxZTsK
Pj4gPiArI2VuZGlmCj4+ID4gIAkJCWFtZF9hY3BpX2MxZV9xdWlyayA9IHRydWU7Cj4+ID4gIAkJ
fQo+PiA+ICAJCWJyZWFrOwo+PiAKPj4gSG1tLCBJIHdvdWxkIGhhdmUgaG9wZWQgZm9yIHRoaXMg
dG8gZ2V0IHByb3Blcmx5IGNsZWFuZWQgdXAsCj4+IGFzIG91dGxpbmVkIGluIHRoYXQgb3RoZXIg
dGhyZWFkLCBpZiB5b3UgYWxyZWFkeSB0b3VjaCBpdC4gQW55d2F5LAo+PiBJIHNlZSB5b3UndmUg
Z290IHRoZSBuZWNlc3NhcnkgYWNrcywgc28gdGhlIHN1YnNlcXVlbnQKPj4gY2xlYW51cCBwYXRj
aCB3aWxsIGp1c3QgaGF2ZSB0byBkZWxldGUgdHdvIG1vcmUgbGluZXMuCj4gCj4gRG8geW91IG1l
YW4gdG8gc3dpdGNoIFBWIHRvIHVzZSB0aGUgc2FtZSBtZWNoYW5pc20gYXMgSFZNPwoKWWVzLgoK
PiBJIGRvbid0IGhhdmUKPiBhIG1hY2hpbmUgdG8gdGVzdCB0aGlzIGNvZGUgcGF0aCBhdCB0aGUg
bW9tZW50LCBzbyBpdCB3aWxsIG5lZWQgdG8gd2FpdAo+IGEgYml0LiBJbiB0aGUgbWVhbiB0aW1l
IEkgd291bGQgbGlrZSB0byB0aWNrIG9uZSBvZiB0aGUgYmlnIHdvcmsgaXRlbXMKPiBvZmYgb2Yg
bXkgbGlzdC4KCkkgZGlkbid0IG1lYW4gdG8ga2VlcCB5b3UgZnJvbSBjb21taXR0aW5nIGl0LiBB
cyBzYWlkIC0geW91IGhhdmUgdGhlCm5lY2Vzc2FyeSBhY2suCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
