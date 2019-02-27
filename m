From: Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH L1TF v9 6/7] x86/hvm: add nospec to hvmop param
Date: Wed, 27 Feb 2019 17:13:39 +0100
Message-ID: <1551284020-7050-7-git-send-email-nmanthey@amazon.de>
References: <1551284020-7050-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=70d2=RC=amazon.de=prvs=954cd6bf9=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gz1t6-0006Gq-JP
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 16:16:52 +0000
In-Reply-To: <1551284020-7050-1-git-send-email-nmanthey@amazon.de>
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
U2lnbmVkLW9mZi1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+CkFja2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0KCk5vdGVzOgogIHY5OiBm
aXhlZCBpbmxpbmUgY29tbWVudHMKICAgICAgYWRkZWQgYWNrZWQtYnkKCiB4ZW4vYXJjaC94ODYv
aHZtL2h2bS5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9odm0u
YwotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZt
LmMKQEAgLTQxMzUsNiArNDEzNSw5IEBAIHN0YXRpYyBpbnQgaHZtb3Bfc2V0X3BhcmFtKAogICAg
IGlmICggYS5pbmRleCA+PSBIVk1fTlJfUEFSQU1TICkKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
CiAKKyAgICAvKiBNYWtlIHN1cmUgdGhlIGFib3ZlIGJvdW5kIGNoZWNrIGlzIG5vdCBieXBhc3Nl
ZCBkdXJpbmcgc3BlY3VsYXRpb24uICovCisgICAgYmxvY2tfc3BlY3VsYXRpb24oKTsKKwogICAg
IGQgPSByY3VfbG9ja19kb21haW5fYnlfYW55X2lkKGEuZG9taWQpOwogICAgIGlmICggZCA9PSBO
VUxMICkKICAgICAgICAgcmV0dXJuIC1FU1JDSDsKQEAgLTQ0MDEsNiArNDQwNCw5IEBAIHN0YXRp
YyBpbnQgaHZtb3BfZ2V0X3BhcmFtKAogICAgIGlmICggYS5pbmRleCA+PSBIVk1fTlJfUEFSQU1T
ICkKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAKKyAgICAvKiBNYWtlIHN1cmUgdGhlIGFib3Zl
IGJvdW5kIGNoZWNrIGlzIG5vdCBieXBhc3NlZCBkdXJpbmcgc3BlY3VsYXRpb24uICovCisgICAg
YmxvY2tfc3BlY3VsYXRpb24oKTsKKwogICAgIGQgPSByY3VfbG9ja19kb21haW5fYnlfYW55X2lk
KGEuZG9taWQpOwogICAgIGlmICggZCA9PSBOVUxMICkKICAgICAgICAgcmV0dXJuIC1FU1JDSDsK
LS0gCjIuNy40CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1
c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hs
YWVnZXIsIFJhbGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBh
bSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
