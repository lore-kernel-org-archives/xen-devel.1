From: Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH L1TF v9 4/7] is_hvm/pv_domain: block speculation
Date: Wed, 27 Feb 2019 17:13:37 +0100
Message-ID: <1551284020-7050-5-git-send-email-nmanthey@amazon.de>
References: <1551284020-7050-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=70d2=RC=amazon.de=prvs=954cd6bf9=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gz1sU-000688-PT
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 16:16:14 +0000
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

V2hlbiBjaGVja2luZyBmb3IgYmVpbmcgYW4gaHZtIGRvbWFpbiwgb3IgUFYgZG9tYWluLCB3ZSBo
YXZlIHRvIG1ha2UKc3VyZSB0aGF0IHNwZWN1bGF0aW9uIGNhbm5vdCBieXBhc3MgdGhhdCBjaGVj
aywgYW5kIGV2ZW50dWFsbHkgYWNjZXNzCmRhdGEgdGhhdCBzaG91bGQgbm90IGVuZCB1cCBpbiBj
YWNoZSBmb3IgdGhlIGN1cnJlbnQgZG9tYWluIHR5cGUuCgpUaGlzIGlzIHBhcnQgb2YgdGhlIHNw
ZWN1bGF0aXZlIGhhcmRlbmluZyBlZmZvcnQuCgpTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRo
ZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCi0tLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCA2ICsrKystLQogMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCi0tLSBhL3hl
bi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBAIC05
MjIsNyArOTIyLDggQEAgdm9pZCB3YXRjaGRvZ19kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWlu
ICpkKTsKIAogc3RhdGljIGlubGluZSBib29sIGlzX3B2X2RvbWFpbihjb25zdCBzdHJ1Y3QgZG9t
YWluICpkKQogewotICAgIHJldHVybiBJU19FTkFCTEVEKENPTkZJR19QVikgPyBkLT5ndWVzdF90
eXBlID09IGd1ZXN0X3R5cGVfcHYgOiBmYWxzZTsKKyAgICByZXR1cm4gSVNfRU5BQkxFRChDT05G
SUdfUFYpCisgICAgICAgICAgID8gZXZhbHVhdGVfbm9zcGVjKGQtPmd1ZXN0X3R5cGUgPT0gZ3Vl
c3RfdHlwZV9wdikgOiBmYWxzZTsKIH0KIAogc3RhdGljIGlubGluZSBib29sIGlzX3B2X3ZjcHUo
Y29uc3Qgc3RydWN0IHZjcHUgKnYpCkBAIC05NTMsNyArOTU0LDggQEAgc3RhdGljIGlubGluZSBi
b29sIGlzX3B2XzY0Yml0X3ZjcHUoY29uc3Qgc3RydWN0IHZjcHUgKnYpCiAjZW5kaWYKIHN0YXRp
YyBpbmxpbmUgYm9vbCBpc19odm1fZG9tYWluKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCiB7Ci0g
ICAgcmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX0hWTSkgPyBkLT5ndWVzdF90eXBlID09IGd1ZXN0
X3R5cGVfaHZtIDogZmFsc2U7CisgICAgcmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX0hWTSkKKyAg
ICAgICAgICAgPyBldmFsdWF0ZV9ub3NwZWMoZC0+Z3Vlc3RfdHlwZSA9PSBndWVzdF90eXBlX2h2
bSkgOiBmYWxzZTsKIH0KIAogc3RhdGljIGlubGluZSBib29sIGlzX2h2bV92Y3B1KGNvbnN0IHN0
cnVjdCB2Y3B1ICp2KQotLSAKMi43LjQKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2Vy
bWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjog
Q2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5
CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
