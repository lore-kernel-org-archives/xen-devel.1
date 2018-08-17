From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 09/34] x86: guard HAS_VPCI with CONFIG_HVM
Date: Fri, 17 Aug 2018 16:12:27 +0100
Message-ID: <9e2d183567933c28cf559ca99a9887e812f0f001.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqgQs-0007yt-So
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:12:58 +0000
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

VlBDSSBpcyBvbmx5IHVzZWZ1bCBmb3IgUFZIIC8gSFZNIGd1ZXN0cy4gSWRlYWxseSBDT05GSUdf
SFZNIHNob3VsZAppbXBseSAhUFZfU0hJTV9FWENMVVNJVkUsIGJ1dCB3ZSBzdGlsbCB3YW50IHRv
IGJ1aWxkIFBWX1NISU1fRVhDTFVTSVZFCndpdGggQ09ORklHX0hWTSBhdCB0aGlzIHN0YWdlIGJl
Y2F1c2UgYSBsb3Qgb2YgdGhpbmdzIGFyZSBzdGlsbAplbnRhbmdsZWQuCgpTaWduZWQtb2ZmLWJ5
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9LY29uZmln
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L0tjb25maWcgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwpp
bmRleCBiYTVjYjYyLi43M2FiOGY4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZwor
KysgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwpAQCAtMjMsNyArMjMsNyBAQCBjb25maWcgWDg2CiAJ
c2VsZWN0IEhBU19QQ0kKIAlzZWxlY3QgSEFTX1BEWAogCXNlbGVjdCBIQVNfVUJTQU4KLQlzZWxl
Y3QgSEFTX1ZQQ0kgaWYgIVBWX1NISU1fRVhDTFVTSVZFCisJc2VsZWN0IEhBU19WUENJIGlmICFQ
Vl9TSElNX0VYQ0xVU0lWRSAmJiBIVk0KIAlzZWxlY3QgTkVFRFNfTElCRUxGCiAJc2VsZWN0IE5V
TUEKIAotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
