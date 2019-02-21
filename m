From: Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH SpectreV1+L1TF v7 8/9] x86/hvm: add nospec to
 hvmop param
Date: Thu, 21 Feb 2019 09:16:42 +0100
Message-ID: <1550737003-25779-9-git-send-email-nmanthey@amazon.de>
References: <1550737003-25779-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rINu=Q4=amazon.de=prvs=9484abbec=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gwjeY-00023E-Q0
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 08:24:22 +0000
In-Reply-To: <1550737003-25779-1-git-send-email-nmanthey@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

VGhlIHBhcmFtcyBhcnJheSBpbiBodm0gY2FuIGJlIGFjY2Vzc2VkIHdpdGggZ2V0IGFuZCBzZXQg
ZnVuY3Rpb25zLgpBcyB0aGUgaW5kZXggaXMgZ3Vlc3QgY29udHJvbGxlZCwgbWFrZSBzdXJlIG5v
IG91dC1vZi1ib3VuZCBhY2Nlc3NlcwpjYW4gYmUgcGVyZm9ybWVkLgoKQXMgd2UgY2Fubm90IGlu
Zmx1ZW5jZSBob3cgZnV0dXJlIGNvbXBpbGVycyBtaWdodCBtb2RpZnkgdGhlCmluc3RydWN0aW9u
cyB0aGF0IGVuZm9yY2UgdGhlIGJvdW5kcywgd2UgZnVydGhlcm1vcmUgYmxvY2sgc3BlY3VsYXRp
b24sCnNvIHRoYXQgdGhlIHVwZGF0ZSBpcyB2aXNpYmxlIGluIHRoZSBhcmNoaXRlY3R1cmFsIHN0
YXRlLgoKVGhpcyBpcyBwYXJ0IG9mIHRoZSBzcGVjdWxhdGl2ZSBoYXJkZW5pbmcgZWZmb3J0LgoK
U2lnbmVkLW9mZi1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+CgotLS0K
Ck5vdGVzOgogIHY3OiBhZGQgc3BlY3VsYXRpdmUgaGFyZGVuaW5nIHRvIGNvbW1pdCBtZXNzYWdl
CiAgICAgIGFkZCBsZmVuY2UgdG8gYS5pbmRleCB1cGRhdGVzIChvdGhlciBwYXJ0cyBvZiB0aGF0
IGNvbW1pdCBoYXZlCiAgICAgICAgICBiZWVuIGNvbW1pdHRlZCBhbHJlYWR5KQoKIHhlbi9hcmNo
L3g4Ni9odm0vaHZtLmMgfCAxNCArKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2Fy
Y2gveDg2L2h2bS9odm0uYwotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vaHZtLmMKQEAgLTQxMDksNiArNDEwOSwxMyBAQCBzdGF0aWMgaW50IGh2bW9w
X3NldF9wYXJhbSgKICAgICBpZiAoIGEuaW5kZXggPj0gSFZNX05SX1BBUkFNUyApCiAgICAgICAg
IHJldHVybiAtRUlOVkFMOwogCisgICAgLyoKKyAgICAgKiBNYWtlIHN1cmUgdGhlIGd1ZXN0IGNv
bnRyb2xsZWQgdmFsdWUgYS5pbmRleCBpcyBib3VuZGVkIGV2ZW4gZHVyaW5nCisgICAgICogc3Bl
Y3VsYXRpdmUgZXhlY3V0aW9uLgorICAgICAqLworICAgIGEuaW5kZXggPSBhcnJheV9pbmRleF9u
b3NwZWMoYS5pbmRleCwgSFZNX05SX1BBUkFNUyk7CisgICAgYmxvY2tfc3BlY3VsYXRpb24oKTsK
KwogICAgIGQgPSByY3VfbG9ja19kb21haW5fYnlfYW55X2lkKGEuZG9taWQpOwogICAgIGlmICgg
ZCA9PSBOVUxMICkKICAgICAgICAgcmV0dXJuIC1FU1JDSDsKQEAgLTQzNzUsNiArNDM4MiwxMyBA
QCBzdGF0aWMgaW50IGh2bW9wX2dldF9wYXJhbSgKICAgICBpZiAoIGEuaW5kZXggPj0gSFZNX05S
X1BBUkFNUyApCiAgICAgICAgIHJldHVybiAtRUlOVkFMOwogCisgICAgLyoKKyAgICAgKiBNYWtl
IHN1cmUgdGhlIGd1ZXN0IGNvbnRyb2xsZWQgdmFsdWUgYS5pbmRleCBpcyBib3VuZGVkIGV2ZW4g
ZHVyaW5nCisgICAgICogc3BlY3VsYXRpdmUgZXhlY3V0aW9uLgorICAgICAqLworICAgIGEuaW5k
ZXggPSBhcnJheV9pbmRleF9ub3NwZWMoYS5pbmRleCwgSFZNX05SX1BBUkFNUyk7CisgICAgYmxv
Y2tfc3BlY3VsYXRpb24oKTsKKwogICAgIGQgPSByY3VfbG9ja19kb21haW5fYnlfYW55X2lkKGEu
ZG9taWQpOwogICAgIGlmICggZCA9PSBOVUxMICkKICAgICAgICAgcmV0dXJuIC1FU1JDSDsKLS0g
CjIuNy40CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vu
c3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hsYWVn
ZXIsIFJhbGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBhbSBB
bXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
