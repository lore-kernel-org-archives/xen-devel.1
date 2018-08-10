From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH] x86/hvm/viridian: set shutdown_code in response
 to CrashNotify
Date: Fri, 10 Aug 2018 16:43:42 +0100
Message-ID: <20180810154342.3296-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3eyy=kz=citrix.com=prvs=753083691=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fo9Zu-0003DL-OE
 for xen-devel@lists.xenproject.org; Fri, 10 Aug 2018 15:43:50 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBXaW5kb3dzIHdyaXRlcyB0aGUgQ3Jhc2hOb3RpZnkgYml0IGluIHRoZSBDUkFTSF9DVEwg
TVNSIHRoZW4gd2Uga25vdwppdCBpcyBjcmFzaGluZywgc28gc2V0IHRoZSBkb21haW4gc2h1dGRv
d24gY29kZSBhcHByb3ByaWF0ZWx5LgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVs
LmR1cnJhbnRAY2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KIHhl
bi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4uYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4uYyBiL3hl
bi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4uYwppbmRleCA0ODYwNjUxODJjLi4yOTRjZjQ4NmNjIDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuLmMKKysrIGIveGVuL2FyY2gveDg2
L2h2bS92aXJpZGlhbi5jCkBAIC02NDUsNiArNjQ1LDEwIEBAIGludCB3cm1zcl92aXJpZGlhbl9y
ZWdzKHVpbnQzMl90IGlkeCwgdWludDY0X3QgdmFsKQogICAgICAgICBpZiAoICFjdGwudS5DcmFz
aE5vdGlmeSApCiAgICAgICAgICAgICBicmVhazsKIAorICAgICAgICBzcGluX2xvY2soJmQtPnNo
dXRkb3duX2xvY2spOworICAgICAgICBkLT5zaHV0ZG93bl9jb2RlID0gU0hVVERPV05fY3Jhc2g7
CisgICAgICAgIHNwaW5fdW5sb2NrKCZkLT5zaHV0ZG93bl9sb2NrKTsKKwogICAgICAgICBncHJp
bnRrKFhFTkxPR19XQVJOSU5HLCAiVklSSURJQU4gQ1JBU0g6ICVseCAlbHggJWx4ICVseCAlbHhc
biIsCiAgICAgICAgICAgICAgICAgdi0+YXJjaC5odm1fdmNwdS52aXJpZGlhbi5jcmFzaF9wYXJh
bVswXSwKICAgICAgICAgICAgICAgICB2LT5hcmNoLmh2bV92Y3B1LnZpcmlkaWFuLmNyYXNoX3Bh
cmFtWzFdLAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
