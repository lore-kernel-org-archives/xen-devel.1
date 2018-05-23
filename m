From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 08/23] Perl @INC path: fix a few more
 scripts to use BEGIN
Date: Wed, 23 May 2018 17:15:55 +0100
Message-ID: <1527092170-4111-9-git-send-email-ian.jackson@eu.citrix.com>
References: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdxj=ik=citrix.com=prvs=674fbe803=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fLWR4-0000O9-J2
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 16:16:22 +0000
In-Reply-To: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
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

VGhyZWUgbW9yZSBmaWxlcyB3aGljaCBtaXNzZWQgb3V0IG9uCiAgZGVhOTg3YzVhYjExICJQRVJM
TElCLCBASU5DOiBVc2UgQkVHSU4geyB9IgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElh
bi5KYWNrc29uQGV1LmNpdHJpeC5jb20+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KLS0tCiBtZy1hbm9pbnQgICAgICAgICAgICAgICAgIHwgMiArLQogdHMtZXhh
bWluZS1ob3N0cHJvcHMtc2F2ZSB8IDIgKy0KIHRzLWZyZWVic2QtaG9zdC1pbnN0YWxsICAgfCAy
ICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9tZy1hbm9pbnQgYi9tZy1hbm9pbnQKaW5kZXggODM3ZTYwOC4uYjAwN2FiNCAx
MDA3NTUKLS0tIGEvbWctYW5vaW50CisrKyBiL21nLWFub2ludApAQCAtNjMsNyArNjMsNyBAQAog
CiB1c2Ugc3RyaWN0IHF3KHZhcnMgcmVmcyk7CiB1c2UgREJJOwotdW5zaGlmdCBASU5DLCBxdygu
KTsKK0JFR0lOIHsgdW5zaGlmdCBASU5DLCBxdyguKTsgfQogdXNlIE9zc3Rlc3Q7CiB1c2UgT3Nz
dGVzdDo6VGVzdFN1cHBvcnQ7CiB1c2UgT3NzdGVzdDo6RXhlY3V0aXZlOwpkaWZmIC0tZ2l0IGEv
dHMtZXhhbWluZS1ob3N0cHJvcHMtc2F2ZSBiL3RzLWV4YW1pbmUtaG9zdHByb3BzLXNhdmUKaW5k
ZXggMTg4NzczZi4uNTVkMjMzOSAxMDA3NTUKLS0tIGEvdHMtZXhhbWluZS1ob3N0cHJvcHMtc2F2
ZQorKysgYi90cy1leGFtaW5lLWhvc3Rwcm9wcy1zYXZlCkBAIC0xOSw3ICsxOSw3IEBAIHVzZSBz
dHJpY3QgcXcodmFycyk7CiB1c2UgREJJOwogdXNlIFBPU0lYOwogCi11bnNoaWZ0IEBJTkMsIHF3
KC4pOworQkVHSU4geyB1bnNoaWZ0IEBJTkMsIHF3KC4pOyB9CiB1c2UgT3NzdGVzdDsKIHVzZSBP
c3N0ZXN0OjpUZXN0U3VwcG9ydDsKIApkaWZmIC0tZ2l0IGEvdHMtZnJlZWJzZC1ob3N0LWluc3Rh
bGwgYi90cy1mcmVlYnNkLWhvc3QtaW5zdGFsbAppbmRleCBjYWM4YmU5Li45ODRiZGYwIDEwMDc1
NQotLS0gYS90cy1mcmVlYnNkLWhvc3QtaW5zdGFsbAorKysgYi90cy1mcmVlYnNkLWhvc3QtaW5z
dGFsbApAQCAtMzUsNyArMzUsNyBAQCB1c2Ugc3RyaWN0IHF3KHZhcnMpOwogdXNlIERCSTsKIHVz
ZSBQT1NJWDsKIAotdW5zaGlmdCBASU5DLCBxdyguKTsKK0JFR0lOIHsgdW5zaGlmdCBASU5DLCBx
dyguKTsgfQogdXNlIE9zc3Rlc3Q7CiB1c2UgT3NzdGVzdDo6VGVzdFN1cHBvcnQ7CiAKLS0gCjIu
MS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
