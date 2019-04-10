From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 38/62] ts-guests-nbd-mirror: Use
 target_getfile_root_stash
Date: Wed, 10 Apr 2019 15:23:44 +0100
Message-ID: <20190410142408.22848-39-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAT-0006nL-S9
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:37 +0000
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

VGhhdCByZW1vdmVzIHRoZSByYXRoZXIgYWQtaG9jIG9wZW4tY29kaW5nLgoKU2lnbmVkLW9mZi1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMtZ3Vlc3Rz
LW5iZC1taXJyb3IgfCA1ICstLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdHMtZ3Vlc3RzLW5iZC1taXJyb3IgYi90cy1ndWVz
dHMtbmJkLW1pcnJvcgppbmRleCAwNjkwM2FhYS4uMDM2NWM0N2IgMTAwNzU1Ci0tLSBhL3RzLWd1
ZXN0cy1uYmQtbWlycm9yCisrKyBiL3RzLWd1ZXN0cy1uYmQtbWlycm9yCkBAIC0xNTQsMTAgKzE1
NCw3IEBAIHN1YiBzaHVmZmxlY29uZmlncyAoKSB7CiAJbXkgJGduPSAkZ25zWyRpXTsKIAlteSAk
Z2hvPSAkZ2hvc1skaV07CiAJbXkgJGNmZ3BhdGg9ICRyeyAiJGdoby0+e0d1ZXN0fV9jZmdwYXRo
IiB9OwotCW15ICRmaWxlPSAkY2ZncGF0aDsKLQkkZmlsZT1+IHMsLywtLGc7Ci0JJGZpbGU9ICIk
c3Rhc2gvIi5ob3N0bmFtZXBhdGgoJGNobykuIi0tJGZpbGUiOwotCXRhcmdldF9nZXRmaWxlX3Jv
b3QoJHNobywgNjAsICRjZmdwYXRoLCAkZmlsZSk7CisJbXkgJGZpbGUgPSB0YXJnZXRfZ2V0Zmls
ZV9yb290X3N0YXNoKCRzaG8sIDYwLCAkY2ZncGF0aCk7CiAJdGFyZ2V0X3B1dGZpbGVfcm9vdCgk
Y2hvLCA2MCwgJGZpbGUsICRjZmdwYXRoKTsKICAgICB9CiB9Ci0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
