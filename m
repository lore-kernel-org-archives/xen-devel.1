From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: tools/fuzz fails due build, osstest did not notice
Date: Mon, 03 Sep 2018 06:35:42 -0600
Message-ID: <5B8D2A9E02000078001E491D@prv1-mh.provo.novell.com>
References: <20180903115323.616cc7f8.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ymad=lr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fwo56-00035Z-LW
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 12:35:48 +0000
In-Reply-To: <20180903115323.616cc7f8.olaf@aepfle.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA5LjE4IGF0IDExOjUzLCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IFNpbmNl
IGFib3V0IHR3byBtb250aHMgc3RhZ2luZyBmYWlscyB0byBidWlsZCBiZWNhdXNlIHRvb2xzL2Z1
enogY2FuIG5vdCBjb3BlIAo+IHdpdGggQ0ZMQUdTPSItTzIgLVdhbGwgIC1mc3RhY2stcHJvdGVj
dG9yLXN0cm9uZyAtZnVud2luZC10YWJsZXMgCj4gLWZhc3luY2hyb25vdXMtdW53aW5kLXRhYmxl
cyAtZnN0YWNrLWNsYXNoLXByb3RlY3Rpb24iLiBXaGlsZSBJIGNhbiBlYXNpbHkgCj4gaGlkZSB0
aGUgYnVnIGJ5IHVuZGVmaW5pbmcgX0ZPUlRJRllfU09VUkNFLCBJIGFsd2F5cyB3b25kZXIgd2h5
IG9zc3Rlc3QgZG9lcyAKPiBub3QgY2F0Y2ggc3VjaCBidWdzPwo+IAo+IExvb2tpbmcgYXQgc29t
ZSByYW5kb20gYnVpbGQtYW1kNjQvNi50cy14ZW4tYnVpbGQubG9nIG91dHB1dCwgaXQgc2VlbXMg
bm8gCj4gQ0ZMQUdTIGF0IGFsbCBpcyBzZXQuIEknbSBzdXJlIFNVU0UgaXMgbm90IHRoZSBvbmx5
IG9uZSB0aGF0IHNldHMgQ0ZMQUdTIAo+IGR1cmluZyB0aGVpciBwYWNrYWdlIGJ1aWxkLCBhbmQg
ZnVydGhlciBJIHRoaW5rIFNVU0UgaXMgbm90IHRoZSBvbmx5IG9uZSB3aG8gCj4gZW5mb3JjZXMg
LURfRk9SVElGWV9TT1VSQ0U9IGdsb2JhbGx5LiBTbyBvbiB0aGF0IGdyb3VuZCwgc2hvdWxkbid0
IHdoYXRldmVyIAo+IG9zc3Rlc3QgZG9lcyBtYXRjaCB3aGF0IHRoZSBjb25zdW1lcnMgb2YgeGVu
IHVzZT8gUnVubmluZyBvc3N0ZXN0IHdpdGggCj4gdGhyb3ctYXdheS1iaW5hcmllcyBjb21waWxl
ZCB3aXRoIC1EX0ZPUlRJRllfU09VUkNFIHdpbGwgbGlrZWx5IG5vdCBodXJ0IG9yIAo+IGludmFs
aWRhdGUgdGhlIG92ZXJhbGwgY292ZXJhZ2UuCgpMZWF2aW5nIGFzaWRlIHRoZSBzdWdnZXN0aW9u
IHlvdSBtYWtlIChJJ20gdW5jb252aW5jZWQgZWl0aGVyIHZhcmlhbnQgaXMKc3RyaWN0bHkgYmV0
dGVyIHRoYW4gdGhlIG90aGVyKSAtIHdoYXQgaXMgdGhlIGFjdHVhbCBwcm9ibGVtPyBUaGUgbWVy
ZQpsaXN0aW5nIG9mIGNvbXBpbGVyIGZsYWdzIHBhc3NlZCBkb2VzIG5vdCBtYWtlIGNsZWFyIHRv
IG1lIHdoZXJlIHRoZSBjbGFzaAppcywgb3IgaG93IGl0IHdvdWxkIHN1cmZhY2UuCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
