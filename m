From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 2/2] x86/pvshim: use 2M alignment
Date: Mon, 18 Mar 2019 14:57:19 +0000
Message-ID: <20190318145719.11396-3-wei.liu2@citrix.com>
References: <20190318145719.11396-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Lai=RV=citrix.com=prvs=973c34550=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h5thh-000814-W2
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 14:57:30 +0000
In-Reply-To: <20190318145719.11396-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHB2c2hpbSBpcyBsb2FkZWQgZGlyZWN0bHkgYnkgdG9vbHN0YWNrLiBVc2UgMk0gYWxpZ25t
ZW50IGZvcgpwb3RlbnRpYWwgYmV0dGVyIHBlcmZvcm1hbmNlLgoKU2lnbmVkLW9mZi1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvY29uZmlncy9wdnNo
aW1fZGVmY29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmlnIGIveGVuL2FyY2gv
eDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZpZwppbmRleCBhMTJlM2QwNDY1Li44ZTUwYjYwY2Rh
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmlnCisrKyBi
L3hlbi9hcmNoL3g4Ni9jb25maWdzL3B2c2hpbV9kZWZjb25maWcKQEAgLTUsNiArNSw3IEBAIENP
TkZJR19QVkhfR1VFU1Q9eQogQ09ORklHX1BWX1NISU09eQogQ09ORklHX1BWX1NISU1fRVhDTFVT
SVZFPXkKIENPTkZJR19OUl9DUFVTPTMyCitDT05GSUdfWEVOX0FMSUdOXzJNPXkKICMgRGlzYWJs
ZSBmZWF0dXJlcyBub3QgdXNlZCBieSB0aGUgUFYgc2hpbQogIyBDT05GSUdfU0hBRE9XX1BBR0lO
RyBpcyBub3Qgc2V0CiAjIENPTkZJR19CSUdNRU0gaXMgbm90IHNldAotLSAKMi4yMC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
