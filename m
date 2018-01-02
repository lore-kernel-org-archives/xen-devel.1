From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: [PATCH] xen/input: do not advertise multi-touch
	pressure support
Date: Tue,  2 Jan 2018 10:12:55 +0200
Message-ID: <1514880775-31185-1-git-send-email-andr2000__9830.02360812879$1514880736$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=08l+=d5=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1eWHh9-0005yf-CP
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2018 08:13:11 +0000
Received: by mail-lf0-x242.google.com with SMTP id m20so41820029lfi.6
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2018 00:13:09 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Cc: andr2000@gmail.com, Andrii Chepurnyi <andrii_chepurnyi@epam.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgoKU29tZSB1c2VyLXNwYWNlIGFwcGxpY2F0aW9ucyBleHBlY3QgbXVsdGktdG91Y2gg
cHJlc3N1cmUKb24gY29udGFjdCB0byBiZSByZXBvcnRlZCBpZiBpdCBpcyBhZHZlcnRpc2VkIGlu
IGRldmljZQpwcm9wZXJ0aWVzLiBPdGhlcndpc2UsIHN1Y2ggYXBwbGljYXRpb25zIG1heSB0cmVh
dCByZXBvcnRzCm5vdCBhcyBhY3R1YWwgdG91Y2hlcywgYnV0IGhvdmVyaW5nLiBDdXJyZW50bHkg
dGhpcyBpcwpvbmx5IGFkdmVydGlzZWQsIGJ1dCBub3QgcmVwb3J0ZWQuCkZpeCB0aGlzIGJ5IG5v
dCBhZHZlcnRpc2luZyB0aGF0IEFCU19NVF9QUkVTU1VSRSBpcyBzdXBwb3J0ZWQuCgpTaWduZWQt
b2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29A
ZXBhbS5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJpaSBDaGVwdXJueWkgPGFuZHJpaV9jaGVwdXJu
eWlAZXBhbS5jb20+Ci0tLQogZHJpdmVycy9pbnB1dC9taXNjL3hlbi1rYmRmcm9udC5jIHwgMiAt
LQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
bnB1dC9taXNjL3hlbi1rYmRmcm9udC5jIGIvZHJpdmVycy9pbnB1dC9taXNjL3hlbi1rYmRmcm9u
dC5jCmluZGV4IDZiZjU2YmI1ZjhkOS4uZDkxZjNiMWM1Mzc1IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2lucHV0L21pc2MveGVuLWtiZGZyb250LmMKKysrIGIvZHJpdmVycy9pbnB1dC9taXNjL3hlbi1r
YmRmcm9udC5jCkBAIC0zMjYsOCArMzI2LDYgQEAgc3RhdGljIGludCB4ZW5rYmRfcHJvYmUoc3Ry
dWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKIAkJCQkgICAgIDAsIHdpZHRoLCAwLCAwKTsKIAkJaW5w
dXRfc2V0X2Fic19wYXJhbXMobXRvdWNoLCBBQlNfTVRfUE9TSVRJT05fWSwKIAkJCQkgICAgIDAs
IGhlaWdodCwgMCwgMCk7Ci0JCWlucHV0X3NldF9hYnNfcGFyYW1zKG10b3VjaCwgQUJTX01UX1BS
RVNTVVJFLAotCQkJCSAgICAgMCwgMjU1LCAwLCAwKTsKIAogCQlyZXQgPSBpbnB1dF9tdF9pbml0
X3Nsb3RzKG10b3VjaCwgbnVtX2NvbnQsIElOUFVUX01UX0RJUkVDVCk7CiAJCWlmIChyZXQpIHsK
LS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
