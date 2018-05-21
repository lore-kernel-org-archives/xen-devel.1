From: Huaisheng Ye <yehs2007@gmail.com>
Subject: [RFC PATCH v2 11/12] include/linux/highmem: update
 usage of movableflags
Date: Mon, 21 May 2018 23:20:32 +0800
Message-ID: <1526916033-4877-12-git-send-email-yehs2007__8871.04050857506$1526961152$gmane$org@gmail.com>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hc98=ii=gmail.com=yehs2007@srs-us1.protection.inumbo.net>)
 id 1fKmd2-0006Au-01
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 15:21:40 +0000
Received: by mail-pl0-x243.google.com with SMTP id n10-v6so9010080plp.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 May 2018 08:21:38 -0700 (PDT)
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
Cc: kstewart@linuxfoundation.org, mhocko@suse.com, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, Philippe Ombredanne <pombredanne@nexb.com>, linux-kernel@vger.kernel.org, willy@infradead.org, alexander.levin@verizon.com, iommu@lists.linux-foundation.org, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, colyli@suse.de, mgorman@techsingularity.net, vbabka@suse.cz
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgoKR0ZQX0hJR0hVU0VSX01PVkFC
TEUgZG9lc24ndCBlcXVhbCB0byBHRlBfSElHSFVTRVIgfCBfX0dGUF9NT1ZBQkxFLAptb2RpZnkg
aXQgdG8gYWRhcHQgcGF0Y2ggb2YgZ2V0dGluZyByaWQgb2YgR0ZQX1pPTkVfVEFCTEUvQkFELgoK
U2lnbmVkLW9mZi1ieTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgpDYzogS2F0ZSBT
dGV3YXJ0IDxrc3Rld2FydEBsaW51eGZvdW5kYXRpb24ub3JnPgpDYzogR3JlZyBLcm9haC1IYXJ0
bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGds
eEBsaW51dHJvbml4LmRlPgpDYzogUGhpbGlwcGUgT21icmVkYW5uZSA8cG9tYnJlZGFubmVAbmV4
Yi5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9oaWdobWVtLmggfCA0ICsrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9oaWdobWVtLmggYi9pbmNsdWRlL2xpbnV4L2hpZ2htZW0uaAppbmRleCA3NzZmOTBm
Li5kYTM0MjYwIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2hpZ2htZW0uaAorKysgYi9pbmNs
dWRlL2xpbnV4L2hpZ2htZW0uaApAQCAtMTU5LDggKzE1OSw4IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBjbGVhcl91c2VyX2hpZ2hwYWdlKHN0cnVjdCBwYWdlICpwYWdlLCB1bnNpZ25lZCBsb25nIHZh
ZGRyKQogCQkJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCQl1bnNpZ25lZCBsb25nIHZh
ZGRyKQogewotCXN0cnVjdCBwYWdlICpwYWdlID0gYWxsb2NfcGFnZV92bWEoR0ZQX0hJR0hVU0VS
IHwgbW92YWJsZWZsYWdzLAotCQkJdm1hLCB2YWRkcik7CisJc3RydWN0IHBhZ2UgKnBhZ2UgPSBh
bGxvY19wYWdlX3ZtYShtb3ZhYmxlZmxhZ3MgPworCQlHRlBfSElHSFVTRVJfTU9WQUJMRSA6IEdG
UF9ISUdIVVNFUiwgdm1hLCB2YWRkcik7CiAKIAlpZiAocGFnZSkKIAkJY2xlYXJfdXNlcl9oaWdo
cGFnZShwYWdlLCB2YWRkcik7Ci0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
