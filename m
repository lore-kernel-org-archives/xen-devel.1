From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 21/23] x86: expose CONFIG_HVM
Date: Sun, 26 Aug 2018 13:19:54 +0100
Message-ID: <2e3eb53f8cc359ece0f19647247a5911fc6f003b.1535285866.git-series.wei.liu2@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gpvm=lj=citrix.com=prvs=769521655=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftu9n-0000W5-2k
 for xen-devel@lists.xenproject.org; Sun, 26 Aug 2018 12:28:39 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCnYyOiB1c2Ug
dGFiIHRvIGluZGVudAoKSGF2ZW4ndCBhZGRlZCBhIGRlcGVuZGVuY3kgb24gUFZfU0hJTV9FWENM
VVNJVkUgYmVjYXVzZSBhZ3JlZW1lbnQgaXMKbm90IHlldCByZWFjaGVkLgotLS0KIHhlbi9hcmNo
L3g4Ni9LY29uZmlnIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvS2NvbmZpZyBiL3hlbi9hcmNoL3g4Ni9LY29uZmln
CmluZGV4IDczYWI4ZjguLjExNjM3ZTEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9LY29uZmln
CisrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCkBAIC02MCw2ICs2MCwxMiBAQCBjb25maWcgUFZf
TElORUFSX1BUCiAKIGNvbmZpZyBIVk0KIAlkZWZfYm9vbCB5CisJcHJvbXB0ICJIVk0gLyBQVkgg
c3VwcG9ydCIKKwktLS1oZWxwLS0tCisJICBJbnRlcmZhY2VzIHRvIHN1cHBvcnQgSFZNIGFuZCBQ
VkggZ3Vlc3RzLgorCisJICBJZiB1bnN1cmUsIHNheSBZLgorCiAKIGNvbmZpZyBTSEFET1dfUEFH
SU5HCiAgICAgICAgIGJvb2wgIlNoYWRvdyBQYWdpbmciCi0tIApnaXQtc2VyaWVzIDAuOS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
