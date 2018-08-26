From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 06/23] x86: don't call vpci function in
 physdev_op when !CONFIG_HAS_VPCI
Date: Sun, 26 Aug 2018 13:19:39 +0100
Message-ID: <9ba265aa00b8a2c0a97d192e267b237110c672a4.1535285866.git-series.wei.liu2@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gpvm=lj=citrix.com=prvs=769521655=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftu1T-0007E7-2B
 for xen-devel@lists.xenproject.org; Sun, 26 Aug 2018 12:20:03 +0000
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

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvcGh5c2Rldi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMgYi94ZW4vYXJjaC94ODYvcGh5c2Rl
di5jCmluZGV4IGI4N2VjOTAuLmFmN2ZkODQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9waHlz
ZGV2LmMKKysrIGIveGVuL2FyY2gveDg2L3BoeXNkZXYuYwpAQCAtNTU3LDYgKzU1Nyw3IEBAIHJl
dF90IGRvX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBh
cmcpCiAKICAgICAgICAgcmV0ID0gcGNpX21tY2ZnX3Jlc2VydmVkKGluZm8uYWRkcmVzcywgaW5m
by5zZWdtZW50LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5mby5zdGFydF9i
dXMsIGluZm8uZW5kX2J1cywgaW5mby5mbGFncyk7CisjaWZkZWYgQ09ORklHX0hBU19WUENJCiAg
ICAgICAgIGlmICggIXJldCAmJiBoYXNfdnBjaShjdXJyZCkgKQogICAgICAgICB7CiAgICAgICAg
ICAgICAvKgpAQCAtNTY3LDYgKzU2OCw3IEBAIHJldF90IGRvX3BoeXNkZXZfb3AoaW50IGNtZCwg
WEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW5mby5zdGFydF9idXMsIGluZm8uZW5kX2J1cywKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbmZvLnNlZ21lbnQp
OwogICAgICAgICB9CisjZW5kaWYKIAogICAgICAgICBicmVhazsKICAgICB9Ci0tIApnaXQtc2Vy
aWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
