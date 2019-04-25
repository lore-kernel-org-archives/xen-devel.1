From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 0/6] stretch fallout: run 32-bit
 builds on 64-bit Linux
Date: Thu, 25 Apr 2019 16:50:50 +0100
Message-ID: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JXZu=S3=citrix.com=prvs=011b70836=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hJgeO-0002o6-4d
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 15:51:04 +0000
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

TXkgcHJldmlvdXMgYXR0ZW1wdCBmYWlsZWQgYmVjYXVzZSBtYW55IGJ1aWxkIHN5c3RlbXMgbG9v
ayBhdCB1bmFtZQphbmQgZW5kIHVwIGNvbmZ1c2VkIGFib3V0IHRoZSBhcmNoaXRlY3R1cmUuICBJ
biB0aGlzIHYyIG9mIHRoZSBzZXJpZXMsCkkgdGFrZSBjb3VudGVybWVhc3VyZXMuCgpJYW4gSmFj
a3NvbiAoNik6CiAgdHMtc3lzbG9nLXNlcnZlcjogLS1uby1zdGRpbiBvcHRpb24KICBzZy1ydW4t
am9iLCB0cy1ob3N0LWluc3RhbGw6IE5ldyAtLWJ1aWxkIG9wdGlvbgogIG1nLXJlcHJvLXNldHVw
OiBGaXggcnVudmFyIGFkanVzdG1lbnQgc2hlbGwgc3ludGF4CiAgRGViaWFuOiBwcmVmZXJyZWQg
YXJjaDogSG9ub3VyIExpbnV4S2VyblByZWZlcnJlZEFyY2hJbmZvCiAgRGViaWFuOiBwcmVmZXJy
ZWQgYXJjaDogQXBwbHkgc2V0YXJjaCB0byBzc2hkCiAgYnVpbGRzOiBSdW4gaTM4NiBidWlsZHMg
b24gYW1kNjQga2VybmVscwoKIE9zc3Rlc3QvRGViaWFuLnBtIHwgNDcgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIG1nLXJlcHJvLXNldHVwICAgIHwgIDIg
Ky0KIHNnLXJ1bi1qb2IgICAgICAgIHwgIDIgKy0KIHRzLWhvc3QtaW5zdGFsbCAgIHwgIDkgKysr
KysrKysrCiB0cy1zeXNsb2ctc2VydmVyICB8IDEwICsrKysrKysrKy0KIDUgZmlsZXMgY2hhbmdl
ZCwgNjcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
