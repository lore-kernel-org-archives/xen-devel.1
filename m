From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: Re: Xen stable-4.11 crash when trying to start a VM on
 fedora 29
Date: Sat, 08 Dec 2018 01:01:33 +0000
Message-ID: <0MIsy-pGK5SPEXb-bEY_hLE-vJmoZEPKiPHUyFAy9isVDTnzpjBzARsWfCaKP7hGgpS_ZYbTmVrucxwE2YEEji8vdTPa4Dy4JVe1XR4Zm8w=@protonmail.com>
References: <141iAKOMS78aTtc5NNHFk6GVJglW_gZhWtlSThWd1BhnzTWHhU9LnS-hgEJzEpL24Qj8HZ_lKRaw6g-vUpv1uIaQZC-sDtzIW7kxxmY6Vb0=@protonmail.com>
 <5BFFC7000200007800201222@prv1-mh.provo.novell.com>
 <DnfOb0qr2qIxRtFZtH3FMkb1kNJ907ckaV3QACBxbfguMuVCi8WkYVTWocyswLNubbrVfIji5mEpgige9L5tQFakeXMlB4o-uMuPmNzA_oA=@protonmail.com>
 <5C0A3EED0200007800203F3B@prv1-mh.provo.novell.com>
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9sxx=OR=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1gVR00-0005a1-TV
 for xen-devel@lists.xenproject.org; Sat, 08 Dec 2018 01:01:41 +0000
In-Reply-To: <5C0A3EED0200007800203F3B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKCj4gPiA+IFdpdGhvdXQgYSBmdWxsIGh5cGVydmlzb3IgbG9nIHRoaXMgaXMgZ29p
bmcgdG8gcmVtYWluIGd1ZXNzd29yaywgYnV0Cj4gPiA+IGNvdWxkIHlvdSBjaGVjayB3aGV0aGVy
ICJwY2lkPW5vIiBhbmQvb3IgInB2LWwxdGY9bm8iIG9uIHRoZSBYZW4KPiA+ID4gYm9vdCBjb21t
YW5kIGxpbmUgaGVscD8KPiA+Cj4gPiBbdmFncmFudEBsb2NhbGhvc3Qgfl0kIGNhdCAvcHJvYy9j
bWRsaW5lCj4gPiBwbGFjZWhvbGRlciByb290PVVVSUQ9ZjRkY2I3ZTYtZTQzMC00YjhiLThlODMt
NWRlYjM1MjJjODhiIHJvIG5vX3RpbWVyX2NoZWNrCj4gPiBjb25zb2xlPXR0eTEgY29uc29sZT10
dHlTMCwxMTUyMDBuOCBuZXQuaWZuYW1lcz0wIGJpb3NkZXZuYW1lPTAKPiA+IEkgaG9wZSB0aGF0
IGhlbHBzLgo+Cj4gSSdtIGFmcmFpZCBJJ20gZW50aXJlbHkgbG9zdCBhcyB0byB3aGF0IHlvdSdy
ZSB0cnlpbmcgdG8gdGVsbCBtZSwgdGhlCj4gbW9yZSBpbiBhIHByaXZhdGUgbWFpbC4gSSd2ZSBh
c2tlZCB5b3UgdG8gdHJ5IG91dCBleHRyYSBoeXBlcnZpc29yCj4gY29tbWFuZCBsaW5lIG9wdGlv
bnMsIGFuZCB5b3UgcmVwbHkgd2l0aCB3aGF0IHNvbWUgcmFuZG9tCj4ga2VybmVsIGNvbW1hbmQg
bGluZSBvZiB5b3VycyBsb29rcyBsaWtlLgoKSSBhcG9sb2dpemUsIEkgcmVhZCB5b3VyIHJlcGx5
IHRvbyBmYXN0IGxhc3QgdGltZSAvb1wKClNvIEkgdHJ5IGFkZGluZyAicGNpZD1ubyIsICJwdi1s
dDFmPW5vIiBhbmQgdGhlbiAicGNpZD1ubyBwdi1sdDFmPW5vIiBpbgovZXRjL3N5c2NvbmZpZy9n
cnViIEdSVUJfQ01ETElORV9YRU4sIFhlbiBpdCBzdGlsbCBjcmFzaGluZywgbm90aGluZyBpbiBk
bWVzZy4KCkFyZSB5b3UgaW50ZXJlc3RlZCBpbiBpbnZlc3RpZ2F0aW5nIHRoaXMgYnVnID8KVG8g
bWUgYW55dGhpbmcgdGhhdCBjcmFzaGVzIFhlbiBpcyB3b3J0aCBsb29raW5nIGF0LgoKQmVzdCBy
ZWdhcmRzLApNYXRoaWV1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
