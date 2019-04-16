From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [REBASE PATCH v5 6/9] iommu/dma-iommu.c: Convert to use
 vm_map_pages()
Date: Tue, 16 Apr 2019 17:19:47 +0530
Message-ID: <80c3d220fc6ada73a88ce43ca049afb55a889258.1552921225.git.jrdr.linux__45342.7673479141$1555415310$gmane$org@gmail.com>
References: <cover.1552921225.git.jrdr.linux@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <cover.1552921225.git.jrdr.linux@gmail.com>
In-Reply-To: <cover.1552921225.git.jrdr.linux@gmail.com>
References: <cover.1552921225.git.jrdr.linux@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: akpm@linux-foundation.org, willy@infradead.org, mhocko@suse.com, kirill.shutemov@linux.intel.com, vbabka@suse.cz, riel@surriel.com, sfr@canb.auug.org.au, rppt@linux.vnet.ibm.com, peterz@infradead.org, linux@armlinux.org.uk, robin.murphy@arm.com, iamjoonsoo.kim@lge.com, treding@nvidia.com, keescook@chromium.org, m.szyprowski@samsung.com, stefanr@s5r6.in-berlin.de, hjc@rock-chips.com, heiko@sntech.de, airlied@linux.ie, oleksandr_andrushchenko@epam.com, joro@8bytes.org, pawel@osciak.com, kyungmin.park@samsung.com, mchehab@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org, linux-mm@kvack.org, iommu@lists.linux-foundation.org, Souptick Joarder <jrdr.linux@gmail.com>, linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Q29udmVydCB0byB1c2Ugdm1fbWFwX3BhZ2VzKCkgdG8gbWFwIHJhbmdlIG9mIGtlcm5lbAptZW1v
cnkgdG8gdXNlciB2bWEuCgpTaWduZWQtb2ZmLWJ5OiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxp
bnV4QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2lvbW11L2RtYS1pb21tdS5jIHwgMTIgKy0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDExIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvZG1hLWlvbW11LmMgYi9kcml2ZXJzL2lvbW11L2Rt
YS1pb21tdS5jCmluZGV4IGQxOWYzZDYuLmJhY2ViZmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW9t
bXUvZG1hLWlvbW11LmMKKysrIGIvZHJpdmVycy9pb21tdS9kbWEtaW9tbXUuYwpAQCAtNjIwLDE3
ICs2MjAsNyBAQCBzdHJ1Y3QgcGFnZSAqKmlvbW11X2RtYV9hbGxvYyhzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHNpemVfdCBzaXplLCBnZnBfdCBnZnAsCiAKIGludCBpb21tdV9kbWFfbW1hcChzdHJ1Y3Qg
cGFnZSAqKnBhZ2VzLCBzaXplX3Qgc2l6ZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiB7
Ci0JdW5zaWduZWQgbG9uZyB1YWRkciA9IHZtYS0+dm1fc3RhcnQ7Ci0JdW5zaWduZWQgaW50IGks
IGNvdW50ID0gUEFHRV9BTElHTihzaXplKSA+PiBQQUdFX1NISUZUOwotCWludCByZXQgPSAtRU5Y
SU87Ci0KLQlmb3IgKGkgPSB2bWEtPnZtX3Bnb2ZmOyBpIDwgY291bnQgJiYgdWFkZHIgPCB2bWEt
PnZtX2VuZDsgaSsrKSB7Ci0JCXJldCA9IHZtX2luc2VydF9wYWdlKHZtYSwgdWFkZHIsIHBhZ2Vz
W2ldKTsKLQkJaWYgKHJldCkKLQkJCWJyZWFrOwotCQl1YWRkciArPSBQQUdFX1NJWkU7Ci0JfQot
CXJldHVybiByZXQ7CisJcmV0dXJuIHZtX21hcF9wYWdlcyh2bWEsIHBhZ2VzLCBQQUdFX0FMSUdO
KHNpemUpID4+IFBBR0VfU0hJRlQpOwogfQogCiBzdGF0aWMgZG1hX2FkZHJfdCBfX2lvbW11X2Rt
YV9tYXAoc3RydWN0IGRldmljZSAqZGV2LCBwaHlzX2FkZHJfdCBwaHlzLAotLSAKMS45LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
