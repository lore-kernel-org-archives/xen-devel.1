From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 04/10] README.dev: Discuss setting
 Firmware for UEFI machines
Date: Thu, 17 May 2018 12:16:53 +0100
Message-ID: <1526555819-29883-5-git-send-email-ian.jackson@eu.citrix.com>
References: <1526555819-29883-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sats=ie=citrix.com=prvs=668e6091f=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fJGub-0001pM-Ku
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 11:17:33 +0000
In-Reply-To: <1526555819-29883-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBtdXN0IG9jY3VyIGJlZm9yZSBta25ldGJvb3RkaXIsIG9yIG1rbmV0Ym9vdGRpciBkb2Vz
IG5vdCBzZXQKdGhpbmdzIHVwIGZvciBVRUZJIGJvb3RpbmcuCgpTaWduZWQtb2ZmLWJ5OiBJYW4g
SmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBSRUFETUUuZGV2IHwgNiAr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9SRUFETUUuZGV2IGIvUkVBRE1FLmRldgppbmRleCAwZjdmY2NkLi5hMmI5M2Uw
IDEwMDY0NAotLS0gYS9SRUFETUUuZGV2CisrKyBiL1JFQURNRS5kZXYKQEAgLTk3LDcgKzk3LDEx
IEBAIEZvciBleGFtcGxlLCBvbmUgbWlnaHQgbmVlZCBzb21ldGhpbmcgbGlrZSB0aGlzOgogKE1h
bnkgb2YgdGhlc2UgdGhpbmdzIGFyZSBub3QgbmVlZGVkIGluIE1hc3NhY2h1c2V0dHMgYXMgdGhl
IGFuc2libGUKIHBsYXlib29rIHdpbGwgcHJvdmlkZSBpdCB2aWEgYW4gYXV0b2dlbmVyYXRlZCBj
b25maWcgZmlsZSAtIHNlZSBhYm92ZS4pCiAKLUNyZWF0ZSB0aGUgdGZ0cCBkaXJlY3Rvcnk6CitT
ZXQgdGhlIGZpcm13YXJlLCBpZiBpdCdzIFVFRkk6CisKKyAkIC4vbWctaG9zdHMgc2V0cHJvcHMg
YWxiYW5hezAsMX0gLS0gRmlybXdhcmUgdWVmaQorCitDcmVhdGUgdGhlIHRmdHAgZGlyZWN0b3J5
IChtdXN0IGJlIGRvbmUgYWZ0ZXIgZmlybXdhcmUgaXMgc2V0KToKIAogICQgLi9tZy1ob3N0cyBt
a25ldGJvb3RkaXIgbXVkY2FrZXswLDF9CiAKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
