From: Huaisheng Ye <yehs2007@163.com>
Subject: [RFC PATCH v3 6/9] mm/vmpressure: update usage of zone
 modifiers
Date: Wed, 23 May 2018 22:57:51 +0800
Message-ID: <1527087474-93986-7-git-send-email-yehs2007__39551.8205281862$1527089890$gmane$org@163.com>
References: <1527087474-93986-1-git-send-email-yehs2007@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=sepi=ik=163.com=yehs2007@srs-us1.protection.inumbo.net>)
 id 1fLVF3-0001Rz-KP
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
Cc: kstewart@linuxfoundation.org, mhocko@suse.com, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, willy@infradead.org, colyli@suse.de, Christoph Hellwig <hch@infradead.org>, Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org, zhongjiang <zhongjiang@huawei.com>, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, Dan Carpenter <dan.carpenter@oracle.com>, mgorman@techsingularity.net, hch@lst.de, vbabka@suse.cz
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
LWJ5OiBIdWFpc2hlbmcgWWUgPHllaHMxQGxlbm92by5jb20+CkNjOiBBbmRyZXcgTW9ydG9uIDxh
a3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogemhvbmdqaWFuZyA8emhvbmdqaWFuZ0BodWF3
ZWkuY29tPgpDYzogTWluY2hhbiBLaW0gPG1pbmNoYW5Aa2VybmVsLm9yZz4KQ2M6IERhbiBDYXJw
ZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KQ2M6IERhdmlkIFJpZW50amVzIDxyaWVu
dGplc0Bnb29nbGUuY29tPgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3Jn
PgotLS0KIG1tL3ZtcHJlc3N1cmUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21tL3ZtcHJlc3N1cmUuYyBiL21tL3Zt
cHJlc3N1cmUuYwppbmRleCA4NTM1MGNlLi4zMGE0MGUyIDEwMDY0NAotLS0gYS9tbS92bXByZXNz
dXJlLmMKKysrIGIvbW0vdm1wcmVzc3VyZS5jCkBAIC0yNTYsNyArMjU2LDcgQEAgdm9pZCB2bXBy
ZXNzdXJlKGdmcF90IGdmcCwgc3RydWN0IG1lbV9jZ3JvdXAgKm1lbWNnLCBib29sIHRyZWUsCiAJ
ICogSW5kaXJlY3QgcmVjbGFpbSAoa3N3YXBkKSBzZXRzIHNjLT5nZnBfbWFzayB0byBHRlBfS0VS
TkVMLCBzbwogCSAqIHdlIGFjY291bnQgaXQgdG9vLgogCSAqLwotCWlmICghKGdmcCAmIChfX0dG
UF9ISUdITUVNIHwgX19HRlBfTU9WQUJMRSB8IF9fR0ZQX0lPIHwgX19HRlBfRlMpKSkKKwlpZiAo
IShnZnAgJiAoX19HRlBfWk9ORV9NT1ZBQkxFIHwgX19HRlBfSU8gfCBfX0dGUF9GUykpKQogCQly
ZXR1cm47CiAKIAkvKgotLSAKMS44LjMuMQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
