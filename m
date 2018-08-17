From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 33/34] x86/pvshim: disable HVM for PV shim
Date: Fri, 17 Aug 2018 16:12:51 +0100
Message-ID: <c328064fe2e585b7b6339b5e330ea64c9b0aec51.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqggC-0001ZH-1Z
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:28:48 +0000
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy9m
aXJtd2FyZS94ZW4tZGlyL3NoaW0uY29uZmlnIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUveGVu
LWRpci9zaGltLmNvbmZpZyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvc2hpbS5jb25maWcKaW5k
ZXggMjFkNzA3NS4uZGU1M2RmZSAxMDA2NDQKLS0tIGEvdG9vbHMvZmlybXdhcmUveGVuLWRpci9z
aGltLmNvbmZpZworKysgYi90b29scy9maXJtd2FyZS94ZW4tZGlyL3NoaW0uY29uZmlnCkBAIC0x
Miw3ICsxMiw3IEBAIENPTkZJR19BUkNIX0RFRkNPTkZJRz0iYXJjaC94ODYvY29uZmlncy94ODZf
NjRfZGVmY29uZmlnIgogQ09ORklHX05SX0NQVVM9MzIKIENPTkZJR19QVj15CiBDT05GSUdfUFZf
TElORUFSX1BUPXkKLUNPTkZJR19IVk09eQorIyBDT05GSUdfSFZNIGlzIG5vdCBzZXQKICMgQ09O
RklHX1NIQURPV19QQUdJTkcgaXMgbm90IHNldAogIyBDT05GSUdfQklHTUVNIGlzIG5vdCBzZXQK
ICMgQ09ORklHX0hWTV9GRVAgaXMgbm90IHNldAotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
