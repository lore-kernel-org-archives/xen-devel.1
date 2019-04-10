From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 41/62] ts-debian-fixup: Use
 debian_overlays_fixup_cmd
Date: Wed, 10 Apr 2019 15:23:47 +0100
Message-ID: <20190410142408.22848-42-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAR-0006ie-Rs
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:35 +0000
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T3RoZXJ3aXNlIHdlIGdldCB0aGUgc2FtZSBlcnJvciBmb3IgZ3Vlc3RzIGFzIHdhcyBwcmV2ZW50
ZWQgZm9yIGhvc3RzCmJ5ICJwcmVzZWVkX2Jhc2U6IGNobW9kIHNzaCBob3N0IHByaXZhdGUga2V5
cyB0byBwbGFjYXRlIHNzaGQiLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMtZGViaWFuLWZpeHVwIHwgNSArKysrKwogMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3RzLWRlYmlhbi1maXh1cCBi
L3RzLWRlYmlhbi1maXh1cAppbmRleCAwZTU1M2Q0Ny4uN2Q5ZDAzOTggMTAwNzU1Ci0tLSBhL3Rz
LWRlYmlhbi1maXh1cAorKysgYi90cy1kZWJpYW4tZml4dXAKQEAgLTIwNiw3ICsyMDYsMTIgQEAg
c2F2ZWNmZygpOwogZXRoZXIoKTsKIHRhcmdldF9rZXJua2luZF9jaGVjaygkZ2hvKTsKIGFjY2Vz
cygpOworCiBkZWJpYW5fb3ZlcmxheXMoJGhvLCBcJm92ZXJsYXkpOwordGFyZ2V0X2NtZF9yb290
KCRobywgPDxFTkQuZGViaWFuX292ZXJsYXlzX2ZpeHVwX2NtZCgkaG8sICRtb3VudHBvaW50KSk7
CitzZXQgLWV4CitFTkQKKwogY29uc29sZSgpOwogZmlsZXN5c3RlbXMoKTsKIG90aGVyZml4dXBj
ZmcoKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
