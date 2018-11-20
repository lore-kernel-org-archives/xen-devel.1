From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] automation: fix debian-{stretch,
 unstable}-32-gcc-debug
Date: Tue, 20 Nov 2018 14:10:02 +0000
Message-ID: <20181120141002.30222-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j60o=n7=citrix.com=prvs=8555d601b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gP6jD-0002VG-Ok
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 14:10:11 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhleSBzaG91bGQgaGF2ZSB1c2VkIC5nY2MteDg2LTMyLWJ1aWxkLWRlYnVnIGluIHRoZSBmaXJz
dCBwbGFjZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0t
LQpUaGlzIHBhdGNoIGlzIHRyaXZpYWwgc28gSSBpbnRlbmQgdG8gY29tbWl0IGl0IGFzIHNvb24g
YXMgcG9zc2libGUgdG8KZml4IEdpdGxhYiBDSS4KLS0tCiAuZ2l0bGFiLWNpLnltbCB8IDQgKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS8uZ2l0bGFiLWNpLnltbCBiLy5naXRsYWItY2kueW1sCmluZGV4IDU2NzhiNTUyYzQu
LjMzNjhmYWQwMTAgMTAwNjQ0Ci0tLSBhLy5naXRsYWItY2kueW1sCisrKyBiLy5naXRsYWItY2ku
eW1sCkBAIC0yMjcsNyArMjI3LDcgQEAgZGViaWFuLXN0cmV0Y2gtMzItZ2NjOgogICAgIENPTlRB
SU5FUjogZGViaWFuOnN0cmV0Y2gtaTM4NgogCiBkZWJpYW4tc3RyZXRjaC0zMi1nY2MtZGVidWc6
Ci0gIGV4dGVuZHM6IC5nY2MteDg2LTY0LWJ1aWxkLWRlYnVnCisgIGV4dGVuZHM6IC5nY2MteDg2
LTMyLWJ1aWxkLWRlYnVnCiAgIHZhcmlhYmxlczoKICAgICBDT05UQUlORVI6IGRlYmlhbjpzdHJl
dGNoLWkzODYKIApAQCAtMjc5LDcgKzI3OSw3IEBAIGRlYmlhbi11bnN0YWJsZS0zMi1nY2M6CiAg
ICAgQ09OVEFJTkVSOiBkZWJpYW46dW5zdGFibGUtaTM4NgogCiBkZWJpYW4tdW5zdGFibGUtMzIt
Z2NjLWRlYnVnOgotICBleHRlbmRzOiAuZ2NjLXg4Ni02NC1idWlsZC1kZWJ1ZworICBleHRlbmRz
OiAuZ2NjLXg4Ni0zMi1idWlsZC1kZWJ1ZwogICB2YXJpYWJsZXM6CiAgICAgQ09OVEFJTkVSOiBk
ZWJpYW46dW5zdGFibGUtaTM4NgogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
