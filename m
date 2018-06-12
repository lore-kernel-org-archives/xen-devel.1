From: Zhouyang Jia <jiazhouyang09@gmail.com>
Subject: [PATCH] xen: add error handling for xenbus_printf
Date: Tue, 12 Jun 2018 11:44:33 +0800
Message-ID: <1528775073-39322-1-git-send-email-jiazhouyang09__26183.9849329137$1528780274$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qlpj=i6=gmail.com=jiazhouyang09@srs-us1.protection.inumbo.net>)
 id 1fSaEb-0000eT-NM
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 03:44:41 +0000
Received: by mail-pg0-x244.google.com with SMTP id p21-v6so10769384pgd.11
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jun 2018 20:44:39 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Zhouyang Jia <jiazhouyang09@gmail.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

V2hlbiB4ZW5idXNfcHJpbnRmIGZhaWxzLCB0aGUgbGFjayBvZiBlcnJvci1oYW5kbGluZyBjb2Rl
IG1heQpjYXVzZSB1bmV4cGVjdGVkIHJlc3VsdHMuCgpUaGlzIHBhdGNoIGFkZHMgZXJyb3ItaGFu
ZGxpbmcgY29kZSBhZnRlciBjYWxsaW5nIHhlbmJ1c19wcmludGYuCgpTaWduZWQtb2ZmLWJ5OiBa
aG91eWFuZyBKaWEgPGppYXpob3V5YW5nMDlAZ21haWwuY29tPgotLS0KIGRyaXZlcnMveGVuL21h
bmFnZS5jIHwgMTcgKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL21hbmFnZS5j
IGIvZHJpdmVycy94ZW4vbWFuYWdlLmMKaW5kZXggODgzNTA2NS4uMTU5Njk0ZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy94ZW4vbWFuYWdlLmMKKysrIGIvZHJpdmVycy94ZW4vbWFuYWdlLmMKQEAgLTI4
OSw4ICsyODksMTUgQEAgc3RhdGljIHZvaWQgc3lzcnFfaGFuZGxlcihzdHJ1Y3QgeGVuYnVzX3dh
dGNoICp3YXRjaCwgY29uc3QgY2hhciAqcGF0aCwKIAkJcmV0dXJuOwogCX0KIAotCWlmIChzeXNy
cV9rZXkgIT0gJ1wwJykKLQkJeGVuYnVzX3ByaW50Zih4YnQsICJjb250cm9sIiwgInN5c3JxIiwg
IiVjIiwgJ1wwJyk7CisJaWYgKHN5c3JxX2tleSAhPSAnXDAnKSB7CisJCWVyciA9IHhlbmJ1c19w
cmludGYoeGJ0LCAiY29udHJvbCIsICJzeXNycSIsICIlYyIsICdcMCcpOworCQlpZiAoZXJyKSB7
CisJCQlwcl9lcnIoIkVycm9yICVkIHdyaXRpbmcgc3lzcnEgY29kZSBpbiBjb250cm9sL3N5c3Jx
XG4iLAorCQkJICAgICAgIGVycik7CisJCQl4ZW5idXNfdHJhbnNhY3Rpb25fZW5kKHhidCwgMSk7
CisJCQlyZXR1cm47CisJCX0KKwl9CiAKIAllcnIgPSB4ZW5idXNfdHJhbnNhY3Rpb25fZW5kKHhi
dCwgMCk7CiAJaWYgKGVyciA9PSAtRUFHQUlOKQpAQCAtMzQyLDcgKzM0OSwxMSBAQCBzdGF0aWMg
aW50IHNldHVwX3NodXRkb3duX3dhdGNoZXIodm9pZCkKIAkJCWNvbnRpbnVlOwogCQlzbnByaW50
Zihub2RlLCBGRUFUVVJFX1BBVEhfU0laRSwgImZlYXR1cmUtJXMiLAogCQkJIHNodXRkb3duX2hh
bmRsZXJzW2lkeF0uY29tbWFuZCk7Ci0JCXhlbmJ1c19wcmludGYoWEJUX05JTCwgImNvbnRyb2wi
LCBub2RlLCAiJXUiLCAxKTsKKwkJZXJyID0geGVuYnVzX3ByaW50ZihYQlRfTklMLCAiY29udHJv
bCIsIG5vZGUsICIldSIsIDEpOworCQlpZiAoZXJyKSB7CisJCQlwcl9lcnIoIkVycm9yICVkIHdy
aXRpbmcgJXNcbiIsIGVyciwgbm9kZSk7CisJCQlyZXR1cm4gZXJyOworCQl9CiAJfQogCiAJcmV0
dXJuIDA7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
