From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH 2/2] arm/irq: Fix block parathenses and
 whitespaces
Date: Fri, 16 Nov 2018 18:24:18 +0200
Message-ID: <1542385458-22466-3-git-send-email-andrii.anisov@gmail.com>
References: <1542385458-22466-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oba2=n3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gNguv-0006Zg-VQ
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 16:24:25 +0000
Received: by mail-ed1-x544.google.com with SMTP id h15so15348612edb.4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Nov 2018 08:24:25 -0800 (PST)
In-Reply-To: <1542385458-22466-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Ci0tLQogeGVuL2FyY2gv
YXJtL2lycS5jIHwgMTIgKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pcnEuYyBiL3hl
bi9hcmNoL2FybS9pcnEuYwppbmRleCBkNWFkMjc3Li5kNmEwMjczIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC9hcm0vaXJxLmMKKysrIGIveGVuL2FyY2gvYXJtL2lycS5jCkBAIC02MSw3ICs2MSw5IEBA
IHN0YXRpYyBERUZJTkVfUEVSX0NQVShpcnFfZGVzY190W05SX0xPQ0FMX0lSUVNdLCBsb2NhbF9p
cnFfZGVzYyk7CiAKIGlycV9kZXNjX3QgKl9faXJxX3RvX2Rlc2MoaW50IGlycSkKIHsKLSAgICBp
ZiAoaXJxIDwgTlJfTE9DQUxfSVJRUykgcmV0dXJuICZ0aGlzX2NwdShsb2NhbF9pcnFfZGVzYylb
aXJxXTsKKyAgICBpZiAoIGlycSA8IE5SX0xPQ0FMX0lSUVMgKQorICAgICAgICByZXR1cm4gJnRo
aXNfY3B1KGxvY2FsX2lycV9kZXNjKVtpcnFdOworCiAgICAgcmV0dXJuICZpcnFfZGVzY1tpcnEt
TlJfTE9DQUxfSVJRU107CiB9CiAKQEAgLTc2LDcgKzc4LDggQEAgc3RhdGljIGludCBfX2luaXQg
aW5pdF9pcnFfZGF0YSh2b2lkKQogewogICAgIGludCBpcnE7CiAKLSAgICBmb3IgKGlycSA9IE5S
X0xPQ0FMX0lSUVM7IGlycSA8IE5SX0lSUVM7IGlycSsrKSB7CisgICAgZm9yICggaXJxID0gTlJf
TE9DQUxfSVJRUzsgaXJxIDwgTlJfSVJRUzsgaXJxKysgKQorICAgIHsKICAgICAgICAgc3RydWN0
IGlycV9kZXNjICpkZXNjID0gaXJxX3RvX2Rlc2MoaXJxKTsKICAgICAgICAgaW5pdF9vbmVfaXJx
X2Rlc2MoZGVzYyk7CiAgICAgICAgIGRlc2MtPmlycSA9IGlycTsKQEAgLTkyLDcgKzk1LDggQEAg
c3RhdGljIGludCBpbml0X2xvY2FsX2lycV9kYXRhKHZvaWQpCiAKICAgICBzcGluX2xvY2soJmxv
Y2FsX2lycXNfdHlwZV9sb2NrKTsKIAotICAgIGZvciAoaXJxID0gMDsgaXJxIDwgTlJfTE9DQUxf
SVJRUzsgaXJxKyspIHsKKyAgICBmb3IgKCBpcnEgPSAwOyBpcnEgPCBOUl9MT0NBTF9JUlFTOyBp
cnErKyApCisgICAgewogICAgICAgICBzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MgPSBpcnFfdG9fZGVz
YyhpcnEpOwogICAgICAgICBpbml0X29uZV9pcnFfZGVzYyhkZXNjKTsKICAgICAgICAgZGVzYy0+
aXJxID0gaXJxOwpAQCAtMTkzLDcgKzE5Nyw3IEBAIHZvaWQgZG9fSVJRKHN0cnVjdCBjcHVfdXNl
cl9yZWdzICpyZWdzLCB1bnNpZ25lZCBpbnQgaXJxLCBpbnQgaXNfZmlxKQogCiAgICAgQVNTRVJU
KGlycSA+PSAxNik7IC8qIFNHSXMgZG8gbm90IGNvbWUgZG93biB0aGlzIHBhdGggKi8KIAotICAg
IGlmIChpcnEgPCAzMikKKyAgICBpZiAoIGlycSA8IDMyICkKICAgICAgICAgcGVyZmNfaW5jcihw
cGlzKTsKICAgICBlbHNlCiAgICAgICAgIHBlcmZjX2luY3Ioc3Bpcyk7Ci0tIAoyLjcuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
