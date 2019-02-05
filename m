From: Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH svm v2] svm: fix xentrace p2mt access
Date: Tue, 5 Feb 2019 16:09:06 +0100
Message-ID: <1549379346-17883-1-git-send-email-nmanthey@amazon.de>
References: <5C5958700200007800213E09@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7kML=QM=amazon.de=prvs=93263f919=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gr2Lv-0000tA-Jc
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 15:09:35 +0000
In-Reply-To: <5C5958700200007800213E09@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <jbeulich@suse.com>, Michael Tautschnig <tautschn@amazon.co.uk>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QSBwb2ludGVyIG1pc21hdGNoIGhhcyBiZWVuIHJlcG9ydGVkIHdoZW4gY29tcGlsaW5nIHdpdGgg
dGhlCmNvbXBpbGVyIGdvdG8tZ2NjIG9mIHRoZSBib3VuZGVkIG1vZGVsIGNoZWNrZXIgQ0JNQy4K
VG8ga2VlcCB0cmFjZSBlbnRyeSBzaXplIGluZGVwZW5kZW50IG9mIHRoZSBjb21waWxlciBpbXBs
ZW1lbnRhdGlvbiwKdXNlIHRoZSBhdmFpbGFibGUgcDJtdCB2YXJpYWJsZSBmb3IgdGhlIGFjY2Vz
cywgYW5kIHVwZGF0ZSB0aGUKdHJhY2UgcmVjb3JkIGluZGVwZW5kZW5seS4KCkZpeGVzOiA5YTc3
OWU0ZiAoSW1wbGVtZW50IFNWTSBzcGVjaWZpYyBwYXJ0IGZvciBOZXN0ZWQgVmlydHVhbGl6YXRp
b24pCgpTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4K
Ci0tLQoKTm90ZXM6CiAgICB2Mjoga2VlcCB0eXBlLCB1c2UgbG9jYWwgdmFyaWFibGUgaW4gZnVu
Y3Rpb24gY2FsbCBhbmQKCiB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyB8IDMgKystCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYwot
LS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2
bS9zdm0uYwpAQCAtMTgwMCw4ICsxODAwLDkgQEAgc3RhdGljIHZvaWQgc3ZtX2RvX25lc3RlZF9w
Z2ZhdWx0KHN0cnVjdCB2Y3B1ICp2LAogICAgICAgICBwMm0gPSBwMm1fZ2V0X3AybSh2KTsKICAg
ICAgICAgX2QuZ3BhID0gZ3BhOwogICAgICAgICBfZC5xdWFsaWZpY2F0aW9uID0gMDsKLSAgICAg
ICAgbWZuID0gX19nZXRfZ2ZuX3R5cGVfYWNjZXNzKHAybSwgZ2ZuLCAmX2QucDJtdCwgJnAybWEs
IDAsIE5VTEwsIDApOworICAgICAgICBtZm4gPSBfX2dldF9nZm5fdHlwZV9hY2Nlc3MocDJtLCBn
Zm4sICZwMm10LCAmcDJtYSwgMCwgTlVMTCwgMCk7CiAgICAgICAgIF9kLm1mbiA9IG1mbl94KG1m
bik7CisgICAgICAgIF9kLnAybXQgPSBwMm10OwogICAgICAgICAKICAgICAgICAgX190cmFjZV92
YXIoVFJDX0hWTV9OUEYsIDAsIHNpemVvZihfZCksICZfZCk7CiAgICAgfQotLSAKMi43LjQKCgoK
CkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEw
MTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBI
ZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0
IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
