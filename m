From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 00/16] x86: indirect call overhead reduction
Date: Mon, 16 Jul 2018 00:15:58 -0600
Message-ID: <5B4C381E02000078001D41FB@prv1-mh.provo.novell.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B485E6002000078001D3AB8@prv1-mh.provo.novell.com>
 <be2ab951-e032-4035-89bb-3560086015a5@arm.com>
 <5B48A8A602000078001D3D1F@prv1-mh.provo.novell.com>
 <74f1e9a6-36bb-c643-6734-3e8767b1c73c@arm.com>
 <5B48B6BD02000078001D3D4F@prv1-mh.provo.novell.com>
 <b7fc275e-8b96-bd19-d4ce-bb7ea34255fb@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=6083=ka=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fewnj-00079v-9W
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 06:16:03 +0000
In-Reply-To: <b7fc275e-8b96-bd19-d4ce-bb7ea34255fb@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA3LjE4IGF0IDE5OjE1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDEzLzA3LzE4IDE1OjI3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTMuMDcuMTgg
YXQgMTU6MzksIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiBPbiAxMy8wNy8xOCAx
NDoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMTMuMDcuMTggYXQgMTU6MDAsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4+IFdoYXQgd291bGQgYmUgdGhlIGdlbmVy
aWMgaW50ZXJmYWNlIGhlcmU/IEkgc2F3IGl0IHdhcyBiYXNlZCBvbgo+Pj4+PiBhbHRlcm5hdGl2
ZSBmb3IgdGhlIHBsdW1iaW5nLgo+Pj4+Cj4+Pj4gWWVzLCBJJ2QgcHJlZmVyIHRvIHVzZSB0aGUg
c2FtZSBtZWNoYW5pc20gYXMgcHJlc2VudGVkIGluIHRoZSBzZXJpZXMuCj4+Pj4gQXMgcGVyIGFi
b3ZlIGZvciB0aGUgSU9NTVUgY2FzZSB3ZSdkIHRoZW4gbmVlZCBhbm90aGVyIGFic3RyYWN0aW9u
Cj4+Pj4gbGF5ZXIgcHV0IGluIHRoZSBtaWRkbGUgKHRvIHByb2R1Y2UgYSBwYXRjaCBzaXRlIG9u
IHg4NiwgYnV0IGEgbm9ybWFsCj4+Pj4gW2luZGlyZWN0XSBjYWxsIG9uIEFSTSkuCj4+Pgo+Pj4g
SSB3aWxsIGhhdmUgYSBsb29rLiBDb3VsZCB5b3UgcG9pbnQgdG8gdGhlIHBhdGNoIGFkZGluZyB0
aGUgYWJzdHJhY3Rpb24/Cj4+IAo+PiBQYXRjaCA5IGlzIHdoZXJlIHRoZSB4ODYgc2lkZSBpbmZy
YXN0cnVjdHVyZSBnZXRzIGFkZGVkLiBUeXBpY2FsIHVzZXMKPj4gd291bGQgdGhlbiBiZSAodGFr
ZW4gZnJvbSBwYXRjaCAxMCkKPj4gCj4+ICAgaHZtX2d1ZXN0X3g4Nl9tb2RlKHN0cnVjdCB2Y3B1
ICp2KQo+PiAgIHsKPj4gICAgICAgQVNTRVJUKHYgPT0gY3VycmVudCk7Cj4+IC0gICAgcmV0dXJu
IGh2bV9mdW5jcy5ndWVzdF94ODZfbW9kZSh2KTsKPj4gKyAgICByZXR1cm4gYWx0ZXJuYXRpdmVf
Y2FsbDEoaHZtX2Z1bmNzLmd1ZXN0X3g4Nl9tb2RlLCB2KTsKPiBPT0ksIGlzIHRoZXJlIGFueSBy
ZWFzb24gZm9yIHlvdSB0byBkZWZpbmUgYWx0ZXJuYXRpdmVfY2FsbE4gYW5kIG5vdCAKPiBwcm92
aWRpbmcgYSBnZW5lcmljIHZlcnNpb24gKHNpbWlsYXIgdG8gYXJtX3NtY2NjXzFfMV9zbWMgaW4g
Cj4gaW5jbHVkZS9hc20tYXJtL3NtY2NjLmgpPwoKT2gsIHRoYXQncyBhIG5pY2UgYXBwcm9hY2gg
LSBJJ2xsIHRyeSB0byBzd2l0Y2ggdG8gdGhhdC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
