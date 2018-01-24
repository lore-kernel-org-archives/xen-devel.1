From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH v3 8/8] ARM: make nr_irqs a constant
Date: Wed, 24 Jan 2018 18:10:58 +0000
Message-ID: <20180124181058.6157-9-andre.przywara@linaro.org>
References: <20180124181058.6157-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=5dpo=et=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1eePWm-0007gA-6P
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 18:12:04 +0000
Received: by mail-wm0-f66.google.com with SMTP id f3so10367018wmc.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2018 10:12:02 -0800 (PST)
In-Reply-To: <20180124181058.6157-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gQVJNIHRoZSBtYXhpbXVtIG51bWJlciBvZiBJUlFzIGlzIGEgY29uc3RhbnQsIGJ1dCB3ZSBz
aGFyZSBpdCBiZWluZwphIHZhcmlhYmxlIHRvIG1hdGNoIHg4Ni4gU2luY2Ugd2UgYXJlIG5vdCBz
dXBwb3NlZCB0byBhbHRlciBpdCwgbGV0J3MKbWFyayBpdCBhcyAiY29uc3QiIHRvIGF2b2lkIGFj
Y2lkZW50YWwgY2hhbmdlLgoKU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdh
cmFAbGluYXJvLm9yZz4KLS0tCiB4ZW4vYXJjaC9hcm0vaXJxLmMgICAgICAgIHwgMiArLQogeGVu
L2luY2x1ZGUvYXNtLWFybS9pcnEuaCB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pcnEuYyBi
L3hlbi9hcmNoL2FybS9pcnEuYwppbmRleCA2MjEwM2EyMGUzLi5kMjI5Y2I2ODcxIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC9hcm0vaXJxLmMKKysrIGIveGVuL2FyY2gvYXJtL2lycS5jCkBAIC0yNyw3
ICsyNyw3IEBACiAjaW5jbHVkZSA8YXNtL2dpYy5oPgogI2luY2x1ZGUgPGFzbS92Z2ljLmg+CiAK
LXVuc2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IG5yX2lycXMgPSBOUl9JUlFTOworY29uc3QgdW5z
aWduZWQgaW50IF9fcmVhZF9tb3N0bHkgbnJfaXJxcyA9IE5SX0lSUVM7CiAKIHN0YXRpYyB1bnNp
Z25lZCBpbnQgbG9jYWxfaXJxc190eXBlW05SX0xPQ0FMX0lSUVNdOwogc3RhdGljIERFRklORV9T
UElOTE9DSyhsb2NhbF9pcnFzX3R5cGVfbG9jayk7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20tYXJtL2lycS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9pcnEuaAppbmRleCAwZDExMGVjYjA4
Li45ZDU1ZTliMTIyIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2lycS5oCisrKyBi
L3hlbi9pbmNsdWRlL2FzbS1hcm0vaXJxLmgKQEAgLTM0LDcgKzM0LDcgQEAgc3RydWN0IGFyY2hf
aXJxX2Rlc2MgewogLyogVGhpcyBpcyBhIHNwdXJpb3VzIGludGVycnVwdCBJRCB3aGljaCBuZXZl
ciBtYWtlcyBpdCBpbnRvIHRoZSBHSUMgY29kZS4gKi8KICNkZWZpbmUgSU5WQUxJRF9JUlEgICAg
IDEwMjMKIAotZXh0ZXJuIHVuc2lnbmVkIGludCBucl9pcnFzOworZXh0ZXJuIGNvbnN0IHVuc2ln
bmVkIGludCBucl9pcnFzOwogI2RlZmluZSBucl9zdGF0aWNfaXJxcyBOUl9JUlFTCiAjZGVmaW5l
IGFyY2hfaHdkb21faXJxcyhkb21pZCkgTlJfSVJRUwogCi0tIAoyLjE0LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
