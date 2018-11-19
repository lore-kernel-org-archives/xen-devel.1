From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 2/4] automation: stash default config file for
 artifact extraction
Date: Mon, 19 Nov 2018 21:31:00 +0000
Message-ID: <20181119213102.8939-3-wei.liu2@citrix.com>
References: <20181119213102.8939-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bhw3=n6=citrix.com=prvs=8540992c9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gOr8N-00070R-LE
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 21:31:07 +0000
In-Reply-To: <20181119213102.8939-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiAuZ2l0bGFi
LWNpLnltbCAgICAgICAgICAgfCAyICstCiBhdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQgfCAzICsr
KwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS8uZ2l0bGFiLWNpLnltbCBiLy5naXRsYWItY2kueW1sCmluZGV4IDU2NzhiNTUyYzQu
LjI4MTUyZTkwNmQgMTAwNjQ0Ci0tLSBhLy5naXRsYWItY2kueW1sCisrKyBiLy5naXRsYWItY2ku
eW1sCkBAIC04LDcgKzgsNyBAQCBzdGFnZXM6CiAgICAgLSAuL2F1dG9tYXRpb24vc2NyaXB0cy9i
dWlsZCAyPiYxIHwgdGVlIGJ1aWxkLmxvZwogICBhcnRpZmFjdHM6CiAgICAgcGF0aHM6Ci0gICAg
ICAtIHhlbi8uY29uZmlnCisgICAgICAtIHhlbi1jb25maWcKICAgICAgIC0gJyoubG9nJwogICAg
IHdoZW46IGFsd2F5cwogICBleGNlcHQ6CmRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL3NjcmlwdHMv
YnVpbGQgYi9hdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQKaW5kZXggNDhlMzk4ZWEyMC4uYTFmOWE1
ZGE1NiAxMDA3NTUKLS0tIGEvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkCisrKyBiL2F1dG9tYXRp
b24vc2NyaXB0cy9idWlsZApAQCAtMjYsNiArMjYsOSBAQCBmaQogCiBtYWtlIC1qJChucHJvYykg
ZGlzdAogCisjIEV4dHJhY3QgYXJ0aWZhY3RzIHRvIGF2b2lkIGdldHRpbmcgcmV3cml0dGVuIGJ5
IGN1c3RvbWlzZWQgYnVpbGRzCitjcCB4ZW4vLmNvbmZpZyB4ZW4tY29uZmlnCisKICMgQnVpbGQg
YWxsIHRoZSBjb25maWdzIHdlIGNhcmUgYWJvdXQKIGNhc2UgJHtYRU5fVEFSR0VUX0FSQ0h9IGlu
CiAgICAgeDg2XzY0KSBhcmNoPXg4NiA7OwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
