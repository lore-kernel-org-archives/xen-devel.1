From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 49/55] x86/smpboot: remove lXe_to_lYe in
 cleanup_cpu_root_pgt
Date: Thu, 7 Feb 2019 16:44:50 +0000
Message-ID: <20190207164456.9260-50-wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sBy9=QO=citrix.com=prvs=93456468f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1grn1r-0001b4-T0
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 16:59:59 +0000
In-Reply-To: <20190207164456.9260-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvc21wYm9vdC5jIHwgMTIgKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXBi
b290LmMgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCmluZGV4IDMyZGNlMDBkMTAuLjNhYzE5MjQz
OTEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKKysrIGIveGVuL2FyY2gveDg2
L3NtcGJvb3QuYwpAQCAtOTUxLDExICs5NTEsMTcgQEAgc3RhdGljIHZvaWQgY2xlYW51cF9jcHVf
cm9vdF9wZ3QodW5zaWduZWQgaW50IGNwdSkKICAgICAvKiBBbHNvIHphcCB0aGUgc3R1YiBtYXBw
aW5nIGZvciB0aGlzIENQVS4gKi8KICAgICBpZiAoIHN0dWJfbGluZWFyICkKICAgICB7Ci0gICAg
ICAgIGwzX3BnZW50cnlfdCAqbDN0ID0gbDRlX3RvX2wzZShjb21tb25fcGd0KTsKLSAgICAgICAg
bDJfcGdlbnRyeV90ICpsMnQgPSBsM2VfdG9fbDJlKGwzdFtsM190YWJsZV9vZmZzZXQoc3R1Yl9s
aW5lYXIpXSk7Ci0gICAgICAgIGwxX3BnZW50cnlfdCAqbDF0ID0gbDJlX3RvX2wxZShsMnRbbDJf
dGFibGVfb2Zmc2V0KHN0dWJfbGluZWFyKV0pOworICAgICAgICBsM19wZ2VudHJ5X3QgKmwzdCA9
IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhsNGVfZ2V0X21mbihjb21tb25fcGd0KSk7CisgICAgICAg
IGwyX3BnZW50cnlfdCAqbDJ0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KAorICAgICAgICAgICAg
bDNlX2dldF9tZm4obDN0W2wzX3RhYmxlX29mZnNldChzdHViX2xpbmVhcildKSk7CisgICAgICAg
IGwxX3BnZW50cnlfdCAqbDF0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KAorICAgICAgICAgICAg
bDJlX2dldF9tZm4obDJ0W2wyX3RhYmxlX29mZnNldChzdHViX2xpbmVhcildKSk7CiAKICAgICAg
ICAgbDF0W2wxX3RhYmxlX29mZnNldChzdHViX2xpbmVhcildID0gbDFlX2VtcHR5KCk7CisKKyAg
ICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDF0KTsKKyAgICAgICAgVU5NQVBfWEVOX1BB
R0VUQUJMRV9ORVcobDJ0KTsKKyAgICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDN0KTsK
ICAgICB9CiB9CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
