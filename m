From: Juergen Gross <jgross@suse.com>
Subject: [PATCH-for-4.11 v2] xpti: fix bug in double fault
 handling
Date: Mon, 23 Apr 2018 14:38:06 +0200
Message-ID: <20180423123806.12650-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhva=hm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fAajT-0004z5-HJ
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 12:38:11 +0000
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
cHZfY3IzIHdoZW4gcmV0dXJuaW5nCmZyb20gdGhlIG5leHQgZm9sbG93aW5nIGludGVycnVwdC4g
U28gcmVwYWlyIHRoaXMgaW4gb3JkZXIgdG8gYWxsb3cKaW50ZXJydXB0IGhhbmRsaW5nIHRvIHdv
cmsgZXZlbiBhZnRlciBhIGRvdWJsZSBmYXVsdC4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYveDg2XzY0L2VudHJ5LlMgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni94ODZfNjQvZW50cnkuUyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvZW50cnkuUwppbmRleCA0
NWQ5ODQyZDA5Li4yNTQyN2IwY2VjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L2Vu
dHJ5LlMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9lbnRyeS5TCkBAIC03NzMsNiArNzczLDcg
QEAgRU5UUlkoZG91YmxlX2ZhdWx0KQogICAgICAgICBuZWcgICAlcmJ4CiAuTGRibGZfY3IzX2xv
YWQ6CiAgICAgICAgIG1vdiAgICVyYngsICVjcjMKKyAgICAgICAgbW92cSAkMCwgU1RBQ0tfQ1BV
SU5GT19GSUVMRCh4ZW5fY3IzKSglcjE0KQogLkxkYmxmX2NyM19va2F5OgogCiAgICAgICAgIG1v
dnEgICVyc3AsJXJkaQotLSAKMi4xMy42CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
