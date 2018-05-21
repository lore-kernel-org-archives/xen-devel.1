From: Huaisheng Ye <yehs2007@gmail.com>
Subject: [RFC PATCH v2 02/12] arch/x86/kernel/amd_gart_64:
 update usage of address zone modifiers
Date: Mon, 21 May 2018 23:20:23 +0800
Message-ID: <1526916033-4877-3-git-send-email-yehs2007__24076.4031805613$1526961148$gmane$org@gmail.com>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hc98=ii=gmail.com=yehs2007@srs-us1.protection.inumbo.net>)
 id 1fKmcI-00069B-27
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 15:20:54 +0000
Received: by mail-pg0-x241.google.com with SMTP id e21-v6so1602799pgv.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 May 2018 08:20:52 -0700 (PDT)
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
Cc: kstewart@linuxfoundation.org, mhocko@suse.com, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, willy@infradead.org, alexander.levin@verizon.com, iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, colyli@suse.de, mgorman@techsingularity.net, vbabka@suse.cz, Robin Murphy <robin.murphy@arm.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgoKVXNlIF9fR0ZQX1pPTkVfTUFT
SyB0byByZXBsYWNlIChfX0dGUF9ETUEgfCBfX0dGUF9ISUdITUVNIHwgX19HRlBfRE1BMzIpLgoK
X19fR0ZQX0RNQSwgX19fR0ZQX0hJR0hNRU0gYW5kIF9fX0dGUF9ETUEzMiBoYXZlIGJlZW4gZGVs
ZXRlZCBmcm9tIEdGUApiaXRtYXNrcywgdGhlIGJvdHRvbSB0aHJlZSBiaXRzIG9mIEdGUCBtYXNr
IGlzIHJlc2VydmVkIGZvciBzdG9yaW5nCmVuY29kZWQgem9uZSBudW1iZXIuCl9fR0ZQX0RNQSwg
X19HRlBfSElHSE1FTSBhbmQgX19HRlBfRE1BMzIgc2hvdWxkIG5vdCBiZSBvcGVyYXRlZCBieSBP
Ui4KClNpZ25lZC1vZmYtYnk6IEh1YWlzaGVuZyBZZSA8eWVoczFAbGVub3ZvLmNvbT4KQ2M6IFRo
b21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdv
QHJlZGhhdC5jb20+CkNjOiAiSC4gUGV0ZXIgQW52aW4iIDxocGFAenl0b3IuY29tPgpDYzogUm9i
aW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KLS0tCiBhcmNoL3g4Ni9rZXJuZWwvYW1k
X2dhcnRfNjQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9hbWRfZ2FydF82NC5jIGIvYXJj
aC94ODYva2VybmVsL2FtZF9nYXJ0XzY0LmMKaW5kZXggZWNkNDg2Yy4uMWRkNjk3MSAxMDA2NDQK
LS0tIGEvYXJjaC94ODYva2VybmVsL2FtZF9nYXJ0XzY0LmMKKysrIGIvYXJjaC94ODYva2VybmVs
L2FtZF9nYXJ0XzY0LmMKQEAgLTQ4NSw3ICs0ODUsNyBAQCBzdGF0aWMgaW50IGdhcnRfbWFwX3Nn
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZywgaW50IG5lbnRzLAog
CXN0cnVjdCBwYWdlICpwYWdlOwogCiAJaWYgKGZvcmNlX2lvbW11ICYmICEoZmxhZyAmIEdGUF9E
TUEpKSB7Ci0JCWZsYWcgJj0gfihfX0dGUF9ETUEgfCBfX0dGUF9ISUdITUVNIHwgX19HRlBfRE1B
MzIpOworCQlmbGFnICY9IH5fX0dGUF9aT05FX01BU0s7CiAJCXBhZ2UgPSBhbGxvY19wYWdlcyhm
bGFnIHwgX19HRlBfWkVSTywgZ2V0X29yZGVyKHNpemUpKTsKIAkJaWYgKCFwYWdlKQogCQkJcmV0
dXJuIE5VTEw7Ci0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
