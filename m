From: Alexandru Isaila <aisaila@bitdefender.com>
Subject: [PATCH v7 02/15] x86/hvm: Introduce
 hvm_save_tsc_adjust_one() func
Date: Thu,  7 Jun 2018 17:59:20 +0300
Message-ID: <1528383573-21522-3-git-send-email-aisaila@bitdefender.com>
References: <1528383573-21522-1-git-send-email-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528383573-21522-1-git-send-email-aisaila@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: wei.liu2@citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, paul.durrant@citrix.com, jbeulich@suse.com, Alexandru Isaila <aisaila@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyB1c2VkIHRvIHNhdmUgZGF0YSBmcm9tIGEgc2luZ2xlIGluc3RhbmNlLgoKU2lnbmVk
LW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Ci0tLQog
eGVuL2FyY2gveDg2L2h2bS9odm0uYyB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0v
aHZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCmluZGV4IGMyMzk4M2MuLjc2ZjdkYjkgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9o
dm0uYwpAQCAtNzQwLDYgKzc0MCwxMSBAQCB2b2lkIGh2bV9kb21haW5fZGVzdHJveShzdHJ1Y3Qg
ZG9tYWluICpkKQogICAgIGRlc3Ryb3lfdnBjaV9tbWNmZyhkKTsKIH0KIAorc3RhdGljIHZvaWQg
aHZtX3NhdmVfdHNjX2FkanVzdF9vbmUoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCBodm1fdHNjX2Fk
anVzdCAqY3R4dCkKK3sKKyAgICBjdHh0LT50c2NfYWRqdXN0ID0gdi0+YXJjaC5odm1fdmNwdS5t
c3JfdHNjX2FkanVzdDsKK30KKwogc3RhdGljIGludCBodm1fc2F2ZV90c2NfYWRqdXN0KHN0cnVj
dCBkb21haW4gKmQsIGh2bV9kb21haW5fY29udGV4dF90ICpoKQogewogICAgIHN0cnVjdCB2Y3B1
ICp2OwpAQCAtNzQ4LDcgKzc1Myw3IEBAIHN0YXRpYyBpbnQgaHZtX3NhdmVfdHNjX2FkanVzdChz
dHJ1Y3QgZG9tYWluICpkLCBodm1fZG9tYWluX2NvbnRleHRfdCAqaCkKIAogICAgIGZvcl9lYWNo
X3ZjcHUgKCBkLCB2ICkKICAgICB7Ci0gICAgICAgIGN0eHQudHNjX2FkanVzdCA9IHYtPmFyY2gu
aHZtX3ZjcHUubXNyX3RzY19hZGp1c3Q7CisgICAgICAgIGh2bV9zYXZlX3RzY19hZGp1c3Rfb25l
KHYsICZjdHh0KTsKICAgICAgICAgZXJyID0gaHZtX3NhdmVfZW50cnkoVFNDX0FESlVTVCwgdi0+
dmNwdV9pZCwgaCwgJmN0eHQpOwogICAgICAgICBpZiAoIGVyciApCiAgICAgICAgICAgICBicmVh
azsKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
