From: Laura Abbott <labbott@redhat.com>
Subject: [PATCH] x86/xen: Remove use of VLAs
Date: Fri, 13 Apr 2018 15:11:46 -0700
Message-ID: <20180413221146.28476-1-labbott__33145.8823675804$1523657472$gmane$org@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jjtg=hc=redhat.com=labbott@srs-us1.protection.inumbo.net>)
 id 1f76vL-0004Qk-W4
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 22:12:04 +0000
Received: by mail-ot0-f195.google.com with SMTP id f47-v6so11496511oth.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Apr 2018 15:12:01 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: kernel-hardening@lists.openwall.com, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, Laura Abbott <labbott@redhat.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUncyBhbiBvbmdvaW5nIGVmZm9ydCB0byByZW1vdmUgVkxBc1sxXSBmcm9tIHRoZSBrZXJu
ZWwgdG8gZXZlbnR1YWxseQp0dXJuIG9uIC1XdmxhLiBUaGUgZmV3IFZMQXMgaW4gdXNlIGhhdmUg
YW4gdXBwZXIgYm91bmQgYmFzZWQgb24gYSBzaXplCm9mIDY0Sy4gVGhpcyBkb2Vzbid0IHByb2R1
Y2UgYW4gZXhjZXNzaXZlbHkgbGFyZ2Ugc3RhY2sgc28ganVzdCBzd2l0Y2gKdGhlIHVwcGVyIGJv
dW5kLgoKWzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzMvNy82MjEKClNpZ25lZC1vZmYt
Ynk6IExhdXJhIEFiYm90dCA8bGFiYm90dEByZWRoYXQuY29tPgotLS0KIGFyY2gveDg2L3hlbi9l
bmxpZ2h0ZW5fcHYuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYu
YyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwppbmRleCBjMzZkMjNhYTZjMzUuLmQ5NmE1
YTUzNWNiYiAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCisrKyBiL2Fy
Y2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwpAQCAtNDIxLDggKzQyMSw3IEBAIHN0YXRpYyB2b2lk
IHhlbl9sb2FkX2dkdChjb25zdCBzdHJ1Y3QgZGVzY19wdHIgKmR0cikKIHsKIAl1bnNpZ25lZCBs
b25nIHZhID0gZHRyLT5hZGRyZXNzOwogCXVuc2lnbmVkIGludCBzaXplID0gZHRyLT5zaXplICsg
MTsKLQl1bnNpZ25lZCBwYWdlcyA9IERJVl9ST1VORF9VUChzaXplLCBQQUdFX1NJWkUpOwotCXVu
c2lnbmVkIGxvbmcgZnJhbWVzW3BhZ2VzXTsKKwl1bnNpZ25lZCBsb25nIGZyYW1lc1tESVZfUk9V
TkRfVVAoU1pfNjRLLCBQQUdFX1NJWkUpXTsKIAlpbnQgZjsKIAogCS8qCkBAIC00NzAsOCArNDY5
LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IHhlbl9sb2FkX2dkdF9ib290KGNvbnN0IHN0cnVjdCBk
ZXNjX3B0ciAqZHRyKQogewogCXVuc2lnbmVkIGxvbmcgdmEgPSBkdHItPmFkZHJlc3M7CiAJdW5z
aWduZWQgaW50IHNpemUgPSBkdHItPnNpemUgKyAxOwotCXVuc2lnbmVkIHBhZ2VzID0gRElWX1JP
VU5EX1VQKHNpemUsIFBBR0VfU0laRSk7Ci0JdW5zaWduZWQgbG9uZyBmcmFtZXNbcGFnZXNdOwor
CXVuc2lnbmVkIGxvbmcgZnJhbWVzW0RJVl9ST1VORF9VUChTWl82NEssIFBBR0VfU0laRSldOwog
CWludCBmOwogCiAJLyoKLS0gCjIuMTQuMwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
