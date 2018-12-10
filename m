From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/2] docs: Specify format when rendering
 markdown man pages
Date: Mon, 10 Dec 2018 13:00:49 +0000
Message-ID: <20181210130049.29665-3-anthony.perard@citrix.com>
References: <20181210130049.29665-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f0tq=OT=citrix.com=prvs=875770904=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gWLBE-0007Lv-N2
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 13:01:00 +0000
In-Reply-To: <20181210130049.29665-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2l0aCBwYW5kb2MgMi41LCB0aGUgbWFuL3hlbi12YmQtaW50ZXJmYWNlLm1hcmtkb3duLjcgaXNu
J3QgZGV0ZWN0ZWQgYXMKbWFya2Rvd24gYW5kIHRoZSBvdXRwdXQgaXNuJ3QgZm9ybWF0ZWQuIEFk
ZCB0aGUgZm9ybWF0IG9mIHRoZSBpbnB1dCB0bwpwYW5kb2MncyBjb21tYW5kIGxpbmUuCgpTaWdu
ZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0t
CiBkb2NzL01ha2VmaWxlIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvTWFrZWZpbGUgYi9kb2NzL01ha2Vm
aWxlCmluZGV4IGZiYTY2NzNkYjYuLjczNzZmMGYwYWIgMTAwNjQ0Ci0tLSBhL2RvY3MvTWFrZWZp
bGUKKysrIGIvZG9jcy9NYWtlZmlsZQpAQCAtMTEyLDcgKzExMiw3IEBAIGlmbmVxICgkKFBBTkRP
QyksKQogCUAkKElOU1RBTExfRElSKSAkJChARCkKIAkkKFBBTkRPQykgLS1zdGFuZGFsb25lIC1W
IHRpdGxlPSQkKiAtViBzZWN0aW9uPSQoMSkgXAogCQkgICAgICAtViBkYXRlPSIkKERBVEUpIiAt
ViBmb290ZXI9IiQoVkVSU0lPTikiIFwKLQkJCSAgLVYgaGVhZGVyPVhlbiAkJDwgLXQgbWFuIC0t
b3V0cHV0ICQkQAorCQkgICAgICAtViBoZWFkZXI9WGVuICQkPCAtZiBtYXJrZG93biAtdCBtYW4g
LS1vdXRwdXQgJCRACiBlbHNlCiAJQGVjaG8gInBhbmRvYyBub3QgaW5zdGFsbGVkOyBza2lwcGlu
ZyAkJEAiCiBlbmRpZgpAQCAtMTI5LDcgKzEyOSw3IEBAIGVuZGlmCiBodG1sL21hbi8lLiQoMSku
aHRtbDogbWFuLyUubWFya2Rvd24uJCgxKSBNYWtlZmlsZQogaWZuZXEgKCQoUEFORE9DKSwpCiAJ
QCQoSU5TVEFMTF9ESVIpICQkKEBEKQotCSQoUEFORE9DKSAtLXN0YW5kYWxvbmUgJCQ8IC10IGh0
bWwgLS10b2MgLS1vdXRwdXQgJCRACisJJChQQU5ET0MpIC0tc3RhbmRhbG9uZSAkJDwgLWYgbWFy
a2Rvd24gLXQgaHRtbCAtLXRvYyAtLW91dHB1dCAkJEAKIGVsc2UKIAlAZWNobyAicGFuZG9jIG5v
dCBpbnN0YWxsZWQ7IHNraXBwaW5nICQkQCIKIGVuZGlmCi0tIApBbnRob255IFBFUkFSRAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
