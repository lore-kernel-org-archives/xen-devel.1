From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/5] power: ssh: Fix handling of $delay
Date: Fri, 25 Jan 2019 14:50:43 +0000
Message-ID: <20190125145046.27138-3-ian.jackson@eu.citrix.com>
References: <20190125145046.27138-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1alE=QB=citrix.com=prvs=9210a8ee7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gn2or-00081P-SB
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 14:50:57 +0000
In-Reply-To: <20190125145046.27138-1-ian.jackson@eu.citrix.com>
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

VGhlIHNjcmlwdCBmcmFnbWVudCBjb250YWlucyBhIHJlZmVyZW5jZSB0byAkZGVsYXkgd2hpY2gg
aXMgYSBwZXJsCnZhcmlhYmxlLCBub3QgYSB2YXJpYWJsZSBpbiB0aGUgc2NyaXB0IGZyYWdtZW50
LiAgV2UgdGhlcmVmb3JlIG5lZWQgdG8Kbm90ICcnLXF1b3RlIHRoZSBzY3JpcHQuCgpXaXRob3V0
IHRoaXMsIHRoZSBzc2ggbWV0aG9kIHdpbGwgb2Z0ZW4gZmFpbCBzcHVyaW91c2x5OiB0aGUgZXhp
dGluZwpwYXJlbnQgKHdoaWNoIHdpbGwgc2lnbmFsIHN1Y2Nlc3MgYmFjayB0byB0aGUgb3NzdGVz
dCBjb250cm9sbGVyKQpyYWNlcyB3aXRoIHRoZSBhdHRlbXB0IHRvIHJlYm9vdC4KClNpZ25lZC1v
ZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rl
c3QvUERVL3NzaC5wbSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvUERVL3NzaC5wbSBiL09zc3Rlc3QvUERV
L3NzaC5wbQppbmRleCBhYzFlYjkxOS4uY2ZjZjhmODUgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvUERV
L3NzaC5wbQorKysgYi9Pc3N0ZXN0L1BEVS9zc2gucG0KQEAgLTQ3LDcgKzQ3LDcgQEAgc3ViIHBk
dV9wb3dlcl9zdGF0ZSB7CiAKICAgICBteSAkZGVsYXkgPSA1OwogCi0gICAgdGFyZ2V0X2NtZF9y
b290KCRtby0+e0hvc3R9LCA8PCdFTkQnLCA2MCk7CisgICAgdGFyZ2V0X2NtZF9yb290KCRtby0+
e0hvc3R9LCA8PEVORCwgNjApOwogIHNldCAtZQogIHR5cGUgcmVib290CiAgZXhlYyA+Pi92YXIv
bG9nL29zc3Rlc3QtcmVib290LmxvZwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
