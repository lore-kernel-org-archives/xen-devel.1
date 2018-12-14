From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] xen/pciback: Check dev_data before using it
Date: Fri, 14 Dec 2018 12:55:45 +0000
Message-ID: <20181214125545.28753-1-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MQLU=OX=citrix.com=prvs=879f9c3a4=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1gXn0Q-0007m8-Qr
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 12:55:50 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SWYgcGNpc3R1Yl9pbml0X2RldmljZSBmYWlscywgdGhlIHJlbGVhc2UgZnVuY3Rpb24gd2lsbCBi
ZSBjYWxsZWQgd2l0aApkZXZfZGF0YSBzZXQgdG8gTlVMTC4gIENoZWNrIGl0IGJlZm9yZSB1c2lu
ZyBpdCB0byBhdm9pZCBhIE5VTEwgcG9pbnRlcgpkZXJlZmVyZW5jZS4KClNpZ25lZC1vZmYtYnk6
IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgotLS0KIGRyaXZlcnMv
eGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbi1w
Y2liYWNrL3BjaV9zdHViLmMgYi9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jCmlu
ZGV4IDU5NjYxZGIxNDRlNS4uMDk3NDEwYTdjZGI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94
ZW4tcGNpYmFjay9wY2lfc3R1Yi5jCisrKyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9z
dHViLmMKQEAgLTEwNiw3ICsxMDYsOCBAQCBzdGF0aWMgdm9pZCBwY2lzdHViX2RldmljZV9yZWxl
YXNlKHN0cnVjdCBrcmVmICprcmVmKQogCSAqIGlzIGNhbGxlZCBmcm9tICJ1bmJpbmQiIHdoaWNo
IHRha2VzIGEgZGV2aWNlX2xvY2sgbXV0ZXguCiAJICovCiAJX19wY2lfcmVzZXRfZnVuY3Rpb25f
bG9ja2VkKGRldik7Ci0JaWYgKHBjaV9sb2FkX2FuZF9mcmVlX3NhdmVkX3N0YXRlKGRldiwgJmRl
dl9kYXRhLT5wY2lfc2F2ZWRfc3RhdGUpKQorCWlmIChkZXZfZGF0YSAmJgorCSAgICBwY2lfbG9h
ZF9hbmRfZnJlZV9zYXZlZF9zdGF0ZShkZXYsICZkZXZfZGF0YS0+cGNpX3NhdmVkX3N0YXRlKSkK
IAkJZGV2X2luZm8oJmRldi0+ZGV2LCAiQ291bGQgbm90IHJlbG9hZCBQQ0kgc3RhdGVcbiIpOwog
CWVsc2UKIAkJcGNpX3Jlc3RvcmVfc3RhdGUoZGV2KTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
