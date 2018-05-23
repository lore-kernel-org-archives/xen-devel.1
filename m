From: Huaisheng Ye <yehs2007@gmail.com>
Subject: [RFC PATCH v3 7/9] mm/zsmalloc: update usage of zone
 modifiers
Date: Thu, 24 May 2018 01:07:06 +0800
Message-ID: <1527095226-5079-1-git-send-email-yehs2007__13413.277877453$1527095179$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pyse=ik=gmail.com=yehs2007@srs-us1.protection.inumbo.net>)
 id 1fLXET-00085f-MG
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 17:07:25 +0000
Received: by mail-pf0-x241.google.com with SMTP id f189-v6so10818312pfa.7
 for <xen-devel@lists.xenproject.org>; Wed, 23 May 2018 10:07:24 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: akpm@linux-foundation.org, linux-mm@kvack.org
Cc: kstewart@linuxfoundation.org, mhocko@suse.com, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, willy@infradead.org, colyli@suse.de, Christoph Hellwig <hch@infradead.org>, Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, Nitin Gupta <ngupta@vflare.org>, mgorman@techsingularity.net, hch@lst.de, vbabka@suse.cz
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgoKVXNlIF9fR0ZQX1pPTkVfTU9W
QUJMRSB0byByZXBsYWNlIChfX0dGUF9ISUdITUVNIHwgX19HRlBfTU9WQUJMRSkuCgpfX19HRlBf
RE1BLCBfX19HRlBfSElHSE1FTSBhbmQgX19fR0ZQX0RNQTMyIGhhdmUgYmVlbiBkZWxldGVkIGZy
b20gR0ZQCmJpdG1hc2tzLCB0aGUgYm90dG9tIHRocmVlIGJpdHMgb2YgR0ZQIG1hc2sgaXMgcmVz
ZXJ2ZWQgZm9yIHN0b3JpbmcKZW5jb2RlZCB6b25lIG51bWJlci4KCl9fR0ZQX1pPTkVfTU9WQUJM
RSBjb250YWlucyBlbmNvZGVkIFpPTkVfTU9WQUJMRSBhbmQgX19HRlBfTU9WQUJMRSBmbGFnLgoK
V2l0aCBHRlBfWk9ORV9UQUJMRSwgX19HRlBfSElHSE1FTSBPUmluZyBfX0dGUF9NT1ZBQkxFIG1l
YW5zIGdmcF96b25lCnNob3VsZCByZXR1cm4gWk9ORV9NT1ZBQkxFLiBJbiBvcmRlciB0byBrZWVw
IHRoYXQgY29tcGF0aWJsZSB3aXRoCkdGUF9aT05FX1RBQkxFLCBVc2UgR0ZQX05PUk1BTF9VTk1P
VkFCTEUoKSB0byBjbGVhciBib3R0b20gNCBiaXRzIG9mCkdGUCBiaXRtYWtzLgoKU2lnbmVkLW9m
Zi1ieTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgpDYzogTWluY2hhbiBLaW0gPG1p
bmNoYW5Aa2VybmVsLm9yZz4KQ2M6IE5pdGluIEd1cHRhIDxuZ3VwdGFAdmZsYXJlLm9yZz4KQ2M6
IFNlcmdleSBTZW5vemhhdHNreSA8c2VyZ2V5LnNlbm96aGF0c2t5LndvcmtAZ21haWwuY29tPgpD
YzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPgotLS0KIG1tL3pzbWFsbG9j
LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvbW0venNtYWxsb2MuYyBiL21tL3pzbWFsbG9jLmMKaW5kZXggNjFj
YjA1ZC4uZTI1MGM2OSAxMDA2NDQKLS0tIGEvbW0venNtYWxsb2MuYworKysgYi9tbS96c21hbGxv
Yy5jCkBAIC0zNDUsNyArMzQ1LDcgQEAgc3RhdGljIHZvaWQgZGVzdHJveV9jYWNoZShzdHJ1Y3Qg
enNfcG9vbCAqcG9vbCkKIHN0YXRpYyB1bnNpZ25lZCBsb25nIGNhY2hlX2FsbG9jX2hhbmRsZShz
dHJ1Y3QgenNfcG9vbCAqcG9vbCwgZ2ZwX3QgZ2ZwKQogewogCXJldHVybiAodW5zaWduZWQgbG9u
ZylrbWVtX2NhY2hlX2FsbG9jKHBvb2wtPmhhbmRsZV9jYWNoZXAsCi0JCQlnZnAgJiB+KF9fR0ZQ
X0hJR0hNRU18X19HRlBfTU9WQUJMRSkpOworCQkJR0ZQX05PUk1BTF9VTk1PVkFCTEUoZ2ZwKSk7
CiB9CiAKIHN0YXRpYyB2b2lkIGNhY2hlX2ZyZWVfaGFuZGxlKHN0cnVjdCB6c19wb29sICpwb29s
LCB1bnNpZ25lZCBsb25nIGhhbmRsZSkKQEAgLTM1Niw3ICszNTYsNyBAQCBzdGF0aWMgdm9pZCBj
YWNoZV9mcmVlX2hhbmRsZShzdHJ1Y3QgenNfcG9vbCAqcG9vbCwgdW5zaWduZWQgbG9uZyBoYW5k
bGUpCiBzdGF0aWMgc3RydWN0IHpzcGFnZSAqY2FjaGVfYWxsb2NfenNwYWdlKHN0cnVjdCB6c19w
b29sICpwb29sLCBnZnBfdCBmbGFncykKIHsKIAlyZXR1cm4ga21lbV9jYWNoZV9hbGxvYyhwb29s
LT56c3BhZ2VfY2FjaGVwLAotCQkJZmxhZ3MgJiB+KF9fR0ZQX0hJR0hNRU18X19HRlBfTU9WQUJM
RSkpOworCQkJR0ZQX05PUk1BTF9VTk1PVkFCTEUoZmxhZ3MpKTsKIH0KIAogc3RhdGljIHZvaWQg
Y2FjaGVfZnJlZV96c3BhZ2Uoc3RydWN0IHpzX3Bvb2wgKnBvb2wsIHN0cnVjdCB6c3BhZ2UgKnpz
cGFnZSkKLS0gCjEuOC4zLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
