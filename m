From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v3 15/16] x86/pvshim: disable HVM for PV shim
Date: Tue, 4 Sep 2018 17:15:32 +0100
Message-ID: <20180904161533.11575-16-wei.liu2@citrix.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6dpj=ls=citrix.com=prvs=77871bf46=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fxECK-0005IA-Ab
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 16:29:00 +0000
In-Reply-To: <20180904161533.11575-1-wei.liu2@citrix.com>
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
MWQ3MDc1YmI0Li5kZTUzZGZlMzc2IDEwMDY0NAotLS0gYS90b29scy9maXJtd2FyZS94ZW4tZGly
L3NoaW0uY29uZmlnCisrKyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvc2hpbS5jb25maWcKQEAg
LTEyLDcgKzEyLDcgQEAgQ09ORklHX0FSQ0hfREVGQ09ORklHPSJhcmNoL3g4Ni9jb25maWdzL3g4
Nl82NF9kZWZjb25maWciCiBDT05GSUdfTlJfQ1BVUz0zMgogQ09ORklHX1BWPXkKIENPTkZJR19Q
Vl9MSU5FQVJfUFQ9eQotQ09ORklHX0hWTT15CisjIENPTkZJR19IVk0gaXMgbm90IHNldAogIyBD
T05GSUdfU0hBRE9XX1BBR0lORyBpcyBub3Qgc2V0CiAjIENPTkZJR19CSUdNRU0gaXMgbm90IHNl
dAogIyBDT05GSUdfSFZNX0ZFUCBpcyBub3Qgc2V0Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
