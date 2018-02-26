From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/PV: fix off-by-one in I/O bitmap limit
 check
Date: Mon, 26 Feb 2018 03:50:45 -0700
Message-ID: <5A93F49502000078001ABA75@prv-mh.provo.novell.com>
References: <5A93C77302000078001AB8CB@prv-mh.provo.novell.com>
 <20180226104414.qjcefuqhbsgcchef@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=uzez=fu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eqGMx-0007G3-60
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 10:50:55 +0000
In-Reply-To: <20180226104414.qjcefuqhbsgcchef@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAyLjE4IGF0IDExOjQ0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgRmViIDI2LCAyMDE4IGF0IDEyOjM4OjExQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
Cj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLmFwdUBjaXRyaXguY29tPgoK
VGhhbmtzLgoKPiBJIHdvdWxkIGhvd2V2ZXIgaW52ZXJ0IHRoZSBjaGVjaywgbXkgYnJhaW4gZmlu
ZHMgaXQgZWFzaWVyIHRvIHJlYWQKPiBhczoKPiAKPiAocG9ydCArIGJ5dGVzKSA8PSB2LT5hcmNo
LnB2X3ZjcHUuaW9ibXBfbGltaXQKCk15IGJyYWluIHRvbywgYnV0IEkgZGlkbid0IHdhbnQgdG8g
bWFrZSB1bnJlbGF0ZWQgY2hhbmdlcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
