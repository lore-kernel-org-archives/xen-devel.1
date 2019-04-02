From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 4/4] xen/console: Simplify domU console handling
 in guest_console_write
Date: Tue,  2 Apr 2019 17:42:38 +0100
Message-ID: <20190402164238.1815-5-julien.grall@arm.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j360=SE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hBMV2-0005yz-Sa
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 16:43:00 +0000
In-Reply-To: <20190402164238.1815-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

MiBwYXRocyBpbiB0aGUgZG9tVSBjb25zb2xlIGhhbmRsaW5nIGFyZSBub3cgdGhlIHNhbWUuIFNv
IHRoZXkgY2FuIGJlCm1lcmdlZCB0byBtYWtlIHRoZSBjb2RlIHNpbXBsZXIuCgpTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9kcml2ZXJz
L2NoYXIvY29uc29sZS5jIHwgOSArKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvY2hhci9jb25z
b2xlLmMgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwppbmRleCBiMTE5YmY5ODBiLi41NDgz
ZDY2NTEyIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYworKysgYi94ZW4v
ZHJpdmVycy9jaGFyL2NvbnNvbGUuYwpAQCAtNTg0LDEzICs1ODQsOCBAQCBzdGF0aWMgbG9uZyBn
dWVzdF9jb25zb2xlX3dyaXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY2hhcikgYnVmZmVyLCBp
bnQgY291bnQpCiAgICAgICAgICAgICAqa291dCA9ICdcMCc7CiAgICAgICAgICAgICBzcGluX2xv
Y2soJmNkLT5wYnVmX2xvY2spOwogICAgICAgICAgICAga2NvdW50ID0ga2luIC0ga2J1ZjsKLSAg
ICAgICAgICAgIGlmICggYyA9PSAnXG4nICkKLSAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAg
ICBjZC0+cGJ1ZltjZC0+cGJ1Zl9pZHhdID0gJ1wwJzsKLSAgICAgICAgICAgICAgICBndWVzdF9w
cmludGsoY2QsIFhFTkxPR19HX0RFQlVHICIlcyVzXG4iLCBjZC0+cGJ1Ziwga2J1Zik7Ci0gICAg
ICAgICAgICAgICAgY2QtPnBidWZfaWR4ID0gMDsKLSAgICAgICAgICAgIH0KLSAgICAgICAgICAg
IGVsc2UgaWYgKCBjZC0+cGJ1Zl9pZHggKyAoa291dCAtIGtidWYpIDwgKERPTUFJTl9QQlVGX1NJ
WkUgLSAxKSApCisgICAgICAgICAgICBpZiAoIGMgIT0gJ1xuJyAmJgorICAgICAgICAgICAgICAg
IChjZC0+cGJ1Zl9pZHggKyAoa291dCAtIGtidWYpIDwgKERPTUFJTl9QQlVGX1NJWkUgLSAxKSkg
KQogICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIC8qIGJ1ZmZlciB0aGUgb3V0cHV0IHVu
dGlsIGEgbmV3bGluZSAqLwogICAgICAgICAgICAgICAgIG1lbWNweShjZC0+cGJ1ZiArIGNkLT5w
YnVmX2lkeCwga2J1Ziwga291dCAtIGtidWYpOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
