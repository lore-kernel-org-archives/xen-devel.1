From: Anthony Liguori <aliguori@amzn.com>
Subject: [PATCH v2 10/23] vixen: do not permit access to
	physical IRQs if in Vixen mode
Date: Sun, 7 Jan 2018 12:28:26 -0800
Message-ID: <1515356919-922-11-git-send-email-aliguori@amzn.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=sjiq=ec=amzn.com=prvs=538cba048=aliguori@srs-us1.protection.inumbo.net>)
 id 1eYHYq-0004NJ-B8
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 20:28:52 +0000
In-Reply-To: <1515356919-922-1-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?q?Jan=20H=2E=20Sch=C3=B6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW50aG9ueSBMaWd1b3JpIDxhbGlndW9yaUBhbWF6b24uY29tPgoKT3VyIGludGVudGlv
biBpcyBmb3IgdGhlIFZpeGVuIGd1ZXN0IHRvIGJlIGRlcHJpdmlsZWdlZCBzbyB3ZSBuZWVkCnRv
IGF2b2lkIHBlcm1pdHRpbmcgYWNjZXNzIHRvIGVhY2ggSVJRIGV2ZW4gdGhvdWdoIGl0IGlzIHRl
Y2huaWNhbGx5CnRoZSBoYXJkd2FyZSBkb21haW4uCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IExp
Z3VvcmkgPGFsaWd1b3JpQGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2lycS5jIHwgMyAr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvaXJxLmMgYi94ZW4vYXJjaC94ODYvaXJxLmMKaW5kZXggODdl
ZjJlOC4uYmQ3NTEwOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2lycS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9pcnEuYwpAQCAtMjUsNiArMjUsNyBAQAogI2luY2x1ZGUgPGFzbS9mbHVzaHRsYi5o
PgogI2luY2x1ZGUgPGFzbS9tYWNoLWdlbmVyaWMvbWFjaF9hcGljLmg+CiAjaW5jbHVkZSA8cHVi
bGljL3BoeXNkZXYuaD4KKyNpbmNsdWRlIDxhc20vZ3Vlc3Qvdml4ZW4uaD4KIAogc3RhdGljIGlu
dCBwYXJzZV9pcnFfdmVjdG9yX21hcF9wYXJhbShjb25zdCBjaGFyICpzKTsKIApAQCAtMTkwLDcg
KzE5MSw3IEBAIGludCBjcmVhdGVfaXJxKG5vZGVpZF90IG5vZGUpCiAgICAgICAgIGRlc2MtPmFy
Y2gudXNlZCA9IElSUV9VTlVTRUQ7CiAgICAgICAgIGlycSA9IHJldDsKICAgICB9Ci0gICAgZWxz
ZSBpZiAoIGhhcmR3YXJlX2RvbWFpbiApCisgICAgZWxzZSBpZiAoICFpc192aXhlbigpICYmIGhh
cmR3YXJlX2RvbWFpbiApCiAgICAgewogICAgICAgICByZXQgPSBpcnFfcGVybWl0X2FjY2Vzcyho
YXJkd2FyZV9kb21haW4sIGlycSk7CiAgICAgICAgIGlmICggcmV0ICkKLS0gCjEuOS4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
