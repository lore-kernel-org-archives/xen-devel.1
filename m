From: Oleksandr Grytsov <al1img@gmail.com>
Subject: [PATCH] libxl: add libxl__is_driver_domain function
Date: Thu, 14 Dec 2017 16:14:12 +0200
Message-ID: <1513260853-3450-1-git-send-email-al1img@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zgzy=dk=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1ePUHG-0004j2-FM
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2017 14:14:22 +0000
Received: by mail-lf0-x232.google.com with SMTP id y78so1175013lfd.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2017 06:14:20 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: ian.jackson@eu.citrix.com, wei.liu2@citrix.com, Oleksandr Grytsov <oleksandr_grytsov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgoKV2Ug
aGF2ZSBmb2xsb3dpbmcgYXJtLWJhc2VkIHNldHVwOgoKLSBEb20wIHdpdGggeGVuIGFuZCB4ZW4g
dG9vbHM7Ci0gRG9tMSB3aXRoIGRldmljZSBiYWNrZW5kcyAoYnV0IGl0IGlzIG5vdCB0aGUgZHJp
dmVyIGRvbWFpbik7Ci0gRG9tMiB3aXRoIGRldmljZSBmcm9udGVuZDsKCk9uIERvbTIgZGVzdHJv
eWluZyB3ZSBoYXZlIHRpbWVvdXQgZXJyb3IuIEJlY2F1c2UgeGwgdHJlYXRzIG91cgpEb20xIGFz
IGRyaXZlciBkb21haW4gYW5kIHdhaXRzIGZvciBiYWNrZW5kIHBhdGggdG8gYmUgY2xlYXJlZApi
eSB0aGUgZHJpdmVyIGRvbWFpbiB3aGljaCBpcyBub3Qgb3VyIGNhc2UuCgpBY2NvcmRpbmcgdG8g
bGlieGxfX2RvbWFpbl9tYWtlIGluIGNhc2Ugb2YgZHJpdmVyIGRvbWFpbiBpdCBoYXMKImxpYnhs
IiB4ZW4gc3RvcmUgZW50cnk6CgogICAgaWYgKGxpYnhsX2RlZmJvb2xfdmFsKGluZm8tPmRyaXZl
cl9kb21haW4pKSB7CiAgICAgICAgLyoKICAgICAgICAgKiBDcmVhdGUgYSBsb2NhbCAibGlieGwi
IGRpcmVjdG9yeSBmb3IgZWFjaCBndWVzdCwgc2luY2Ugd2UgbWlnaHQgd2FudAogICAgICAgICAq
IHRvIHVzZSBsaWJ4bCBmcm9tIGluc2lkZSB0aGUgZ3Vlc3QKICAgICAgICAgKi8KICAgICAgICBs
aWJ4bF9feHNfbWtub2QoZ2MsIHQsIEdDU1BSSU5URigiJXMvbGlieGwiLCBkb21fcGF0aCksIHJ3
cGVybSwKICAgICAgICAgICAgICAgICAgICAgICAgQVJSQVlfU0laRShyd3Blcm0pKTsKClRoaXMg
cGF0Y2ggaW50cm9kdWNlcyBsaWJ4bF9faXNfZHJpdmVyX2RvbWFpbiB3aGljaCBkZXRlcm1pbmVz
IHRoZSBkcml2ZXIKZG9tYWluIGJ5IGNoZWNraW5nIGlmICJsaWJ4bCIgZW50cnkgaXMgcHJlc2Vu
dCBhbmQgdXNlcyB0aGlzIGZ1bmN0aW9uIG9uCmRldmljZSBkZXN0cm95IHRvIGNoZWNrIGJ5IHdo
b20gZG9tYWluIHBhdGggc2hvdWxkIGJlIGNsZWFuZWQgdXAgKGxpYnhsCm9yIHRoZSBkcml2ZXIg
ZG9tYWluKS4KCk9sZWtzYW5kciBHcnl0c292ICgxKToKICBsaWJ4bDogYWRkIGxpYnhsX19pc19k
cml2ZXJfZG9tYWluIGZ1bmN0aW9uCgogdG9vbHMvbGlieGwvbGlieGxfZGV2aWNlLmMgICB8IDE3
ICsrKysrKysrKystLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5jIHwgMTYgKysr
KysrKysrKysrKysrKwogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8ICA0ICsrKysKIDMg
ZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCi0tIAoyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
