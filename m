From: Bruno Alvisio <bruno.alvisio@gmail.com>
Subject: [PATCH v2 10/17] Save/Restore Support: Add
	suspend/resume support for timers
Date: Tue, 13 Feb 2018 18:25:54 -0800
Message-ID: <1518575161-70717-11-git-send-email-bruno.alvisio@gmail.com>
References: <1518575161-70717-1-git-send-email-bruno.alvisio@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=cyps=fi=gmail.com=bruno.alvisio@srs-us1.protection.inumbo.net>)
 id 1elmmB-0002th-3Q
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2018 02:26:27 +0000
In-Reply-To: <1518575161-70717-1-git-send-email-bruno.alvisio@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: jgross@suse.com, samuel.thibault@ens-lyon.org, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQnJ1bm8gQWx2aXNpbyA8YnJ1bm8uYWx2aXNpb0BnbWFpbC5jb20+Ci0t
LQpDaGFuZ2VkIHNpbmNlIHYxOgogICAqIFJlbW92ZWQgcmVzdW1lL3N1c3BlbmRfdGltZSgpIGFu
ZCB1c2VkIGluaXQvZmluaV90aW1lKCkgaW5zdGVhZAotLS0KIGFyY2gveDg2L3RpbWUuYyB8IDEg
LQoga2VybmVsLmMgICAgICAgIHwgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3RpbWUuYyBiL2FyY2gv
eDg2L3RpbWUuYwppbmRleCAzNjU4MTQyLi44MDc3YzgwIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni90
aW1lLmMKKysrIGIvYXJjaC94ODYvdGltZS5jCkBAIC0yMzMsNyArMjMzLDYgQEAgc3RhdGljIHZv
aWQgdGltZXJfaGFuZGxlcihldnRjaG5fcG9ydF90IGV2LCBzdHJ1Y3QgcHRfcmVncyAqcmVncywg
dm9pZCAqaWduKQogc3RhdGljIGV2dGNobl9wb3J0X3QgcG9ydDsKIHZvaWQgaW5pdF90aW1lKHZv
aWQpCiB7Ci0gICAgcHJpbnRrKCJJbml0aWFsaXNpbmcgdGltZXIgaW50ZXJmYWNlXG4iKTsKICAg
ICBwb3J0ID0gYmluZF92aXJxKFZJUlFfVElNRVIsICZ0aW1lcl9oYW5kbGVyLCBOVUxMKTsKICAg
ICB1bm1hc2tfZXZ0Y2huKHBvcnQpOwogfQpkaWZmIC0tZ2l0IGEva2VybmVsLmMgYi9rZXJuZWwu
YwppbmRleCA3ODJlYjc5Li4zNTY0YWYzIDEwMDY0NAotLS0gYS9rZXJuZWwuYworKysgYi9rZXJu
ZWwuYwpAQCAtMTIwLDEwICsxMjAsMTQgQEAgdm9pZCBzdGFydF9rZXJuZWwodm9pZCogcGFyKQog
dm9pZCBwcmVfc3VzcGVuZCh2b2lkKQogewogICAgIGxvY2FsX2lycV9kaXNhYmxlKCk7CisKKyAg
ICBmaW5pX3RpbWUoKTsKIH0KIAogdm9pZCBwb3N0X3N1c3BlbmQoaW50IGNhbmNlbGVkKQogewor
ICAgIGluaXRfdGltZSgpOworCiAgICAgbG9jYWxfaXJxX2VuYWJsZSgpOwogfQogCi0tIAoyLjMu
MiAoQXBwbGUgR2l0LTU1KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
