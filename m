From: Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 0/2] xen-hvm: use new resource
 mapping API
Date: Wed, 9 May 2018 12:26:06 -0500
Message-ID: <0c96c8b0-4736-d1fe-8145-bf14d2a24a97@redhat.com>
References: <20180509154604.25530-1-paul.durrant@citrix.com>
 <152588171396.2703.471985236583323449@71c20359a636>
 <82906d30c1854e13bd7986af99eb1d98@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/yhc=h4=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1fGSr3-0007BV-FT
 for xen-devel@lists.xenproject.org; Wed, 09 May 2018 17:26:17 +0000
In-Reply-To: <82906d30c1854e13bd7986af99eb1d98@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "famz@redhat.com" <famz@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDkvMjAxOCAxMTowNSBBTSwgUGF1bCBEdXJyYW50IHdyb3RlOgoKPj4geGVuZm9yZWln
bm1lbW9yeV9tYXBfcmVzb3VyY2UoKSB0byBtYXAgaW9yZXEgcGFnZXMuLi4KPj4gRVJST1I6IHNw
YWNlcyByZXF1aXJlZCBhcm91bmQgdGhhdCAnKicgKGN0eDpXeFYpCj4+ICMxNjQ6IEZJTEU6IGlu
Y2x1ZGUvaHcveGVuL3hlbl9jb21tb24uaDoxMjg6Cj4+ICsgICAgeGVuZm9yZWlnbm1lbW9yeV9o
YW5kbGUgKmZtZW0sIGRvbWlkX3QgZG9taWQsIHVuc2lnbmVkIGludCB0eXBlLAo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeCj4+Cj4+IHRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5n
cywgMTM4IGxpbmVzIGNoZWNrZWQKPj4KPj4gWW91ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMs
IHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCj4+IGFyZSBmYWxzZSBwb3Np
dGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQo+PiBDSEVDS1BBVENIIGlu
IE1BSU5UQUlORVJTLgo+IAo+IFRoaXMgc3R5bGUgd2FybmluZyBhcHBlYXJzIHRvIGJlIHNwdXJp
b3VzLgoKWWVwLCBhbmQgaXQncyBiZWNhdXNlIHhlbmZvcmVpZ25tZW1vcnlfaGFuZGxlIGRvZXNu
J3QgZm9sbG93IG91ciB1c3VhbCAKY29udmVudGlvbnMgZm9yIGEgdHlwZSBuYW1lLiAgU2VlIGNv
bW1pdCA1YWMwNjdhIGlmIHlvdSB3YW50IHRvIGFkZCBpdCAKdG8gdGhlIGxpc3Qgb2Ygd2hpdGVs
aXN0ZWQgZXhjZXB0aW9uIHR5cGUgbmFtZXMsIHRvIHNpbGVuY2UgbWVzc2FnZXMgCmxpa2UgdGhp
cy4KCi0tIApFcmljIEJsYWtlLCBQcmluY2lwYWwgU29mdHdhcmUgRW5naW5lZXIKUmVkIEhhdCwg
SW5jLiAgICAgICAgICAgKzEtOTE5LTMwMS0zMjY2ClZpcnR1YWxpemF0aW9uOiAgcWVtdS5vcmcg
fCBsaWJ2aXJ0Lm9yZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
