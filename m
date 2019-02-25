From: Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH L1TF v8 8/9] x86/hvm: add nospec to hvmop param
Date: Mon, 25 Feb 2019 14:34:42 +0100
Message-ID: <1551101683-996-9-git-send-email-nmanthey@amazon.de>
References: <1551101683-996-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9cCv=RA=amazon.de=prvs=952b5b9ed=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gyGSR-0007Qt-K6
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 13:38:11 +0000
In-Reply-To: <1551101683-996-1-git-send-email-nmanthey@amazon.de>
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
Ck5vdGVzOgogIHY4OiBkcm9wIGEuaW5kZXggdXBkYXRlIGJlZm9yZSBibG9ja19zcGVjdWxhdGlv
bgogICAgICBpbXByb3ZlIGNvbW1lbnRzCgogeGVuL2FyY2gveDg2L2h2bS9odm0uYyB8IDEwICsr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKLS0tIGEveGVu
L2FyY2gveDg2L2h2bS9odm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCkBAIC00MTA5
LDYgKzQxMDksMTEgQEAgc3RhdGljIGludCBodm1vcF9zZXRfcGFyYW0oCiAgICAgaWYgKCBhLmlu
ZGV4ID49IEhWTV9OUl9QQVJBTVMgKQogICAgICAgICByZXR1cm4gLUVJTlZBTDsKIAorICAgIC8q
CisgICAgICogTWFrZSBzdXJlIHRoZSBhYm92ZSBib3VuZCBjaGVjayBpcyBub3QgYnlwYXNzZWQg
ZHVyaW5nIHNwZWN1bGF0aW9uLgorICAgICAqLworICAgIGJsb2NrX3NwZWN1bGF0aW9uKCk7CisK
ICAgICBkID0gcmN1X2xvY2tfZG9tYWluX2J5X2FueV9pZChhLmRvbWlkKTsKICAgICBpZiAoIGQg
PT0gTlVMTCApCiAgICAgICAgIHJldHVybiAtRVNSQ0g7CkBAIC00Mzc1LDYgKzQzODAsMTEgQEAg
c3RhdGljIGludCBodm1vcF9nZXRfcGFyYW0oCiAgICAgaWYgKCBhLmluZGV4ID49IEhWTV9OUl9Q
QVJBTVMgKQogICAgICAgICByZXR1cm4gLUVJTlZBTDsKIAorICAgIC8qCisgICAgICogTWFrZSBz
dXJlIHRoZSBhYm92ZSBib3VuZCBjaGVjayBpcyBub3QgYnlwYXNzZWQgZHVyaW5nIHNwZWN1bGF0
aW9uLgorICAgICAqLworICAgIGJsb2NrX3NwZWN1bGF0aW9uKCk7CisKICAgICBkID0gcmN1X2xv
Y2tfZG9tYWluX2J5X2FueV9pZChhLmRvbWlkKTsKICAgICBpZiAoIGQgPT0gTlVMTCApCiAgICAg
ICAgIHJldHVybiAtRVNSQ0g7Ci0tIAoyLjcuNAoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRl
ciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVo
cmVyOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoClVzdC1JRDogREUgMjg5IDIz
NyA4NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3
MyBCCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
