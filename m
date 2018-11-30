From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH OSSTEST] ts-xen-build: Enable ITS driver in Xen
Date: Fri, 30 Nov 2018 15:23:42 +0000
Message-ID: <20181130152342.7747-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nnkx=OJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gSkeW-0001GL-1R
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 15:24:24 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

VGhlIElUUyBkcml2ZXIgd2FzIGFkZGVkIGluIFhlbiA0LjEwIGFzIGEgdGVjaG5pY2FsIHByZXZp
ZXcgZmVhdHVyZS4KSG93ZXZlciwgaXQgaXMgcmVxdWlyZWQgaW4gb3JkZXIgdG8gYm9vdCBYZW4g
YXMgVGh1bmRlci1YIGJlY2F1c2UKUENJIGRldmljZXMgZG9uJ3Qgc3VwcG9ydCBsZWdhY3kgaW50
ZXJydXB0LgoKU28gZW5hYmxlIENPTkZJR19JVFMgaW4gb3VyIFhlbiBidWlsZC4KClNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogdHMteGVuLWJ1
aWxkIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvdHMteGVuLWJ1aWxkIGIvdHMteGVuLWJ1aWxkCmluZGV4IGM1ZDJhMWQuLmRlZGY0NzQgMTAw
NzU1Ci0tLSBhL3RzLXhlbi1idWlsZAorKysgYi90cy14ZW4tYnVpbGQKQEAgLTEyNiw2ICsxMjYs
MTAgQEAgRU5ECiAJCWVjaG8gPj54ZW4vLmNvbmZpZyBDT05GSUdfRVhQRVJUPXkKIAkJZWNobyA+
Pnhlbi8uY29uZmlnIENPTkZJR19IVk1fRkVQPXkKIAkJZWNobyA+Pnhlbi8uY29uZmlnIENPTkZJ
R19WRVJCT1NFX0RFQlVHPXkKKwkJIyBJVFMgZHJpdmVyIGlzIHJlcXVpcmVkIHRvIGJvb3QgdGhl
IEhhcmR3YXJlIERvbWFpbgorCQkjIG9uIFhlbi4gRm9yIG5vdyAoWGVuIDQuMTAvNC4xMSBhdCBh
dCBsZWFzdCksCisJCSMgd2lsbCBiZSBub3QgYnVpbHQgYnkgZGVmYXVsdCBhbmQgZ2F0ZWQgYnkg
ZXhwZXJ0IG1vZGUKKwkJZWNobyA+Pnhlbi8uY29uZmlnIENPTkZJR19IQVNfSVRTPXkKIAlmaQog
RU5ECiAgICAgICAgICAgICAgICApOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
