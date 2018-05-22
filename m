From: Huaisheng HS1 Ye <yehs1@lenovo.com>
Subject: Re: [External] Re: [RFC PATCH v2 10/12] mm/zsmalloc:
 update usage of address zone modifiers
Date: Tue, 22 May 2018 11:51:52 +0000
Message-ID: <HK2PR03MB16844D405C08B595CD682B6592940__28509.2569691644$1526989861$gmane$org@HK2PR03MB1684.apcprd03.prod.outlook.com>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
 <1526916033-4877-11-git-send-email-yehs2007@gmail.com>
 <20180522112230.GA5412@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qcm/=ij=lenovo.com=yehs1@srs-us1.protection.inumbo.net>)
 id 1fL5pn-0004N7-Iz
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 11:52:07 +0000
In-Reply-To: <20180522112230.GA5412@bombadil.infradead.org>
Content-Language: zh-CN
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "mhocko@suse.com" <mhocko@suse.com>, Nitin Gupta <ngupta@vflare.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Ocean HY1 He <hehy1@lenovo.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Minchan Kim <minchan@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "alexander.levin@verizon.com" <alexander.levin@verizon.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, NingTing Cheng <chengnt@lenovo.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "colyli@suse.de" <colyli@suse.de>, "mgorman@techsingularity.net" <mgorman@techsingularity.net>, Christoph
List-Id: xen-devel@lists.xenproject.org

RnJvbTogb3duZXItbGludXgtbW1Aa3ZhY2sub3JnIE9uIEJlaGFsZiBPZiBNYXR0aGV3IFdpbGNv
eAo+IAo+IE9uIE1vbiwgTWF5IDIxLCAyMDE4IGF0IDExOjIwOjMxUE0gKzA4MDAsIEh1YWlzaGVu
ZyBZZSB3cm90ZToKPiA+IEBAIC0zNDMsNyArMzQzLDcgQEAgc3RhdGljIHZvaWQgZGVzdHJveV9j
YWNoZShzdHJ1Y3QgenNfcG9vbCAqcG9vbCkKPiA+ICBzdGF0aWMgdW5zaWduZWQgbG9uZyBjYWNo
ZV9hbGxvY19oYW5kbGUoc3RydWN0IHpzX3Bvb2wgKnBvb2wsIGdmcF90IGdmcCkKPiA+ICB7Cj4g
PiAgCXJldHVybiAodW5zaWduZWQgbG9uZylrbWVtX2NhY2hlX2FsbG9jKHBvb2wtPmhhbmRsZV9j
YWNoZXAsCj4gPiAtCQkJZ2ZwICYgfihfX0dGUF9ISUdITUVNfF9fR0ZQX01PVkFCTEUpKTsKPiA+
ICsJCQlnZnAgJiB+X19HRlBfWk9ORV9NT1ZBQkxFKTsKPiA+ICB9Cj4gCj4gVGhpcyBzaG91bGQg
YmUgJiB+R0ZQX1pPTkVNQVNLCj4gCj4gQWN0dWFsbHksIHdlIHNob3VsZCBwcm9iYWJseSBoYXZl
IGEgZnVuY3Rpb24gdG8gY2xlYXIgdGhvc2UgYml0cyByYXRoZXIKPiB0aGFuIGhhdmUgZXZlcnkg
ZHJpdmVyIG1hbmlwdWxhdGluZyB0aGUgZ2ZwIG1hc2sgbGlrZSB0aGlzLiAgTWF5YmUKPiAKPiAj
ZGVmaW5lIGdmcF9ub3JtYWwoZ2ZwKQkJKChnZnApICYgfkdGUF9aT05FTUFTSykKCkdvb2QgaWRl
YSEKCj4gCj4gCXJldHVybiAodW5zaWduZWQgbG9uZylrbWVtX2NhY2hlX2FsbG9jKHBvb2wtPmhh
bmRsZV9jYWNoZXAsCj4gLQkJCWdmcCAmIH4oX19HRlBfSElHSE1FTXxfX0dGUF9NT1ZBQkxFKSk7
Cj4gKwkJCWdmcF9ub3JtYWwoZ2ZwKSk7CgoKU2luY2VyZWx5LApIdWFpc2hlbmcgWWUKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
