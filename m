From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH] xen/gntdev: fix up blockable calls to
 mn_invl_range_start
Date: Thu, 23 Aug 2018 23:20:54 +0900
Message-ID: <470950f0-a579-6c74-c5f0-bea635259176__34697.5295142785$1535033991$gmane$org@i-love.sakura.ne.jp>
References: <20180823120707.10998-1-mhocko@kernel.org>
 <07c7ead4-334d-9b25-f588-25e9b46bbea0@i-love.sakura.ne.jp>
 <20180823135151.GM29735@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sjxu=lg=i-love.sakura.ne.jp=penguin-kernel@srs-us1.protection.inumbo.net>)
 id 1fsqTv-00033Q-O6
 for xen-devel@lists.xenproject.org; Thu, 23 Aug 2018 14:21:03 +0000
In-Reply-To: <20180823135151.GM29735@dhcp22.suse.cz>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC8wOC8yMyAyMjo1MSwgTWljaGFsIEhvY2tvIHdyb3RlOgo+IFlvdSBhcmUgcmlnaHQu
IEkgY29tcGxldGVseSBmb3Jnb3QgSSd2ZSByZW1vdmVkIGluX3JhbmdlIHRoZXJlLiBEb2VzCj4g
dGhpcyBsb29rIGFueSBiZXR0ZXI/Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2dudGRl
di5jIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMKPiBpbmRleCBlN2Q4YmIxYmVlMmEuLjMwZjgxMDA0
ZWE2MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3hlbi9nbnRkZXYuYwo+ICsrKyBiL2RyaXZlcnMv
eGVuL2dudGRldi5jCj4gQEAgLTUyNSwxNCArNTI1LDIwIEBAIHN0YXRpYyBpbnQgbW5faW52bF9y
YW5nZV9zdGFydChzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwKPiAgCQlyZXR1cm4gLUVBR0FJTjsK
PiAgCj4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KG1hcCwgJnByaXYtPm1hcHMsIG5leHQpIHsKPiAt
CQlpZiAoIWJsb2NrYWJsZSAmJiBpbl9yYW5nZShtYXAsIHN0YXJ0LCBlbmQpKSB7Cj4gKwkJaWYg
KGluX3JhbmdlKG1hcCwgc3RhcnQsIGVuZCkpIHsKPiArCQkJaWYgKGJsb2NrYWJsZSkKPiArCQkJ
CWNvbnRpbnVlOwo+ICsKPiAgCQkJcmV0ID0gLUVBR0FJTjsKPiAgCQkJZ290byBvdXRfdW5sb2Nr
Owo+ICAJCX0KClRoaXMgc3RpbGwgbG9va3Mgc3RyYW5nZS4gaW5fcmFuZ2UoKSByZXR1cm5zIGZh
bHNlIGlmIG1hcC0+dm1hID09IE5VTEwuCkJ1dCB1bm1hcF9pZl9pbl9yYW5nZSgpIHVuY29uZGl0
aW9uYWxseSBkZXJlZmVyZW5jZXMgbWFwLT52bWEtPnZtX1tzdGFydHxlbmRdIC4KU3VnZ2VzdGlv
biBmcm9tIEJvcmlzIGxvb2tzIGJldHRlci4KCj4gIAkJdW5tYXBfaWZfaW5fcmFuZ2UobWFwLCBz
dGFydCwgZW5kKTsKPiAgCX0KPiAgCWxpc3RfZm9yX2VhY2hfZW50cnkobWFwLCAmcHJpdi0+ZnJl
ZWFibGVfbWFwcywgbmV4dCkgewo+IC0JCWlmICghYmxvY2thYmxlICYmIGluX3JhbmdlKG1hcCwg
c3RhcnQsIGVuZCkpIHsKPiArCQlpZiAoaW5fcmFuZ2UobWFwLCBzdGFydCwgZW5kKSkgewo+ICsJ
CQlpZiAoYmxvY2thYmxlKQo+ICsJCQkJY29udGludWU7Cj4gKwkJCQo+ICAJCQlyZXQgPSAtRUFH
QUlOOwo+ICAJCQlnb3RvIG91dF91bmxvY2s7Cj4gIAkJfQo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
