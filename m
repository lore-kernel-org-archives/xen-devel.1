From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2] xen-netback: fix occasional leak of
 grant ref mappings under memory pressure
Date: Thu, 28 Feb 2019 10:37:13 -0800 (PST)
Message-ID: <20190228.103713.745079321072396223.davem__47812.9141776421$1551379088$gmane$org@davemloft.net>
References: <1551358083-14227-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8/sX=RD=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1gzQYW-0004ye-Sl
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 18:37:16 +0000
In-Reply-To: <1551358083-14227-1-git-send-email-igor.druzhinin@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: igor.druzhinin@citrix.com
Cc: xen-devel@lists.xenproject.org, paul.durrant@citrix.com, wei.liu2@citrix.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CkRhdGU6IFRo
dSwgMjggRmViIDIwMTkgMTI6NDg6MDMgKzAwMDAKCj4gWmVyby1jb3B5IGNhbGxiYWNrIGZsYWcg
aXMgbm90IHlldCBzZXQgb24gZnJhZyBsaXN0IHNrYiBhdCB0aGUgbW9tZW50Cj4geGVudmlmX2hh
bmRsZV9mcmFnX2xpc3QoKSByZXR1cm5zIC1FTk9NRU0uIFRoaXMgZXZlbnR1YWxseSByZXN1bHRz
IGluCj4gbGVha2luZyBncmFudCByZWYgbWFwcGluZ3Mgc2luY2UgeGVudmlmX3plcm9jb3B5X2Nh
bGxiYWNrKCkgaXMgbmV2ZXIKPiBjYWxsZWQgZm9yIHRoZXNlIGZyYWdtZW50cy4gVGhvc2UgZXZl
bnR1YWxseSBidWlsZCB1cCBhbmQgY2F1c2UgWGVuCj4gdG8ga2lsbCBEb20wIGFzIHRoZSBzbG90
cyBnZXQgcmV1c2VkIGZvciBuZXcgbWFwcGluZ3M6Cj4gCj4gImQwdjAgQXR0ZW1wdCB0byBpbXBs
aWNpdGx5IHVubWFwIGEgZ3JhbnRlZCBQVEUgYzAxMDAwMDMyOWZjZTAwNSIKPiAKPiBUaGF0IGJl
aGF2aW9yIGlzIG9ic2VydmVkIHVuZGVyIGNlcnRhaW4gd29ya2xvYWRzIHdoZXJlIHN1ZGRlbiBz
cGlrZXMKPiBvZiBwYWdlIGNhY2hlIHdyaXRlcyBjb2V4aXN0IHdpdGggYWN0aXZlIGF0b21pYyBz
a2IgYWxsb2NhdGlvbnMgZnJvbQo+IG5ldHdvcmsgdHJhZmZpYy4gQWRkaXRpb25hbGx5LCByZXdv
cmsgdGhlIGxvZ2ljIHRvIGRlYWwgd2l0aCBmcmFnX2xpc3QKPiBkZWFsbG9jYXRpb24gaW4gYSBz
aW5nbGUgcGxhY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6
aGluaW5AY2l0cml4LmNvbT4KCkFwcGxpZWQgYW5kIHF1ZXVlZCB1cCBmb3IgLXN0YWJsZSwgdGhh
bmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
