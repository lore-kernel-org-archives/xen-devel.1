From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 23/55] x86_64/mm: drop l4e_to_l3e invocation
 from paging_init
Date: Thu, 7 Feb 2019 16:44:24 +0000
Message-ID: <20190207164456.9260-24-wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sBy9=QO=citrix.com=prvs=93456468f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1grn1j-0001O3-0a
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 16:59:51 +0000
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
aC94ODYveDg2XzY0L21tLmMgfCA3ICsrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9t
bS5jIGIveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCmluZGV4IDAyOTE5NDgxZTQuLjA5NGM2MDlj
OGMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYworKysgYi94ZW4vYXJjaC94
ODYveDg2XzY0L21tLmMKQEAgLTY0OCw4ICs2NDgsMTAgQEAgdm9pZCBfX2luaXQgcGFnaW5nX2lu
aXQodm9pZCkKICAgICAvKiBDcmVhdGUgdXNlci1hY2Nlc3NpYmxlIEwyIGRpcmVjdG9yeSB0byBt
YXAgdGhlIE1QVCBmb3IgY29tcGF0IGd1ZXN0cy4gKi8KICAgICBCVUlMRF9CVUdfT04obDRfdGFi
bGVfb2Zmc2V0KFJEV1JfTVBUX1ZJUlRfU1RBUlQpICE9CiAgICAgICAgICAgICAgICAgIGw0X3Rh
YmxlX29mZnNldChISVJPX0NPTVBBVF9NUFRfVklSVF9TVEFSVCkpOwotICAgIGwzX3JvX21wdCA9
IGw0ZV90b19sM2UoaWRsZV9wZ190YWJsZVtsNF90YWJsZV9vZmZzZXQoCi0gICAgICAgIEhJUk9f
Q09NUEFUX01QVF9WSVJUX1NUQVJUKV0pOworCisgICAgbDNfcm9fbXB0X21mbiA9IGw0ZV9nZXRf
bWZuKGlkbGVfcGdfdGFibGVbbDRfdGFibGVfb2Zmc2V0KAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIEhJUk9fQ09NUEFUX01QVF9WSVJUX1NUQVJUKV0pOworICAgIGwz
X3JvX21wdCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhsM19yb19tcHRfbWZuKTsKIAogICAgIGwy
X3JvX21wdF9tZm4gPSBhbGxvY194ZW5fcGFnZXRhYmxlX25ldygpOwogICAgIGlmICggbWZuX2Vx
KGwyX3JvX21wdF9tZm4sIElOVkFMSURfTUZOKSApCkBAIC03MDEsNiArNzAzLDcgQEAgdm9pZCBf
X2luaXQgcGFnaW5nX2luaXQodm9pZCkKICN1bmRlZiBNRk4KIAogICAgIFVOTUFQX1hFTl9QQUdF
VEFCTEVfTkVXKGwyX3JvX21wdCk7CisgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDNfcm9f
bXB0KTsKIAogICAgIG1hY2hpbmVfdG9fcGh5c19tYXBwaW5nX3ZhbGlkID0gMTsKIAotLSAKMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
