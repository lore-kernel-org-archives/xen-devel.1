From: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v1] xen: creating debug info is optional
Date: Thu, 30 Aug 2018 17:10:54 +0200
Message-ID: <20180830151054.30766-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ntoh=ln=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fvOb8-0006Qh-FK
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 15:11:03 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien.grall@arm.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>
List-Id: xen-devel@lists.xenproject.org

Q3JlYXRpbmcgZGVidWcgaW5mbyBkdXJpbmcgYnVpbGQgaXMgbm90IHN0cmljdGx5IHJlcXVpcmVk
IGF0IHJ1bnRpbWUuCk1ha2UgaXQgb3B0aW9uYWwgYnkgcmV1c2luZyB0aGUgZXhpc3RpbmcgJ2Rl
YnVnX3N5bWJvbHM9bicga25vYi4KVGhpcyBzbGlnaHRseSByZWR1Y2VzIGJ1aWxkIHRpbWUgYW5k
IGRpc2t1c2FnZSwgaWYgc3BlY2lmaWVkLgoKU2lnbmVkLW9mZi1ieTogT2xhZiBIZXJpbmcgPG9s
YWZAYWVwZmxlLmRlPgotLS0KIHhlbi9SdWxlcy5tayB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vUnVsZXMu
bWsgYi94ZW4vUnVsZXMubWsKaW5kZXggNDdjOTU0NDI1ZC4uNzQwYjAyMzVlMSAxMDA2NDQKLS0t
IGEveGVuL1J1bGVzLm1rCisrKyBiL3hlbi9SdWxlcy5tawpAQCAtNTUsNyArNTUsMTAgQEAgZW5k
aWYKIAogQ0ZMQUdTICs9IC1ub3N0ZGluYyAtZm5vLWJ1aWx0aW4gLWZuby1jb21tb24KIENGTEFH
UyArPSAtV2Vycm9yIC1XcmVkdW5kYW50LWRlY2xzIC1Xbm8tcG9pbnRlci1hcml0aAotQ0ZMQUdT
ICs9IC1waXBlIC1nIC1EX19YRU5fXyAtaW5jbHVkZSAkKEJBU0VESVIpL2luY2x1ZGUveGVuL2Nv
bmZpZy5oCitpZmVxICgkKGRlYnVnX3N5bWJvbHMpLHkpCitDRkxBR1MgKz0gLWcKK2VuZGlmCitD
RkxBR1MgKz0gLXBpcGUgLURfX1hFTl9fIC1pbmNsdWRlICQoQkFTRURJUikvaW5jbHVkZS94ZW4v
Y29uZmlnLmgKIENGTEFHUyArPSAnLURfX09CSkVDVF9GSUxFX189IiRAIicKIAogaWZuZXEgKCQo
Y2xhbmcpLHkpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
