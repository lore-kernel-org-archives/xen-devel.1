From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH] gic: drop interrupts enabling on interrupts
 processing
Date: Fri, 21 Dec 2018 19:41:29 +0200
Message-ID: <1545414089-12024-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/5Gq=O6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gaOnn-00085t-AL
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 17:41:35 +0000
Received: by mail-lj1-x243.google.com with SMTP id t18-v6so5443015ljd.4
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 09:41:33 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRoaXMgcmVkdWNl
cyB0aGUgbnVtYmVyIG9mIGNvbnRleHQgc3dpdGNoZXMgaW4gY2FzZSB3ZSBoYXZlIGNvbWluZyBn
dWVzdAppbnRlcnJ1cHRzIGZyb20gZGlmZmVyZW50IHNvdXJjZXMgYXQgYSBoaWdoIHJhdGUuIFdo
YXQgaXMgbGlrZWx5IGZvcgptdWx0aW1lZGlhIHVzZS1jYXNlcy4KSGF2aW5nIGlycXMgdW5sb2Nr
ZWQgaGVyZSBtYWtlcyB1cyBnbyB0aHJvdWdoIHRyYXAgcGF0aCBhZ2FpbiBpbiBjYXNlIHdlCmhh
dmUgYSBuZXcgZ3Vlc3QgaW50ZXJydXB0IGFycml2ZWQgKGV2ZW4gd2l0aCB0aGUgc2FtZSBwcmlv
cml0eSwgYWZ0ZXIKYGRlc2MtPmhhbmRsZXItPmVuZChkZXNjKWAgaW4gYGRvX0lSUSgpYCksIHdo
YXQgaXMganVzdCBhIHByb2Nlc3NvcgpjeWNsZXMgd2FzdGluZy4gV2Ugd2lsbCBjYXRjaCB0aGVt
IGFsbCBpbiB0aGUgYGdpY19pbnRlcnJ1cHQoKSBmdW5jdGlvbgpsb29wIGFueXdheS4gQW5kIHRo
ZSBndWVzdCBpcnFzIGFycml2YWwgcHJpb3JpdGl6YXRpb24gaXMgbWVhbmluZ2xlc3MKaGVyZSwg
aXQgaXMgb25seSBlZmZlY3RpdmUgYXQgZ3Vlc3QncyBsZXZlbC4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLS0KClRoaXMgaXMgdGhlIHBh
dGNoIFsxXSBmcm9tIFJGQyBzZXJpZXMsIHdpdGggZXh0ZW5kZWQgY29tbWl0IG1lc3NhZ2UuCgpb
MV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8y
MDE4LTExL21zZzAzMjg2Lmh0bWwKCi0tLQogeGVuL2FyY2gvYXJtL2dpYy5jIHwgMiAtLQogMSBm
aWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dp
Yy5jIGIveGVuL2FyY2gvYXJtL2dpYy5jCmluZGV4IDZjYzdkZWMuLjlmNWNkOTUgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL2FybS9naWMuYworKysgYi94ZW4vYXJjaC9hcm0vZ2ljLmMKQEAgLTM4Niwx
MCArMzg2LDggQEAgdm9pZCBnaWNfaW50ZXJydXB0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdz
LCBpbnQgaXNfZmlxKQogCiAgICAgICAgIGlmICggbGlrZWx5KGlycSA+PSAxNiAmJiBpcnEgPCAx
MDIwKSApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGxvY2FsX2lycV9lbmFibGUoKTsKICAgICAg
ICAgICAgIGlzYigpOwogICAgICAgICAgICAgZG9fSVJRKHJlZ3MsIGlycSwgaXNfZmlxKTsKLSAg
ICAgICAgICAgIGxvY2FsX2lycV9kaXNhYmxlKCk7CiAgICAgICAgIH0KICAgICAgICAgZWxzZSBp
ZiAoIGlzX2xwaShpcnEpICkKICAgICAgICAgewotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
