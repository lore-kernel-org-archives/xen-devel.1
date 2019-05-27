From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH 0/4] x86: further L1TF / XSA-289 guards
Date: Mon, 27 May 2019 03:24:40 -0600
Message-ID: <5CEBACD80200007800232B44@prv1-mh.provo.novell.com>
References: <5C5301290200007800212C6B@prv1-mh.provo.novell.com>
 <5C53012902000000001030F5@prv1-mh.provo.novell.com>
 <5C53012902000078002328D1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVBs7-0001vn-KJ
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 09:24:47 +0000
In-Reply-To: <5C53012902000078002328D1@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, nmanthey@amazon.de, Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjAxLjE5IGF0IDE1OjA3LCAgd3JvdGU6Cj4gVGhpcyBnb2VzIGFsb25nc2lkZSBO
b3JiZXJ0J3Mgc2VyaWVzLCBkZWFsaW5nIHdpdGggYSBmZXcgbW9yZQo+IHBsYWNlcyB3aGVyZSBJ
IGhhcHBlbmVkIHRvIGtub3cgKHdpdGhvdXQgYW55IGFuYWx5c2lzIHRvb2xzKQo+IGd1ZXN0IGNv
bnRyb2xsZWQgYXJyYXkgYWNjZXNzZXMgc2l0LiBJJ3ZlIGFkZGl0aW9uYWxseSBhbHNvCj4gY2hl
Y2tlZCBlbXVsLWk4MjU0LmMsIGFuZCBJIHRoaW5rIG5vIGFkanVzdG1lbnRzIGFyZSBuZWVkZWQK
PiB0aGVyZSAodGhlcmUgYXJlIGEgZmV3IHBvc3NpYmxlIG92ZXJydW5zIGJ5IG9uZSwgYnV0IGp1
c3QgbGlrZQo+IGlzIHRoZSBjYXNlIGluIHBhdGNoIDIgSSBkb24ndCB0aGluayB0aGV5IGFyZSBh
Y3R1YWwgaXNzdWVzKS4KPiAKPiAxOiB4ODZlbXVsOiBhdm9pZCBzcGVjdWxhdGl2ZSBvdXQgb2Yg
Ym91bmRzIGFjY2Vzc2VzCgpUaGVyZSB3YXMgYSB2MiBvZiB0aGlzIHNlbnQgc2VwYXJhdGVseS4K
CkphbgoKPiAyOiB4ODYvdk1TSTogYXZvaWQgc3BlY3VsYXRpdmUgb3V0IG9mIGJvdW5kcyBhY2Nl
c3Nlcwo+IDM6IHg4Ni92UElDOiBhdm9pZCBzcGVjdWxhdGl2ZSBvdXQgb2YgYm91bmRzIGFjY2Vz
c2VzCj4gNDogeDg2L3ZMQVBJQzogYXZvaWQgc3BlY3VsYXRpdmUgb3V0IG9mIGJvdW5kcyBhY2Nl
c3Nlcwo+IAo+IErDvHJnZW4sIEkndmUgY29waWVkIHlvdSBhbnl3YXksIGJ1dCBJIGFzc3VtZSB5
b3VyIGdlbmVyYWwKPiBSYWItdW50aWwtUkMzIHdvdWxkIGFwcGx5IHRvIHRoaXMgc2VyaWVzIChh
bmQgcGVyaGFwcyB0bwo+IGZ1cnRoZXIgb25lcywgc2hvdWxkIGFueW9uZSBmaW5kIHRpbWUpIGFz
IG11Y2ggYXMgdG8gTm9yYmVydCdzLgo+IAo+IEphbgo+IAo+IAoKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
