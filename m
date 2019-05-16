From: Viktor Mitin <viktor.mitin.19@gmail.com>
Subject: [PATCH] coverage: GCC coverage libfdt Makefile fix
Date: Thu, 16 May 2019 14:13:54 +0300
Message-ID: <20190516111354.15195-1-viktor.mitin.19@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BGuO=TQ=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hRELE-0000Fq-NG
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:14:28 +0000
Received: by mail-lj1-x242.google.com with SMTP id w1so2761504ljw.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 04:14:27 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHBhdGNoIHJlc29sdmVzICd4ZW5jb3YnIGNyYXNoZXMgaW4gY2FzZSBvZiBBYXJjaDY0LgoK
QWxsIHRoZSAuaW5pdC4qIHNlY3Rpb25zIGFyZSBzdHJpcHBlZCBhZnRlciBib290LAppdCBtZWFu
cyB0aGF0IGFueXRoaW5nIGluIC5pbml0LmRhdGEgY2Fubm90IGJlIGFjY2Vzc2VkIGFueW1vcmUu
ClRoZSBidWlsZCBzeXN0ZW0gZXhwbGljaXRseSBjb21waWxlcyBhbnkgLmluaXQgYmluYXJ5IHdp
dGhvdXQgZ2NvdiBvcHRpb24uClRoZSBwcm9ibGVtIGlzIGNvbWluZyBmcm9tIGxpYmZkdC4KVGhl
IGVudGlyZSBsaWJyYXJ5IGlzIG1vdmVkIHRvIC5pbml0IHVzaW5nOgokKE9CSkNPUFkpICQoZm9y
ZWFjaCBzLCQoU0VDVElPTlMpLC0tcmVuYW1lLXNlY3Rpb24gLiQocyk9LmluaXQuJChzKSkgJDwg
JEAKU28gd2UgbmVlZCB0byB0ZWxsIHRoZSB0b3AgTWFrZWZpbGUgdG8gZmlsdGVyIG91dCBsaWJm
ZHQuCgpSZXBvcnRlZC1ieTogVmlrdG9yIE1pdGluIDx2aWt0b3IubWl0aW4uMTlAZ21haWwuY29t
PgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpUZXN0
ZWQtYnk6IFZpa3RvciBNaXRpbiA8dmlrdG9yLm1pdGluLjE5QGdtYWlsLmNvbT4KLS0tCiB4ZW4v
Y29tbW9uL2xpYmZkdC9NYWtlZmlsZSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUgYi94ZW4vY29tbW9u
L2xpYmZkdC9NYWtlZmlsZQppbmRleCBkODFmNTRiNmI4Li5jMDc1YmJmNTQ2IDEwMDY0NAotLS0g
YS94ZW4vY29tbW9uL2xpYmZkdC9NYWtlZmlsZQorKysgYi94ZW4vY29tbW9uL2xpYmZkdC9NYWtl
ZmlsZQpAQCAtMyw2ICszLDcgQEAgaW5jbHVkZSBNYWtlZmlsZS5saWJmZHQKIFNFQ1RJT05TIDo9
IHRleHQgZGF0YSAkKFNQRUNJQUxfREFUQV9TRUNUSU9OUykKIAogb2JqLXkgKz0gbGliZmR0Lm8K
K25vY292LXkgKz0gbGliZmR0Lm8KIAogQ0ZMQUdTICs9IC1JJChCQVNFRElSKS9pbmNsdWRlL3hl
bi9saWJmZHQvCiAKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
