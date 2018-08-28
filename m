From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/arm: fix SMMU driver build
Date: Tue, 28 Aug 2018 16:47:40 -0700
Message-ID: <1535500060-13958-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

QWRkIG1pc3NpbmcgIkNPTkZJR18iCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHN0ZWZhbm9zQHhpbGlueC5jb20+Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL01h
a2VmaWxlIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL01ha2VmaWxlIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL01ha2VmaWxlCmluZGV4IDAxNTY0MzEuLmIzZWZj
ZmQgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9NYWtlZmlsZQorKysg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUKQEAgLTEsMiArMSwyIEBACiBv
YmoteSArPSBpb21tdS5vCi1vYmotJChBUk1fU01NVSkgKz0gc21tdS5vCitvYmotJChDT05GSUdf
QVJNX1NNTVUpICs9IHNtbXUubwotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
