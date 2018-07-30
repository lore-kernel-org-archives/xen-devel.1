From: Jim Fehlig <jfehlig@suse.com>
Subject: [OSSTEST] Install GnuTLS for libvirt builds
Date: Mon, 30 Jul 2018 11:37:48 -0600
Message-ID: <20180730173748.9926-1-jfehlig@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ip3t=ko=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1fkC7W-0003YK-2E
 for xen-devel@lists.xenproject.org; Mon, 30 Jul 2018 17:38:10 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: ian.jackson@citrix.com, Jim Fehlig <jfehlig@suse.com>, dfaggioli@suse.com
List-Id: xen-devel@lists.xenproject.org

U2luY2UgbGlidmlydCBjb21taXQgNjBkOWFkNmYgR251VExTIGlzIHJlcXVpcmVkIHRvIGJ1aWxk
IGxpYnZpcnQuIFRoZQp2YXJpb3VzIGxpYnZpcnQgYnVpbGQgdGVzdHMgaW4gb3NzdGVzdCBiZWdh
biBmYWlsaW5nIGFmdGVyIHRoZSBjb21taXQKaGl0IGxpYnZpcnQuZ2l0IG1hc3Rlci4gQWRkaW5n
IGxpYmdudXRsczI4LWRldiB0byB0aGUgbGlzdCBvZiBwYWNrYWdlcwpuZWVkZWQgdG8gYnVpbGQg
bGlidmlydCB3aWxsIGZpeCB0aGUgY3VycmVudGx5IGJyb2tlbiBidWlsZHMuCgpTaWduZWQtb2Zm
LWJ5OiBKaW0gRmVobGlnIDxqZmVobGlnQHN1c2UuY29tPgotLS0KCkkgY3JpYmJlZCB0aGUgJ2xp
YmdudXRsczI4LWRldicgcGFja2FnZSBuYW1lIGZyb20gdGhlIGxpYnZpcnQgamVua2lucyBDSQoK
aHR0cHM6Ly9saWJ2aXJ0Lm9yZy9naXQvP3A9bGlidmlydC1qZW5raW5zLWNpLmdpdDthPWJsb2I7
Zj1ndWVzdHMvdmFycy9tYXBwaW5ncy55bWw7aD1iZTM1NmFhZTYxNmU3ZGFjZjYwMzE3NWZlMWJl
YThjZTM5ODYyOWUxO2hiPUhFQUQjbDEzOAoKIE9zc3Rlc3QvVG9vbHN0YWNrL2xpYnZpcnQucG0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9Pc3N0ZXN0L1Rvb2xzdGFjay9saWJ2aXJ0LnBtIGIvT3NzdGVzdC9Ub29sc3Rh
Y2svbGlidmlydC5wbQppbmRleCA0NWRmMTczLi5kNWNkYTc3IDEwMDY0NAotLS0gYS9Pc3N0ZXN0
L1Rvb2xzdGFjay9saWJ2aXJ0LnBtCisrKyBiL09zc3Rlc3QvVG9vbHN0YWNrL2xpYnZpcnQucG0K
QEAgLTI2LDcgKzI2LDcgQEAgdXNlIFhNTDo6TGliWE1MOwogCiBzdWIgbmV3IHsKICAgICBteSAo
JGNsYXNzLCAkaG8sICRtZXRobmFtZSwkYXNzZXQpID0gQF87Ci0gICAgbXkgQGV4dHJhX3BhY2th
Z2VzID0gcXcobGliYXZhaGktY2xpZW50Myk7CisgICAgbXkgQGV4dHJhX3BhY2thZ2VzID0gcXco
bGliYXZhaGktY2xpZW50MyBsaWJnbnV0bHMyOC1kZXYpOwogICAgIG15ICRubF9saWIgPSAibGli
bmwtMy0yMDAiOwogICAgICRubF9saWIgPSAibGlibmwxIiBpZiAoJGhvLT57U3VpdGV9ID1+IG0v
d2hlZXp5Lyk7CiAgICAgcHVzaChAZXh0cmFfcGFja2FnZXMsICRubF9saWIpOwotLSAKMi4xOC4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
