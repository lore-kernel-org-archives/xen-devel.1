From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/4] xen/PVH: Remove reserved entry in PVH
 GDT
Date: Wed, 02 May 2018 09:07:24 -0600
Message-ID: <5AE9D42C02000078001C030D__27362.1796667159$1525273573$gmane$org@prv1-mh.provo.novell.com>
References: <20180430162339.17143-1-boris.ostrovsky@oracle.com>
 <20180430162339.17143-5-boris.ostrovsky@oracle.com>
 <20180501080009.wnjmno5pietptixo@MacBook-Pro-de-Roger.local>
 <5a357f3d-b66e-ca55-0601-18a89b549f4a@oracle.com>
 <5AE9764D02000078001C00BE@prv1-mh.provo.novell.com>
 <ee05bb34-7671-3069-3eb0-f794a2dc68a4@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=toke=hv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fDtLv-0007qq-52
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 15:07:31 +0000
In-Reply-To: <ee05bb34-7671-3069-3eb0-f794a2dc68a4@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA1LjE4IGF0IDE3OjA2LCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IE9uIDA1LzAyLzIwMTggMDQ6MjYgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBP
biAwMS4wNS4xOCBhdCAxNDozNCwgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToK
Pj4+IE9uIDA1LzAxLzIwMTggMDQ6MDAgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4g
T24gTW9uLCBBcHIgMzAsIDIwMTggYXQgMTI6MjM6MzlQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+Pj4+PiBBbmQgd2l0aG91dCBpdCB3ZSBjYW4ndCB1c2UgX0JPT1RfWFggbWFjcm9z
IGFueSBsb25nZXIgc28gZGVmaW5lIG5ldyBvbmVzLgo+Pj4+IE5vdCBiZWluZyB0aGF0IGZhbWls
aWFyIHdpdGggTGludXggaW50ZXJuYWxzIEknbSBub3Qgc3VyZSBJIHNlZSB0aGUKPj4+PiBiZW5l
Zml0IG9mIHRoaXMuIElzbid0IHRoZXJlIGEgcmlzayB0aGF0IHNvbWUgb3RoZXIgY29kZSBpcyBn
b2luZyB0bwo+Pj4+IHVzZSB0aGUgX19CT09UX1hYIGRlZmluZXM/Cj4+PiBUaGUgc3RhcnR1cCBj
b2RlIHdlIGFyZSBqdW1waW5nIHRvIGxvYWRzIHRoZWlyIG93biBHRFQgYW5kIEkgZG9uJ3Qgc2Vl
IAo+Pj4gYW55IGV4cGxpY2l0IHJlZmVyZW5jZXMgdG8gc2VnbWVudHMuCj4+IE5vIGV4cGxpY2l0
IHJlZmVyZW5jZXMgdG8gc2VnbWVudHMgaXNuJ3QgZW5vdWdoOiBZb3UgYWxzbyBuZWVkIHRvIG1h
a2UKPj4gc3VyZSBubyBleGNlcHRpb25zIGF0IGFsbCBjYW4gb2NjdXIgd2hpbGUgbG9hZGVkIHNl
bGVjdG9ycyBhbmQgR0RUIGFyZQo+PiBvdXQgb2Ygc3luYyAtIGluIHBhcnRpY3VsYXIgTk1JIG1p
Z2h0IGJlIG9mIGNvbmNlcm4gaGVyZSAodGhpcyBpc24ndCBQVgo+PiBhZnRlciBhbGwsIHdoZXJl
IG5vdCBoYXZpbmcgYSBjYWxsYmFjayByZWdpc3RlcmVkIGVmZmVjdGl2ZWx5IG1hc2tzIE5NSSku
Cj4gCj4gSG93IHdvdWxkIGtlZXBpbmcgX19CT09UX1hYIHNlbGVjdG9ycyBoZWxwIHdpdGggTk1J
PyBXZSBkb24ndCBoYXZlCj4gYW55dGhpbmcgc2V0IHVwIGZvciBOTUkgaGFuZGxpbmcgYW55d2F5
IHlldCwgdGhpcyBpcyBhbGwgZG9uZSBpbiB4ODYKPiBzdGFydHVwIGNvZGUgbGF0ZXIuCgpPaCwg
eW91J3JlIHJpZ2h0IC0gdGhlcmUncyBubyBJRFQgZWl0aGVyLCBzbyBhbiBOTUkgd291bGQgeWll
bGQgYSB0cmlwbGUgZmF1bHQKYW55d2F5LgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
