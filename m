From: Huaisheng HS1 Ye <yehs1@lenovo.com>
Subject: [RFC PATCH v2 08/12] drivers/block/zram/zram_drv:
 update usage of address zone modifiers
Date: Mon, 21 May 2018 18:03:38 +0000
Message-ID: <HK2PR03MB16847B9F373C3782466F724192950__38897.3521338359$1526961129$gmane$org@HK2PR03MB1684.apcprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ozro=ii=lenovo.com=yehs1@srs-us1.protection.inumbo.net>)
 id 1fKpAA-0002CN-0V
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 18:04:02 +0000
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
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "mhocko@suse.com" <mhocko@suse.com>, "ngupta@vflare.org" <ngupta@vflare.org>, "sergey.senozhatsky.work@gmail.com" <sergey.senozhatsky.work@gmail.com>, Ocean HY1 He <hehy1@lenovo.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "alexander.levin@verizon.com" <alexander.levin@verizon.com>, "minchan@kernel.org" <minchan@kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, NingTing Cheng <chengnt@lenovo.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "colyli@suse.de" <colyli@suse.de>, "mgorman@techsingularity.net" <mgorman@techsingularity.net>, "hch@lst.de" <hch@lst.de>, "vbabka@suse.cz" <vbabka@suse.cz>
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
YzogTWluY2hhbiBLaW0gPG1pbmNoYW5Aa2VybmVsLm9yZz4KQ2M6IE5pdGluIEd1cHRhIDxuZ3Vw
dGFAdmZsYXJlLm9yZz4KQ2M6IFNlcmdleSBTZW5vemhhdHNreSA8c2VyZ2V5LnNlbm96aGF0c2t5
LndvcmtAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvYmxvY2svenJhbS96cmFtX2Rydi5jIHwgNiAr
Ky0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay96cmFtL3pyYW1fZHJ2LmMgYi9kcml2ZXJzL2Jsb2Nr
L3pyYW0venJhbV9kcnYuYwppbmRleCAwYWZhNmM4Li4zOWNiN2Q2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2Jsb2NrL3pyYW0venJhbV9kcnYuYworKysgYi9kcml2ZXJzL2Jsb2NrL3pyYW0venJhbV9k
cnYuYwpAQCAtOTk3LDE0ICs5OTcsMTIgQEAgc3RhdGljIGludCBfX3pyYW1fYnZlY193cml0ZShz
dHJ1Y3QgenJhbSAqenJhbSwgc3RydWN0IGJpb192ZWMgKmJ2ZWMsCiAgICAgICAgICAgICAgICBo
YW5kbGUgPSB6c19tYWxsb2MoenJhbS0+bWVtX3Bvb2wsIGNvbXBfbGVuLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF9fR0ZQX0tTV0FQRF9SRUNMQUlNIHwgCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgX19HRlBfTk9XQVJOIHwKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBfX0dGUF9ISUdITUVNIHwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBf
X0dGUF9NT1ZBQkxFKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX0dGUF9aT05F
X01PVkFCTEUpOwogICAgICAgIGlmICghaGFuZGxlKSB7CiAgICAgICAgICAgICAgICB6Y29tcF9z
dHJlYW1fcHV0KHpyYW0tPmNvbXApOwogICAgICAgICAgICAgICAgYXRvbWljNjRfaW5jKCZ6cmFt
LT5zdGF0cy53cml0ZXN0YWxsKTsKICAgICAgICAgICAgICAgIGhhbmRsZSA9IHpzX21hbGxvYyh6
cmFtLT5tZW1fcG9vbCwgY29tcF9sZW4sCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
R0ZQX05PSU8gfCBfX0dGUF9ISUdITUVNIHwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBfX0dGUF9NT1ZBQkxFKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfTk9J
TyB8IF9fR0ZQX1pPTkVfTU9WQUJMRSk7CiAgICAgICAgICAgICAgICBpZiAoaGFuZGxlKQogICAg
ICAgICAgICAgICAgICAgICAgICBnb3RvIGNvbXByZXNzX2FnYWluOwogICAgICAgICAgICAgICAg
cmV0dXJuIC1FTk9NRU07Ci0tIAoxLjguMy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
