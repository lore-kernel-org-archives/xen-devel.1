From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] xen/pvh: increase early stack size
Date: Tue, 9 Oct 2018 12:32:37 +0200
Message-ID: <20181009103237.52527-1-roger.pau__60.6789406903729$1539081139$gmane$org@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=av44=mv=citrix.com=prvs=81391bf32=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g9pKH-0002qJ-QI
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 10:33:17 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgYm9vdGluZyBvbiBhbiBBTUQgRVBZQyBib3ggdGhlIHN0YWNrIGNhbmFyeSB3b3VsZCBk
ZXRlY3Qgc3RhY2sKb3ZlcmZsb3dzIHdoZW4gdXNpbmcgdGhlIGN1cnJlbnQgUFZIIGVhcmx5IHN0
YWNrIHNpemUgKDI1NikuIFN3aXRjaCB0bwp1c2luZyB0aGUgdmFsdWUgZGVmaW5lZCBieSBCT09U
X1NUQUNLX1NJWkUsIHdoaWNoIHByZXZlbnRzIHRoZSBzdGFjawpvdmVyZmxvdy4KClNpZ25lZC1v
ZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEJv
cmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
LS0tCiBhcmNoL3g4Ni94ZW4veGVuLXB2aC5TIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3hlbi1w
dmguUyBiL2FyY2gveDg2L3hlbi94ZW4tcHZoLlMKaW5kZXggY2EyZDNiMmJmMmFmLi41ODcyMmEw
NTJmOWMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi94ZW4tcHZoLlMKKysrIGIvYXJjaC94ODYv
eGVuL3hlbi1wdmguUwpAQCAtMTgxLDcgKzE4MSw3IEBAIGNhbmFyeToKIAkuZmlsbCA0OCwgMSwg
MAogCiBlYXJseV9zdGFjazoKLQkuZmlsbCAyNTYsIDEsIDAKKwkuZmlsbCBCT09UX1NUQUNLX1NJ
WkUsIDEsIDAKIGVhcmx5X3N0YWNrX2VuZDoKIAogCUVMRk5PVEUoWGVuLCBYRU5fRUxGTk9URV9Q
SFlTMzJfRU5UUlksCi0tIAoyLjE5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
