From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 13/16] x86: rearrange x86_64/entry.S
Date: Fri, 2 Nov 2018 12:54:44 +0000
Message-ID: <20181102125444.dwm6bbxmexrcx2su@zion.uk.xensource.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <abc8b48947d241f0dfc75f1b7624d23a9dd76709.1539959287.git-series.wei.liu2@citrix.com>
 <5BD71FCF02000078001F5DDE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1awx=nn=citrix.com=prvs=837bb29b5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gIYyO-0004FJ-Ty
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 12:54:48 +0000
Content-Disposition: inline
In-Reply-To: <5BD71FCF02000078001F5DDE@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMjksIDIwMTggYXQgMDg6NTc6MTlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjEwLjE4IGF0IDE2OjI4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBAQCAtODQ1LDE5ICs4NjUsNyBAQCBoYW5kbGVfaXN0X2V4Y2VwdGlvbjoKPiA+ICAg
ICAgICAgIC8qIFdlIHdhbnQgdG8gZ2V0IHN0cmFpZ2h0IHRvIHRoZSBJUkVUIG9uIHRoZSBOTUkg
ZXhpdCBwYXRoLiAqLwo+ID4gICAgICAgICAgdGVzdGIgJDMsVVJFR1NfY3MoJXJzcCkKPiA+ICAg
ICAgICAgIGp6ICAgIHJlc3RvcmVfYWxsX3hlbgo+ID4gLSAgICAgICAgR0VUX0NVUlJFTlQoYngp
Cj4gPiAtICAgICAgICAvKiBTZW5kIGFuIElQSSB0byBvdXJzZWx2ZXMgdG8gY292ZXIgZm9yIHRo
ZSBsYWNrIG9mIGV2ZW50IGNoZWNraW5nLiAqLwo+ID4gLSAgICAgICAgbW92bCAgVkNQVV9wcm9j
ZXNzb3IoJXJieCksJWVheAo+ID4gLSAgICAgICAgc2hsbCAgJElSUVNUQVRfc2hpZnQsJWVheAo+
ID4gLSAgICAgICAgbGVhcSAgaXJxX3N0YXQrSVJRU1RBVF9zb2Z0aXJxX3BlbmRpbmcoJXJpcCks
JXJjeAo+ID4gLSAgICAgICAgY21wbCAgJDAsKCVyY3gsJXJheCwxKQo+ID4gLSAgICAgICAgamUg
ICAgMWYKPiA+IC0gICAgICAgIG1vdmwgICRFVkVOVF9DSEVDS19WRUNUT1IsJWVkaQo+ID4gLSAg
ICAgICAgY2FsbCAgc2VuZF9JUElfc2VsZgo+ID4gLTE6ICAgICAgbW92cSAgVkNQVV9kb21haW4o
JXJieCksJXJheAo+ID4gLSAgICAgICAgY21wYiAgJDAsRE9NQUlOX2lzXzMyYml0X3B2KCVyYXgp
Cj4gPiAtICAgICAgICBqZSAgICByZXN0b3JlX2FsbF9ndWVzdAo+ID4gLSAgICAgICAgam1wICAg
Y29tcGF0X3Jlc3RvcmVfYWxsX2d1ZXN0Cj4gPiArICAgICAgICBqbXAgICBzZWxmX2lwaV9yZXN0
b3JlX2FsbF9ndWVzdAo+IAo+IEknbSBoYXZpbmcgc29tZSB0cm91YmxlIHVuZGVyc3RhbmRpbmcg
d2h5IHlvdSBtb3ZlIHRoaXMgY29kZToKPiBXaXRob3V0IENPTkZJR19QViBpdCBpcyB1bnJlYWNo
YWJsZS4KCkkgdGhvdWdodCB0aGlzIHNuaXBwZXQgd2FzIHNlbGYtY29udGFpbmVkIGVub3VnaCB0
byBtb3ZlIHRvIHRoZSBmaXJzdApoYWxmIG9mIHRoZSBmaWxlLiBCdXQgLi4uCgo+IEknZCBwcmVm
ZXIgaWYgaXQgc3RheWVkIGluCj4gcGxhY2UgYW5kIHNpbXBseSBnb3QgYW4gI2lmZGVmIGFyb3Vu
ZCBpdC4KCi4uLiBJJ20gZmluZSB3aXRoIHRoaXMgdG9vLgoKV2VpLgoKPiBUaGUgb25lIGFsdGVy
bmF0aXZlCj4gb3B0aW9uIEkgY291bGQgc2VlIGlzIHRvIG1vdmUgdGhlIHJlc3RvcmVfYWxsX3hl
biBjb2RlIGJsb2NrCj4gcmlnaHQgaGVyZSwgc28gdGhlIEpNUCB5b3UgcHV0IGluIGNvdWxkIGJl
Y29tZSBKTlouCj4gCj4gSmFuCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
