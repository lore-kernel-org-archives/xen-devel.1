From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 06/44] x86emul: test for correct EVEX
 Disp8 scaling
Date: Wed, 14 Nov 2018 07:58:18 -0700
Message-ID: <5BEC380A02000078001FC0D8@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BAA34B502000078001EB9B6@prv1-mh.provo.novell.com>
 <5BAA383002000078001EB9EF@prv1-mh.provo.novell.com>
 <32137fcd-b3d1-a427-a4bb-67733a10eb09@citrix.com>
 <5BEAB19D02000078001FB68A@prv1-mh.provo.novell.com>
 <6eb73469-6eef-be46-e52a-95d809e5ca79@citrix.com>
 <5BEC2E9202000078001FC06B@prv1-mh.provo.novell.com>
 <3877613e-8c6a-1b71-1a2a-243866f6db24@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=etbn=nz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMwdS-0000QM-0J
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 14:59:18 +0000
In-Reply-To: <3877613e-8c6a-1b71-1a2a-243866f6db24@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjExLjE4IGF0IDE1OjQyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTQvMTEvMjAxOCAxNDoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBBZnRlciBy
ZS1yZWFkaW5nIHRoZSBhcHBhcmVudGx5IHJlbGV2YW50IGJpdHMgb2YgVm9sIDEsIDIgYW5kIDMs
IEknbQo+Pj4gc3RpbGwgYWN0dWFsbHkgbm9uZSB0aGUgd2lzZXIgYXMgdG8gd2hpY2ggQVZYNTEy
IGZlYXR1cmUgYml0cyBtZWFuIHdoYXQuCj4+IFdoYXQgZmVhdHVyZSBiaXRzIGFyZSB5b3UgdGFs
a2luZyBhYm91dD8gVGhlIGNvbnRleHQgYWJvdmUgZG9lc24ndAo+PiByZWZlciB0byBhbnksIGF0
IGxlYXN0IG5vdCBkaXJlY3RseS4KPiAKPiBJIHdhcyByZWZlcnJpbmcgdG8gdGhlIEFWWDUxMiBj
cHVpZCBmbGFncy4KPiAKPiBGb3IgZXhhbXBsZSwgaXQgdG9vayBtZSB1bnRpbCB3cml0aW5nIHRo
YXQgY29tbWVudCB0byByZWFsaXNlIHRoYXQgdGhlCj4gVkwgZmVhdHVyZSBiaXQgYmVoYXZlZCBp
biB0aGUgb3Bwb3NpdGUgd2F5IHRvIGhvdyBJIGV4cGVjdGVkIGl0IHRvCj4gYmVoYXZlLiAgKEku
ZS4gaXQgYWxsb3dzIHlvdSB0byBlbmNvZGUgRVZFWCBpbnN0cnVjdGlvbnMgd2hpY2ggZG9uJ3QK
PiByZWZlciB0byAlem1tIHJlZ2lzdGVyKS4KCk9oLiBBVlg1MTIsIGFzIGl0cyBuYW1lIHNheXMs
IGltcGxpZXMgNTEyLWJpdCB2ZWN0b3JzLiBTaG9ydGVyCmZvcm1zIGFyZSB3aGF0IHRoZXkgY29u
c2lkZXIgdGhlIFZlY3RvciBMZW5ndGggRXh0ZW5zaW9uICh3aGVyZQoiZXh0ZW5zaW9uIiBkb2Vz
IF9ub3RfIHJlZmVyIHRvIHZlY3RvciBsZW5ndGgsIGJ1dCB0byB0aGUgd2lkZXIKY2FwYWJpbGl0
aWVzLikgU29tZSBvZiB0aGUgZ2NjIGlzc3VlcyBJJ3ZlIHJ1biBpbnRvIGFwcGVhciB0bwpyZWxh
dGUgdG8gcHJvYmxlbXMgdGhleSBoYXZlIHdoZW4gQVZYNTEyRiAoaS5lLiB3aXRob3V0CkFWWDUx
MlZMKSBjb2RlIHdhbnRzIHRvIGludGVyYWN0IHdpdGggY29kZSBkZWFsaW5nIHdpdGggc2hvcnRl
cgp2ZWN0b3JzLiBBbmQgdGhhdCdzIGRlc3BpdGUgc29tZSBBVlg1MTJGIGluc25zIHRoZW1zZWx2
ZXMKaGF2aW5nIHNob3J0ZXIgb3BlcmFuZHMgKHdoZW4gZWxlbWVudCB3aWR0aCB3aWRlbnMgb3Ig
c2hyaW5rcykuCgo+IEhhdmluZyBzYWlkIGFsbCBvZiB0aGlzLCBoYXZpbmcgc2VhcmNoZWQgYWJv
dXQgb25saW5lLCBJIHRoaW5rIHRoZQo+IFdpa2lwZWRpYSBBVlgtNTEyIHBhZ2UgaXMgcHJvYmFi
bHkgdGhlIGNsb3NlcyB0byB3aGF0IEkgd2FzIGxvb2tpbmcgZm9yLAo+IHNvIHBlcmhhcHMgdXMg
d3JpdGluZyBvdXIgb3duIGJyZWFrZG93biBpc24ndCB0aGUgYmVzdCBpZGVhLgoKSW5kZWVkLiBQ
bHVzIHRoZSBTRE0gaW5zbiBwYWdlcyBsb29rIHByZXR0eSBjb3JyZWN0IGluIHRoaXMgcGFydGlj
dWxhcgpyZWdhcmQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
