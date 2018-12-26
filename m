From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [RFC v2 04/16] gic: drop interrupts enabling on
 interrupts processing
Date: Wed, 26 Dec 2018 13:20:15 +0200
Message-ID: <1545823227-6207-5-git-send-email-andrii.anisov@gmail.com>
References: <1545823227-6207-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tRx+=PD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gc7Et-00082M-NV
 for xen-devel@lists.xenproject.org; Wed, 26 Dec 2018 11:20:39 +0000
Received: by mail-lj1-x243.google.com with SMTP id k15-v6so13630910ljc.8
 for <xen-devel@lists.xenproject.org>; Wed, 26 Dec 2018 03:20:38 -0800 (PST)
In-Reply-To: <1545823227-6207-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andre Przywara <andre.przywara@arm.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRoaXMgcmVkdWNl
cyB0aGUgbnVtYmVyIG9mIGNvbnRleHQgc3dpdGNoZXMgaW4gY2FzZSB3ZSBoYXZlIGNvbWluZyBn
dWVzdAppbnRlcnJ1cHRzIGZyb20gZGlmZmVyZW50IHNvdXJjZXMgYXQgYSBoaWdoIHJhdGUuIFdo
YXQgaXMgbGlrZWx5IGZvcgptdWx0aW1lZGlhIHVzZS1jYXNlcy4KSGF2aW5nIGlycXMgdW5sb2Nr
ZWQgaGVyZSBtYWtlcyB1cyBnbyB0aHJvdWdoIHRyYXAgcGF0aCBhZ2FpbiBpbiBjYXNlIHdlCmhh
dmUgYSBuZXcgZ3Vlc3QgaW50ZXJydXB0IGFycml2ZWQgKGV2ZW4gd2l0aCB0aGUgc2FtZSBwcmlv
cml0eSwgYWZ0ZXIKYGRlc2MtPmhhbmRsZXItPmVuZChkZXNjKWApLCB3aGF0IGlzIGp1c3QgYSBw
cm9jZXNzb3IgY3ljbGVzIHdhc3RpbmcuIFdlCndpbGwgY2F0Y2ggdGhlbSBhbGwgaW4gdGhlIGBn
aWNfaW50ZXJydXB0KCkgZnVuY3Rpb24gbG9vcCBhbnl3YXkuIEFuZAp0aGUgZ3Vlc3QgaXJxcyBh
cnJpdmFsIHByaW9yaXRpemF0aW9uIGlzIG1lYW5pbmdsZXNzIGhlcmUsIGl0IGlzIG9ubHkKZWZm
ZWN0aXZlIGF0IGd1ZXN0J3MgbGV2ZWwuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxh
bmRyaWlfYW5pc292QGVwYW0uY29tPgotLS0KClRoZSBwYXRjaCBtZXNzYWdlIGlzIGltcHJvdmVk
LgoKLS0tCiB4ZW4vYXJjaC9hcm0vZ2ljLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLmMgYi94ZW4vYXJjaC9hcm0v
Z2ljLmMKaW5kZXggZjU3NmI2Ni4uZWNhYTNkNiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2dp
Yy5jCisrKyBiL3hlbi9hcmNoL2FybS9naWMuYwpAQCAtNDA2LDEwICs0MDYsOCBAQCB2b2lkIGdp
Y19pbnRlcnJ1cHQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIGludCBpc19maXEpCiAKICAg
ICAgICAgaWYgKCBsaWtlbHkoaXJxID49IDE2ICYmIGlycSA8IDEwMjApICkKICAgICAgICAgewot
ICAgICAgICAgICAgbG9jYWxfaXJxX2VuYWJsZSgpOwogICAgICAgICAgICAgaXNiKCk7CiAgICAg
ICAgICAgICBkb19JUlEocmVncywgaXJxLCBpc19maXEpOwotICAgICAgICAgICAgbG9jYWxfaXJx
X2Rpc2FibGUoKTsKICAgICAgICAgfQogI2lmZGVmIENPTkZJR19HSUNWMwogICAgICAgICBlbHNl
IGlmICggaXNfbHBpKGlycSkgKQotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
