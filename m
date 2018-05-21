From: Huaisheng HS1 Ye <yehs1@lenovo.com>
Subject: [RFC PATCH v2 07/12] fs/btrfs/extent_io: update usage
 of address zone modifiers
Date: Mon, 21 May 2018 18:01:36 +0000
Message-ID: <HK2PR03MB16848D9371E00E9029FCC94092950__2477.15332448042$1526961129$gmane$org@HK2PR03MB1684.apcprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ozro=ii=lenovo.com=yehs1@srs-us1.protection.inumbo.net>)
 id 1fKp8D-00029l-A6
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 18:02:01 +0000
Content-Language: zh-CN
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "willy@infradead.org" <willy@infradead.org>
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "mhocko@suse.com" <mhocko@suse.com>, Ocean HY1 He <hehy1@lenovo.com>, "jbacik@fb.com" <jbacik@fb.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "alexander.levin@verizon.com" <alexander.levin@verizon.com>, "clm@fb.com" <clm@fb.com>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, NingTing Cheng <chengnt@lenovo.com>, "dsterba@suse.com" <dsterba@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "colyli@suse.de" <colyli@suse.de>, "mgorman@techsingularity.net" <mgorman@techsingularity.net>, "hch@lst.de" <hch@lst.de>, "vbabka@suse.cz" <vbabka@suse.cz>
List-Id: xen-devel@lists.xenproject.org

VXNlIF9fR0ZQX1pPTkVfTUFTSyB0byByZXBsYWNlIChfX0dGUF9ETUEzMiB8IF9fR0ZQX0hJR0hN
RU0pLgoKSW4gZnVuY3Rpb24gYWxsb2NfZXh0ZW50X3N0YXRlLCBpdCBpcyBvYnZpb3VzIHRoYXQg
X19HRlBfRE1BIGlzIG5vdCAKdGhlIGV4cGVjdGluZyB6b25lIHR5cGUuCgpfX19HRlBfRE1BLCBf
X19HRlBfSElHSE1FTSBhbmQgX19fR0ZQX0RNQTMyIGhhdmUgYmVlbiBkZWxldGVkIGZyb20gR0ZQ
IApiaXRtYXNrcywgdGhlIGJvdHRvbSB0aHJlZSBiaXRzIG9mIEdGUCBtYXNrIGlzIHJlc2VydmVk
IGZvciBzdG9yaW5nCmVuY29kZWQgem9uZSBudW1iZXIuCl9fR0ZQX0RNQSwgX19HRlBfSElHSE1F
TSBhbmQgX19HRlBfRE1BMzIgc2hvdWxkIG5vdCBiZSBvcGVyYXRlZCB3aXRoCmVhY2ggb3RoZXJz
IGJ5IE9SLiAKClNpZ25lZC1vZmYtYnk6IEh1YWlzaGVuZyBZZSA8eWVoczFAbGVub3ZvLmNvbT4K
Q2M6IENocmlzIE1hc29uIDxjbG1AZmIuY29tPgpDYzogSm9zZWYgQmFjaWsgPGpiYWNpa0BmYi5j
b20+CkNjOiBEYXZpZCBTdGVyYmEgPGRzdGVyYmFAc3VzZS5jb20+Ci0tLQogZnMvYnRyZnMvZXh0
ZW50X2lvLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9mcy9idHJmcy9leHRlbnRfaW8uYyBiL2ZzL2J0cmZzL2V4dGVu
dF9pby5jCmluZGV4IGRmZWI3NGEuLjY2NTNlOWEgMTAwNjQ0Ci0tLSBhL2ZzL2J0cmZzL2V4dGVu
dF9pby5jCisrKyBiL2ZzL2J0cmZzL2V4dGVudF9pby5jCkBAIC0yMjAsNyArMjIwLDcgQEAgc3Rh
dGljIHN0cnVjdCBleHRlbnRfc3RhdGUgKmFsbG9jX2V4dGVudF9zdGF0ZShnZnBfdCBtYXNrKQog
ICAgICAgICAqIFRoZSBnaXZlbiBtYXNrIG1pZ2h0IGJlIG5vdCBhcHByb3ByaWF0ZSBmb3IgdGhl
IHNsYWIgYWxsb2NhdG9yLAogICAgICAgICAqIGRyb3AgdGhlIHVuc3VwcG9ydGVkIGJpdHMKICAg
ICAgICAgKi8KLSAgICAgICBtYXNrICY9IH4oX19HRlBfRE1BMzJ8X19HRlBfSElHSE1FTSk7Cisg
ICAgICAgbWFzayAmPSB+X19HRlBfWk9ORV9NQVNLOwogICAgICAgIHN0YXRlID0ga21lbV9jYWNo
ZV9hbGxvYyhleHRlbnRfc3RhdGVfY2FjaGUsIG1hc2spOwogICAgICAgIGlmICghc3RhdGUpCiAg
ICAgICAgICAgICAgICByZXR1cm4gc3RhdGU7Ci0tIAoxLjguMy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
