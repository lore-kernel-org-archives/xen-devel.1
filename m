From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3] build: remove shim related targets
Date: Wed, 28 Feb 2018 15:47:00 +0000
Message-ID: <20180228154700.ujw24yrkuctrmn7o@MacBook-Pro-de-Roger.local>
References: <20180221122218.37777-1-roger.pau@citrix.com>
 <5A969A6D02000078001ACA01@prv-mh.provo.novell.com>
 <20180228114722.pe3qegstcejubini@MacBook-Pro-de-Roger.local>
 <5A96AEA202000078001ACB31@prv-mh.provo.novell.com>
 <20180228130254.pisdymntg33pscm2@MacBook-Pro-de-Roger.local>
 <5A96BBD302000078001ACCA7@prv-mh.provo.novell.com>
 <20180228150236.ndh7x4d4vryuqc6j@MacBook-Pro-de-Roger.local>
 <5A96D91402000078001ACE66@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=j/eq=fw=citrix.com=prvs=5902857c7=roger.pau@srs-us1.protection.inumbo.net>)
 id 1er4OO-00069h-4l
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 16:15:44 +0000
Content-Disposition: inline
In-Reply-To: <5A96D91402000078001ACE66@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjgsIDIwMTggYXQgMDg6MzA6MTJBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjAyLjE4IGF0IDE2OjAyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQnV0IHRoYXQgcmFpc2VzIHRoZSBxdWVzdGlvbiwgaWYgcHJlZml4PS91c3IvbG9j
YWwgdGhpcyB3aWxsIGJlY29tZToKPiA+IAo+ID4gL3Vzci9sb2NhbC9saWIvdXNyL2xvY2FsL2xp
Yi94ZW4vLi4uCj4gCj4gL3Vzci9sb2NhbC9saWIvZGVidWcvdXNyL2xvY2FsL2xpYi94ZW4vLi4u
Cj4gCj4gPiBTaG91bGQgdGhpcyBpbnN0ZWFkIGJlOgo+ID4gCj4gPiAvdXNyL2xvY2FsL2xpYi91
c3IvbGliL3hlbi8uLi4KPiAKPiAvdXNyL2xvY2FsL2xpYi9kZWJ1Zy91c3IvbGliL3hlbi8uLi4K
ClJpZ2h0LgoKPiA+IEkgZG9uJ3QgdGhpbmsgc28sIGJ1dCB3YW50IHRvIGJlIHN1cmUuCj4gCj4g
TmVpdGhlciwgSSB3b3VsZCBzYXkgKHdpdGhvdXQga25vd2luZyB3aGV0aGVyIHRoZXJlIGFyZSBh
bnkKPiBjb252ZW50aW9ucyBmb3IgJHtwcmVmaXh9L2xpYi9kZWJ1ZykgLSB3aGF0IGhhcyB0aGUg
ZnVsbCBwYXRoIGdvdCB0bwo+IGRvIGluIHRoZSBtaWRkbGUgaW4gdGhlcmU/IFRoZSBtb3JlIHdo
ZW4gaXQncyAvaG9tZS8uLi4gb3IKPiBzb21ldGhpbmcgZXZlbiBtb3JlIG9ic2N1cmU/CgpJIHdv
dWxkIGV4cGVjdCBkZWJ1Z2dlcnMgbGlrZSBnZGIgdG8gc2VhcmNoIC91c3IvbGliL2RlYnVnIGFu
ZAovdXNyL2xvY2FsL2xpYi9kZWJ1ZyBpbiBvcmRlciB0byBmaW5kIHRoZSBkZWJ1ZyBzeW1ib2xz
IG9mIGEgYmluYXJ5LApzbyB0aGF0IHdoYXQncyBpbnNpZGUgdGhlIGRlYnVnLyBkaXJlY3Rvcnkg
bmVlZHMgdG8gaGF2ZSB0aGUgc2FtZSBwYXRoCmFzIHdoZXJlIHRoZSBiaW5hcnkgcmVzaWRlcywg
aGVuY2UgSSB0aGluayBpdCBzaG91bGQgYmU6CgovdXNyL2xvY2FsL2xpYi9kZWJ1Zy91c3IvbG9j
YWwvbGliL3hlbi8KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
