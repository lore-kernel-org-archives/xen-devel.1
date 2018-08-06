From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] tools/kdd: work around gcc 8.1 bug
Date: Mon, 6 Aug 2018 11:35:18 +0100
Message-ID: <545884d1ccc4854c0a59fff99283becc1842a5bc.1533551059.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jffb=kv=citrix.com=prvs=749655d01=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fmcrD-0004Ze-70
 for xen-devel@lists.xenproject.org; Mon, 06 Aug 2018 10:35:23 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2NjIDguMSBoYXMgYSBidWcgdGhhdCBjYXVzZXMga2RkIGZhaWwgdG8gYnVpbGQuIFJld3JpdGUg
dGhlIGNvZGUgdG8Kd29yayBhcm91bmQgdGhhdCBidWcuCgpodHRwczovL2djYy5nbnUub3JnL2J1
Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD04NjgyNwoKU2lnbmVkLW9mZi1ieTogVGltIERlZWdhbiA8
dGltQHhlbi5vcmc+ClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
ClRlc3RlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy9kZWJ1
Z2dlci9rZGQva2RkLmMgfCAgOSArKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZGVidWdnZXIva2RkL2tk
ZC5jIGIvdG9vbHMvZGVidWdnZXIva2RkL2tkZC5jCmluZGV4IDVhMDE5YTAuLmZiOGM2NDUgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL2RlYnVnZ2VyL2tkZC9rZGQuYworKysgYi90b29scy9kZWJ1Z2dlci9r
ZGQva2RkLmMKQEAgLTY4NywxMSArNjg3LDEwIEBAIHN0YXRpYyB2b2lkIGtkZF9oYW5kbGVfcmVh
ZF9jdHJsKGtkZF9zdGF0ZSAqcykKICAgICAgICAgfQogICAgIH0gZWxzZSB7CiAgICAgICAgIC8q
IDMyLWJpdCBjb250cm9sLXJlZ2lzdGVyIHNwYWNlIHN0YXJ0cyBhdCAweFsyXWNjLCBmb3IgODQg
Ynl0ZXMgKi8KLSAgICAgICAgdWludDMyX3Qgb2Zmc2V0ID0gYWRkcjsKLSAgICAgICAgaWYgKG9m
ZnNldCA+IDB4MjAwKQotICAgICAgICAgICAgb2Zmc2V0IC09IDB4MjAwOwotICAgICAgICBvZmZz
ZXQgLT0gMHhjYzsKLSAgICAgICAgaWYgKG9mZnNldCA+IHNpemVvZiBjdHJsLmMzMiB8fCBvZmZz
ZXQgKyBsZW4gPiBzaXplb2YgY3RybC5jMzIpIHsKKyAgICAgICAgdWludDMyX3Qgb2Zmc2V0ID0g
YWRkciAtIDB4Y2M7CisgICAgICAgIGlmIChvZmZzZXQgPiBzaXplb2YgY3RybC5jMzIpCisgICAg
ICAgICAgICBvZmZzZXQgLT0gMHgyY2M7CisgICAgICAgIGlmIChvZmZzZXQgPiBzaXplb2YgY3Ry
bC5jMzIgfHwgbGVuID4gc2l6ZW9mIGN0cmwuYzMyIC0gb2Zmc2V0KSB7CiAgICAgICAgICAgICBL
RERfTE9HKHMsICJSZXF1ZXN0IG91dHNpZGUgb2Yga25vd24gY29udHJvbCBzcGFjZVxuIik7CiAg
ICAgICAgICAgICBsZW4gPSAwOwogICAgICAgICB9IGVsc2UgewoKYmFzZS1jb21taXQ6IGU3NTJm
Mjg0MDk2NzhjZTNhZGU0OTk4NmIzOTMwOTE3OGZiMmE2ZDYKLS0gCmdpdC1zZXJpZXMgMC45LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
