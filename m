From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 04/25] xen/arm: increase MAX_MODULES
Date: Mon, 12 Nov 2018 14:59:37 -0800
Message-ID: <1542063598-23767-4-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1811121458060.8259@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1811121458060.8259@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: Stefano Stabellini <stefanos@xilinx.com>, Achin.Gupta@arm.com, sstabellini@kernel.org, andrii_anisov@epam.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

WGVuIGJvb3QgbW9kdWxlcyBuZWVkIHRvIGFjY291bnQgbm90IGp1c3QgZm9yIERvbTAgYnV0IGFs
c28gZm9yIGEgZmV3CnBvdGVudGlhbCBEb21VcywgZWFjaCBvZiB0aGVtIGNvbWluZyB3aXRoIHRo
ZWlyIG93biBrZXJuZWwgYW5kIGluaXRyZC4KSW5jcmVhc2UgTUFYX01PRFVMRVMgdG8gMzIgdG8g
YWxsb3cgZm9yIG1vcmUgRG9tVXMuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHN0ZWZhbm9zQHhpbGlueC5jb20+ClJldmlld2VkLWJ5OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9l
QGNhcmRvZS5jb20+Ci0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5o
CmluZGV4IDBjYzMzMzAuLmYxZTRhM2YgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0v
c2V0dXAuaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmgKQEAgLTgsNyArOCw3IEBA
CiAKICNkZWZpbmUgTlJfTUVNX0JBTktTIDEyOAogCi0jZGVmaW5lIE1BWF9NT0RVTEVTIDUgLyog
Q3VycmVudCBtYXhpbXVtIHVzZWZ1bCBtb2R1bGVzICovCisjZGVmaW5lIE1BWF9NT0RVTEVTIDMy
IC8qIEN1cnJlbnQgbWF4aW11bSB1c2VmdWwgbW9kdWxlcyAqLwogCiB0eXBlZGVmIGVudW0gewog
ICAgIEJPT1RNT0RfWEVOLAotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
