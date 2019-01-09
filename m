From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH for-4.12] x86/p2m: fix p2m_finish_type_change()
Date: Wed,  9 Jan 2019 12:41:06 +0200
Message-ID: <1547030466-3547-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mb6b=PR=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1ghBIS-0004Bs-95
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 10:41:16 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: wei.liu2@citrix.com, Razvan Cojocaru <rcojocaru@bitdefender.com>, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

ZmluaXNoX3R5cGVfY2hhbmdlKCkgcmV0dXJucyBhIG5lZ2F0aXZlIGludCBvbiBlcnJvciwgYnV0
IHRoZQpjdXJyZW50IGNvZGUgY2hlY2tzIGlmICggIXJjICkuIEFsc28gcHJvcGVybHkgaW5kZW50
IHRoZSBvdXQ6CmxhYmVsIHdoaWxlIGF0IGl0LgoKU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9j
YXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0u
YyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9t
bS9wMm0uYwppbmRleCA1NDUxZjE2Li5lMDhmNmIxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
bW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC0xMTc2LDcgKzExNzYsNyBA
QCBpbnQgcDJtX2ZpbmlzaF90eXBlX2NoYW5nZShzdHJ1Y3QgZG9tYWluICpkLAogCiAgICAgcmMg
PSBmaW5pc2hfdHlwZV9jaGFuZ2UoaG9zdHAybSwgZmlyc3RfZ2ZuLCBtYXhfbnIpOwogCi0gICAg
aWYgKCAhcmMgKQorICAgIGlmICggcmMgPCAwICkKICAgICAgICAgZ290byBvdXQ7CiAKICNpZmRl
ZiBDT05GSUdfSFZNCkBAIC0xMTkzLDEzICsxMTkzLDEzIEBAIGludCBwMm1fZmluaXNoX3R5cGVf
Y2hhbmdlKHN0cnVjdCBkb21haW4gKmQsCiAgICAgICAgICAgICAgICAgcmMgPSBmaW5pc2hfdHlw
ZV9jaGFuZ2UoYWx0cDJtLCBmaXJzdF9nZm4sIG1heF9ucik7CiAgICAgICAgICAgICAgICAgcDJt
X3VubG9jayhhbHRwMm0pOwogCi0gICAgICAgICAgICAgICAgaWYgKCAhcmMgKQorICAgICAgICAg
ICAgICAgIGlmICggcmMgPCAwICkKICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7CiAgICAg
ICAgICAgICB9CiAgICAgfQogI2VuZGlmCiAKLW91dDoKKyBvdXQ6CiAgICAgcDJtX3VubG9jayho
b3N0cDJtKTsKIAogICAgIHJldHVybiByYzsKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
