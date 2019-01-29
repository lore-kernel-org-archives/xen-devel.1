From: Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH SpectreV1+L1TF v5 6/9] is_control_domain: block
 speculation
Date: Tue, 29 Jan 2019 15:43:14 +0100
Message-ID: <1548772997-32742-7-git-send-email-nmanthey@amazon.de>
References: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
 <1548772997-32742-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TCeJ=QF=amazon.de=prvs=9250e2409=nmanthey@srs-us1.protection.inumbo.net>)
 id 1goUdN-0001yL-Iv
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 14:45:05 +0000
In-Reply-To: <1548772997-32742-1-git-send-email-nmanthey@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Q2hlY2tzIG9mIGRvbWFpbiBwcm9wZXJ0aWVzLCBzdWNoIGFzIGlzX2hhcmR3YXJlX2RvbWFpbiBv
ciBpc19odm1fZG9tYWluLAptaWdodCBiZSBieXBhc3NlZCBieSBzcGVjdWxhdGl2ZWx5IGV4ZWN1
dGluZyB0aGVzZSBpbnN0cnVjdGlvbnMuIEEgcmVhc29uCmZvciBieXBhc3NpbmcgdGhlc2UgY2hl
Y2tzIGlzIHRoYXQgdGhlc2UgbWFjcm9zIGFjY2VzcyB0aGUgZG9tYWluCnN0cnVjdHVyZSB2aWEg
YSBwb2ludGVyLCBhbmQgY2hlY2sgYSBjZXJ0YWluIGZpZWxkLiBTaW5jZSB0aGlzIG1lbW9yeQph
Y2Nlc3MgaXMgc2xvdywgdGhlIENQVSBhc3N1bWVzIGEgcmV0dXJuZWQgdmFsdWUgYW5kIGNvbnRp
bnVlcyB0aGUKZXhlY3V0aW9uLgoKSW4gY2FzZSBhbiBpc19jb250cm9sX2RvbWFpbiBjaGVjayBp
cyBieXBhc3NlZCwgZm9yIGV4YW1wbGUgZHVyaW5nIGEKaHlwZXJjYWxsLCBkYXRhIHRoYXQgc2hv
dWxkIG9ubHkgYmUgYWNjZXNzaWJsZSBieSB0aGUgY29udHJvbCBkb21haW4gY291bGQKYmUgbG9h
ZGVkIGludG8gdGhlIGNhY2hlLgoKU2lnbmVkLW9mZi1ieTogTm9yYmVydCBNYW50aGV5IDxubWFu
dGhleUBhbWF6b24uZGU+CgotLS0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIHwgNSArKystLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCi0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5o
CkBAIC0yMyw2ICsyMyw3IEBACiAjaW5jbHVkZSA8YXNtL2F0b21pYy5oPgogI2luY2x1ZGUgPHhl
bi92cGNpLmg+CiAjaW5jbHVkZSA8eGVuL3dhaXQuaD4KKyNpbmNsdWRlIDx4ZW4vbm9zcGVjLmg+
CiAjaW5jbHVkZSA8cHVibGljL3hlbi5oPgogI2luY2x1ZGUgPHB1YmxpYy9kb21jdGwuaD4KICNp
bmNsdWRlIDxwdWJsaWMvc3lzY3RsLmg+CkBAIC05MDgsMTAgKzkwOSwxMCBAQCB2b2lkIHdhdGNo
ZG9nX2RvbWFpbl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQpOwogICogICAgKHRoYXQgaXMsIHRo
aXMgd291bGQgbm90IGJlIHN1aXRhYmxlIGZvciBhIGRyaXZlciBkb21haW4pCiAgKiAgLSBUaGVy
ZSBpcyBuZXZlciBhIHJlYXNvbiB0byBkZW55IHRoZSBoYXJkd2FyZSBkb21haW4gYWNjZXNzIHRv
IHRoaXMKICAqLwotI2RlZmluZSBpc19oYXJkd2FyZV9kb21haW4oX2QpICgoX2QpID09IGhhcmR3
YXJlX2RvbWFpbikKKyNkZWZpbmUgaXNfaGFyZHdhcmVfZG9tYWluKF9kKSBldmFsdWF0ZV9ub3Nw
ZWMoKF9kKSA9PSBoYXJkd2FyZV9kb21haW4pCiAKIC8qIFRoaXMgY2hlY2sgaXMgZm9yIGZ1bmN0
aW9uYWxpdHkgc3BlY2lmaWMgdG8gYSBjb250cm9sIGRvbWFpbiAqLwotI2RlZmluZSBpc19jb250
cm9sX2RvbWFpbihfZCkgKChfZCktPmlzX3ByaXZpbGVnZWQpCisjZGVmaW5lIGlzX2NvbnRyb2xf
ZG9tYWluKF9kKSBldmFsdWF0ZV9ub3NwZWMoKF9kKS0+aXNfcHJpdmlsZWdlZCkKIAogI2RlZmlu
ZSBWTV9BU1NJU1QoZCwgdCkgKHRlc3RfYml0KFZNQVNTVF9UWVBFXyAjIyB0LCAmKGQpLT52bV9h
c3Npc3QpKQogCi0tIAoyLjcuNAoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55
IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBDaHJp
c3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4NzkKRWlu
Z2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
