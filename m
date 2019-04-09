From: FionaLi-oc <fionali-oc@zhaoxin.com>
Subject: [PATCH 0/2] x86/iommu: support IOMMU for Zhaoxin CPU
Date: Tue, 9 Apr 2019 10:59:27 +0800
Message-ID: <1554778767-3480-1-git-send-email-fionali-oc@zhaoxin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iHqD=SL=zhaoxin.com=fionali-oc@srs-us1.protection.inumbo.net>)
 id 1hDgzC-0004mB-5i
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 02:59:46 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: wei.liu2@citrix.com, andrew.cooper3@citrix.com, cobechen@zhaoxin.com, FionaLi-oc <fionali-oc@zhaoxin.com>, jbeulich@suse.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

VGhlIHBhdGNoc2V0IHN1cHBvcnRzIHNvbWUgZmVhdHVyZXMgZm9yIFpoYW94aW4gQ1BVIHdob3Nl
IHZlbmRvcgpJRCBpcyAnU2hhbmdoYWknLiBaaGFveGluIHg4NiBTT0Mgc3VwcG9ydHMgSS9PIHZp
cnR1YWxpemF0aW9uCndoaWNoIGlzIGNvbXBhdGlibGUgd2l0aCBJbnRlbCBJL08gdmlydHVsaXph
aXRvbi4KCkluZGVudCB3aXRoIGZvdXIgc3BhY2VzLgoKU2lnbmVkLW9mZi1ieTogRmlvbmFMaS1v
YyA8ZmlvbmFsaS1vY0B6aGFveGluLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2lvbW11
LmggfCA5ICsrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2lvbW11LmggYi94ZW4v
aW5jbHVkZS9hc20teDg2L2lvbW11LmgKaW5kZXggOGRjMzkyNC4uZWM1YTAwOSAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9pb21tdS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
aW9tbXUuaApAQCAtNzEsMTAgKzcxLDExIEBAIHN0YXRpYyBpbmxpbmUgaW50IGlvbW11X2hhcmR3
YXJlX3NldHVwKHZvaWQpCiB7CiAgICAgc3dpdGNoICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9y
ICkKICAgICB7Ci0gICAgY2FzZSBYODZfVkVORE9SX0lOVEVMOgotICAgICAgICByZXR1cm4gaW50
ZWxfdnRkX3NldHVwKCk7Ci0gICAgY2FzZSBYODZfVkVORE9SX0FNRDoKLSAgICAgICAgcmV0dXJu
IGFtZF9pb3ZfZGV0ZWN0KCk7CisgICAgICAgIGNhc2UgWDg2X1ZFTkRPUl9JTlRFTDoKKyAgICAg
ICAgY2FzZSBYODZfVkVORE9SX1NIQU5HSEFJOgorICAgICAgICAgICAgcmV0dXJuIGludGVsX3Z0
ZF9zZXR1cCgpOworICAgICAgICBjYXNlIFg4Nl9WRU5ET1JfQU1EOgorICAgICAgICAgICAgcmV0
dXJuIGFtZF9pb3ZfZGV0ZWN0KCk7CiAgICAgfQogCiAgICAgcmV0dXJuIC1FTk9ERVY7Ci0tIAox
LjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
