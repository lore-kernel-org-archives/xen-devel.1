From: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v1] fuzz: wrappers.c depends on x86_emulate.h
Date: Thu, 29 Mar 2018 14:01:30 +0200
Message-ID: <20180329120130.13630-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SW4gbXkgYXV0b21hdGVkIFNMRV8xMSBidWlsZHMgSSBvZnRlbiBzZWUgZmFpbHVyZXMgbGlrZSB0
aGF0OgoKWyAgIDc0c10gd3JhcHBlcnMuYzo1OjI1OiBlcnJvcjogeDg2LWVtdWxhdGUuaDogTm8g
c3VjaCBmaWxlIG9yIGRpcmVjdG9yeQpbICAgNzRzXSBtYWtlWzZdOiAqKiogW3dyYXBwZXJzLm9d
IEVycm9yIDEKClNpZ25lZC1vZmYtYnk6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KLS0t
CiB0b29scy9mdXp6L3g4Nl9pbnN0cnVjdGlvbl9lbXVsYXRvci9NYWtlZmlsZSB8IDIgKysKIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9mdXp6L3g4
Nl9pbnN0cnVjdGlvbl9lbXVsYXRvci9NYWtlZmlsZSBiL3Rvb2xzL2Z1enoveDg2X2luc3RydWN0
aW9uX2VtdWxhdG9yL01ha2VmaWxlCmluZGV4IGRmMDRkMDkyNTIuLjY5N2JjNWVhNjQgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL2Z1enoveDg2X2luc3RydWN0aW9uX2VtdWxhdG9yL01ha2VmaWxlCisrKyBi
L3Rvb2xzL2Z1enoveDg2X2luc3RydWN0aW9uX2VtdWxhdG9yL01ha2VmaWxlCkBAIC0xOCw2ICsx
OCw4IEBAIGFzbToKIAogYXNtLyU6IGFzbSA7CiAKK3dyYXBwZXJzLm86ICQoeDg2X2VtdWxhdGUu
aCkKKwogeDg2LWVtdWxhdGUuYyB4ODYtZW11bGF0ZS5oIHdyYXBwZXJzLmM6ICU6CiAJWyAtTCAk
KiBdIHx8IGxuIC1zZiAkKFhFTl9ST09UKS90b29scy90ZXN0cy94ODZfZW11bGF0b3IvJCoKIAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
