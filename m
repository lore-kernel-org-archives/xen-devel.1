From: Joe Jin <joe.jin@oracle.com>
Subject: [PATCH] xenbaked.c: Avoid divide by zero issue on
	dump_stats()
Date: Tue, 13 Mar 2018 18:38:24 -0700
Message-ID: <560fcc42-d01f-f60d-0c9f-4373d4e8e8f4@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ofxj=ge=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1evvR1-0007dA-7B
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 01:42:31 +0000
Content-Language: en-MW
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Wei Liu <wei.liu2@citrix.com>, Ian Campbell <ian.campbell@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Philip Lee <philip.lee@oracle.com>
List-Id: xen-devel@lists.xenproject.org

cnVuX3RpbWUgb24gZHVtcF9zdGF0cygpIG1heWJlIHplcm8gaWYgYnJlYWsgeGVubW9uLnB5IGlt
bWVkaWF0ZWx5IGFmdGVyIGl0CnN0YXJ0ZWQsIHRoZW4geGVuYmFrZWQgaGl0IGRpdmlkZSBieSB6
ZXJvIGZhdWx0LgoKU2lnbmVkLW9mZi1ieTogSm9lIEppbiA8am9lLmppbkBvcmFjbGUuY29tPgpT
aWduZWQtb2ZmLWJ5OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5j
b20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpDYzogSWFuIENhbXBiZWxsIDxp
YW4uY2FtcGJlbGxAY2l0cml4LmNvbT4KLS0tCiB0b29scy94ZW5tb24veGVuYmFrZWQuYyB8IDgg
KysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvdG9vbHMveGVubW9uL3hlbmJha2VkLmMgYi90b29scy94ZW5tb24veGVu
YmFrZWQuYwppbmRleCAzZDllMGVkOTAwLi5kM2Y5NDBhMjZiIDEwMDY0NAotLS0gYS90b29scy94
ZW5tb24veGVuYmFrZWQuYworKysgYi90b29scy94ZW5tb24veGVuYmFrZWQuYwpAQCAtMjQzLDEw
ICsyNDMsMTIgQEAgc3RhdGljIHZvaWQgZHVtcF9zdGF0cyh2b2lkKQogICAgIH0KIAogICAgIHBy
aW50ZigicHJvY2Vzc2VkICVkIHRvdGFsIHJlY29yZHMgaW4gJWQgc2Vjb25kcyAoJWxkIHBlciBz
ZWNvbmQpXG4iLAotICAgICAgICAgICByZWNfY291bnQsIChpbnQpcnVuX3RpbWUsIChsb25nKShy
ZWNfY291bnQvcnVuX3RpbWUpKTsKKyAgICAgICAgICAgcmVjX2NvdW50LCAoaW50KXJ1bl90aW1l
LAorICAgICAgICAgICBydW5fdGltZSA/IChsb25nKShyZWNfY291bnQvcnVuX3RpbWUpIDogMEwp
OwogCi0gICAgcHJpbnRmKCJ3b2tlIHVwICVkIHRpbWVzIGluICVkIHNlY29uZHMgKCVsZCBwZXIg
c2Vjb25kKVxuIiwgd2FrZXVwcywKLQkgICAoaW50KSBydW5fdGltZSwgKGxvbmcpKHdha2V1cHMv
cnVuX3RpbWUpKTsKKyAgICBwcmludGYoIndva2UgdXAgJWQgdGltZXMgaW4gJWQgc2Vjb25kcyAo
JWxkIHBlciBzZWNvbmQpXG4iLAorICAgICAgICAgICB3YWtldXBzLCAoaW50KSBydW5fdGltZSwK
KyAgICAgICAgICAgcnVuX3RpbWUgPyAobG9uZykod2FrZXVwcy9ydW5fdGltZSkgOiAwTCk7CiAK
ICAgICBjaGVja19nb3R0ZW5fc3VtKCk7CiB9Ci0tIAoyLjE0LjMgKEFwcGxlIEdpdC05OCkKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
