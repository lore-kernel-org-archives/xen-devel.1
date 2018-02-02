From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 13/25] x86emul: adjust_bnd() should check
	XCR0
Date: Fri, 2 Feb 2018 13:30:54 +0000
Message-ID: <6b93de9a-44af-d28e-8660-1c685e3fb8bd@citrix.com>
References: <5A29550C020000780019585B@prv-mh.provo.novell.com>
 <5A29597D0200007800195900@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=g0dj=e4=citrix.com=prvs=564f8cbd0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ehbQj-00046T-K5
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 13:31:01 +0000
In-Reply-To: <5A29597D0200007800195900@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMTcgMTQ6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEV4cGVyaW1lbnRhbGx5IE1Q
WCBpbnN0cnVjdGlvbnMgaGF2ZSBiZWVuIGNvbmZpcm1lZCB0byBiZWhhdmUgYXMgTk9Qcwo+IHVu
bGVzcyBib3RoIHJlbGF0ZWQgWENSMCBiaXRzIGFyZSBzZXQgdG8gMS4gQnkgaW1wbGljYXRpb24g
YnJhbmNoZXMKPiB0aGVuIGFsc28gZG9uJ3QgY2xlYXIgQk5Ebi4KPgo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94
ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRl
L3g4Nl9lbXVsYXRlLmMKPiBAQCAtMjE0MywxMiArMjE0MywxNiBAQCBzdGF0aWMgYm9vbCB1bWlw
X2FjdGl2ZShzdHJ1Y3QgeDg2X2VtdWxhCj4gIHN0YXRpYyB2b2lkIGFkanVzdF9ibmQoc3RydWN0
IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
c3RydWN0IHg4Nl9lbXVsYXRlX29wcyAqb3BzLCBlbnVtIHZleF9wZnggcGZ4KQo+ICB7Cj4gLSAg
ICB1aW50NjRfdCBibmRjZmc7Cj4gKyAgICB1aW50NjRfdCB4Y3IwLCBibmRjZmc7Cj4gICAgICBp
bnQgcmM7Cj4gIAo+ICAgICAgaWYgKCBwZnggPT0gdmV4X2YyIHx8ICFjcHVfaGFzX21weCB8fCAh
dmNwdV9oYXNfbXB4KCkgKQo+ICAgICAgICAgIHJldHVybjsKPiAgCj4gKyAgICBpZiAoICFvcHMt
PnJlYWRfeGNyIHx8IG9wcy0+cmVhZF94Y3IoMCwgJnhjcjAsIGN0eHQpICE9IFg4NkVNVUxfT0tB
WSB8fAo+ICsgICAgICAgICAhKHhjcjAgJiBYU1RBVEVfQk5EUkVHUykgfHwgISh4Y3IwICYgWFNU
QVRFX0JORENTUikgKQoKISh4Y3IwICYgKFhTVEFURV9CTkRSRUdTIHwgWFNUQVRFX0JORENTUikp
ID8KCk90aGVyd2lzZSwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Cgo+ICsgICAgICAgIHJldHVybjsKPiArCj4gICAgICBpZiAoICFtb2RlX3Jp
bmcwKCkgKQo+ICAgICAgICAgIGJuZGNmZyA9IHJlYWRfYm5kY2ZndSgpOwo+ICAgICAgZWxzZSBp
ZiAoICFvcHMtPnJlYWRfbXNyIHx8Cj4KPgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
