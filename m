From: Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2] xen/drivers/char: Don't require vpl011 for
 all non-x86 archs
Date: Mon, 20 May 2019 10:13:15 -0700
Message-ID: <20190520171315.12026-1-alistair.francis@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qpne=TU=wdc.com=prvs=036de673d=alistair.francis@srs-us1.protection.inumbo.net>)
 id 1hSlsQ-00083B-QN
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 17:15:07 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, Alistair Francis <alistair.francis@wdc.com>, jbeulich@suse.com, andrew.cooper3@citrix.com, alistair23@gmail.com
List-Id: xen-devel@lists.xenproject.org

TWFrZSB0aGUgYXNtL3ZwbDAxMS5oIGRlcGVuZGVudCBvbiB0aGUgQ09ORklHX1NCU0FfVlVBUlRf
Q09OU09MRSBkZWZpbmUuCgpTaWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFp
ci5mcmFuY2lzQHdkYy5jb20+Ci0tLQogeGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29s
ZS5jCmluZGV4IDliYmNiMGY1N2EuLjI0Mjg3ZTU5Y2IgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJz
L2NoYXIvY29uc29sZS5jCisrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCkBAIC0zNiw3
ICszNiw3IEBACiAjaWZkZWYgQ09ORklHX1g4NgogI2luY2x1ZGUgPHhlbi9jb25zb2xlZC5oPgog
I2luY2x1ZGUgPGFzbS9ndWVzdC5oPgotI2Vsc2UKKyNlbGlmIENPTkZJR19TQlNBX1ZVQVJUX0NP
TlNPTEUKICNpbmNsdWRlIDxhc20vdnBsMDExLmg+CiAjZW5kaWYKIAotLSAKMi4yMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
