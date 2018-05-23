From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 02/23] Osstest/TestSupport: Use right
 arch for UEFI grub setup
Date: Wed, 23 May 2018 17:15:49 +0100
Message-ID: <1527092170-4111-3-git-send-email-ian.jackson@eu.citrix.com>
References: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdxj=ik=citrix.com=prvs=674fbe803=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fLWR3-0000O0-NC
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 16:16:21 +0000
In-Reply-To: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@linaro.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyB0YWJsZSB3YXMgZXJyb25lb3VzbHkgbmV2ZXIgdXNlZC4gIEFsc28sIHRoZSB2YWx1ZSBm
b3IgYXJtNjQgaXMKd3Jvbmc6IGl0IHNob3VsZCBiZSBBQTY0LiAgV2UgZml4IHRoZSB0YWJsZSB2
YWx1ZSwgYW5kIHN1YnN0aXR1dGUgaXQKaW4sIGZvciBubyBvdmVyYWxsIGNoYW5nZSBvbiBhbWQ2
NC4gIE9uIG90aGVyIGFyY2hlcyB3ZSBub3cgZG8gbm90CmhhcmRjb2RlIHRoZSB3cm9uZyB2YWx1
ZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29t
PgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAbGluYXJvLm9yZz4KLS0tCiBPc3N0ZXN0
L1Rlc3RTdXBwb3J0LnBtIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSBi
L09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KaW5kZXggNmQ1ZTY2Ny4uOGY3OThhMyAxMDA2NDQKLS0t
IGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQorKysgYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCkBA
IC0yNjM0LDcgKzI2MzQsNyBAQCBzdWIgc2V0dXBfbmV0Ym9vdF9sb2NhbF91ZWZpICgkKSB7CiAg
ICAgbXkgKCRobykgPSBAXzsKICAgICBteSAlZWZpX2FyY2hzID0gcXcoYW1kNjQgWDY0CiAgICAg
ICAgICAgICAgICAgICAgICAgIGFybTMyIEFSTQotICAgICAgICAgICAgICAgICAgICAgICBhcm02
NCBBQVJDSDY0CisgICAgICAgICAgICAgICAgICAgICAgIGFybTY0IEFBNjQKICAgICAgICAgICAg
ICAgICAgICAgICAgaTM4NiAgSUEzMik7CiAgICAgZGllICJFRkkgYXJjaCIgdW5sZXNzICRlZmlf
YXJjaHN7ICRye2FyY2h9IH07CiAgICAgbXkgJGVmaSA9ICRlZmlfYXJjaHN7ICRye2FyY2h9IH07
CkBAIC0yNjQ2LDggKzI2NDYsOCBAQCBtZW51ZW50cnkgJ2xvY2FsJyB7CiAgIGluc21vZCBwYXJ0
X2dwdAogICBpbnNtb2QgcGFydF9tc2RvcwogICBzZXQgcm9vdD0oaGQwLGdwdDEpCi0gIGVjaG8g
IkNoYWlubG9hZGluZyAoXCR7cm9vdH0pL0VGSS9CT09UL0JPT1RBQTY0LkVGSSIKLSAgY2hhaW5s
b2FkZXIgKFwke3Jvb3R9KS9FRkkvQk9PVC9CT09UQUE2NC5FRkkKKyAgZWNobyAiQ2hhaW5sb2Fk
aW5nIChcJHtyb290fSkvRUZJL0JPT1QvQk9PVCRlZmkuRUZJIgorICBjaGFpbmxvYWRlciAoXCR7
cm9vdH0pL0VGSS9CT09UL0JPT1QkZWZpLkVGSQogICBib290CiB9CiBFTkQKLS0gCjIuMS40CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
