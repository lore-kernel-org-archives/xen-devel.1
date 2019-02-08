From: Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH SpectreV1+L1TF v6 6/9] is_control_domain: block
 speculation
Date: Fri, 8 Feb 2019 14:44:46 +0100
Message-ID: <1549633489-12724-7-git-send-email-nmanthey@amazon.de>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MeI5=QP=amazon.de=prvs=9359aedec=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gs6Vj-0006Zk-Gj
 for xen-devel@lists.xenproject.org; Fri, 08 Feb 2019 13:48:07 +0000
In-Reply-To: <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
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
dGhleUBhbWF6b24uZGU+CgotLS0KCk5vdGVzOgogIHY2OiBEcm9wIG5vc3BlYy5oIGluY2x1ZGUK
CiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4v
c2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCi0tLSBhL3hlbi9pbmNsdWRlL3hlbi9z
Y2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBAIC05MTMsMTAgKzkxMywxMCBA
QCB2b2lkIHdhdGNoZG9nX2RvbWFpbl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQpOwogICogICAg
KHRoYXQgaXMsIHRoaXMgd291bGQgbm90IGJlIHN1aXRhYmxlIGZvciBhIGRyaXZlciBkb21haW4p
CiAgKiAgLSBUaGVyZSBpcyBuZXZlciBhIHJlYXNvbiB0byBkZW55IHRoZSBoYXJkd2FyZSBkb21h
aW4gYWNjZXNzIHRvIHRoaXMKICAqLwotI2RlZmluZSBpc19oYXJkd2FyZV9kb21haW4oX2QpICgo
X2QpID09IGhhcmR3YXJlX2RvbWFpbikKKyNkZWZpbmUgaXNfaGFyZHdhcmVfZG9tYWluKF9kKSBl
dmFsdWF0ZV9ub3NwZWMoKF9kKSA9PSBoYXJkd2FyZV9kb21haW4pCiAKIC8qIFRoaXMgY2hlY2sg
aXMgZm9yIGZ1bmN0aW9uYWxpdHkgc3BlY2lmaWMgdG8gYSBjb250cm9sIGRvbWFpbiAqLwotI2Rl
ZmluZSBpc19jb250cm9sX2RvbWFpbihfZCkgKChfZCktPmlzX3ByaXZpbGVnZWQpCisjZGVmaW5l
IGlzX2NvbnRyb2xfZG9tYWluKF9kKSBldmFsdWF0ZV9ub3NwZWMoKF9kKS0+aXNfcHJpdmlsZWdl
ZCkKIAogI2RlZmluZSBWTV9BU1NJU1QoZCwgdCkgKHRlc3RfYml0KFZNQVNTVF9UWVBFXyAjIyB0
LCAmKGQpLT52bV9hc3Npc3QpKQogCi0tIAoyLjcuNAoKCgoKQW1hem9uIERldmVsb3BtZW50IENl
bnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNm
dWVocmVyOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoClVzdC1JRDogREUgMjg5
IDIzNyA4NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0
OTE3MyBCCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
