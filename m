From: Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH svm] svm: fix p2mt type
Date: Tue, 5 Feb 2019 09:29:53 +0100
Message-ID: <1549355393-7820-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7kML=QM=amazon.de=prvs=93263f919=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gqw7g-00052f-C7
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 08:30:28 +0000
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
CkZpeGVzOiA5YTc3OWU0ZiAoSW1wbGVtZW50IFNWTSBzcGVjaWZpYyBwYXJ0IGZvciBOZXN0ZWQg
VmlydHVhbGl6YXRpb24pCgpTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5
QGFtYXpvbi5kZT4KCi0tLQogeGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCi0t
LSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3Zt
L3N2bS5jCkBAIC0xNzk0LDcgKzE3OTQsNyBAQCBzdGF0aWMgdm9pZCBzdm1fZG9fbmVzdGVkX3Bn
ZmF1bHQoc3RydWN0IHZjcHUgKnYsCiAgICAgICAgICAgICB1aW50NjRfdCBncGE7CiAgICAgICAg
ICAgICB1aW50NjRfdCBtZm47CiAgICAgICAgICAgICB1aW50MzJfdCBxdWFsaWZpY2F0aW9uOwot
ICAgICAgICAgICAgdWludDMyX3QgcDJtdDsKKyAgICAgICAgICAgIHAybV90eXBlX3QgcDJtdDsK
ICAgICAgICAgfSBfZDsKIAogICAgICAgICBwMm0gPSBwMm1fZ2V0X3AybSh2KTsKLS0gCjIuNy40
CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAz
OAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJh
bGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBhbSBBbXRzZ2Vy
aWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
