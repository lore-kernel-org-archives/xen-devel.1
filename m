From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH] cr-ensure-disk-space: Actually quit
 before taking lock if all is well
Date: Thu, 5 Apr 2018 15:39:51 +0100
Message-ID: <1522939191-22350-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/x8/=g2=citrix.com=prvs=6261e79ed=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f463V-0004JY-DH
 for xen-devel@lists.xenproject.org; Thu, 05 Apr 2018 14:40:01 +0000
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

NWQyNDY2ZGMwZjI2ICJjci1lbnN1cmUtZGlzay1zcGFjZTogQ29ycmVjdCBzdGRvdXQgb3V0cHV0
IiB3YXMKc3VwcG9zZWQgdG8gY2hhbmdlIGFuIGBleGl0IDAnIGludG8gYSBgcXVpdF9vaycgYnV0
IGVycm9uZW91c2x5CmNoYW5nZWQgaXQgaW50byBgY2hlY2tfc3BhY2UnLiAgRml4IHRoaXMuCgpT
aWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0t
CiBjci1lbnN1cmUtZGlzay1zcGFjZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2NyLWVuc3VyZS1kaXNrLXNwYWNlIGIv
Y3ItZW5zdXJlLWRpc2stc3BhY2UKaW5kZXggOGQzZDQ0My4uNzA5MTMxNCAxMDA3NTUKLS0tIGEv
Y3ItZW5zdXJlLWRpc2stc3BhY2UKKysrIGIvY3ItZW5zdXJlLWRpc2stc3BhY2UKQEAgLTc5LDcg
Kzc5LDcgQEAgc3ViIHF1aXRfb2sgKCkgewogCiAkfD0xOwogCi1jaGVja19zcGFjZSBpZiBjaGVj
a19zcGFjZTsKK3F1aXRfb2sgaWYgY2hlY2tfc3BhY2U7CiAKIHByaW50ICJ0YWtpbmcgbG9jay4u
LiI7CiAKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
