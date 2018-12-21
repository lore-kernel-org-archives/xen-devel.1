From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/5] pvcalls-front: don't try to free
 unallocated rings
Date: Fri, 21 Dec 2018 15:06:30 -0800
Message-ID: <1545433593-18874-2-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1812211501280.15901@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0AIz=O6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gaTsK-00006E-9F
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 23:06:36 +0000
In-Reply-To: <alpine.DEB.2.10.1812211501280.15901@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Stefano Stabellini <stefanos@xilinx.com>, boris.ostrovsky@oracle.com, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

aW5mbGlnaHRfcmVxX2lkIGlzIDAgd2hlbiBpbml0aWFsaXplZC4gSWYgaW5mbGlnaHRfcmVxX2lk
IGlzIDAsIHRoZXJlIGlzCm5vIGFjY2VwdF9tYXAgdG8gZnJlZS4gRml4IHRoZSBjaGVjayBpbiBw
dmNhbGxzX2Zyb250X3JlbGVhc2UuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHN0ZWZhbm9zQHhpbGlueC5jb20+Ci0tLQogZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYyBiL2RyaXZlcnMveGVuL3B2
Y2FsbHMtZnJvbnQuYwppbmRleCBlNWQ5NWFhLi40ZjNkNjY0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L3hlbi9wdmNhbGxzLWZyb250LmMKKysrIGIvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jCkBA
IC0xMDMwLDggKzEwMzAsOCBAQCBpbnQgcHZjYWxsc19mcm9udF9yZWxlYXNlKHN0cnVjdCBzb2Nr
ZXQgKnNvY2spCiAJCXNwaW5fbG9jaygmYmVkYXRhLT5zb2NrZXRfbG9jayk7CiAJCWxpc3RfZGVs
KCZtYXAtPmxpc3QpOwogCQlzcGluX3VubG9jaygmYmVkYXRhLT5zb2NrZXRfbG9jayk7Ci0JCWlm
IChSRUFEX09OQ0UobWFwLT5wYXNzaXZlLmluZmxpZ2h0X3JlcV9pZCkgIT0KLQkJICAgIFBWQ0FM
TFNfSU5WQUxJRF9JRCkgeworCQlpZiAoUkVBRF9PTkNFKG1hcC0+cGFzc2l2ZS5pbmZsaWdodF9y
ZXFfaWQpICE9IFBWQ0FMTFNfSU5WQUxJRF9JRCAmJgorCQkJUkVBRF9PTkNFKG1hcC0+cGFzc2l2
ZS5pbmZsaWdodF9yZXFfaWQpICE9IDApIHsKIAkJCXB2Y2FsbHNfZnJvbnRfZnJlZV9tYXAoYmVk
YXRhLAogCQkJCQkgICAgICAgbWFwLT5wYXNzaXZlLmFjY2VwdF9tYXApOwogCQl9Ci0tIAoxLjku
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
