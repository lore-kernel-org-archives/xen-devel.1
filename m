From: Bruno Alvisio <bruno.alvisio@gmail.com>
Subject: [PATCH v2 12/16] Save/Restore Support: Add support for
	suspend/restore events.
Date: Tue, 13 Feb 2018 18:27:35 -0800
Message-ID: <1518575259-71141-13-git-send-email-bruno.alvisio@gmail.com>
References: <1518575259-71141-1-git-send-email-bruno.alvisio@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=cyps=fi=gmail.com=bruno.alvisio@srs-us1.protection.inumbo.net>)
 id 1elmnt-0004Ou-7Y
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2018 02:28:13 +0000
In-Reply-To: <1518575259-71141-1-git-send-email-bruno.alvisio@gmail.com>
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

U2lnbmVkLW9mZi1ieTogQnJ1bm8gQWx2aXNpbyA8YnJ1bm8uYWx2aXNpb0BnbWFpbC5jb20+ClJl
dmlld2VkLWJ5OiBTYW11ZWwgVGhpYmF1bHQgPHNhbXVlbC50aGliYXVsdEBlbnMtbHlvbi5vcmc+
Ci0tLQogZXZlbnRzLmMgICAgICAgICB8IDUgKysrKysKIGluY2x1ZGUvZXZlbnRzLmggfCAxICsK
IGtlcm5lbC5jICAgICAgICAgfCAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2V2ZW50cy5jIGIvZXZlbnRzLmMKaW5kZXggZThlZjhhYS4uMzQyYWVh
ZCAxMDA2NDQKLS0tIGEvZXZlbnRzLmMKKysrIGIvZXZlbnRzLmMKQEAgLTE4Myw2ICsxODMsMTEg
QEAgdm9pZCBmaW5pX2V2ZW50cyh2b2lkKQogICAgIGFyY2hfZmluaV9ldmVudHMoKTsKIH0KIAor
dm9pZCBzdXNwZW5kX2V2ZW50cyh2b2lkKQoreworICAgIHVuYmluZF9hbGxfcG9ydHMoKTsKK30K
Kwogdm9pZCBkZWZhdWx0X2hhbmRsZXIoZXZ0Y2huX3BvcnRfdCBwb3J0LCBzdHJ1Y3QgcHRfcmVn
cyAqcmVncywgdm9pZCAqaWdub3JlKQogewogICAgIHByaW50aygiW1BvcnQgJWRdIC0gZXZlbnQg
cmVjZWl2ZWRcbiIsIHBvcnQpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ldmVudHMuaCBiL2luY2x1
ZGUvZXZlbnRzLmgKaW5kZXggODliNTk5Ny4uNzA1YWQ5MyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9l
dmVudHMuaAorKysgYi9pbmNsdWRlL2V2ZW50cy5oCkBAIC01NSw1ICs1NSw2IEBAIHN0YXRpYyBp
bmxpbmUgaW50IG5vdGlmeV9yZW1vdGVfdmlhX2V2dGNobihldnRjaG5fcG9ydF90IHBvcnQpCiB9
CiAKIHZvaWQgZmluaV9ldmVudHModm9pZCk7Cit2b2lkIHN1c3BlbmRfZXZlbnRzKHZvaWQpOwog
CiAjZW5kaWYgLyogX0VWRU5UU19IXyAqLwpkaWZmIC0tZ2l0IGEva2VybmVsLmMgYi9rZXJuZWwu
YwppbmRleCAyZmI2OWJmLi5kMDc4ZTBhIDEwMDY0NAotLS0gYS9rZXJuZWwuYworKysgYi9rZXJu
ZWwuYwpAQCAtMTI0LDYgKzEyNCw4IEBAIHZvaWQgcHJlX3N1c3BlbmQodm9pZCkKICAgICBmaW5p
X3RpbWUoKTsKIAogICAgIHN1c3BlbmRfY29uc29sZSgpOworCisgICAgc3VzcGVuZF9ldmVudHMo
KTsKIH0KIAogdm9pZCBwb3N0X3N1c3BlbmQoaW50IGNhbmNlbGVkKQotLSAKMi4zLjIgKEFwcGxl
IEdpdC01NSkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
