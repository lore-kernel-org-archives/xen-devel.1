From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] xen_pt: Present the size of 64 bit BARs
 correctly
Date: Mon, 14 May 2018 10:57:46 +0100
Message-ID: <20180514095746.5058-1-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=og53=ib=citrix.com=prvs=665482757=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1fIAF0-000806-9h
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 09:58:02 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Ross Lagerwall <ross.lagerwall@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGZ1bGwgc2l6ZSBvZiB0aGUgQkFSIGlzIHN0b3JlZCBpbiB0aGUgbG93ZXIgUENJSU9SZWdp
b24uc2l6ZS4gVGhlCnVwcGVyIFBDSUlPUmVnaW9uLnNpemUgaXMgMC4gIENhbGN1bGF0ZSB0aGUg
c2l6ZSBvZiB0aGUgdXBwZXIgaGFsZgpjb3JyZWN0bHkgZnJvbSB0aGUgbG93ZXIgaGFsZiBvdGhl
cndpc2UgdGhlIHNpemUgcmVhZCBieSB0aGUgZ3Vlc3Qgd2lsbApiZSBpbmNvcnJlY3QuCgpTaWdu
ZWQtb2ZmLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KLS0t
CiBody94ZW4veGVuX3B0X2NvbmZpZ19pbml0LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaHcveGVuL3hlbl9wdF9jb25maWdfaW5pdC5jIGIv
aHcveGVuL3hlbl9wdF9jb25maWdfaW5pdC5jCmluZGV4IGEzY2UzM2UuLmFlZTMxYzYgMTAwNjQ0
Ci0tLSBhL2h3L3hlbi94ZW5fcHRfY29uZmlnX2luaXQuYworKysgYi9ody94ZW4veGVuX3B0X2Nv
bmZpZ19pbml0LmMKQEAgLTUwNCw2ICs1MDQsOCBAQCBzdGF0aWMgaW50IHhlbl9wdF9iYXJfcmVn
X3dyaXRlKFhlblBDSVBhc3N0aHJvdWdoU3RhdGUgKnMsIFhlblBUUmVnICpjZmdfZW50cnksCiAg
ICAgICAgIGJhcl9yb19tYXNrID0gWEVOX1BUX0JBUl9JT19ST19NQVNLIHwgKHJfc2l6ZSAtIDEp
OwogICAgICAgICBicmVhazsKICAgICBjYXNlIFhFTl9QVF9CQVJfRkxBR19VUFBFUjoKKyAgICAg
ICAgYXNzZXJ0KGluZGV4ID4gMCk7CisgICAgICAgIHJfc2l6ZSA9IGQtPmlvX3JlZ2lvbnNbaW5k
ZXggLSAxXS5zaXplID4+IDMyOwogICAgICAgICBiYXJfZW11X21hc2sgPSBYRU5fUFRfQkFSX0FM
TEY7CiAgICAgICAgIGJhcl9yb19tYXNrID0gcl9zaXplID8gcl9zaXplIC0gMSA6IDA7CiAgICAg
ICAgIGJyZWFrOwotLSAKMi45LjUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
