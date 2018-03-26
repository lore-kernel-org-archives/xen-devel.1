From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.11 3/3] vpci/msi: fix size of the vectors
 fields
Date: Mon, 26 Mar 2018 12:21:04 +0100
Message-ID: <20180326112104.80041-4-roger.pau@citrix.com>
References: <20180326112104.80041-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mjw3=gq=citrix.com=prvs=616e7aceb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f0QBo-0005xV-Cu
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 11:21:24 +0000
In-Reply-To: <20180326112104.80041-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGN1cnJlbnQgc2l6ZSAoNWJpdHMpIGlzIG5vdCBlbm91Z2ggdG8gc3RvcmUgdGhlIG1heGlt
dW0gbnVtYmVyIG9mCnZlY3RvcnMgKDMyKSwgYnVtcCBpdCBieSBvbmUgYml0LgoKTm90ZSB0aGF0
IHRoZSBzaXplIG9mIHRoZSBzdHJ1Y3QgaXMgc3RpbGwgdGhlIHNhbWUuCgpSZXBvcnRlZC1ieTog
Q292ZXJpdHkKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Ci0tLQogeGVuL2luY2x1ZGUveGVuL3ZwY2kuaCB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS94ZW4vdnBjaS5oIGIveGVuL2luY2x1ZGUveGVuL3ZwY2kuaAppbmRleCBjYjM5ZTBlYmVh
Li5mYWMxMmExYzQyIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oCisrKyBiL3hl
bi9pbmNsdWRlL3hlbi92cGNpLmgKQEAgLTEwMCw3ICsxMDAsNyBAQCBzdHJ1Y3QgdnBjaSB7CiAg
ICAgICAgIC8qIERhdGEuICovCiAgICAgICAgIHVpbnQxNl90IGRhdGE7CiAgICAgICAgIC8qIE1h
eGltdW0gbnVtYmVyIG9mIHZlY3RvcnMgc3VwcG9ydGVkIGJ5IHRoZSBkZXZpY2UuICovCi0gICAg
ICAgIHVpbnQ4X3QgbWF4X3ZlY3RvcnMgOiA1OworICAgICAgICB1aW50OF90IG1heF92ZWN0b3Jz
IDogNjsKICAgICAgICAgLyogRW5hYmxlZD8gKi8KICAgICAgICAgYm9vbCBlbmFibGVkICAgICAg
ICA6IDE7CiAgICAgICAgIC8qIFN1cHBvcnRzIHBlci12ZWN0b3IgbWFza2luZz8gKi8KQEAgLTEw
OCw3ICsxMDgsNyBAQCBzdHJ1Y3QgdnBjaSB7CiAgICAgICAgIC8qIDY0LWJpdCBhZGRyZXNzIGNh
cGFibGU/ICovCiAgICAgICAgIGJvb2wgYWRkcmVzczY0ICAgICAgOiAxOwogICAgICAgICAvKiBO
dW1iZXIgb2YgdmVjdG9ycyBjb25maWd1cmVkLiAqLwotICAgICAgICB1aW50OF90IHZlY3RvcnMg
ICAgIDogNTsKKyAgICAgICAgdWludDhfdCB2ZWN0b3JzICAgICA6IDY7CiAgICAgICAgIC8qIEFy
Y2gtc3BlY2lmaWMgZGF0YS4gKi8KICAgICAgICAgc3RydWN0IHZwY2lfYXJjaF9tc2kgYXJjaDsK
ICAgICB9ICptc2k7Ci0tIAoyLjE2LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
