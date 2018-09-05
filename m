From: Jim Fehlig <jfehlig@suse.com>
Subject: [PATCH OSSTEST] Install GnuTLS for libvirt builds
Date: Wed,  5 Sep 2018 15:43:12 -0600
Message-ID: <20180905214312.10907-1-jfehlig@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ayz8=lt=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1fxfaG-0008CV-L5
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 21:43:32 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: ian.jackson@citrix.com, Jim Fehlig <jfehlig@suse.com>, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

U2luY2UgbGlidmlydCBjb21taXQgNjBkOWFkNmYgR251VExTIGlzIHJlcXVpcmVkIHRvIGJ1aWxk
IGxpYnZpcnQuIFRoZQp2YXJpb3VzIGxpYnZpcnQgYnVpbGQgdGVzdHMgaW4gb3NzdGVzdCBiZWdh
biBmYWlsaW5nIGFmdGVyIHRoZSBjb21taXQKaGl0IGxpYnZpcnQuZ2l0IG1hc3Rlci4gQWRkaW5n
IGxpYmdudXRsczI4LWRldiB0byB0aGUgbGlzdCBvZiBwYWNrYWdlcwpuZWVkZWQgdG8gYnVpbGQg
bGlidmlydCB3aWxsIGZpeCB0aGUgY3VycmVudGx5IGJyb2tlbiBidWlsZHMuCgpTaWduZWQtb2Zm
LWJ5OiBKaW0gRmVobGlnIDxqZmVobGlnQHN1c2UuY29tPgotLS0KClJlYmFzZSBhbmQgcmVwb3N0
IG9mCgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVs
LzIwMTgtMDcvbXNnMDI1ODQuaHRtbAoKIE9zc3Rlc3QvVG9vbHN0YWNrL2xpYnZpcnQucG0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9Pc3N0ZXN0L1Rvb2xzdGFjay9saWJ2aXJ0LnBtIGIvT3NzdGVzdC9Ub29sc3RhY2sv
bGlidmlydC5wbQppbmRleCA0NWRmMTczLi5kNWNkYTc3IDEwMDY0NAotLS0gYS9Pc3N0ZXN0L1Rv
b2xzdGFjay9saWJ2aXJ0LnBtCisrKyBiL09zc3Rlc3QvVG9vbHN0YWNrL2xpYnZpcnQucG0KQEAg
LTI2LDcgKzI2LDcgQEAgdXNlIFhNTDo6TGliWE1MOwogCiBzdWIgbmV3IHsKICAgICBteSAoJGNs
YXNzLCAkaG8sICRtZXRobmFtZSwkYXNzZXQpID0gQF87Ci0gICAgbXkgQGV4dHJhX3BhY2thZ2Vz
ID0gcXcobGliYXZhaGktY2xpZW50Myk7CisgICAgbXkgQGV4dHJhX3BhY2thZ2VzID0gcXcobGli
YXZhaGktY2xpZW50MyBsaWJnbnV0bHMyOC1kZXYpOwogICAgIG15ICRubF9saWIgPSAibGlibmwt
My0yMDAiOwogICAgICRubF9saWIgPSAibGlibmwxIiBpZiAoJGhvLT57U3VpdGV9ID1+IG0vd2hl
ZXp5Lyk7CiAgICAgcHVzaChAZXh0cmFfcGFja2FnZXMsICRubF9saWIpOwotLSAKMi4xOC4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
