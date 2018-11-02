From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86emul: consolidate CR4 handling
Date: Fri, 2 Nov 2018 18:24:27 +0000
Message-ID: <a3c2177c-1847-3e86-d853-db098abd1a8a@citrix.com>
References: <5BDC7E5802000078001F75BA@prv1-mh.provo.novell.com>
 <5BDC7F4B02000078001F75D2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a587=nn=citrix.com=prvs=837a34217=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gIe7c-0004XM-Dg
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 18:24:40 +0000
In-Reply-To: <5BDC7F4B02000078001F75D2@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTEvMTggMTY6NDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE5vdyB0aGF0IHRoZXJlJ3Mg
YW4gYWxtb3N0IHVuY29uZGl0aW9uYWwgQ1I0IHJlYWQgcmlnaHQgYXQgdGhlIGJlZ2lubmluZwo+
IG9mIHg4Nl9lbXVsYXRlKCksIGNlbnRyYWxpemUgaXRzIHJlYWRpbmcgdGhlcmUgYW5kIHVzZSBy
ZXN1bHQgYW5kIHZhbHVlCj4gZXZlcnl3aGVyZSBlbHNlIHdpdGhvdXQgZnVydGhlciBpbnZva2lu
ZyB0aGUgaG9vay4KPgo+IFN1YnNlcXVlbnRseSB3ZSBtYXkgd2FudCB0byBjb25zaWRlciBoYXZp
bmcgdGhlIGNhbGxlcnMgcHJvdmlkZQo+IHdoaWNoZXZlciB2YWx1ZSB0aGV5IGRlZW0gYXBwcm9w
cmlhdGUgaW4gdGhlaXIgY29udGV4dHMsIHRvIGF2b2lkCj4gaW52b2tpbmcgdGhlIGhvb2sgYWx0
b2dldGhlciBmb3IgdGhpcyBwdXJwb3NlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKSSd2ZSBnb3QgbW9zdCBvZiBhIHNlcmllcyBkb2luZyB0aGlz
IGZvciBjcHVpZCwgd2hpY2ggZHJvcHMgfjRrIG9mIC50ZXh0CnZvbHVtZSBmcm9tIHg4Nl9lbXVs
YXRlKCkgYWxvbmUuCgpNeSBwbGFuIHdhcyB0byBnZXQgYWxsIHRoZSBhcmNoaXRlY3R1cmFsIHN0
YXRlIGluIGEgZGlyZWN0bHkgcmVhZGFibGUKZm9ybSwgdG8gcmVkdWNlIHRoZSBjb21wbGV4aXR5
IGFuZCBib2lsZXJwbGF0ZS7CoCBPbiB0aGF0IHN1YmplY3QuLi4KCj4gQEAgLTMyNDcsNiArMzI0
NSw4IEBAIHg4Nl9lbXVsYXRlKAo+ICAKPiAgICAgIEFTU0VSVChvcHMtPnJlYWQpOwo+ICAKPiAr
ICAgIGNyNF9yYyA9IG9wcy0+cmVhZF9jciA/IG9wcy0+cmVhZF9jcig0LCAmY3I0LCBjdHh0KSA6
IFg4NkVNVUxfT0tBWTsKCi4uLiB3aHkgbm90IG1ha2UgcmVhZF9jcigpIG1hbmRhdG9yeSwgb3Ig
cHV0IGNyNCBpbnRvIGN0eHQ/wqAgUGx1bWJpbmcKY3I0X3JjIGFyb3VuZCBzdGlsbCBmZWVscyBs
aWtlIGEgbG90IG9mIGJvaWxlcnBsYXRlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
