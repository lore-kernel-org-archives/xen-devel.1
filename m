From: Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH L1TF v10 6/8] x86/hvm: add nospec to hvmop param
Date: Thu, 14 Mar 2019 13:50:09 +0100
Message-ID: <1552567811-5301-7-git-send-email-nmanthey@amazon.de>
References: <1552567811-5301-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MyZm=RR=amazon.de=prvs=96908ba04=nmanthey@srs-us1.protection.inumbo.net>)
 id 1h4PrV-0000WM-BG
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 12:53:29 +0000
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

VGhlIHBhcmFtcyBhcnJheSBpbiBodm0gY2FuIGJlIGFjY2Vzc2VkIHdpdGggZ2V0IGFuZCBzZXQg
ZnVuY3Rpb25zLgpBcyB0aGUgaW5kZXggaXMgZ3Vlc3QgY29udHJvbGxlZCwgbWFrZSBzdXJlIG5v
IG91dC1vZi1ib3VuZCBhY2Nlc3NlcwpjYW4gYmUgcGVyZm9ybWVkLgoKQXMgd2UgY2Fubm90IGlu
Zmx1ZW5jZSBob3cgZnV0dXJlIGNvbXBpbGVycyBtaWdodCBtb2RpZnkgdGhlCmluc3RydWN0aW9u
cyB0aGF0IGVuZm9yY2UgdGhlIGJvdW5kcywgd2UgZnVydGhlcm1vcmUgYmxvY2sgc3BlY3VsYXRp
b24sCnNvIHRoYXQgdGhlIHVwZGF0ZSBpcyB2aXNpYmxlIGluIHRoZSBhcmNoaXRlY3R1cmFsIHN0
YXRlLgoKVGhpcyBpcyBwYXJ0IG9mIHRoZSBzcGVjdWxhdGl2ZSBoYXJkZW5pbmcgZWZmb3J0LgoK
U2lnbmVkLW9mZi1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+CkFja2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0KIHhlbi9hcmNoL3g4Ni9o
dm0vaHZtLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5j
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0u
YwpAQCAtNDEzNSw2ICs0MTM1LDkgQEAgc3RhdGljIGludCBodm1vcF9zZXRfcGFyYW0oCiAgICAg
aWYgKCBhLmluZGV4ID49IEhWTV9OUl9QQVJBTVMgKQogICAgICAgICByZXR1cm4gLUVJTlZBTDsK
IAorICAgIC8qIE1ha2Ugc3VyZSB0aGUgYWJvdmUgYm91bmQgY2hlY2sgaXMgbm90IGJ5cGFzc2Vk
IGR1cmluZyBzcGVjdWxhdGlvbi4gKi8KKyAgICBibG9ja19zcGVjdWxhdGlvbigpOworCiAgICAg
ZCA9IHJjdV9sb2NrX2RvbWFpbl9ieV9hbnlfaWQoYS5kb21pZCk7CiAgICAgaWYgKCBkID09IE5V
TEwgKQogICAgICAgICByZXR1cm4gLUVTUkNIOwpAQCAtNDQwMSw2ICs0NDA0LDkgQEAgc3RhdGlj
IGludCBodm1vcF9nZXRfcGFyYW0oCiAgICAgaWYgKCBhLmluZGV4ID49IEhWTV9OUl9QQVJBTVMg
KQogICAgICAgICByZXR1cm4gLUVJTlZBTDsKIAorICAgIC8qIE1ha2Ugc3VyZSB0aGUgYWJvdmUg
Ym91bmQgY2hlY2sgaXMgbm90IGJ5cGFzc2VkIGR1cmluZyBzcGVjdWxhdGlvbi4gKi8KKyAgICBi
bG9ja19zcGVjdWxhdGlvbigpOworCiAgICAgZCA9IHJjdV9sb2NrX2RvbWFpbl9ieV9hbnlfaWQo
YS5kb21pZCk7CiAgICAgaWYgKCBkID09IE5VTEwgKQogICAgICAgICByZXR1cm4gLUVTUkNIOwot
LSAKMi43LjQKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVz
ZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxh
ZWdlciwgUmFsZiBIZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFt
IEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
