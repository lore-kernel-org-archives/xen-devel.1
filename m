From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 33/62] ts-xen-build: Enable ITS driver
 in Xen
Date: Wed, 10 Apr 2019 15:23:39 +0100
Message-ID: <20190410142408.22848-34-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAN-0006X3-AT
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:31 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClRoZSBJVFMgZHJpdmVy
IHdhcyBhZGRlZCBpbiBYZW4gNC4xMCBhcyBhIHRlY2huaWNhbCBwcmV2aWV3IGZlYXR1cmUuCkhv
d2V2ZXIsIGl0IGlzIHJlcXVpcmVkIGluIG9yZGVyIHRvIGJvb3QgWGVuIGFzIFRodW5kZXItWCBi
ZWNhdXNlClBDSSBkZXZpY2VzIGRvbid0IHN1cHBvcnQgbGVnYWN5IGludGVycnVwdC4KClNvIGVu
YWJsZSBDT05GSUdfSVRTIGluIG91ciBYZW4gYnVpbGQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHRzLXhlbi1idWlsZCB8IDQgKysrKwog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3RzLXhlbi1idWls
ZCBiL3RzLXhlbi1idWlsZAppbmRleCA2ZGRmYzUzMy4uMTc2MmNkNjEgMTAwNzU1Ci0tLSBhL3Rz
LXhlbi1idWlsZAorKysgYi90cy14ZW4tYnVpbGQKQEAgLTEyOCw2ICsxMjgsMTAgQEAgRU5ECiAJ
CWVjaG8gPj54ZW4vLmNvbmZpZyBDT05GSUdfRVhQRVJUPXkKIAkJZWNobyA+Pnhlbi8uY29uZmln
IENPTkZJR19IVk1fRkVQPXkKIAkJZWNobyA+Pnhlbi8uY29uZmlnIENPTkZJR19WRVJCT1NFX0RF
QlVHPXkKKwkJIyBJVFMgZHJpdmVyIGlzIHJlcXVpcmVkIHRvIGJvb3QgdGhlIEhhcmR3YXJlIERv
bWFpbgorCQkjIG9uIFhlbi4gRm9yIG5vdyAoWGVuIDQuMTAvNC4xMSBhdCBhdCBsZWFzdCksCisJ
CSMgd2lsbCBiZSBub3QgYnVpbHQgYnkgZGVmYXVsdCBhbmQgZ2F0ZWQgYnkgZXhwZXJ0IG1vZGUK
KwkJZWNobyA+Pnhlbi8uY29uZmlnIENPTkZJR19IQVNfSVRTPXkKIAlmaQogRU5ECiAgICAgICAg
ICAgICAgICApOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
