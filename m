From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Qemu-devel] [PATCH 16/16] configure: do_compiler:
 Dump some extra info under bash
Date: Tue, 24 Apr 2018 16:05:01 +0100
Message-ID: <23263.18333.710326.753665@mariner.uk.xensource.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-17-git-send-email-ian.jackson@eu.citrix.com>
 <20180423162142.GG1980@perard>
 <23262.3101.567189.675156@mariner.uk.xensource.com>
 <4402483b-17fd-60e0-4f00-05887a11320d@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvks=hn=citrix.com=prvs=6454bde7c=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fAzVY-0006v7-OZ
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 15:05:28 +0000
In-Reply-To: <4402483b-17fd-60e0-4f00-05887a11320d@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eric Blake <eblake@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Janosch Frank <frankja@linux.vnet.ibm.com>, "Kent R. Spillner" <kspillner@acm.org>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: xen-devel@lists.xenproject.org

RXJpYyBCbGFrZSB3cml0ZXMgKCJSZTogW1FlbXUtZGV2ZWxdIFtQQVRDSCAxNi8xNl0gY29uZmln
dXJlOiBkb19jb21waWxlcjogRHVtcCBzb21lIGV4dHJhIGluZm8gdW5kZXIgYmFzaCIpOgo+IFRo
YXQncyBzdGlsbCBmb3JrLWhlYXZ5LiAgWW91IGNvdWxkIGRvOgo+IAo+IHRlc3QgLW4gIiRCQVNI
X1ZFUlNJT04iICYmIGV2YWwgJwo+IGVjaG8gPj5jb25maWcubG9nICIKPiBmdW5jczogJHtGVU5D
TkFNRVsqXX0KPiBsaW5lczogJHtCQVNIX0xJTkVOT1sqXX0KPiBmaWxlczogJHtCQVNIX1NPVVJD
RVsqXX0iJwo+IAo+IHdoaWNoIGF2b2lkcyB0aGUgZm9yaywgYnV0IHJlbWFpbnMgc2lsZW50IG9u
IGRhc2guCgpUaGFua3MuICBJIHdpbGwgYWRvcHQgdGhpcy4gIEFsdGhvdWdoIEkgd2lsbCB1c2Ug
aWYgLi4uIHRoZW4gYXMgdGhhdApzZWVtcyB0byBiZSB0aGUgdXN1YWwgc3R5bGUuICAoJiYgd291
bGQgYnJlYWsgd2l0aCBzZXQgLWUgd2hpY2gKY29uZmlndXJlIGRvZXMgbm90IHVzZS4uLikKCklh
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
