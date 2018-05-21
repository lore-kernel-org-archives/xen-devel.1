From: Huaisheng Ye <yehs2007@gmail.com>
Subject: [RFC PATCH v2 03/12] arch/x86/kernel/pci-calgary_64:
 update usage of address zone modifiers
Date: Mon, 21 May 2018 23:20:24 +0800
Message-ID: <1526916033-4877-4-git-send-email-yehs2007__11772.5170254291$1526961136$gmane$org@gmail.com>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hc98=ii=gmail.com=yehs2007@srs-us1.protection.inumbo.net>)
 id 1fKmcN-00069U-2U
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 15:20:59 +0000
Received: by mail-pg0-x243.google.com with SMTP id c22-v6so5835630pgn.11
 for <xen-devel@lists.xenproject.org>; Mon, 21 May 2018 08:20:58 -0700 (PDT)
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
Cc: kstewart@linuxfoundation.org, Muli Ben-Yehuda <mulix@mulix.org>, mhocko@suse.com, "H. Peter Anvin" <hpa@zytor.com>, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, Jon Mason <jdmason@kudzu.us>, linux-kernel@vger.kernel.org, willy@infradead.org, alexander.levin@verizon.com, iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, colyli@suse.de, mgorman@techsingularity.net, vbabka@suse.cz
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgoKVXNlIF9fR0ZQX1pPTkVfTUFT
SyB0byByZXBsYWNlIChfX0dGUF9ETUEgfCBfX0dGUF9ISUdITUVNIHwgX19HRlBfRE1BMzIpLgoK
X19fR0ZQX0RNQSwgX19fR0ZQX0hJR0hNRU0gYW5kIF9fX0dGUF9ETUEzMiBoYXZlIGJlZW4gZGVs
ZXRlZCBmcm9tIEdGUApiaXRtYXNrcywgdGhlIGJvdHRvbSB0aHJlZSBiaXRzIG9mIEdGUCBtYXNr
IGlzIHJlc2VydmVkIGZvciBzdG9yaW5nCmVuY29kZWQgem9uZSBudW1iZXIuCl9fR0ZQX0RNQSwg
X19HRlBfSElHSE1FTSBhbmQgX19HRlBfRE1BMzIgc2hvdWxkIG5vdCBiZSBvcGVyYXRlZCBieSBP
Ui4KClNpZ25lZC1vZmYtYnk6IEh1YWlzaGVuZyBZZSA8eWVoczFAbGVub3ZvLmNvbT4KQ2M6IE11
bGkgQmVuLVllaHVkYSA8bXVsaXhAbXVsaXgub3JnPgpDYzogSm9uIE1hc29uIDxqZG1hc29uQGt1
ZHp1LnVzPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdv
IE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KQ2M6ICJILiBQZXRlciBBbnZpbiIgPGhwYUB6eXRv
ci5jb20+Ci0tLQogYXJjaC94ODYva2VybmVsL3BjaS1jYWxnYXJ5XzY0LmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9rZXJuZWwvcGNpLWNhbGdhcnlfNjQuYyBiL2FyY2gveDg2L2tlcm5lbC9wY2ktY2Fs
Z2FyeV82NC5jCmluZGV4IDM1YzQ2MWYuLmM4OTcxN2QgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2tl
cm5lbC9wY2ktY2FsZ2FyeV82NC5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9wY2ktY2FsZ2FyeV82
NC5jCkBAIC00NDUsNyArNDQ1LDcgQEAgc3RhdGljIHZvaWQqIGNhbGdhcnlfYWxsb2NfY29oZXJl
bnQoc3RydWN0IGRldmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwKIAlucGFnZXMgPSBzaXplID4+IFBB
R0VfU0hJRlQ7CiAJb3JkZXIgPSBnZXRfb3JkZXIoc2l6ZSk7CiAKLQlmbGFnICY9IH4oX19HRlBf
RE1BIHwgX19HRlBfSElHSE1FTSB8IF9fR0ZQX0RNQTMyKTsKKwlmbGFnICY9IH5fX0dGUF9aT05F
X01BU0s7CiAKIAkvKiBhbGxvYyBlbm91Z2ggcGFnZXMgKGFuZCBwb3NzaWJseSBtb3JlKSAqLwog
CXJldCA9ICh2b2lkICopX19nZXRfZnJlZV9wYWdlcyhmbGFnLCBvcmRlcik7Ci0tIAoxLjguMy4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
