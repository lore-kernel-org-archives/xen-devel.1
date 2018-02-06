From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH v5 8/8] ARM: make nr_irqs a constant
Date: Tue,  6 Feb 2018 17:09:03 +0000
Message-ID: <20180206170903.30637-9-andre.przywara@linaro.org>
References: <20180206170903.30637-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tmtn=fa=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ej6kB-0003sk-BS
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2018 17:09:19 +0000
Received: by mail-wr0-x242.google.com with SMTP id v15so2723805wrb.8
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2018 09:09:18 -0800 (PST)
In-Reply-To: <20180206170903.30637-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gQVJNIHRoZSBtYXhpbXVtIG51bWJlciBvZiBJUlFzIGlzIGEgY29uc3RhbnQsIGJ1dCB3ZSBz
aGFyZSBpdCBiZWluZwphIHZhcmlhYmxlIHRvIG1hdGNoIHg4Ni4gU2luY2Ugd2UgYXJlIG5vdCBz
dXBwb3NlZCB0byBhbHRlciBpdCwgbGV0J3MKbWFyayBpdCBhcyAiY29uc3QiIHRvIGF2b2lkIGFj
Y2lkZW50YWwgY2hhbmdlLgoKU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFA
bGluYXJvLm9yZz4KQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
Ci0tLQogeGVuL2FyY2gvYXJtL2lycS5jICAgICAgICB8IDIgKy0KIHhlbi9pbmNsdWRlL2FzbS1h
cm0vaXJxLmggfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9hcm0v
aXJxLmMKaW5kZXggNjIxMDNhMjBlMy4uMjlhZjEwZTgyYyAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
YXJtL2lycS5jCisrKyBiL3hlbi9hcmNoL2FybS9pcnEuYwpAQCAtMjcsNyArMjcsNyBAQAogI2lu
Y2x1ZGUgPGFzbS9naWMuaD4KICNpbmNsdWRlIDxhc20vdmdpYy5oPgogCi11bnNpZ25lZCBpbnQg
X19yZWFkX21vc3RseSBucl9pcnFzID0gTlJfSVJRUzsKK2NvbnN0IHVuc2lnbmVkIGludCBucl9p
cnFzID0gTlJfSVJRUzsKIAogc3RhdGljIHVuc2lnbmVkIGludCBsb2NhbF9pcnFzX3R5cGVbTlJf
TE9DQUxfSVJRU107CiBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKGxvY2FsX2lycXNfdHlwZV9sb2Nr
KTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaXJxLmggYi94ZW4vaW5jbHVkZS9h
c20tYXJtL2lycS5oCmluZGV4IDBkMTEwZWNiMDguLjlkNTVlOWIxMjIgMTAwNjQ0Ci0tLSBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0vaXJxLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9pcnEuaApA
QCAtMzQsNyArMzQsNyBAQCBzdHJ1Y3QgYXJjaF9pcnFfZGVzYyB7CiAvKiBUaGlzIGlzIGEgc3B1
cmlvdXMgaW50ZXJydXB0IElEIHdoaWNoIG5ldmVyIG1ha2VzIGl0IGludG8gdGhlIEdJQyBjb2Rl
LiAqLwogI2RlZmluZSBJTlZBTElEX0lSUSAgICAgMTAyMwogCi1leHRlcm4gdW5zaWduZWQgaW50
IG5yX2lycXM7CitleHRlcm4gY29uc3QgdW5zaWduZWQgaW50IG5yX2lycXM7CiAjZGVmaW5lIG5y
X3N0YXRpY19pcnFzIE5SX0lSUVMKICNkZWZpbmUgYXJjaF9od2RvbV9pcnFzKGRvbWlkKSBOUl9J
UlFTCiAKLS0gCjIuMTQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
