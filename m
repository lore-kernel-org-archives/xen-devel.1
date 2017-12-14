From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 02/11] di_special_kernel: Pass $kp to $fn
Date: Thu, 14 Dec 2017 16:22:13 +0000
Message-ID: <1513268542-16212-2-git-send-email-ian.jackson@eu.citrix.com>
References: <1513268542-16212-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dmf7=dk=citrix.com=prvs=514febeb1=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ePWHR-0007iL-08
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2017 16:22:41 +0000
In-Reply-To: <1513268542-16212-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWRqdXN0IHRoZSBvbmUgY3VycmVudCBjYWxsZXIuICBObyBmdW5jdGlvbmFsIGNoYW5nZQoKU2ln
bmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQog
T3NzdGVzdC9EZWJpYW4ucG0gfCA0ICsrLS0KIHRzLWhvc3QtaW5zdGFsbCAgIHwgMiArLQogMiBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvT3NzdGVzdC9EZWJpYW4ucG0gYi9Pc3N0ZXN0L0RlYmlhbi5wbQppbmRleCBiYTM5YWQyLi42
YTFiYWJmIDEwMDY0NAotLS0gYS9Pc3N0ZXN0L0RlYmlhbi5wbQorKysgYi9Pc3N0ZXN0L0RlYmlh
bi5wbQpAQCAtMTA0Niw3ICsxMDQ2LDcgQEAgRU5ECiAKIHN1YiBkaV9zcGVjaWFsX2tlcm5lbCAo
JCQkKSB7CiAgICAgbXkgKCRobywgJGRfaSwgJGZuKSA9IEBfOwotICAgICMgY2FsbHMgJGZuLT4o
JGtlcm5lbCwgJGNwaW8pICMgZWl0aGVyIG9yIGJvdGggbWF5IGJlIHVuZGVmCisgICAgIyBjYWxs
cyAkZm4tPigka3AsICRrZXJuZWwsICRjcGlvKSAjICRrZXJuZWwgYW5kL29yICRjcGlvIG1heSBi
ZSB1bmRlZgogICAgIGZvcmVhY2ggbXkgJGtwIChrZXlzICV7ICRoby0+e0ZsYWdzfSB9KSB7CiAg
ICAgICAgIG15ICRrZXJuZWw7CiAgICAgICAgICMgQmFja3dhcmRzIGNvbXBhdGliaWxpdHkKQEAg
LTEwNzAsNyArMTA3MCw3IEBAIHN1YiBkaV9zcGVjaWFsX2tlcm5lbCAoJCQkKSB7CiAgICAgICAg
IH0gZWxzZSB7CiAgICAgICAgICAgICBkaWUgIiRrcCAkY3BpbyAkISI7CiAgICAgICAgIH0KLSAg
ICAgICAgJGZuLT4oJGtlcm5lbCwgJGNwaW8pOworICAgICAgICAkZm4tPigka3AsICRrZXJuZWws
ICRjcGlvKTsKICAgICB9CiB9CiAKZGlmZiAtLWdpdCBhL3RzLWhvc3QtaW5zdGFsbCBiL3RzLWhv
c3QtaW5zdGFsbAppbmRleCAyMTY1NDM2Li4wMWQwNGQ0IDEwMDc1NQotLS0gYS90cy1ob3N0LWlu
c3RhbGwKKysrIGIvdHMtaG9zdC1pbnN0YWxsCkBAIC0xODIsNyArMTgyLDcgQEAgc3ViIHNldHVw
X25ldGJvb3RfZmlyc3Rib290KCQpIHsKICAgICB9CiAKICAgICBkaV9zcGVjaWFsX2tlcm5lbCgk
aG8sICRkX2ksIHN1YiB7Ci0gICAgICAgIG15ICgkaywgJGNwaW8pID0gQF87CisgICAgICAgIG15
ICgka3AsICRrLCAkY3BpbykgPSBAXzsKICAgICAgICAgJGtlcm5lbCA9ICRrIGlmIGRlZmluZWQg
JGs7CiAgICAgICAgIHB1c2ggQGluaXRyZHMsICRjcGlvIGlmIGRlZmluZWQgJGNwaW87CiAgICAg
fSk7Ci0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
