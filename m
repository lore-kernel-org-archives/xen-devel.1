From: Huaisheng Ye <yehs2007@gmail.com>
Subject: [RFC PATCH v2 04/12] drivers/iommu/amd_iommu: update
 usage of address zone modifiers
Date: Mon, 21 May 2018 23:20:25 +0800
Message-ID: <1526916033-4877-5-git-send-email-yehs2007__14331.3212589876$1526961146$gmane$org@gmail.com>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hc98=ii=gmail.com=yehs2007@srs-us1.protection.inumbo.net>)
 id 1fKmcR-00069n-Ng
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 15:21:03 +0000
Received: by mail-pg0-x242.google.com with SMTP id 11-v6so4874353pge.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 May 2018 08:21:02 -0700 (PDT)
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
Cc: kstewart@linuxfoundation.org, mhocko@suse.com, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, willy@infradead.org, alexander.levin@verizon.com, iommu@lists.linux-foundation.org, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, colyli@suse.de, mgorman@techsingularity.net, vbabka@suse.cz
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgoKVXNlIF9fR0ZQX1pPTkVfTUFT
SyB0byByZXBsYWNlIChfX0dGUF9ETUEgfCBfX0dGUF9ISUdITUVNIHwgX19HRlBfRE1BMzIpLgoK
X19fR0ZQX0RNQSwgX19fR0ZQX0hJR0hNRU0gYW5kIF9fX0dGUF9ETUEzMiBoYXZlIGJlZW4gZGVs
ZXRlZCBmcm9tIEdGUApiaXRtYXNrcywgdGhlIGJvdHRvbSB0aHJlZSBiaXRzIG9mIEdGUCBtYXNr
IGlzIHJlc2VydmVkIGZvciBzdG9yaW5nCmVuY29kZWQgem9uZSBudW1iZXIuCl9fR0ZQX0RNQSwg
X19HRlBfSElHSE1FTSBhbmQgX19HRlBfRE1BMzIgc2hvdWxkIG5vdCBiZSBvcGVyYXRlZCBieSBP
Ui4KClNpZ25lZC1vZmYtYnk6IEh1YWlzaGVuZyBZZSA8eWVoczFAbGVub3ZvLmNvbT4KQ2M6IEpv
ZXJnIFJvZWRlbCA8am9yb0A4Ynl0ZXMub3JnPgotLS0KIGRyaXZlcnMvaW9tbXUvYW1kX2lvbW11
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2FtZF9pb21tdS5jIGIvZHJpdmVycy9pb21tdS9h
bWRfaW9tbXUuYwppbmRleCA3NDc4OGZkLi4zOTIxZDUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lv
bW11L2FtZF9pb21tdS5jCisrKyBiL2RyaXZlcnMvaW9tbXUvYW1kX2lvbW11LmMKQEAgLTI2MTQs
NyArMjYxNCw3IEBAIHN0YXRpYyB2b2lkICphbGxvY19jb2hlcmVudChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHNpemVfdCBzaXplLAogCWRtYV9kb20gICA9IHRvX2RtYV9vcHNfZG9tYWluKGRvbWFpbik7
CiAJc2l6ZQkgID0gUEFHRV9BTElHTihzaXplKTsKIAlkbWFfbWFzayAgPSBkZXYtPmNvaGVyZW50
X2RtYV9tYXNrOwotCWZsYWcgICAgICY9IH4oX19HRlBfRE1BIHwgX19HRlBfSElHSE1FTSB8IF9f
R0ZQX0RNQTMyKTsKKwlmbGFnICAgICAmPSB+X19HRlBfWk9ORV9NQVNLOwogCWZsYWcgICAgIHw9
IF9fR0ZQX1pFUk87CiAKIAlwYWdlID0gYWxsb2NfcGFnZXMoZmxhZyB8IF9fR0ZQX05PV0FSTiwg
IGdldF9vcmRlcihzaXplKSk7Ci0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
