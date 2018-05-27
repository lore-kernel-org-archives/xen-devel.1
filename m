From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] ALSA: xen-front: fix unsigned error check
 on return from to_sndif_format
Date: Sun, 27 May 2018 22:32:19 +0100
Message-ID: <20180527213219.24182-1-colin.king__13226.8501133241$1527456673$gmane$org@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xu1y=io=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1fN3H9-0002E4-8O
 for xen-devel@lists.xenproject.org; Sun, 27 May 2018 21:32:27 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBuZWdh
dGl2ZSBlcnJvciByZXR1cm4gZnJvbSB0aGUgY2FsbCB0byB0b19zbmRpZl9mb3JtYXQgaXMgYmVp
bmcKYXNzaWduZWQgdG8gYW4gdW5zaWduZWQgOCBiaXQgaW50ZWdlciBhbmQgaGVuY2UgdGhlIGNo
ZWNrIGZvciBhIG5lZ2F0aXZlCnZhbHVlIGlzIGFsd2F5cyBnb2luZyB0byBiZSBmYWxzZS4gIEZp
eCB0aGlzIGJ5IHVzaW5nIHJldCBhcyB0aGUgZXJyb3IKcmV0dXJuIGFuZCBoZW5jZSB0aGUgbmVn
YXRpdmUgZXJyb3IgY2FuIGJlIGRldGVjdGVkIGFuZCBhc3NpZ24KdGhlIHU4IHNuZGlmX2Zvcm1h
dCB0byByZXQgaWYgdGhlcmUgaXMgbm8gZXJyb3IuCgpEZXRlY3RlZCBieSBDb3Zlcml0eVNjYW4s
IENJRCMxNDY5Mzg1ICgiVW5zaWduZWQgY29tcGFyZWQgYWdhaW5zdCAwIikKClNpZ25lZC1vZmYt
Ynk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogc291bmQv
eGVuL3hlbl9zbmRfZnJvbnRfYWxzYS5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3hlbi94ZW5f
c25kX2Zyb250X2Fsc2EuYyBiL3NvdW5kL3hlbi94ZW5fc25kX2Zyb250X2Fsc2EuYwppbmRleCA1
MDQxZjgzZTk4ZDIuLjVhMmJkNzBhMmZhMSAxMDA2NDQKLS0tIGEvc291bmQveGVuL3hlbl9zbmRf
ZnJvbnRfYWxzYS5jCisrKyBiL3NvdW5kL3hlbi94ZW5fc25kX2Zyb250X2Fsc2EuYwpAQCAtNDY2
LDEzICs0NjYsMTQgQEAgc3RhdGljIGludCBhbHNhX3ByZXBhcmUoc3RydWN0IHNuZF9wY21fc3Vi
c3RyZWFtICpzdWJzdHJlYW0pCiAJCXU4IHNuZGlmX2Zvcm1hdDsKIAkJaW50IHJldDsKIAotCQlz
bmRpZl9mb3JtYXQgPSB0b19zbmRpZl9mb3JtYXQocnVudGltZS0+Zm9ybWF0KTsKLQkJaWYgKHNu
ZGlmX2Zvcm1hdCA8IDApIHsKKwkJcmV0ID0gdG9fc25kaWZfZm9ybWF0KHJ1bnRpbWUtPmZvcm1h
dCk7CisJCWlmIChyZXQgPCAwKSB7CiAJCQlkZXZfZXJyKCZzdHJlYW0tPmZyb250X2luZm8tPnhi
X2Rldi0+ZGV2LAogCQkJCSJVbnN1cHBvcnRlZCBzYW1wbGUgZm9ybWF0OiAlZFxuIiwKIAkJCQly
dW50aW1lLT5mb3JtYXQpOwotCQkJcmV0dXJuIHNuZGlmX2Zvcm1hdDsKKwkJCXJldHVybiByZXQ7
CiAJCX0KKwkJc25kaWZfZm9ybWF0ID0gcmV0OwogCiAJCXJldCA9IHhlbl9zbmRfZnJvbnRfc3Ry
ZWFtX3ByZXBhcmUoJnN0cmVhbS0+ZXZ0X3BhaXItPnJlcSwKIAkJCQkJCSAgICZzdHJlYW0tPnNo
X2J1ZiwKLS0gCjIuMTcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
