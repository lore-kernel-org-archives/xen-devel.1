From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 05/11] di_installer_path: Use in
	ts-host-install
Date: Thu, 14 Dec 2017 16:22:16 +0000
Message-ID: <1513268542-16212-5-git-send-email-ian.jackson@eu.citrix.com>
References: <1513268542-16212-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dmf7=dk=citrix.com=prvs=514febeb1=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ePWHZ-0007mq-Kb
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2017 16:22:49 +0000
In-Reply-To: <1513268542-16212-1-git-send-email-ian.jackson@eu.citrix.com>
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

Tm8gc2lnbmlmaWNhbnQgZnVuY3Rpb25hbCBjaGFuZ2UuICBXZSBub3cgaG9ub3VyIGNmZ190ZnRw
X2RpX3ZlcnNpb24KaWYgdGhlICRobyBkb2Vzbid0IGhhdmUgdGhlIGluZm9ybWF0aW9uLgoKU2ln
bmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQog
dHMtaG9zdC1pbnN0YWxsIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdHMtaG9zdC1pbnN0YWxsIGIvdHMtaG9zdC1pbnN0
YWxsCmluZGV4IDUyMDk4M2YuLmE1Y2Y5M2IgMTAwNzU1Ci0tLSBhL3RzLWhvc3QtaW5zdGFsbAor
KysgYi90cy1ob3N0LWluc3RhbGwKQEAgLTE1OCw3ICsxNTgsNyBAQCBFTkQKIHN1YiBzZXR1cF9u
ZXRib290X2ZpcnN0Ym9vdCgkKSB7CiAgICAgbXkgKCRwc191cmwpID0gQF87CiAgICAgCi0gICAg
bXkgJGRfaT0gJGhvLT57VGZ0cH17RGlCYXNlfS4nLycuJHJ7YXJjaH0uJy8nLiRoby0+e0RpVmVy
c2lvbn0uJy0nLiRoby0+e1N1aXRlfTsKKyAgICBteSAkZF9pPSBkaV9pbnN0YWxsZXJfcGF0aCgk
aG8pOwogICAgIAogICAgIG15IEBkaWNtZGxpbmU9IHF3KHZnYT1ub3JtYWwpOwogICAgIHB1c2gg
QGRpY21kbGluZSwgZGlfaW5zdGFsbGNtZGxpbmVfY29yZSgkaG8sICRwc191cmwsICV4b3B0cyk7
Ci0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
