From: Huaisheng HS1 Ye <yehs1@lenovo.com>
Subject: [RFC PATCH v2 09/12] mm/vmpressure: update usage of
 address zone modifiers
Date: Mon, 21 May 2018 18:06:48 +0000
Message-ID: <HK2PR03MB16849EA4D9CE5C230EB9966492950__13776.6185137027$1526961132$gmane$org@HK2PR03MB1684.apcprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ozro=ii=lenovo.com=yehs1@srs-us1.protection.inumbo.net>)
 id 1fKpD5-0002F5-44
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 18:07:03 +0000
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
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>, "mhocko@suse.com" <mhocko@suse.com>, Ocean HY1 He <hehy1@lenovo.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "rientjes@google.com" <rientjes@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "alexander.levin@verizon.com" <alexander.levin@verizon.com>, "minchan@kernel.org" <minchan@kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "zhongjiang@huawei.com" <zhongjiang@huawei.com>, "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, NingTing Cheng <chengnt@lenovo.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "colyli@suse.de" <colyli@suse.de>, "mgorman@techsingularity.net" <mgorman@techsingularity.net>, "hch@lst.de" <hch@lst.de>, vbabka@suse.c
List-Id: xen-devel@lists.xenproject.org

VXNlIF9fR0ZQX1pPTkVfTU9WQUJMRSB0byByZXBsYWNlIChfX0dGUF9ISUdITUVNIHwgX19HRlBf
TU9WQUJMRSkuCgpfX19HRlBfRE1BLCBfX19HRlBfSElHSE1FTSBhbmQgX19fR0ZQX0RNQTMyIGhh
dmUgYmVlbiBkZWxldGVkIGZyb20gR0ZQIApiaXRtYXNrcywgdGhlIGJvdHRvbSB0aHJlZSBiaXRz
IG9mIEdGUCBtYXNrIGlzIHJlc2VydmVkIGZvciBzdG9yaW5nCmVuY29kZWQgem9uZSBudW1iZXIu
CgpfX0dGUF9aT05FX01PVkFCTEUgY29udGFpbnMgZW5jb2RlZCBaT05FX01PVkFCTEUgYW5kIF9f
R0ZQX01PVkFCTEUgZmxhZy4KCldpdGggR0ZQX1pPTkVfVEFCTEUsIF9fR0ZQX0hJR0hNRU0gT1Jp
bmcgX19HRlBfTU9WQUJMRSBtZWFucyBnZnBfem9uZQpzaG91bGQgcmV0dXJuIFpPTkVfTU9WQUJM
RS4gSW4gb3JkZXIgdG8ga2VlcCB0aGF0IGNvbXBhdGlibGUgd2l0aApHRlBfWk9ORV9UQUJMRSwg
cmVwbGFjZSAoX19HRlBfSElHSE1FTSB8IF9fR0ZQX01PVkFCTEUpIHdpdGgKX19HRlBfWk9ORV9N
T1ZBQkxFLgoKU2lnbmVkLW9mZi1ieTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgpD
YzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IHpob25namlh
bmcgPHpob25namlhbmdAaHVhd2VpLmNvbT4KQ2M6IE1pbmNoYW4gS2ltIDxtaW5jaGFuQGtlcm5l
bC5vcmc+CkNjOiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+CkNjOiBE
YXZpZCBSaWVudGplcyA8cmllbnRqZXNAZ29vZ2xlLmNvbT4KLS0tCiBtbS92bXByZXNzdXJlLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9tbS92bXByZXNzdXJlLmMgYi9tbS92bXByZXNzdXJlLmMKaW5kZXggODUzNTBj
ZS4uMzBhNDBlMiAxMDA2NDQKLS0tIGEvbW0vdm1wcmVzc3VyZS5jCisrKyBiL21tL3ZtcHJlc3N1
cmUuYwpAQCAtMjU2LDcgKzI1Niw3IEBAIHZvaWQgdm1wcmVzc3VyZShnZnBfdCBnZnAsIHN0cnVj
dCBtZW1fY2dyb3VwICptZW1jZywgYm9vbCB0cmVlLAogICAgICAgICAqIEluZGlyZWN0IHJlY2xh
aW0gKGtzd2FwZCkgc2V0cyBzYy0+Z2ZwX21hc2sgdG8gR0ZQX0tFUk5FTCwgc28KICAgICAgICAg
KiB3ZSBhY2NvdW50IGl0IHRvby4KICAgICAgICAgKi8KLSAgICAgICBpZiAoIShnZnAgJiAoX19H
RlBfSElHSE1FTSB8IF9fR0ZQX01PVkFCTEUgfCBfX0dGUF9JTyB8IF9fR0ZQX0ZTKSkpCisgICAg
ICAgaWYgKCEoZ2ZwICYgKF9fR0ZQX1pPTkVfTU9WQUJMRSB8IF9fR0ZQX0lPIHwgX19HRlBfRlMp
KSkKICAgICAgICAgICAgICAgIHJldHVybjsKIAogICAgICAgIC8qCi0tIAoxLjguMy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
