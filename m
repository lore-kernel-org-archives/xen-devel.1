From: julien.grall@arm.com
Subject: [PATCH 3/3] xen/arm: domain_builder: irq sanity check
	logic fix
Date: Tue, 27 Feb 2018 15:15:55 +0000
Message-ID: <20180227151555.1953-4-julien.grall@arm.com>
References: <20180227151555.1953-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=r2zm=fv=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eqh2W-0005fd-7R
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 15:19:36 +0000
In-Reply-To: <20180227151555.1953-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogU3Rld2FydCBIaWxkZWJyYW5kIDxTdGV3YXJ0LkhpbGRlYnJhbmRAZG9ybmVyd29ya3Mu
Y29tPgoKU2luY2UgY29tbWl0ICJ4ZW4vYXJtOiBkb21haW5fYnVpbGQ6IFJld29yayB0aGUgd2F5
IHRvIGFsbG9jYXRlIHRoZQpldmVudCBjaGFubmVsIGludGVycnVwdCIsIGl0IGlzIG5vdCBwb3Nz
aWJsZSBmb3IgYW4gaXJxIHRvIGJlIGJvdGggYmVsb3cgMTYKYW5kIGdyZWF0ZXIvZXF1YWwgdGhh
biAzMi4KCkFsc28gZml4IHRoZSByZWZlcmVuY2UgdG8gbGludXggZG9jdW1lbnRhdGlvbiB3aGls
ZSB3ZSdyZSBhdCBpdC4KClNpZ25lZC1vZmYtYnk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2Fy
dC5oaWxkZWJyYW5kQGRvcm5lcndvcmtzLmNvbT4KU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KW1NsaWdodGx5IHJld29yayB0aGUgY29tbWl0IG1lc3Nh
Z2VdCi0tLQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgNSArKystLQogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKaW5k
ZXggZWQxYTM5M2JiNS4uMjhlZTg3NmI5MiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwpAQCAtNTAzLDkgKzUw
MywxMCBAQCBzdGF0aWMgdm9pZCBzZXRfaW50ZXJydXB0X3BwaShnaWNfaW50ZXJydXB0X3QgaW50
ZXJydXB0LCB1bnNpZ25lZCBpbnQgaXJxLAogewogICAgIF9fYmUzMiAqY2VsbHMgPSBpbnRlcnJ1
cHQ7CiAKLSAgICBCVUdfT04oaXJxIDwgMTYgJiYgaXJxID49IDMyKTsKKyAgICBCVUdfT04oaXJx
IDwgMTYpOworICAgIEJVR19PTihpcnEgPj0gMzIpOwogCi0gICAgLyogU2VlIGxpbnV4IERvY3Vt
ZW50YXRpb24vZGV2aWN0cmVlL2JpbmRpbmdzL2FybS9naWMudHh0ICovCisgICAgLyogU2VlIGxp
bnV4IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxl
ci9hcm0sZ2ljLnR4dCAqLwogICAgIGR0X3NldF9jZWxsKCZjZWxscywgMSwgMSk7IC8qIGlzIGEg
UFBJICovCiAgICAgZHRfc2V0X2NlbGwoJmNlbGxzLCAxLCBpcnEgLSAxNik7IC8qIFBQSXMgc3Rh
cnQgYXQgMTYgKi8KICAgICBkdF9zZXRfY2VsbCgmY2VsbHMsIDEsIChjcHVtYXNrIDw8IDgpIHwg
bGV2ZWwpOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
