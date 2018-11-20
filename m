From: Norbert Manthey <nmanthey@amazon.de>
Subject: [faster-by-no-jump-table] retpoline: disable jump tables
Date: Tue, 20 Nov 2018 16:37:54 +0100
Message-ID: <1542728274-29599-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nl/l=n7=amazon.de=prvs=855626c38=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gP86e-00032z-CT
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 15:38:28 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "H . J . Lu" <hongjiu.lu@intel.com>, dwmw2@infradead.org, Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VG8gbWl0aWdhdGUgTWVsdGRvd24sIFhlbiBoYXMgYmVlbiBmaXhlZCB3aXRoIGEgc29mdHdhcmUg
Zml4LCBuYW1lbHkKdXNpbmcgcmV0cG9saW5lIHNlcXVlbmNlcyBnZW5lcmF0ZWQgYnkgdGhlIGNv
bXBpbGVyLiBUaGlzIHdheSwgaW5kaXJlY3QKYnJhbmNoZXMgYXJlIHByb3RlY3RlZCBhZ2FpbnN0
IHRoZSBhdHRhY2suCgpIb3dldmVyLCB0aGUgcmV0cG9saW5lIHNlcXVlbmNlIGNvbWVzIHdpdGgg
YSBzbG93IGRvd24uIFRvIG1ha2UgdXAgZm9yCnRoaXMsIHdlIHByb3Bvc2UgdG8gYXZvaWQganVt
cCB0YWJsZXMgaW4gdGhlIGZpcnN0IHBsYWNlLiBXaXRob3V0IHRoZQpyZXRwb2xpbmUgc2VxdWVu
Y2VzLCB0aGlzIGNvZGUgd291bGQgYmUgbGVzcyBlZmZpY2llbnQuIEhvd2V2ZXIsIHdoZW4KcmV0
cG9saW5lIGlzIGVuYWJsZWQsIHRoaXMgYWN0dWFsbHkgcmVzdWx0cyBpbiBhIHNsaWdodCBwZXJm
b3JtYW5jZQppbXByb3ZlbWVudC4KClRoaXMgY2hhbmdlIG1pZ2h0IGJlY29tZSBpcnJlbGV2YW50
IG9uY2UgdGhlIGNvbXBpbGVyIHN0YXJ0cyBhdm9pZGluZwpqdW1wIHRhYmxlcyBpbiBjYXNlIHJl
dHBvbGluZXMgYXJlIHVzZWQ6Cmh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcu
Y2dpP2lkPTg2OTUyCgpSZXBvcnRlZC1ieTogSnVsaWFuIFN0ZWNrbGluYSA8anN0ZWNrbGlAYW1h
em9uLmRlPgpSZXBvcnRlZC1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9u
LmRlPgpTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4K
LS0tCiB4ZW4vYXJjaC94ODYvUnVsZXMubWsgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9SdWxlcy5tayBiL3hlbi9hcmNoL3g4
Ni9SdWxlcy5tawppbmRleCBjYzMwMWNkLi4zZjI2ODdiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvUnVsZXMubWsKKysrIGIveGVuL2FyY2gveDg2L1J1bGVzLm1rCkBAIC00OCw2ICs0OCw3IEBA
IGVuZGlmCiBpZm5lcSAoJChjYWxsIGNjLW9wdGlvbiwkKENDKSwtbWluZGlyZWN0LWJyYW5jaC1y
ZWdpc3RlcixuKSxuKQogQ0ZMQUdTICs9IC1taW5kaXJlY3QtYnJhbmNoPXRodW5rLWV4dGVybiAt
bWluZGlyZWN0LWJyYW5jaC1yZWdpc3RlcgogQ0ZMQUdTICs9IC1EQ09ORklHX0lORElSRUNUX1RI
VU5LCitDRkxBR1MgKz0gLWZuby1qdW1wLXRhYmxlcwogZXhwb3J0IENPTkZJR19JTkRJUkVDVF9U
SFVOSz15CiBlbmRpZgogCi0tIAoyLjcuNAoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBH
ZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVy
OiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4
NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBC
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
