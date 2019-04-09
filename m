From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH v2 2/3] OvmfPkg/XenSupport: use a correct PCI
 host bridge aperture for BAR64
Date: Tue, 9 Apr 2019 04:12:39 +0100
Message-ID: <1554779560-26204-3-git-send-email-igor.druzhinin@citrix.com>
References: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nMgv=SL=citrix.com=prvs=995126bee=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hDhBy-0006lF-2u
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 03:12:58 +0000
In-Reply-To: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
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

SW4gY2FzZSBCQVI2NCBpcyBwbGFjZWQgYmVsb3cgNEcgY2hvb3NlIHRoZSBjb3JyZWN0IGFwZXJ0
dXJlLgpUaGlzIGZpeGVzIGEgZmFpbGVkIGFzc2VydGlvbiBkb3duIHRoZSBjb2RlIHBhdGguCgpD
b250cmlidXRlZC11bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBBZ3JlZW1lbnQgMS4xCkFj
a2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KU2lnbmVk
LW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Ci0tLQog
T3ZtZlBrZy9MaWJyYXJ5L1BjaUhvc3RCcmlkZ2VMaWIvWGVuU3VwcG9ydC5jIHwgNiArKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMgYi9Pdm1m
UGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMKaW5kZXggNWVhNjNmNy4u
Zjc2MzEzNCAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9MaWJyYXJ5L1BjaUhvc3RCcmlkZ2VMaWIvWGVu
U3VwcG9ydC5jCisrKyBiL092bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGliL1hlblN1cHBv
cnQuYwpAQCAtMTQzLDcgKzE0MywxMSBAQCBQY2F0UGNpUm9vdEJyaWRnZVBhcnNlQmFycyAoCiAg
ICAgICAgICAgTGVuZ3RoID0gTGVuZ3RoIHwgTFNoaWZ0VTY0ICgoVUlOVDY0KSBVcHBlclZhbHVl
LCAzMik7CiAgICAgICAgICAgTGVuZ3RoID0gKH5MZW5ndGgpICsgMTsKIAotICAgICAgICAgIE1l
bUFwZXJ0dXJlID0gTWVtQWJvdmU0RzsKKyAgICAgICAgICBpZiAoQmFzZSA8IEJBU0VfNEdCKSB7
CisgICAgICAgICAgICBNZW1BcGVydHVyZSA9IE1lbTsKKyAgICAgICAgICB9IGVsc2UgeworICAg
ICAgICAgICAgTWVtQXBlcnR1cmUgPSBNZW1BYm92ZTRHOworICAgICAgICAgIH0KICAgICAgICAg
fQogCiAgICAgICAgIExpbWl0ID0gQmFzZSArIExlbmd0aCAtIDE7Ci0tIAoyLjcuNAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
