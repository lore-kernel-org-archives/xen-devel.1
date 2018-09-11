From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH] x86/EISA: Don't probe EISA bus for Xen PV guests
Date: Tue, 11 Sep 2018 15:55:38 -0400
Message-ID: <20180911195538.23289-1-boris.ostrovsky__35491.5925804109$1536695633$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y368=lz=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fzokY-0007aP-O6
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 19:55:02 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com
Cc: jgross@suse.com, x86@kernel.org, linux-kernel@vger.kernel.org, andy@strugglers.net, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Rm9yIHVucHJpdmlsZWdlZCBYZW4gUFYgZ3Vlc3RzIHRoaXMgaXMgbm9ybWFsIG1lbW9yeSBhbmQg
aW9yZW1hcCB3aWxsCm5vdCBiZSBhYmxlIHRvIHByb3Blcmx5IG1hcCBpdC4KCldoaWxlIGF0IGl0
LCBzaW5jZSBpb3JlbWFwIG1heSByZXR1cm4gTlVMTCwgYWRkIGEgdGVzdCBmb3IgcG9pbnRlcidz
CnZhbGlkaXR5LgoKUmVwb3J0ZWQtYnk6IEFuZHkgU21pdGggPGFuZHlAc3RydWdnbGVycy5uZXQ+
ClNpZ25lZC1vZmYtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5j
b20+Ci0tLQogYXJjaC94ODYva2VybmVsL2Vpc2EuYyB8IDEwICsrKysrKysrLS0KIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva2VybmVsL2Vpc2EuYyBiL2FyY2gveDg2L2tlcm5lbC9laXNhLmMKaW5kZXggZjI2MGU0
NTJlNGY4Li5mY2YzZGUxNzEyYzggMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2tlcm5lbC9laXNhLmMK
KysrIGIvYXJjaC94ODYva2VybmVsL2Vpc2EuYwpAQCAtNywxMSArNywxNyBAQAogI2luY2x1ZGUg
PGxpbnV4L2Vpc2EuaD4KICNpbmNsdWRlIDxsaW51eC9pby5oPgogCisjaW5jbHVkZSA8eGVuL3hl
bi5oPgorCiBzdGF0aWMgX19pbml0IGludCBlaXNhX2J1c19wcm9iZSh2b2lkKQogewotCXZvaWQg
X19pb21lbSAqcCA9IGlvcmVtYXAoMHgwRkZGRDksIDQpOworCXZvaWQgX19pb21lbSAqcDsKKwor
CWlmICh4ZW5fcHZfZG9tYWluKCkgJiYgIXhlbl9pbml0aWFsX2RvbWFpbigpKQorCQlyZXR1cm4g
MDsKIAotCWlmIChyZWFkbChwKSA9PSAnRScgKyAoJ0knPDw4KSArICgnUyc8PDE2KSArICgnQSc8
PDI0KSkKKwlwID0gaW9yZW1hcCgweDBGRkZEOSwgNCk7CisJaWYgKHAgJiYgcmVhZGwocCkgPT0g
J0UnICsgKCdJJzw8OCkgKyAoJ1MnPDwxNikgKyAoJ0EnPDwyNCkpCiAJCUVJU0FfYnVzID0gMTsK
IAlpb3VubWFwKHApOwogCXJldHVybiAwOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
