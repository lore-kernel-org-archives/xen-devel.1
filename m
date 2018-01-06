From: Nick Desaulniers <nick.desaulniers@gmail.com>
Subject: [PATCH v2] x86: xen: remove the use of VLAIS
Date: Sat,  6 Jan 2018 13:39:48 -0800
Message-ID: <1515274788-24548-1-git-send-email-nick.desaulniers__29450.2679877498$1515274763$gmane$org@gmail.com>
References: <c2217783-9d18-912f-8c13-996489dbe602@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ognq=eb=gmail.com=nick.desaulniers@srs-us1.protection.inumbo.net>)
 id 1eXwCF-0001K3-Hl
 for xen-devel@lists.xenproject.org; Sat, 06 Jan 2018 21:40:07 +0000
Received: by mail-pg0-x243.google.com with SMTP id i5so3360455pgq.11
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jan 2018 13:40:05 -0800 (PST)
In-Reply-To: <c2217783-9d18-912f-8c13-996489dbe602@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nick Desaulniers <nick.desaulniers@gmail.com>, ghackmann@google.com, linux-kernel@vger.kernel.org, mka@google.com, Ingo Molnar <mingo@redhat.com>, srhines@google.com, kees@google.com, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

VmFyaWFibGUgTGVuZ3RoIEFycmF5cyBJbiBTdHJ1Y3RzIChWTEFJUykgaXMgbm90IHN1cHBvcnRl
ZCBieSBDbGFuZywgYW5kCmZyb3duZWQgdXBvbiBieSBvdGhlcnMuCgpodHRwczovL2xrbWwub3Jn
L2xrbWwvMjAxMy85LzIzLzUwMAoKSGVyZSwgdGhlIFZMQUlTIHdhcyB1c2VkIGJlY2F1c2UgdGhl
IHNpemUgb2YgdGhlIGJpdG1hcCByZXR1cm5lZCBmcm9tCnhlbl9tY19lbnRyeSgpIGRlcGVuZGVk
IG9uIHBvc3NpYmx5IChiYXNlZCBvbiBrZXJuZWwgY29uZmlndXJhdGlvbikKcnVudGltZSBzaXpl
ZCBkYXRhLiBSYXRoZXIgdGhhbiBkZWNsYXJpbmcgYXJncyBhcyBhIFZMQUlTIHRoZW4gY2FsbGlu
ZwpzaXplb2Ygb24gKmFyZ3MsIHdlIGNhbGN1bGF0ZSB0aGUgYXBwcm9wcmlhdGUgc2l6ZW9mIGFy
Z3MgbWFudWFsbHkuCkZ1cnRoZXIsIHdlIGNhbiBnZXQgcmlkIG9mIHRoZSAjaWZkZWYncyBhbmQg
cmVseSBvbiBudW1fcG9zc2libGVfY3B1cygpCih0aGFua3MgdG8gYSBoZWxwZnVsIGNoZWNrcGF0
Y2ggd2FybmluZyBmcm9tIGFuIGVhcmxpZXIgdmVyc2lvbiBvZiB0aGlzCnBhdGNoKS4KClN1Z2dl
c3RlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpTaWduZWQtb2ZmLWJ5OiBO
aWNrIERlc2F1bG5pZXJzIDxuaWNrLmRlc2F1bG5pZXJzQGdtYWlsLmNvbT4KLS0tCkNoYW5nZXMg
aW4gdjI6CiogQ2hhbmdlIG1hc2sgdG8gdXMgREVDTEFSRV9CSVRNQVAgaW5zdGVhZCBvZiBwb2lu
dGVyLCBhcyBzdWdnZXN0ZWQuCiogVXBkYXRlIGNvbW1pdCBtZXNzYWdlIHRvIHJlbW92ZSBtZW50
aW9uIG9mIHBvaW50ZXIuCiogVXBkYXRlIHNpemVvZiBjYWxjdWxhdGlvbiB0byB3b3JrIHdpdGgg
YXJyYXkgcmF0aGVyIHRoYW4gcG9pbnRlci4KCiBhcmNoL3g4Ni94ZW4vbW11X3B2LmMgfCA4ICsr
Ky0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9tbXVfcHYuYyBiL2FyY2gveDg2L3hlbi9tbXVfcHYu
YwppbmRleCA0ZDYyYzA3Li5kODUwNzYyIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4vbW11X3B2
LmMKKysrIGIvYXJjaC94ODYveGVuL21tdV9wdi5jCkBAIC0xMzI1LDIwICsxMzI1LDE4IEBAIHN0
YXRpYyB2b2lkIHhlbl9mbHVzaF90bGJfb3RoZXJzKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVz
LAogewogCXN0cnVjdCB7CiAJCXN0cnVjdCBtbXVleHRfb3Agb3A7Ci0jaWZkZWYgQ09ORklHX1NN
UAotCQlERUNMQVJFX0JJVE1BUChtYXNrLCBudW1fcHJvY2Vzc29ycyk7Ci0jZWxzZQogCQlERUNM
QVJFX0JJVE1BUChtYXNrLCBOUl9DUFVTKTsKLSNlbmRpZgogCX0gKmFyZ3M7CiAJc3RydWN0IG11
bHRpY2FsbF9zcGFjZSBtY3M7CisJY29uc3Qgc2l6ZV90IG1jX2VudHJ5X3NpemUgPSBzaXplb2Yo
YXJncy0+b3ApICsKKwkJc2l6ZW9mKGFyZ3MtPm1hc2tbMF0pICogQklUU19UT19MT05HUyhudW1f
cG9zc2libGVfY3B1cygpKTsKIAogCXRyYWNlX3hlbl9tbXVfZmx1c2hfdGxiX290aGVycyhjcHVz
LCBpbmZvLT5tbSwgaW5mby0+c3RhcnQsIGluZm8tPmVuZCk7CiAKIAlpZiAoY3B1bWFza19lbXB0
eShjcHVzKSkKIAkJcmV0dXJuOwkJLyogbm90aGluZyB0byBkbyAqLwogCi0JbWNzID0geGVuX21j
X2VudHJ5KHNpemVvZigqYXJncykpOworCW1jcyA9IHhlbl9tY19lbnRyeShtY19lbnRyeV9zaXpl
KTsKIAlhcmdzID0gbWNzLmFyZ3M7CiAJYXJncy0+b3AuYXJnMi52Y3B1bWFzayA9IHRvX2NwdW1h
c2soYXJncy0+bWFzayk7CiAKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
