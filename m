From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 for-4.12] x86/pvh-boot: don't mandate
 validity of RSDP pointer
Date: Wed, 30 Jan 2019 13:55:55 +0000
Message-ID: <20190130135555.3290-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cj/s=QG=citrix.com=prvs=926cecb90=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1goqLP-0000JE-Be
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 13:55:59 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UlNEUCBpcyBub3QgbWFuZGF0b3J5IGFjY29yZGluZyB0byBQVkggc3BlYy4gUmVtb3ZlIHRoZSBC
VUdfT04uIFRoZQpndWVzdCAoeGVuKSB3aWxsIGZhbGwgYmFjayB0byBzY2FubmluZyBpZiBuZWNl
c3NhcnkuCgpSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4
ZW4vYXJjaC94ODYvZ3Vlc3QvcHZoLWJvb3QuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvcHZoLWJvb3QuYyBiL3hl
bi9hcmNoL3g4Ni9ndWVzdC9wdmgtYm9vdC5jCmluZGV4IDU0NDc3NWVlYjQuLmNhOGUxNTZmN2Qg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9wdmgtYm9vdC5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9ndWVzdC9wdmgtYm9vdC5jCkBAIC03OSw3ICs3OSw2IEBAIHN0YXRpYyB2b2lkIF9faW5p
dCBjb252ZXJ0X3B2aF9pbmZvKG11bHRpYm9vdF9pbmZvX3QgKiptYmksCiAgICAgICAgIHB2aF9t
YmlfbW9kc1tpXS5zdHJpbmcgICAgPSBlbnRyeVtpXS5jbWRsaW5lX3BhZGRyOwogICAgIH0KIAot
ICAgIEJVR19PTighcHZoX2luZm8tPnJzZHBfcGFkZHIpOwogICAgIHJzZHBfaGludCA9IHB2aF9p
bmZvLT5yc2RwX3BhZGRyOwogCiAgICAgKm1iaSA9ICZwdmhfbWJpOwotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
