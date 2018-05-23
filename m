From: Huaisheng Ye <yehs2007@163.com>
Subject: [RFC PATCH v3 2/9] include/linux/dma-mapping: update
 usage of zone modifiers
Date: Wed, 23 May 2018 22:57:47 +0800
Message-ID: <1527087474-93986-3-git-send-email-yehs2007__29208.3160522909$1527101460$gmane$org@163.com>
References: <1527087474-93986-1-git-send-email-yehs2007@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=sepi=ik=163.com=yehs2007@srs-us1.protection.inumbo.net>)
 id 1fLYrX-0000RU-2n
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 18:51:51 +0000
In-Reply-To: <1527087474-93986-1-git-send-email-yehs2007@163.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: akpm@linux-foundation.org, linux-mm@kvack.org
Cc: kstewart@linuxfoundation.org, mhocko@suse.com, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, willy@infradead.org, colyli@suse.de, Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, Robin Murphy <robin.murphy@arm.com>, mgorman@techsingularity.net, hch@lst.de, vbabka@suse.cz, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgoKVXNlIF9fR0ZQX1pPTkVfTUFT
SyB0byByZXBsYWNlIChfX0dGUF9ETUEgfCBfX0dGUF9ISUdITUVNIHwgX19HRlBfRE1BMzIpLgoK
X19fR0ZQX0RNQSwgX19fR0ZQX0hJR0hNRU0gYW5kIF9fX0dGUF9ETUEzMiBoYXZlIGJlZW4gZGVs
ZXRlZCBmcm9tIEdGUApiaXRtYXNrcywgdGhlIGJvdHRvbSB0aHJlZSBiaXRzIG9mIEdGUCBtYXNr
IGlzIHJlc2VydmVkIGZvciBzdG9yaW5nCmVuY29kZWQgem9uZSBudW1iZXIuCl9fR0ZQX0RNQSwg
X19HRlBfSElHSE1FTSBhbmQgX19HRlBfRE1BMzIgc2hvdWxkIG5vdCBiZSBvcGVyYXRlZCB3aXRo
CmVhY2ggb3RoZXJzIGJ5IE9SLgoKVXNlIEdGUF9OT1JNQUwoKSB0byBjbGVhciBib3R0b20gMyBi
aXRzIG9mIEdGUCBiaXRtYWtzLgoKU2lnbmVkLW9mZi1ieTogSHVhaXNoZW5nIFllIDx5ZWhzMUBs
ZW5vdm8uY29tPgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CkNjOiBNYXJlayBT
enlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+CkNjOiBSb2JpbiBNdXJwaHkgPHJv
YmluLm11cnBoeUBhcm0uY29tPgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQu
b3JnPgotLS0KIGluY2x1ZGUvbGludXgvZG1hLW1hcHBpbmcuaCB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgvZG1hLW1hcHBpbmcuaCBiL2luY2x1ZGUvbGludXgvZG1hLW1hcHBpbmcuaAppbmRleCBm
OGFiMWMwLi44ZmU1MjRkIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2RtYS1tYXBwaW5nLmgK
KysrIGIvaW5jbHVkZS9saW51eC9kbWEtbWFwcGluZy5oCkBAIC01MTksNyArNTE5LDcgQEAgc3Rh
dGljIGlubGluZSB2b2lkICpkbWFfYWxsb2NfYXR0cnMoc3RydWN0IGRldmljZSAqZGV2LCBzaXpl
X3Qgc2l6ZSwKIAkJcmV0dXJuIGNwdV9hZGRyOwogCiAJLyogbGV0IHRoZSBpbXBsZW1lbnRhdGlv
biBkZWNpZGUgb24gdGhlIHpvbmUgdG8gYWxsb2NhdGUgZnJvbTogKi8KLQlmbGFnICY9IH4oX19H
RlBfRE1BIHwgX19HRlBfRE1BMzIgfCBfX0dGUF9ISUdITUVNKTsKKwlmbGFnID0gR0ZQX05PUk1B
TChmbGFnKTsKIAogCWlmICghYXJjaF9kbWFfYWxsb2NfYXR0cnMoJmRldiwgJmZsYWcpKQogCQly
ZXR1cm4gTlVMTDsKLS0gCjEuOC4zLjEKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
