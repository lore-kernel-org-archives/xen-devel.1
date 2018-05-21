From: Huaisheng Ye <yehs2007@gmail.com>
Subject: [RFC PATCH v2 05/12] include/linux/dma-mapping: update
 usage of address zone modifiers
Date: Mon, 21 May 2018 23:20:26 +0800
Message-ID: <1526916033-4877-6-git-send-email-yehs2007__46158.2495751374$1526961150$gmane$org@gmail.com>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hc98=ii=gmail.com=yehs2007@srs-us1.protection.inumbo.net>)
 id 1fKmcW-0006A6-Dh
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 15:21:08 +0000
Received: by mail-pg0-x244.google.com with SMTP id p8-v6so6499689pgq.10
 for <xen-devel@lists.xenproject.org>; Mon, 21 May 2018 08:21:07 -0700 (PDT)
In-Reply-To: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: akpm@linux-foundation.org, linux-mm@kvack.org
Cc: kstewart@linuxfoundation.org, mhocko@suse.com, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, willy@infradead.org, alexander.levin@verizon.com, iommu@lists.linux-foundation.org, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, colyli@suse.de, mgorman@techsingularity.net, Christoph Hellwig <hch@lst.de>, vbabka@suse.cz, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgoKVXNlIF9fR0ZQX1pPTkVfTUFT
SyB0byByZXBsYWNlIChfX0dGUF9ETUEgfCBfX0dGUF9ISUdITUVNIHwgX19HRlBfRE1BMzIpLgoK
X19fR0ZQX0RNQSwgX19fR0ZQX0hJR0hNRU0gYW5kIF9fX0dGUF9ETUEzMiBoYXZlIGJlZW4gZGVs
ZXRlZCBmcm9tIEdGUApiaXRtYXNrcywgdGhlIGJvdHRvbSB0aHJlZSBiaXRzIG9mIEdGUCBtYXNr
IGlzIHJlc2VydmVkIGZvciBzdG9yaW5nCmVuY29kZWQgem9uZSBudW1iZXIuCl9fR0ZQX0RNQSwg
X19HRlBfSElHSE1FTSBhbmQgX19HRlBfRE1BMzIgc2hvdWxkIG5vdCBiZSBvcGVyYXRlZCB3aXRo
CmVhY2ggb3RoZXJzIGJ5IE9SLgoKU2lnbmVkLW9mZi1ieTogSHVhaXNoZW5nIFllIDx5ZWhzMUBs
ZW5vdm8uY29tPgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CkNjOiBNYXJlayBT
enlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+CkNjOiBSb2JpbiBNdXJwaHkgPHJv
YmluLm11cnBoeUBhcm0uY29tPgotLS0KIGluY2x1ZGUvbGludXgvZG1hLW1hcHBpbmcuaCB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLW1hcHBpbmcuaCBiL2luY2x1ZGUvbGludXgvZG1hLW1h
cHBpbmcuaAppbmRleCBlYjllYWI0Li4zZGEwMjkzIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4
L2RtYS1tYXBwaW5nLmgKKysrIGIvaW5jbHVkZS9saW51eC9kbWEtbWFwcGluZy5oCkBAIC01MjMs
NyArNTIzLDcgQEAgc3RhdGljIGlubGluZSB2b2lkICpkbWFfYWxsb2NfYXR0cnMoc3RydWN0IGRl
dmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwKIAkgKiBkZWNpZGUgb24gdGhlIHdheSBvZiB6ZXJvaW5n
IHRoZSBtZW1vcnkgZ2l2ZW4gdGhhdCB0aGUgbWVtb3J5CiAJICogcmV0dXJuZWQgc2hvdWxkIGFs
d2F5cyBiZSB6ZXJvZWQuCiAJICovCi0JZmxhZyAmPSB+KF9fR0ZQX0RNQSB8IF9fR0ZQX0RNQTMy
IHwgX19HRlBfSElHSE1FTSB8IF9fR0ZQX1pFUk8pOworCWZsYWcgJj0gfihfX0dGUF9aT05FX01B
U0sgfCBfX0dGUF9aRVJPKTsKIAogCWlmICghYXJjaF9kbWFfYWxsb2NfYXR0cnMoJmRldiwgJmZs
YWcpKQogCQlyZXR1cm4gTlVMTDsKLS0gCjEuOC4zLjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
