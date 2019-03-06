From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH RESEND 1/3] OvmfPkg/XenSupport: remove usage of
 prefetchable PCI host bridge aperture
Date: Wed, 6 Mar 2019 12:40:54 +0000
Message-ID: <1551876056-28223-2-git-send-email-igor.druzhinin@citrix.com>
References: <1551876056-28223-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/oGn=RJ=citrix.com=prvs=961469de7=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1h1Vr8-000064-6g
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 12:41:06 +0000
In-Reply-To: <1551876056-28223-1-git-send-email-igor.druzhinin@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: edk2-devel@lists.01.org
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, ard.biesheuvel@linaro.org, jordan.l.justen@intel.com, julien.grall@arm.com, anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com
List-Id: xen-devel@lists.xenproject.org

VGhpcyBhcGVydHVyZSBkb2Vzbid0IGV4aXN0IGluIE9WTUYgYW5kIHRyeWluZyB0byB1c2UgaXQg
Y2F1c2VzCmZhaWxpbmcgYXNzZXJ0aW9ucyBsYXRlciBpbiBjYXNlcyB0aGVyZSBhcmUgcHJlZmV0
Y2hhYmxlIGFuZApub24tcHJlZmV0Y2hhYmxlIEJBUnMgZm9sbG93aW5nIGVhY2ggb3RoZXIuIFRo
aXMgY29uZmlndXJhdGlvbiBpcwpxdWl0ZSBsaWtlbHkgd2l0aCBzb21lIFBDSSBwYXNzdGhyb3Vn
aCBkZXZpY2VzLgoKQ29udHJpYnV0ZWQtdW5kZXI6IFRpYW5vQ29yZSBDb250cmlidXRpb24gQWdy
ZWVtZW50IDEuMQpTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5A
Y2l0cml4LmNvbT4KLS0tCiBPdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBw
b3J0LmMgfCAxMiArKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL092bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJp
ZGdlTGliL1hlblN1cHBvcnQuYyBiL092bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGliL1hl
blN1cHBvcnQuYwppbmRleCA5MjA0MTc5Li5jMjNjNDZkIDEwMDY0NAotLS0gYS9Pdm1mUGtnL0xp
YnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMKKysrIGIvT3ZtZlBrZy9MaWJyYXJ5
L1BjaUhvc3RCcmlkZ2VMaWIvWGVuU3VwcG9ydC5jCkBAIC0xMjksMTEgKzEyOSw3IEBAIFBjYXRQ
Y2lSb290QnJpZGdlUGFyc2VCYXJzICgKICAgICAgICAgICAvLwogICAgICAgICAgIExlbmd0aCA9
ICgofkxlbmd0aCkgKyAxKSAmIDB4ZmZmZmZmZmY7CiAKLSAgICAgICAgICBpZiAoKFZhbHVlICYg
QklUMykgPT0gQklUMykgewotICAgICAgICAgICAgTWVtQXBlcnR1cmUgPSBQTWVtOwotICAgICAg
ICAgIH0gZWxzZSB7Ci0gICAgICAgICAgICBNZW1BcGVydHVyZSA9IE1lbTsKLSAgICAgICAgICB9
CisgICAgICAgICAgTWVtQXBlcnR1cmUgPSBNZW07CiAgICAgICAgIH0gZWxzZSB7CiAgICAgICAg
ICAgLy8KICAgICAgICAgICAvLyA2NGJpdApAQCAtMTQ5LDExICsxNDUsNyBAQCBQY2F0UGNpUm9v
dEJyaWRnZVBhcnNlQmFycyAoCiAgICAgICAgICAgTGVuZ3RoID0gTGVuZ3RoIHwgTFNoaWZ0VTY0
ICgoVUlOVDY0KSBVcHBlclZhbHVlLCAzMik7CiAgICAgICAgICAgTGVuZ3RoID0gKH5MZW5ndGgp
ICsgMTsKIAotICAgICAgICAgIGlmICgoVmFsdWUgJiBCSVQzKSA9PSBCSVQzKSB7Ci0gICAgICAg
ICAgICBNZW1BcGVydHVyZSA9IFBNZW1BYm92ZTRHOwotICAgICAgICAgIH0gZWxzZSB7Ci0gICAg
ICAgICAgICBNZW1BcGVydHVyZSA9IE1lbUFib3ZlNEc7Ci0gICAgICAgICAgfQorICAgICAgICAg
IE1lbUFwZXJ0dXJlID0gTWVtQWJvdmU0RzsKICAgICAgICAgfQogCiAgICAgICAgIExpbWl0ID0g
QmFzZSArIExlbmd0aCAtIDE7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
