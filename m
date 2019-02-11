From: Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH XTF perf 1/4] categories: add perf
Date: Mon, 11 Feb 2019 11:23:13 +0100
Message-ID: <1549880596-26939-2-git-send-email-nmanthey@amazon.de>
References: <1549880596-26939-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b7qG=QS=amazon.de=prvs=93823c592=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gt8kx-0007NG-Fg
 for xen-devel@lists.xenproject.org; Mon, 11 Feb 2019 10:24:07 +0000
In-Reply-To: <1549880596-26939-1-git-send-email-nmanthey@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXMgWFRGIGFsbG93cyB0byB3cml0ZSB0ZXN0cyB0aGF0IGludGVyYWN0IHdpdGggdGhlIGh5cGVy
dmlzb3IsIHdlIHdvdWxkIGxpa2UKdG8gdXNlIHRoaXMgY2FwYWJpbGl0eSB0byBpbXBsZW1lbnQg
bWljcm8gYmVuY2htYXJrcywgc28gdGhhdCB3ZSBjYW4gbWVhc3VyZQp0aGUgcGVyZm9ybWFuY2Ug
aW1wYWN0IG9mIG1vZGlmaWNhdGlvbnMgdG8gdGhlIGh5cGVydmlzb3IuCgpTaWduZWQtb2ZmLWJ5
OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KCi0tLQogYnVpbGQvY29tbW9u
Lm1rIHwgMiArLQogeHRmLXJ1bm5lciAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYnVpbGQvY29tbW9uLm1r
IGIvYnVpbGQvY29tbW9uLm1rCi0tLSBhL2J1aWxkL2NvbW1vbi5taworKysgYi9idWlsZC9jb21t
b24ubWsKQEAgLTEsNCArMSw0IEBACi1BTExfQ0FURUdPUklFUyAgICAgOj0gc3BlY2lhbCBmdW5j
dGlvbmFsIHhzYSB1dGlsaXR5IGluLWRldmVsb3BtZW50CitBTExfQ0FURUdPUklFUyAgICAgOj0g
c3BlY2lhbCBmdW5jdGlvbmFsIHhzYSB1dGlsaXR5IGluLWRldmVsb3BtZW50IHBlcmYKIAogQUxM
X0VOVklST05NRU5UUyAgIDo9IHB2NjQgcHYzMnBhZSBodm02NCBodm0zMnBhZSBodm0zMnBzZSBo
dm0zMgogCmRpZmYgLS1naXQgYS94dGYtcnVubmVyIGIveHRmLXJ1bm5lcgotLS0gYS94dGYtcnVu
bmVyCisrKyBiL3h0Zi1ydW5uZXIKQEAgLTM3LDcgKzM3LDcgQEAgZGVmIGV4aXRfY29kZShzdGF0
ZSk6CiAKICMgQWxsIHRlc3QgY2F0ZWdvcmllcwogZGVmYXVsdF9jYXRlZ29yaWVzICAgICA9IHNl
dCgoImZ1bmN0aW9uYWwiLCAieHNhIikpCi1ub25fZGVmYXVsdF9jYXRlZ29yaWVzID0gc2V0KCgi
c3BlY2lhbCIsICJ1dGlsaXR5IiwgImluLWRldmVsb3BtZW50IikpCitub25fZGVmYXVsdF9jYXRl
Z29yaWVzID0gc2V0KCgic3BlY2lhbCIsICJ1dGlsaXR5IiwgImluLWRldmVsb3BtZW50IiwgInBl
cmYiKSkKIGFsbF9jYXRlZ29yaWVzICAgICAgICAgPSBkZWZhdWx0X2NhdGVnb3JpZXMgfCBub25f
ZGVmYXVsdF9jYXRlZ29yaWVzCiAKICMgQWxsIHRlc3QgZW52aXJvbm1lbnRzCi0tIAoyLjcuNAoK
CgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgK
MTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxm
IEhlcmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmlj
aHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
