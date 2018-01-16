From: mjaggi@caviumnetworks.com
Subject: [RFC PATCH 01/10] Add CONFIG_VGIC_ERRATA
Date: Tue, 16 Jan 2018 21:12:56 +0530
Message-ID: <20180116154305.19186-2-mjaggi@caviumnetworks.com>
References: <20180116154305.19186-1-mjaggi@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180116154305.19186-1-mjaggi@caviumnetworks.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org, marc.zyngier@arm.com, sstabellini@kernel.org, julien.grall@linaro.org, andre.przywara@linaro.org
Cc: manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogTWFuaXNoIEphZ2dpIDxtYW5pc2guamFnZ2lAY2F2aXVtLmNvbT4KCkFkZCBhIGNvbmZp
ZyBvcHRpb24gdG8gZW5hYmxlIFZHSUMgRXJyYXRhIENvZGUgaW4gWGVuLiBQbGF0Zm9ybXMgd2hp
Y2ggZG8gbm90CmhhdmUgdGhpcyBlcnJ0YSBjYW4gY29tcGlsZSBvdXQgdGhpcyBmZWF0dXJlLgoK
U2lnbmVkLW9mZi1ieTogTWFuaXNoIEphZ2dpIDxtYW5pc2guamFnZ2lAY2F2aXVtLmNvbT4KLS0t
CiB4ZW4vYXJjaC9hcm0vS2NvbmZpZyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL0tjb25maWcgYi94ZW4vYXJj
aC9hcm0vS2NvbmZpZwppbmRleCBmNTgwMTlkNmVkLi4yOTY2ZTNhM2QzIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC9hcm0vS2NvbmZpZworKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZwpAQCAtNTksNiAr
NTksMTUgQEAgY29uZmlnIFNCU0FfVlVBUlRfQ09OU09MRQogCiBlbmRtZW51CiAKK21lbnUgIkVy
cmF0YSBXb3JrYXJvdW5kcyIKKyAgICAgICBkZXBlbmRzIG9uIEFSTV82NAorCitjb25maWcgVkdJ
Q19FUlJBVEEKKyAgICAgICBib29sICJIYW5kbGVyIGNvZGUgZm9yIGVtdWxhdGlvbiBvZiBHcm91
cDAvMSB2R0lDIHJlZ2lzdGVycyBmb3IgVkdDIEVycmF0YSIKKyAgICAgICBkZXBlbmRzIG9uIEFS
TV82NAorCitlbmRtZW51CisKIG1lbnUgIkFSTSBlcnJhdGEgd29ya2Fyb3VuZCB2aWEgdGhlIGFs
dGVybmF0aXZlIGZyYW1ld29yayIKIAlkZXBlbmRzIG9uIEhBU19BTFRFUk5BVElWRQogCi0tIAoy
LjE0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
