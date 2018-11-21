From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] automation: git clean between builds
Date: Wed, 21 Nov 2018 16:32:56 +0000
Message-ID: <20181121163256.25289-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=88oy=oa=citrix.com=prvs=85659e452=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gPVR5-00080V-8Q
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 16:33:07 +0000
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

Q3VycmVudGx5IHJhbmRjb25maWcgdGVzdHMgYXJlIG1vcmUgbGlrZWx5IHRvIGZhaWwgdGhhbiB0
byBzdWNjZWVkCmJlY2F1c2Ugb2YgYSBidWcgaW4geGVuJ3MgYnVpbGQgc3lzdGVtOiBzeW1ib2xz
LWR1bW15Lm8ncyBkZXBlbmRlbmN5CmlzIHdyb25nLCB3aGljaCBjYXVzZXMgaXQgdG8gbm90IGdl
dCByZWJ1aWxkIGJldHdlZW4gcnVucywgd2hpY2gKZXZlbnR1YWxseSBjYXVzZXMgbGlua2luZyB0
byBmYWlsLiBUaGVyZSBtYXkgYWxzbyBiZSBvdGhlciBjb3JuZXIKY2FzZXMgd2UgaGF2ZW4ndCBk
aXNjb3ZlcmVkLgoKVGhlIGZpeCBpcyBub3Qgc3RyYWlnaHRmb3J3YXJkLiBGb3Igbm93LCBtYWtl
IHN1cmUgdGhlIHRyZWUgaXMgY2xlYW5lZApwcm9wZXJseSBiZXR3ZWVuIGJ1aWxkcyBzbyB3ZSBk
b24ndCBzZWUgcmFuZG9tIGZhaWx1cmVzIGluIEdpdGxhYiBDSS4KClNpZ25lZC1vZmYtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxk
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkIGIvYXV0b21hdGlvbi9zY3JpcHRz
L2J1aWxkCmluZGV4IGUzNjcyYTM2MjYuLjlkODJlMWQ2MTIgMTAwNzU1Ci0tLSBhL2F1dG9tYXRp
b24vc2NyaXB0cy9idWlsZAorKysgYi9hdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQKQEAgLTQyLDcg
KzQyLDcgQEAgZXNhYwogY2ZnX2Rpcj0iYXV0b21hdGlvbi9jb25maWdzLyR7YXJjaH0iCiBmb3Ig
Y2ZnIGluIGBscyAke2NmZ19kaXJ9YDsgZG8KICAgICBlY2hvICJCdWlsZGluZyAkY2ZnIgotICAg
IHJtIC1mIHhlbi8uY29uZmlnCisgICAgZ2l0IGNsZWFuIC1mZHhxCiAgICAgbWFrZSAtQyB4ZW4g
S0JVSUxEX0RFRkNPTkZJRz0uLi8uLi8uLi8uLi8ke2NmZ19kaXJ9LyR7Y2ZnfSBYRU5fQ09ORklH
X0VYUEVSVD15IGRlZmNvbmZpZwogICAgIG1ha2UgLWokKG5wcm9jKSAtQyB4ZW4gWEVOX0NPTkZJ
R19FWFBFUlQ9eQogZG9uZQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
