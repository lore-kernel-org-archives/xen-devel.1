From: Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH SpectreV1+L1TF v7 6/9] is_hvm/pv_domain: block
 speculation
Date: Thu, 21 Feb 2019 09:16:40 +0100
Message-ID: <1550737003-25779-7-git-send-email-nmanthey@amazon.de>
References: <1550737003-25779-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rINu=Q4=amazon.de=prvs=9484abbec=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gwjcf-0001kF-OJ
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 08:22:25 +0000
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

V2hlbiBjaGVja2luZyBmb3IgYmVpbmcgYW4gaHZtIGRvbWFpbiwgb3IgUFYgZG9tYWluLCB3ZSBo
YXZlIHRvIG1ha2UKc3VyZSB0aGF0IHNwZWN1bGF0aW9uIGNhbm5vdCBieXBhc3MgdGhhdCBjaGVj
aywgYW5kIGV2ZW50dWFsbHkgYWNjZXNzCmRhdGEgdGhhdCBzaG91bGQgbm90IGVuZCB1cCBpbiBj
YWNoZSBmb3IgdGhlIGN1cnJlbnQgZG9tYWluIHR5cGUuCgpUaGlzIGlzIHBhcnQgb2YgdGhlIHNw
ZWN1bGF0aXZlIGhhcmRlbmluZyBlZmZvcnQuCgpTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRo
ZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KCi0tLQoKTm90ZXM6CiAgdjc6IG1lbnRpb24gc3BlY3Vs
YXRpdmUgaGFyZGVuaW5nIGluIGNvbW1pdCBtZXNzYWdlCgogeGVuL2luY2x1ZGUveGVuL3NjaGVk
LmggfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRl
L3hlbi9zY2hlZC5oCi0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9pbmNs
dWRlL3hlbi9zY2hlZC5oCkBAIC05MjIsNyArOTIyLDggQEAgdm9pZCB3YXRjaGRvZ19kb21haW5f
ZGVzdHJveShzdHJ1Y3QgZG9tYWluICpkKTsKIAogc3RhdGljIGlubGluZSBib29sIGlzX3B2X2Rv
bWFpbihjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQogewotICAgIHJldHVybiBJU19FTkFCTEVEKENP
TkZJR19QVikgPyBkLT5ndWVzdF90eXBlID09IGd1ZXN0X3R5cGVfcHYgOiBmYWxzZTsKKyAgICBy
ZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfUFYpCisgICAgICAgICAgID8gZXZhbHVhdGVfbm9zcGVj
KGQtPmd1ZXN0X3R5cGUgPT0gZ3Vlc3RfdHlwZV9wdikgOiBmYWxzZTsKIH0KIAogc3RhdGljIGlu
bGluZSBib29sIGlzX3B2X3ZjcHUoY29uc3Qgc3RydWN0IHZjcHUgKnYpCkBAIC05NTMsNyArOTU0
LDggQEAgc3RhdGljIGlubGluZSBib29sIGlzX3B2XzY0Yml0X3ZjcHUoY29uc3Qgc3RydWN0IHZj
cHUgKnYpCiAjZW5kaWYKIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19odm1fZG9tYWluKGNvbnN0IHN0
cnVjdCBkb21haW4gKmQpCiB7Ci0gICAgcmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX0hWTSkgPyBk
LT5ndWVzdF90eXBlID09IGd1ZXN0X3R5cGVfaHZtIDogZmFsc2U7CisgICAgcmV0dXJuIElTX0VO
QUJMRUQoQ09ORklHX0hWTSkKKyAgICAgICAgICAgPyBldmFsdWF0ZV9ub3NwZWMoZC0+Z3Vlc3Rf
dHlwZSA9PSBndWVzdF90eXBlX2h2bSkgOiBmYWxzZTsKIH0KIAogc3RhdGljIGlubGluZSBib29s
IGlzX2h2bV92Y3B1KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQotLSAKMi43LjQKCgoKCkFtYXpvbiBE
ZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxp
bgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApV
c3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0
ZW5idXJnIEhSQiAxNDkxNzMgQgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
