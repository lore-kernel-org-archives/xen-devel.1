From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 15/17] x86: expose CONFIG_PV
Date: Thu, 4 Oct 2018 16:43:34 +0100
Message-ID: <7d4d6dc6e34b577c645dc950e0fe0cf2ebccaa64.1538667753.git-series.wei.liu2@citrix.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a7fh=mq=citrix.com=prvs=808c92aaa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g861Q-0007Kb-0G
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 15:58:40 +0000
In-Reply-To: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
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
aC94ODYvS2NvbmZpZyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvS2NvbmZpZyBiL3hlbi9hcmNoL3g4Ni9LY29u
ZmlnCmluZGV4IDU0OGNiZjkuLjk1NTQ0M2YgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9LY29u
ZmlnCisrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCkBAIC0zNyw2ICszNywxNCBAQCBzb3VyY2Ug
ImFyY2gvS2NvbmZpZyIKIAogY29uZmlnIFBWCiAJZGVmX2Jvb2wgeQorCXByb21wdCAiUFYgc3Vw
cG9ydCIKKwktLS1oZWxwLS0tCisJICBJbnRlcmZhY2VzIHRvIHN1cHBvcnQgUFYgZ3Vlc3RzIHdo
aWNoIGRvbid0IHJlcXVpcmUgaGFyZHdhcmUKKwkgIHN1cHBvcnQgbGlrZSBJbnRlbCdzIFZULXgg
b3IgQU1EJ3MgU1ZNLgorCisJICBUaGlzIG9wdGlvbiBpcyBuZWVkZWQgaWYgeW91IHdhbnQgdG8g
cnVuIFBWIGd1ZXN0cy4KKworCSAgSWYgdW5zdXJlLCBzYXkgWS4KIAogY29uZmlnIFBWX0xJTkVB
Ul9QVAogICAgICAgIGJvb2wgIlN1cHBvcnQgZm9yIFBWIGxpbmVhciBwYWdldGFibGVzIgotLSAK
Z2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
