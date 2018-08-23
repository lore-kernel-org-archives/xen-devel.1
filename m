From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH] xen/gntdev: fix up blockable calls to
 mn_invl_range_start
Date: Thu, 23 Aug 2018 22:44:07 +0900
Message-ID: <07c7ead4-334d-9b25-f588-25e9b46bbea0__39010.3009449833$1535031882$gmane$org@i-love.sakura.ne.jp>
References: <20180823120707.10998-1-mhocko@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sjxu=lg=i-love.sakura.ne.jp=penguin-kernel@srs-us1.protection.inumbo.net>)
 id 1fspuT-0006rd-5Q
 for xen-devel@lists.xenproject.org; Thu, 23 Aug 2018 13:44:25 +0000
In-Reply-To: <20180823120707.10998-1-mhocko@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Juergen Gross <jgross@suse.com>, Michal Hocko <mhocko@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC8wOC8yMyAyMTowNywgTWljaGFsIEhvY2tvIHdyb3RlOgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3hlbi9nbnRkZXYuYyBiL2RyaXZlcnMveGVuL2dudGRldi5jCj4gaW5kZXggNTczOTBj
NzY2NmU1Li5lN2Q4YmIxYmVlMmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4vZ250ZGV2LmMK
PiArKysgYi9kcml2ZXJzL3hlbi9nbnRkZXYuYwo+IEBAIC01MTksMjEgKzUxOSwyMCBAQCBzdGF0
aWMgaW50IG1uX2ludmxfcmFuZ2Vfc3RhcnQoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sCj4gIAlz
dHJ1Y3QgZ250ZGV2X2dyYW50X21hcCAqbWFwOwo+ICAJaW50IHJldCA9IDA7Cj4gIAo+IC0JLyog
VE9ETyBkbyB3ZSByZWFsbHkgbmVlZCBhIG11dGV4IGhlcmU/ICovCj4gIAlpZiAoYmxvY2thYmxl
KQo+ICAJCW11dGV4X2xvY2soJnByaXYtPmxvY2spOwo+ICAJZWxzZSBpZiAoIW11dGV4X3RyeWxv
Y2soJnByaXYtPmxvY2spKQo+ICAJCXJldHVybiAtRUFHQUlOOwo+ICAKPiAgCWxpc3RfZm9yX2Vh
Y2hfZW50cnkobWFwLCAmcHJpdi0+bWFwcywgbmV4dCkgewo+IC0JCWlmIChpbl9yYW5nZShtYXAs
IHN0YXJ0LCBlbmQpKSB7Cj4gKwkJaWYgKCFibG9ja2FibGUgJiYgaW5fcmFuZ2UobWFwLCBzdGFy
dCwgZW5kKSkgewoKVGhpcyBzdGlsbCBsb29rcyBzdHJhbmdlLiBQcmlvciB0byA5MzA2NWFjNzUz
ZTQsIGluX3JhbmdlKCkgdGVzdCB3YXMKaW5zaWRlIHVubWFwX2lmX2luX3JhbmdlKCkuIEJ1dCB0
aGlzIHBhdGNoIHJlbW92ZXMgaW5fcmFuZ2UoKSB0ZXN0CmlmIGJsb2NrYWJsZSA9PSB0cnVlLiBU
aGF0IGlzLCB1bm1hcF9pZl9pbl9yYW5nZSgpIHdpbGwgdW5jb25kaXRpb25hbGx5CnVubWFwIGlm
IGJsb2NrYWJsZSA9PSB0cnVlLCB3aGljaCBzZWVtcyB0byBiZSBhbiB1bmV4cGVjdGVkIGNoYW5n
ZS4KCj4gIAkJCXJldCA9IC1FQUdBSU47Cj4gIAkJCWdvdG8gb3V0X3VubG9jazsKPiAgCQl9Cj4g
IAkJdW5tYXBfaWZfaW5fcmFuZ2UobWFwLCBzdGFydCwgZW5kKTsKPiAgCX0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
