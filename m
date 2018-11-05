From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/3] x86emul: consolidate CR4 handling
Date: Mon, 05 Nov 2018 02:55:26 -0700
Message-ID: <5BE0138E02000078001F7D91@prv1-mh.provo.novell.com>
References: <5BDC7E5802000078001F75BA@prv1-mh.provo.novell.com>
 <5BDC7F4B02000078001F75D2@prv1-mh.provo.novell.com>
 <a3c2177c-1847-3e86-d853-db098abd1a8a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=5iqt=nq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gJbbY-0002XO-Hs
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 09:55:32 +0000
In-Reply-To: <a3c2177c-1847-3e86-d853-db098abd1a8a@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjExLjE4IGF0IDE5OjI0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDIvMTEvMTggMTY6NDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBOb3cgdGhhdCB0
aGVyZSdzIGFuIGFsbW9zdCB1bmNvbmRpdGlvbmFsIENSNCByZWFkIHJpZ2h0IGF0IHRoZSBiZWdp
bm5pbmcKPj4gb2YgeDg2X2VtdWxhdGUoKSwgY2VudHJhbGl6ZSBpdHMgcmVhZGluZyB0aGVyZSBh
bmQgdXNlIHJlc3VsdCBhbmQgdmFsdWUKPj4gZXZlcnl3aGVyZSBlbHNlIHdpdGhvdXQgZnVydGhl
ciBpbnZva2luZyB0aGUgaG9vay4KPj4KPj4gU3Vic2VxdWVudGx5IHdlIG1heSB3YW50IHRvIGNv
bnNpZGVyIGhhdmluZyB0aGUgY2FsbGVycyBwcm92aWRlCj4+IHdoaWNoZXZlciB2YWx1ZSB0aGV5
IGRlZW0gYXBwcm9wcmlhdGUgaW4gdGhlaXIgY29udGV4dHMsIHRvIGF2b2lkCj4+IGludm9raW5n
IHRoZSBob29rIGFsdG9nZXRoZXIgZm9yIHRoaXMgcHVycG9zZS4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEkndmUgZ290IG1vc3Qgb2Yg
YSBzZXJpZXMgZG9pbmcgdGhpcyBmb3IgY3B1aWQsIHdoaWNoIGRyb3BzIH40ayBvZiAudGV4dAo+
IHZvbHVtZSBmcm9tIHg4Nl9lbXVsYXRlKCkgYWxvbmUuCj4gCj4gTXkgcGxhbiB3YXMgdG8gZ2V0
IGFsbCB0aGUgYXJjaGl0ZWN0dXJhbCBzdGF0ZSBpbiBhIGRpcmVjdGx5IHJlYWRhYmxlCj4gZm9y
bSwgdG8gcmVkdWNlIHRoZSBjb21wbGV4aXR5IGFuZCBib2lsZXJwbGF0ZS4KCkknbSBub3QgY29u
dmluY2VkLCB0aGUgbW9yZSB0aGF0IEkgZG9uJ3QgdGhpbmsgeW91IHJlYWxseSBtZWFuICJhbGwi
CndoZW4geW91IHNheSAiYWxsIjogU3VyZWx5IG5vdCB0aGUgd2hvbGUgc2V0IG9mIE1TUnMgb3Ig
YW55IG9mClhTVEFURT8KCj4gIE9uIHRoYXQgc3ViamVjdC4uLgo+IAo+PiBAQCAtMzI0Nyw2ICsz
MjQ1LDggQEAgeDg2X2VtdWxhdGUoCj4+ICAKPj4gICAgICBBU1NFUlQob3BzLT5yZWFkKTsKPj4g
IAo+PiArICAgIGNyNF9yYyA9IG9wcy0+cmVhZF9jciA/IG9wcy0+cmVhZF9jcig0LCAmY3I0LCBj
dHh0KSA6IFg4NkVNVUxfT0tBWTsKPiAKPiAuLi4gd2h5IG5vdCBtYWtlIHJlYWRfY3IoKSBtYW5k
YXRvcnksIG9yIHB1dCBjcjQgaW50byBjdHh0PyAgUGx1bWJpbmcKPiBjcjRfcmMgYXJvdW5kIHN0
aWxsIGZlZWxzIGxpa2UgYSBsb3Qgb2YgYm9pbGVycGxhdGUuCgpyZWFkX2NyKCkgaXMgbm90IGN1
cnJlbnRseSBwb3B1bGF0ZWQgYnkgYWxsIHBhdGhzOyBzZWUKaHZtX2VtdWxhdGVfb25lX21taW8o
KSBmb3Igb25lIGV4YW1wbGUuIEkgZG9uJ3Qgd2FudCB0byBtYWtlCnRoZSBob29rIG1hbmRhdG9y
eSwgYXQgbGVhc3Qgbm90IHlldC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
