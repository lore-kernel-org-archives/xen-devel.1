From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 0/2] Minor improvement to early boot code
Date: Fri, 28 Sep 2018 18:06:30 +0100
Message-ID: <20180928170632.1176-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rttn=mk=citrix.com=prvs=802525662=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g5wDr-0002C2-W6
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 17:06:36 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSAoMik6CiAgeDg2OiBtYWtlIHN1cmUgbW9kdWxlIGFycmF5IGlzIGxhcmdlIGVub3Vn
aCBpbiBwdmgtYm9vdC5jCiAgeGVuOiBpbml0aWFsaXNlIG9wdF94ZW5fY29uc29sZSBlYXJseSBp
biBQVkggYm9vdCBwYXRoCgogeGVuL2FyY2gveDg2L2d1ZXN0L3B2aC1ib290LmMgfCAxMiArKysr
KysrKysrKy0KIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAgIHwgIDUgKysrKysKIHhlbi9k
cml2ZXJzL2NoYXIvY29uc29sZS5jICAgIHwgMTAgKysrKysrKystLQogeGVuL2luY2x1ZGUveGVu
L2NvbnNvbGUuaCAgICAgfCAgMiArKwogNCBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
