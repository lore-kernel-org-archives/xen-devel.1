From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/4] TestSupport: Export
 pkg_manager_install_cmd_line
Date: Thu, 21 Jun 2018 15:09:18 +0100
Message-ID: <1529590160-25104-3-git-send-email-ian.jackson@eu.citrix.com>
References: <1529590160-25104-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g66k=jh=citrix.com=prvs=70384805a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fW0HM-0001dn-33
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 14:09:40 +0000
In-Reply-To: <1529590160-25104-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSBiL09zc3Rlc3QvVGVz
dFN1cHBvcnQucG0KaW5kZXggZmZmM2M1Yi4uZTRhNjRmMiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9U
ZXN0U3VwcG9ydC5wbQorKysgYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCkBAIC02OCw2ICs2OCw3
IEBAIEJFR0lOIHsKICAgICAgICAgICAgICAgICAgICAgICBodHRwX3Byb3h5X2VudnNldHRpbmdz
CiAgICAgICAgICAgICAgICAgICAgICAgdGFyZ2V0X2VkaXRmaWxlX3Jvb3QgdGFyZ2V0X2ZpbGVf
ZXhpc3RzCiAgICAgICAgICAgICAgICAgICAgICAgdGFyZ2V0X2VkaXRmaWxlX2t2cF9yZXBsYWNl
CisJCSAgICAgIHBrZ19tYW5hZ2VyX2luc3RhbGxfY21kX2xpbmUKICAgICAgICAgICAgICAgICAg
ICAgICB0YXJnZXRfaW5zdGFsbF9wYWNrYWdlcyB0YXJnZXRfaW5zdGFsbF9wYWNrYWdlc19ub3Jl
YwogICAgICAgICAgICAgICAgICAgICAgIHRhcmdldF9qb2JkaXIgdGFyZ2V0X2V4dHJhY3Rfam9i
ZGlzdHBhdGhfc3ViZGlyCiAgICAgICAgICAgICAgICAgICAgICAgdGFyZ2V0X2V4dHJhY3Rfam9i
ZGlzdHBhdGggdGFyZ2V0X2V4dHJhY3RfZGlzdHBhcnQKLS0gCjIuMS40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
