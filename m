From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH V9 2/7] x86/p2m: switch global_logdirty from
 bool_t to bool
Date: Thu, 22 Nov 2018 13:40:23 +0200
Message-ID: <1542886828-11241-3-git-send-email-rcojocaru@bitdefender.com>
References: <1542886828-11241-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qves=ob=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gPnLY-0005RN-D0
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 11:40:36 +0000
In-Reply-To: <1542886828-11241-1-git-send-email-rcojocaru@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
PgoKLS0tCkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNDOiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KQ0M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgot
LS0KQ2hhbmdlcyBzaW5jZSBWODoKIC0gTm9uZS4KLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L3Ay
bS5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaCBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvcDJtLmgKaW5kZXggNmQ4NDlhNS4uYjUyZmVmZCAxMDA2NDQKLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9wMm0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCkBAIC0yMjIs
NyArMjIyLDcgQEAgc3RydWN0IHAybV9kb21haW4gewogICAgIHN0cnVjdCByYW5nZXNldCAgICps
b2dkaXJ0eV9yYW5nZXM7CiAKICAgICAvKiBIb3N0IHAybTogR2xvYmFsIGxvZy1kaXJ0eSBtb2Rl
IGVuYWJsZWQgZm9yIHRoZSBkb21haW4uICovCi0gICAgYm9vbF90ICAgICAgICAgICAgIGdsb2Jh
bF9sb2dkaXJ0eTsKKyAgICBib29sICAgICAgICAgICAgICAgZ2xvYmFsX2xvZ2RpcnR5OwogCiAg
ICAgLyogSG9zdCBwMm06IHdoZW4gdGhpcyBmbGFnIGlzIHNldCwgZG9uJ3QgZmx1c2ggYWxsIHRo
ZSBuZXN0ZWQtcDJtIAogICAgICAqIHRhYmxlcyBvbiBldmVyeSBob3N0LXAybSBjaGFuZ2UuICBU
aGUgc2V0dGVyIG9mIHRoaXMgZmxhZyAKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
