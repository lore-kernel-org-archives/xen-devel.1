From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] iommu: fix arm build after e9be34be5
Date: Tue, 9 Oct 2018 19:58:12 +0100
Message-ID: <20181009185812.9597-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+8ch=mv=citrix.com=prvs=8135aa832=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g9xD0-0004D7-AT
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 18:58:18 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGZ1bmN0aW9uIGlvbW11X3NoYXJlX3AybV90YWJsZSBpcyB1c2VkIGJ5IGJvdGggQVJNIGFu
ZCB4ODYgYnV0CmhhcF9lbmFibGVkIG1hY3JvIGlzIHg4NiBvbmx5LiBQdXQgdGhlIEFTU0VSVCB1
bmRlciBDT05GSUdfWDg2LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jIHwgMiArKwogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCmluZGV4IGUw
M2RlNmUzYWIuLjhiNDM4YWU0YmMgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwpAQCAtNTA1LDcg
KzUwNSw5IEBAIGludCBpb21tdV9kb19kb21jdGwoCiAKIHZvaWQgaW9tbXVfc2hhcmVfcDJtX3Rh
YmxlKHN0cnVjdCBkb21haW4qIGQpCiB7CisjaWZkZWYgQ09ORklHX1g4NgogICAgIEFTU0VSVCho
YXBfZW5hYmxlZChkKSk7CisjZW5kaWYKICAgICAvKgogICAgICAqIGlvbW11X3VzZV9oYXBfcHQo
ZCkgY2Fubm90IGJlIHVzZWQgaGVyZSBiZWNhdXNlIGR1cmluZyBkb21haW4KICAgICAgKiBjb25z
dHJ1Y3Rpb24gbmVlZF9pb21tdShkKSB3aWxsIGFsd2F5cyByZXR1cm4gZmFsc2UgaGVyZS4KLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
