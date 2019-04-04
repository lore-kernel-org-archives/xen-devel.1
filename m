From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: [PATCH] ALSA: xen-front: Do not use stream buffer size
 before it is set
Date: Thu,  4 Apr 2019 15:38:38 +0300
Message-ID: <20190404123838.22162-1-andr2000__17702.904755582$1554381585$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o7bd=SG=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hC1do-0008Tb-Pu
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 12:38:48 +0000
Received: by mail-lf1-x144.google.com with SMTP id y18so1708374lfe.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2019 05:38:47 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, jgross@suse.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, perex@perex.cz, tiwai@suse.com
Cc: andr2000@gmail.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgoKVGhpcyBmaXhlcyB0aGUgcmVncmVzc2lvbiBpbnRyb2R1Y2VkIHdoaWxlIG1vdmlu
ZyB0byBYZW4gc2hhcmVkCmJ1ZmZlciBpbXBsZW1lbnRhdGlvbi4KCkZpeGVzOiA1OGY5ZDgwNmQx
NmEgKCJBTFNBOiB4ZW4tZnJvbnQ6IFVzZSBYZW4gY29tbW9uIHNoYXJlZCBidWZmZXIgaW1wbGVt
ZW50YXRpb24iKQoKU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtz
YW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgotLS0KIHNvdW5kL3hlbi94ZW5fc25kX2Zyb250
X2Fsc2EuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3hlbi94ZW5fc25kX2Zyb250X2Fsc2EuYyBiL3NvdW5k
L3hlbi94ZW5fc25kX2Zyb250X2Fsc2EuYwppbmRleCBhN2Y0MTNjYjcwNGQuLmIxNGFiNTEyYzJj
ZSAxMDA2NDQKLS0tIGEvc291bmQveGVuL3hlbl9zbmRfZnJvbnRfYWxzYS5jCisrKyBiL3NvdW5k
L3hlbi94ZW5fc25kX2Zyb250X2Fsc2EuYwpAQCAtNDQxLDcgKzQ0MSw3IEBAIHN0YXRpYyBpbnQg
c2hidWZfc2V0dXBfYmFja3N0b3JlKHN0cnVjdCB4ZW5fc25kX2Zyb250X3BjbV9zdHJlYW1faW5m
byAqc3RyZWFtLAogewogCWludCBpOwogCi0Jc3RyZWFtLT5idWZmZXIgPSBhbGxvY19wYWdlc19l
eGFjdChzdHJlYW0tPmJ1ZmZlcl9zeiwgR0ZQX0tFUk5FTCk7CisJc3RyZWFtLT5idWZmZXIgPSBh
bGxvY19wYWdlc19leGFjdChidWZmZXJfc3osIEdGUF9LRVJORUwpOwogCWlmICghc3RyZWFtLT5i
dWZmZXIpCiAJCXJldHVybiAtRU5PTUVNOwogCi0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
