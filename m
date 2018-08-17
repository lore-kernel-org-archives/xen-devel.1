From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 03/34] x86: HVM_FEP should depend on HVM
Date: Fri, 17 Aug 2018 16:12:21 +0100
Message-ID: <8b7fbb41ea284132f3602585557d74c40fbebad6.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqgQr-0007yM-Ez
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:12:57 +0000
In-Reply-To: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
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

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvS2NvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L0tjb25maWcgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwppbmRl
eCA2M2IyODZhLi5iYTVjYjYyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZworKysg
Yi94ZW4vYXJjaC94ODYvS2NvbmZpZwpAQCAtOTQsNiArOTQsNyBAQCBjb25maWcgQklHTUVNCiBj
b25maWcgSFZNX0ZFUAogCWJvb2wgIkhWTSBGb3JjZWQgRW11bGF0aW9uIFByZWZpeCBzdXBwb3J0
IiBpZiBFWFBFUlQgPSAieSIKIAlkZWZhdWx0IERFQlVHCisJZGVwZW5kcyBvbiBIVk0KIAktLS1o
ZWxwLS0tCiAKIAkgIENvbXBpbGVzIGluIGEgZmVhdHVyZSB0aGF0IGFsbG93cyBIVk0gZ3Vlc3Qg
dG8gYXJiaXRyYXJpbHkKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
