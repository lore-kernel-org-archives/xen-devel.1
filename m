From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v3] xpti: fix bug in double fault handling
Date: Mon, 23 Apr 2018 15:59:27 +0200
Message-ID: <20180423135927.16996-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhva=hm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fAc0D-0002YC-HA
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 13:59:33 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, andrew.cooper3@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

V2hlbiBlbnRlcmluZyB0aGUgaHlwZXJ2aXNvciB2aWEgdGhlIGRvdWJsZSBmYXVsdCBoYW5kbGVy
IHJlc2V0dGluZwp4ZW5fY3IzIHdhcyBtaXNzaW5nLiBUaGlzIGxlZCB0byBzd2l0Y2hpbmcgdG8g
cHZfY3IzIHdoZW4gcmV0dXJuaW5nCmZyb20gdGhlIG5leHQgZm9sbG93aW5nIGV4Y2VwdGlvbiwg
c28gcmVwYWlyIHRoaXMgaW4gb3JkZXIgdG8gYWxsb3cKZXhjZXB0aW9uIGhhbmRsaW5nIHRvIHdv
cmsgZXZlbiBhZnRlciBhIGRvdWJsZSBmYXVsdC4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYveDg2XzY0L2VudHJ5LlMgfCA0
ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0L2VudHJ5LlMgYi94ZW4vYXJjaC94ODYveDg2
XzY0L2VudHJ5LlMKaW5kZXggNDVkOTg0MmQwOS4uMWNkN2Q5Mzg5MiAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L3g4Nl82NC9lbnRyeS5TCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvZW50cnku
UwpAQCAtNzY3LDEyICs3NjcsMTQgQEAgRU5UUlkoZG91YmxlX2ZhdWx0KQogICAgICAgICAvKiBX
QVJOSU5HISBgcmV0YCwgYGNhbGwgKmAsIGBqbXAgKmAgbm90IHNhZmUgYmVmb3JlIHRoaXMgcG9p
bnQuICovCiAKICAgICAgICAgbW92ICAgU1RBQ0tfQ1BVSU5GT19GSUVMRCh4ZW5fY3IzKSglcjE0
KSwgJXJieAotICAgICAgICB0ZXN0ICAlcmJ4LCAlcmJ4CisgICAgICAgIG5lZyAgICVyYngKICAg
ICAgICAganogICAgLkxkYmxmX2NyM19va2F5CiAgICAgICAgIGpucyAgIC5MZGJsZl9jcjNfbG9h
ZAorICAgICAgICBtb3YgICAlcmJ4LCBTVEFDS19DUFVJTkZPX0ZJRUxEKHhlbl9jcjMpKCVyMTQp
CiAgICAgICAgIG5lZyAgICVyYngKIC5MZGJsZl9jcjNfbG9hZDoKICAgICAgICAgbW92ICAgJXJi
eCwgJWNyMworICAgICAgICBtb3ZxICQwLCBTVEFDS19DUFVJTkZPX0ZJRUxEKHhlbl9jcjMpKCVy
MTQpCiAuTGRibGZfY3IzX29rYXk6CiAKICAgICAgICAgbW92cSAgJXJzcCwlcmRpCi0tIAoyLjEz
LjYKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
