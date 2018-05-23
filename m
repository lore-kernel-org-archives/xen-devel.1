From: Huaisheng Ye <yehs2007@gmail.com>
Subject: [RFC PATCH v3 8/9] include/linux/highmem.h: update
 usage of movableflags
Date: Thu, 24 May 2018 01:08:06 +0800
Message-ID: <1527095286-5165-1-git-send-email-yehs2007__27070.397247053$1527095222$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pyse=ik=gmail.com=yehs2007@srs-us1.protection.inumbo.net>)
 id 1fLXFK-0008AF-Al
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 17:08:18 +0000
Received: by mail-pg0-x243.google.com with SMTP id p8-v6so9691050pgq.10
 for <xen-devel@lists.xenproject.org>; Wed, 23 May 2018 10:08:16 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: akpm@linux-foundation.org, linux-mm@kvack.org
Cc: kstewart@linuxfoundation.org, mhocko@suse.com, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, Philippe Ombredanne <pombredanne@nexb.com>, linux-kernel@vger.kernel.org, willy@infradead.org, colyli@suse.de, Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, mgorman@techsingularity.net, hch@lst.de, vbabka@suse.cz
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgoKR0ZQX0hJR0hVU0VSX01PVkFC
TEUgZG9lc24ndCBlcXVhbCB0byBHRlBfSElHSFVTRVIgfCBfX0dGUF9NT1ZBQkxFLAptb2RpZnkg
aXQgdG8gYWRhcHQgcGF0Y2ggb2YgZ2V0dGluZyByaWQgb2YgR0ZQX1pPTkVfVEFCTEUvQkFELgoK
U2lnbmVkLW9mZi1ieTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgpDYzogS2F0ZSBT
dGV3YXJ0IDxrc3Rld2FydEBsaW51eGZvdW5kYXRpb24ub3JnPgpDYzogR3JlZyBLcm9haC1IYXJ0
bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGds
eEBsaW51dHJvbml4LmRlPgpDYzogUGhpbGlwcGUgT21icmVkYW5uZSA8cG9tYnJlZGFubmVAbmV4
Yi5jb20+CkNjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+Ci0tLQogaW5j
bHVkZS9saW51eC9oaWdobWVtLmggfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9oaWdobWVt
LmggYi9pbmNsdWRlL2xpbnV4L2hpZ2htZW0uaAppbmRleCAwNjkwNjc5Li41MzgzYzllIDEwMDY0
NAotLS0gYS9pbmNsdWRlL2xpbnV4L2hpZ2htZW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L2hpZ2ht
ZW0uaApAQCAtMTU5LDggKzE1OSw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBjbGVhcl91c2VyX2hp
Z2hwYWdlKHN0cnVjdCBwYWdlICpwYWdlLCB1bnNpZ25lZCBsb25nIHZhZGRyKQogCQkJc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCQl1bnNpZ25lZCBsb25nIHZhZGRyKQogewotCXN0cnVj
dCBwYWdlICpwYWdlID0gYWxsb2NfcGFnZV92bWEoR0ZQX0hJR0hVU0VSIHwgbW92YWJsZWZsYWdz
LAotCQkJdm1hLCB2YWRkcik7CisJc3RydWN0IHBhZ2UgKnBhZ2UgPSBhbGxvY19wYWdlX3ZtYSht
b3ZhYmxlZmxhZ3MgPworCQlHRlBfSElHSFVTRVJfTU9WQUJMRSA6IEdGUF9ISUdIVVNFUiwgdm1h
LCB2YWRkcik7CiAKIAlpZiAocGFnZSkKIAkJY2xlYXJfdXNlcl9oaWdocGFnZShwYWdlLCB2YWRk
cik7Ci0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
