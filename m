From: Colin King <colin.king@canonical.com>
Subject: [PATCH] x86/xen: remove redundant variable save_pud
Date: Tue, 28 Aug 2018 17:10:46 +0100
Message-ID: <20180828161046.17165-1-colin.king__11856.9604740062$1535472590$gmane$org@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3l52=ll=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1fuga5-0000GR-TF
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 16:11:01 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClZhcmlhYmxl
IHNhdmVfcHVkIGlzIGJlaW5nIGFzc2lnbmVkIGJ1dCBpcyBuZXZlciB1c2VkIGhlbmNlIGl0IGlz
CnJlZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92ZWQuCgpDbGVhbnMgdXAgY2xhbmcgd2FybmluZzoK
dmFyaWFibGUgJ3NhdmVfcHVkJyBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQoKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25p
Y2FsLmNvbT4KLS0tCiBhcmNoL3g4Ni94ZW4vbW11X3B2LmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vbW11X3B2LmMgYi9h
cmNoL3g4Ni94ZW4vbW11X3B2LmMKaW5kZXggMDZhODE0ZDQ0YjliLi4yZmU1YzliMTgxNmIgMTAw
NjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9tbXVfcHYuYworKysgYi9hcmNoL3g4Ni94ZW4vbW11X3B2
LmMKQEAgLTIwNjAsNyArMjA2MCw2IEBAIHZvaWQgX19pbml0IHhlbl9yZWxvY2F0ZV9wMm0odm9p
ZCkKIAlwdWRfdCAqcHVkOwogCXBnZF90ICpwZ2Q7CiAJdW5zaWduZWQgbG9uZyAqbmV3X3AybTsK
LQlpbnQgc2F2ZV9wdWQ7CiAKIAlzaXplID0gUEFHRV9BTElHTih4ZW5fc3RhcnRfaW5mby0+bnJf
cGFnZXMgKiBzaXplb2YodW5zaWduZWQgbG9uZykpOwogCW5fcHRlID0gcm91bmR1cChzaXplLCBQ
QUdFX1NJWkUpID4+IFBBR0VfU0hJRlQ7CkBAIC0yMDkwLDcgKzIwODksNiBAQCB2b2lkIF9faW5p
dCB4ZW5fcmVsb2NhdGVfcDJtKHZvaWQpCiAKIAlwZ2QgPSBfX3ZhKHJlYWRfY3IzX3BhKCkpOwog
CW5ld19wMm0gPSAodW5zaWduZWQgbG9uZyAqKSgyICogUEdESVJfU0laRSk7Ci0Jc2F2ZV9wdWQg
PSBuX3B1ZDsKIAlmb3IgKGlkeF9wdWQgPSAwOyBpZHhfcHVkIDwgbl9wdWQ7IGlkeF9wdWQrKykg
ewogCQlwdWQgPSBlYXJseV9tZW1yZW1hcChwdWRfcGh5cywgUEFHRV9TSVpFKTsKIAkJY2xlYXJf
cGFnZShwdWQpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
