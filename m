From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH v2 10/12] mm/zsmalloc: update usage of
 address zone modifiers
Date: Tue, 22 May 2018 04:22:30 -0700
Message-ID: <20180522112230.GA5412__43520.5194204629$1526988084$gmane$org@bombadil.infradead.org>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
 <1526916033-4877-11-git-send-email-yehs2007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3nhg=ij=infradead.org=willy@srs-us1.protection.inumbo.net>)
 id 1fL5NL-0001PT-4W
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 11:22:43 +0000
Content-Disposition: inline
In-Reply-To: <1526916033-4877-11-git-send-email-yehs2007@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Huaisheng Ye <yehs2007@gmail.com>
Cc: kstewart@linuxfoundation.org, mhocko@suse.com, Nitin Gupta <ngupta@vflare.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, alexander.levin@verizon.com, linux-mm@kvack.org, iommu@lists.linux-foundation.org, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, akpm@linux-foundation.org, colyli@suse.de, mgorman@techsingularity.net, vbabka@suse.cz
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMjEsIDIwMTggYXQgMTE6MjA6MzFQTSArMDgwMCwgSHVhaXNoZW5nIFllIHdy
b3RlOgo+IEBAIC0zNDMsNyArMzQzLDcgQEAgc3RhdGljIHZvaWQgZGVzdHJveV9jYWNoZShzdHJ1
Y3QgenNfcG9vbCAqcG9vbCkKPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgY2FjaGVfYWxsb2NfaGFu
ZGxlKHN0cnVjdCB6c19wb29sICpwb29sLCBnZnBfdCBnZnApCj4gIHsKPiAgCXJldHVybiAodW5z
aWduZWQgbG9uZylrbWVtX2NhY2hlX2FsbG9jKHBvb2wtPmhhbmRsZV9jYWNoZXAsCj4gLQkJCWdm
cCAmIH4oX19HRlBfSElHSE1FTXxfX0dGUF9NT1ZBQkxFKSk7Cj4gKwkJCWdmcCAmIH5fX0dGUF9a
T05FX01PVkFCTEUpOwo+ICB9CgpUaGlzIHNob3VsZCBiZSAmIH5HRlBfWk9ORU1BU0sKCkFjdHVh
bGx5LCB3ZSBzaG91bGQgcHJvYmFibHkgaGF2ZSBhIGZ1bmN0aW9uIHRvIGNsZWFyIHRob3NlIGJp
dHMgcmF0aGVyCnRoYW4gaGF2ZSBldmVyeSBkcml2ZXIgbWFuaXB1bGF0aW5nIHRoZSBnZnAgbWFz
ayBsaWtlIHRoaXMuICBNYXliZQoKI2RlZmluZSBnZnBfbm9ybWFsKGdmcCkJCSgoZ2ZwKSAmIH5H
RlBfWk9ORU1BU0spCgoJcmV0dXJuICh1bnNpZ25lZCBsb25nKWttZW1fY2FjaGVfYWxsb2MocG9v
bC0+aGFuZGxlX2NhY2hlcCwKLQkJCWdmcCAmIH4oX19HRlBfSElHSE1FTXxfX0dGUF9NT1ZBQkxF
KSk7CisJCQlnZnBfbm9ybWFsKGdmcCkpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
