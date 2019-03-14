From: Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH L1TF v10 8/8] common/domain: block speculative
 out-of-bound accesses
Date: Thu, 14 Mar 2019 13:50:11 +0100
Message-ID: <1552567811-5301-9-git-send-email-nmanthey@amazon.de>
References: <1552567811-5301-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MyZm=RR=amazon.de=prvs=96908ba04=nmanthey@srs-us1.protection.inumbo.net>)
 id 1h4Prq-0000fE-3u
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 12:53:50 +0000
In-Reply-To: <1552567811-5301-1-git-send-email-nmanthey@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBpc3N1aW5nIGEgdmNwdV9vcCBoeXBlcmNhbGwsIGd1ZXN0cyBoYXZlIGNvbnRyb2wgb3Zl
ciB0aGUKdmNwdWlkIHZhcmlhYmxlLiBJbiB0aGUgb2xkIGNvZGUsIHRoaXMgYWxsb3dlZCB0byBw
ZXJmb3JtCnNwZWN1bGF0aXZlIG91dC1vZi1ib3VuZCBhY2Nlc3Nlcy4gVG8gYmxvY2sgdGhpcywg
d2UgbWFrZSB1c2UKb2YgdGhlIGRvbWFpbl92Y3B1IGZ1bmN0aW9uLgoKVGhpcyBpcyBwYXJ0IG9m
IHRoZSBzcGVjdWxhdGl2ZSBoYXJkZW5pbmcgZWZmb3J0LgoKU2lnbmVkLW9mZi1ieTogTm9yYmVy
dCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Ci0tLQogeGVuL2NvbW1vbi9kb21haW4uYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jCi0tLSBh
L3hlbi9jb21tb24vZG9tYWluLmMKKysrIGIveGVuL2NvbW1vbi9kb21haW4uYwpAQCAtMTM2NSw3
ICsxMzY1LDcgQEAgbG9uZyBkb192Y3B1X29wKGludCBjbWQsIHVuc2lnbmVkIGludCB2Y3B1aWQs
IFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQogICAgIHN0cnVjdCB2Y3B1ICp2Owog
ICAgIGxvbmcgcmMgPSAwOwogCi0gICAgaWYgKCB2Y3B1aWQgPj0gZC0+bWF4X3ZjcHVzIHx8ICh2
ID0gZC0+dmNwdVt2Y3B1aWRdKSA9PSBOVUxMICkKKyAgICBpZiAoICh2ID0gZG9tYWluX3ZjcHUo
ZCwgdmNwdWlkKSkgPT0gTlVMTCApCiAgICAgICAgIHJldHVybiAtRU5PRU5UOwogCiAgICAgc3dp
dGNoICggY21kICkKLS0gCjIuNy40CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1h
bnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENo
cmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpF
aW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
