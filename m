From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] tools/xenmon: make xenmon.py compatible with
 python 2 and 3
Date: Mon, 1 Apr 2019 11:39:00 +0100
Message-ID: <20190401103900.17269-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZqZs=SD=citrix.com=prvs=987e11b64=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hAuLN-0000rT-4z
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 10:39:09 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy94
ZW5tb24veGVubW9uLnB5IHwgOCArKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy94ZW5tb24veGVubW9uLnB5
IGIvdG9vbHMveGVubW9uL3hlbm1vbi5weQppbmRleCAyYTk0OGNkNDhhLi4xNzVlYWNkMmNiIDEw
MDY0NAotLS0gYS90b29scy94ZW5tb24veGVubW9uLnB5CisrKyBiL3Rvb2xzL3hlbm1vbi94ZW5t
b24ucHkKQEAgLTIzLDYgKzIzLDggQEAKICMgICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgSWYg
bm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgogIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAK
K2Zyb20gX19mdXR1cmVfXyBpbXBvcnQgcHJpbnRfZnVuY3Rpb24KKwogaW1wb3J0IG1tYXAKIGlt
cG9ydCBzdHJ1Y3QKIGltcG9ydCBvcwpAQCAtMjQ4LDggKzI1MCw4IEBAIGRlZiBkaXNwbGF5KHNj
ciwgcm93LCBjb2wsIHN0ciwgYXR0cj0wKToKICAgICAgICAgc2NyLmtleXBhZCgwKQogICAgICAg
ICBfYy5lY2hvKCkKICAgICAgICAgX2MuZW5kd2luKCkKLSAgICAgICAgcHJpbnQgIllvdXIgdGVy
bWluYWwgc2NyZWVuIGlzIG5vdCBiaWcgZW5vdWdoOyBQbGVhc2UgcmVzaXplIGl0LiIKLSAgICAg
ICAgcHJpbnQgInJvdz0lZCwgY29sPSVkLCBzdHI9JyVzJyIgJSAocm93LCBjb2wsIHN0cikKKyAg
ICAgICAgcHJpbnQoIllvdXIgdGVybWluYWwgc2NyZWVuIGlzIG5vdCBiaWcgZW5vdWdoOyBQbGVh
c2UgcmVzaXplIGl0LiIpCisgICAgICAgIHByaW50KCJyb3c9JWQsIGNvbD0lZCwgc3RyPSclcyci
ICUgKHJvdywgY29sLCBzdHIpKQogICAgICAgICBzeXMuZXhpdCgxKQogCiAKQEAgLTcwNCw3ICs3
MDYsNyBAQCBkZWYgbWFpbigpOgogICAgICAgICB0cnk6CiAgICAgICAgICAgICB3cml0ZWxvZygp
CiAgICAgICAgIGV4Y2VwdDoKLSAgICAgICAgICAgIHByaW50ICdRdWl0dGluZy4nCisgICAgICAg
ICAgICBwcmludCgnUXVpdHRpbmcuJykKICAgICBzdG9wX3hlbmJha2VkKCkKIAogaWYgX19uYW1l
X18gPT0gIl9fbWFpbl9fIjoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
