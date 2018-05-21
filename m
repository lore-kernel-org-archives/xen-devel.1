From: Huaisheng Ye <yehs2007@gmail.com>
Subject: [RFC PATCH v2 10/12] mm/zsmalloc: update usage of
 address zone modifiers
Date: Mon, 21 May 2018 23:20:31 +0800
Message-ID: <1526916033-4877-11-git-send-email-yehs2007__18981.3715209768$1526961147$gmane$org@gmail.com>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hc98=ii=gmail.com=yehs2007@srs-us1.protection.inumbo.net>)
 id 1fKmcw-0006AW-LZ
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 15:21:34 +0000
Received: by mail-pf0-x244.google.com with SMTP id p14-v6so7245772pfh.9
 for <xen-devel@lists.xenproject.org>; Mon, 21 May 2018 08:21:33 -0700 (PDT)
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
Cc: kstewart@linuxfoundation.org, mhocko@suse.com, Nitin Gupta <ngupta@vflare.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, willy@infradead.org, alexander.levin@verizon.com, Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, colyli@suse.de, mgorman@techsingularity.net, vbabka@suse.cz
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgoKVXNlIF9fR0ZQX1pPTkVfTU9W
QUJMRSB0byByZXBsYWNlIChfX0dGUF9ISUdITUVNIHwgX19HRlBfTU9WQUJMRSkuCgpfX19HRlBf
RE1BLCBfX19HRlBfSElHSE1FTSBhbmQgX19fR0ZQX0RNQTMyIGhhdmUgYmVlbiBkZWxldGVkIGZy
b20gR0ZQCmJpdG1hc2tzLCB0aGUgYm90dG9tIHRocmVlIGJpdHMgb2YgR0ZQIG1hc2sgaXMgcmVz
ZXJ2ZWQgZm9yIHN0b3JpbmcKZW5jb2RlZCB6b25lIG51bWJlci4KCl9fR0ZQX1pPTkVfTU9WQUJM
RSBjb250YWlucyBlbmNvZGVkIFpPTkVfTU9WQUJMRSBhbmQgX19HRlBfTU9WQUJMRSBmbGFnLgoK
V2l0aCBHRlBfWk9ORV9UQUJMRSwgX19HRlBfSElHSE1FTSBPUmluZyBfX0dGUF9NT1ZBQkxFIG1l
YW5zIGdmcF96b25lCnNob3VsZCByZXR1cm4gWk9ORV9NT1ZBQkxFLiBJbiBvcmRlciB0byBrZWVw
IHRoYXQgY29tcGF0aWJsZSB3aXRoCkdGUF9aT05FX1RBQkxFLCByZXBsYWNlIChfX0dGUF9ISUdI
TUVNIHwgX19HRlBfTU9WQUJMRSkgd2l0aApfX0dGUF9aT05FX01PVkFCTEUuCgpTaWduZWQtb2Zm
LWJ5OiBIdWFpc2hlbmcgWWUgPHllaHMxQGxlbm92by5jb20+CkNjOiBNaW5jaGFuIEtpbSA8bWlu
Y2hhbkBrZXJuZWwub3JnPgpDYzogTml0aW4gR3VwdGEgPG5ndXB0YUB2ZmxhcmUub3JnPgpDYzog
U2VyZ2V5IFNlbm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3kud29ya0BnbWFpbC5jb20+Ci0t
LQogbW0venNtYWxsb2MuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS96c21hbGxvYy5jIGIvbW0venNtYWxs
b2MuYwppbmRleCBjMzAxMzUwLi4wNmIyOTAyIDEwMDY0NAotLS0gYS9tbS96c21hbGxvYy5jCisr
KyBiL21tL3pzbWFsbG9jLmMKQEAgLTM0Myw3ICszNDMsNyBAQCBzdGF0aWMgdm9pZCBkZXN0cm95
X2NhY2hlKHN0cnVjdCB6c19wb29sICpwb29sKQogc3RhdGljIHVuc2lnbmVkIGxvbmcgY2FjaGVf
YWxsb2NfaGFuZGxlKHN0cnVjdCB6c19wb29sICpwb29sLCBnZnBfdCBnZnApCiB7CiAJcmV0dXJu
ICh1bnNpZ25lZCBsb25nKWttZW1fY2FjaGVfYWxsb2MocG9vbC0+aGFuZGxlX2NhY2hlcCwKLQkJ
CWdmcCAmIH4oX19HRlBfSElHSE1FTXxfX0dGUF9NT1ZBQkxFKSk7CisJCQlnZnAgJiB+X19HRlBf
Wk9ORV9NT1ZBQkxFKTsKIH0KIAogc3RhdGljIHZvaWQgY2FjaGVfZnJlZV9oYW5kbGUoc3RydWN0
IHpzX3Bvb2wgKnBvb2wsIHVuc2lnbmVkIGxvbmcgaGFuZGxlKQpAQCAtMzU0LDcgKzM1NCw3IEBA
IHN0YXRpYyB2b2lkIGNhY2hlX2ZyZWVfaGFuZGxlKHN0cnVjdCB6c19wb29sICpwb29sLCB1bnNp
Z25lZCBsb25nIGhhbmRsZSkKIHN0YXRpYyBzdHJ1Y3QgenNwYWdlICpjYWNoZV9hbGxvY196c3Bh
Z2Uoc3RydWN0IHpzX3Bvb2wgKnBvb2wsIGdmcF90IGZsYWdzKQogewogCXJldHVybiBrbWVtX2Nh
Y2hlX2FsbG9jKHBvb2wtPnpzcGFnZV9jYWNoZXAsCi0JCQlmbGFncyAmIH4oX19HRlBfSElHSE1F
TXxfX0dGUF9NT1ZBQkxFKSk7CisJCQlmbGFncyAmIH5fX0dGUF9aT05FX01PVkFCTEUpOwogfQog
CiBzdGF0aWMgdm9pZCBjYWNoZV9mcmVlX3pzcGFnZShzdHJ1Y3QgenNfcG9vbCAqcG9vbCwgc3Ry
dWN0IHpzcGFnZSAqenNwYWdlKQotLSAKMS44LjMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
