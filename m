From: zhong jiang <zhongjiang@huawei.com>
Subject: [PATCH] xen: remove unnecessary condition check before
 kfree
Date: Sat, 8 Sep 2018 22:18:38 +0800
Message-ID: <1536416318-34106-1-git-send-email-zhongjiang__38453.4083576456$1536516769$gmane$org@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gf4b=lw=huawei.com=zhongjiang@srs-us1.protection.inumbo.net>)
 id 1fyeGF-0000Xx-1Z
 for xen-devel@lists.xenproject.org; Sat, 08 Sep 2018 14:30:55 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

a2ZyZWUgaGFzIHRha2VuIG51bGwgcG9pbnRlciBpbnRvIGFjY291bnQuIFNvIGp1c3QgcmVtb3Zl
IHRoZQpjb25kaXRpb24gY2hlY2sgYmVmb3JlIGtmcmVlLgoKU2lnbmVkLW9mZi1ieTogemhvbmcg
amlhbmcgPHpob25namlhbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi94ZW4tYWNwaS1w
cm9jZXNzb3IuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbi1hY3BpLXByb2Nlc3Nvci5jIGIv
ZHJpdmVycy94ZW4veGVuLWFjcGktcHJvY2Vzc29yLmMKaW5kZXggZmJiOTEzNy4uN2UxZDQ5ZSAx
MDA2NDQKLS0tIGEvZHJpdmVycy94ZW4veGVuLWFjcGktcHJvY2Vzc29yLmMKKysrIGIvZHJpdmVy
cy94ZW4veGVuLWFjcGktcHJvY2Vzc29yLmMKQEAgLTI2OCw3ICsyNjgsNyBAQCBzdGF0aWMgaW50
IHB1c2hfcHh4X3RvX2h5cGVydmlzb3Ioc3RydWN0IGFjcGlfcHJvY2Vzc29yICpfcHIpCiAJCXBy
X3dhcm4oIihfUFhYKTogSHlwZXJ2aXNvciBlcnJvciAoJWQpIGZvciBBQ1BJIENQVSV1XG4iLAog
CQkJcmV0LCBfcHItPmFjcGlfaWQpOwogZXJyX2ZyZWU6Ci0JaWYgKCFJU19FUlJfT1JfTlVMTChk
c3Rfc3RhdGVzKSkKKwlpZiAoIUlTX0VSUihkc3Rfc3RhdGVzKSkKIAkJa2ZyZWUoZHN0X3N0YXRl
cyk7CiAKIAlyZXR1cm4gcmV0OwotLSAKMS43LjEyLjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
