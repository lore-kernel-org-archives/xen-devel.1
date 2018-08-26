From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 22/23] x86/pvshim: disable HVM for PV shim
Date: Sun, 26 Aug 2018 13:19:55 +0100
Message-ID: <302ac2c4bd07943466689884f40e0418332d59d9.1535285866.git-series.wei.liu2@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gpvm=lj=citrix.com=prvs=769521655=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftu9w-0000eJ-MS
 for xen-devel@lists.xenproject.org; Sun, 26 Aug 2018 12:28:48 +0000
In-Reply-To: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHRvb2xzL2Zpcm13
YXJlL3hlbi1kaXIvc2hpbS5jb25maWcgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9maXJtd2FyZS94ZW4tZGly
L3NoaW0uY29uZmlnIGIvdG9vbHMvZmlybXdhcmUveGVuLWRpci9zaGltLmNvbmZpZwppbmRleCAy
MWQ3MDc1Li5kZTUzZGZlIDEwMDY0NAotLS0gYS90b29scy9maXJtd2FyZS94ZW4tZGlyL3NoaW0u
Y29uZmlnCisrKyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvc2hpbS5jb25maWcKQEAgLTEyLDcg
KzEyLDcgQEAgQ09ORklHX0FSQ0hfREVGQ09ORklHPSJhcmNoL3g4Ni9jb25maWdzL3g4Nl82NF9k
ZWZjb25maWciCiBDT05GSUdfTlJfQ1BVUz0zMgogQ09ORklHX1BWPXkKIENPTkZJR19QVl9MSU5F
QVJfUFQ9eQotQ09ORklHX0hWTT15CisjIENPTkZJR19IVk0gaXMgbm90IHNldAogIyBDT05GSUdf
U0hBRE9XX1BBR0lORyBpcyBub3Qgc2V0CiAjIENPTkZJR19CSUdNRU0gaXMgbm90IHNldAogIyBD
T05GSUdfSFZNX0ZFUCBpcyBub3Qgc2V0Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
