From: Huaisheng Ye <yehs2007@163.com>
Subject: [RFC PATCH v3 3/9] drivers/xen/swiotlb-xen: update
 usage of zone modifiers
Date: Wed, 23 May 2018 22:57:48 +0800
Message-ID: <1527087474-93986-4-git-send-email-yehs2007__25320.1342457489$1527089901$gmane$org@163.com>
References: <1527087474-93986-1-git-send-email-yehs2007@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=sepi=ik=163.com=yehs2007@srs-us1.protection.inumbo.net>)
 id 1fLVF4-0001S1-Dv
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 14:59:54 +0000
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
Cc: kstewart@linuxfoundation.org, Juergen Gross <jgross@suse.com>, mhocko@suse.com, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, willy@infradead.org, colyli@suse.de, Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, mgorman@techsingularity.net, hch@lst.de, vbabka@suse.cz
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgoKVXNlIF9fR0ZQX1pPTkVfTUFT
SyB0byByZXBsYWNlIChfX0dGUF9ETUEgfCBfX0dGUF9ISUdITUVNKS4KCkluIGZ1bmN0aW9uIHhl
bl9zd2lvdGxiX2FsbG9jX2NvaGVyZW50LCBpdCBpcyBvYnZpb3VzIHRoYXQgX19HRlBfRE1BMzIK
aXMgbm90IHRoZSBleHBlY3Rpbmcgem9uZSB0eXBlLgoKX19fR0ZQX0RNQSwgX19fR0ZQX0hJR0hN
RU0gYW5kIF9fX0dGUF9ETUEzMiBoYXZlIGJlZW4gZGVsZXRlZCBmcm9tIEdGUApiaXRtYXNrcywg
dGhlIGJvdHRvbSB0aHJlZSBiaXRzIG9mIEdGUCBtYXNrIGlzIHJlc2VydmVkIGZvciBzdG9yaW5n
CmVuY29kZWQgem9uZSBudW1iZXIuCl9fR0ZQX0RNQSwgX19HRlBfSElHSE1FTSBhbmQgX19HRlBf
RE1BMzIgc2hvdWxkIG5vdCBiZSBvcGVyYXRlZCB3aXRoCmVhY2ggb3RoZXJzIGJ5IE9SLgoKVXNl
IEdGUF9OT1JNQUwoKSB0byBjbGVhciBib3R0b20gMyBiaXRzIG9mIEdGUCBiaXRtYWtzLgoKU2ln
bmVkLW9mZi1ieTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgpDYzogS29ucmFkIFJ6
ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogQm9yaXMgT3N0cm92c2t5
IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4KLS0tCiBk
cml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vc3dpb3RsYi14
ZW4uYyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKaW5kZXggZTFjNjA4OS4uMzk5OTk1OSAx
MDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYworKysgYi9kcml2ZXJzL3hlbi9z
d2lvdGxiLXhlbi5jCkBAIC0zMDEsNyArMzAxLDcgQEAgaW50IF9fcmVmIHhlbl9zd2lvdGxiX2lu
aXQoaW50IHZlcmJvc2UsIGJvb2wgZWFybHkpCiAJKiBtYWNoaW5lIHBoeXNpY2FsIGxheW91dC4g
IFdlIGNhbid0IGFsbG9jYXRlIGhpZ2htZW0KIAkqIGJlY2F1c2Ugd2UgY2FuJ3QgcmV0dXJuIGEg
cG9pbnRlciB0byBpdC4KIAkqLwotCWZsYWdzICY9IH4oX19HRlBfRE1BIHwgX19HRlBfSElHSE1F
TSk7CisJZmxhZ3MgPSBHRlBfTk9STUFMKGZsYWdzKTsKIAogCS8qIE9uIEFSTSB0aGlzIGZ1bmN0
aW9uIHJldHVybnMgYW4gaW9yZW1hcCdwZWQgdmlydHVhbCBhZGRyZXNzIGZvcgogCSAqIHdoaWNo
IHZpcnRfdG9fcGh5cyBkb2Vzbid0IHJldHVybiB0aGUgY29ycmVzcG9uZGluZyBwaHlzaWNhbAot
LSAKMS44LjMuMQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
