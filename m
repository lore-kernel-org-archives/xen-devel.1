From: Julien Grall <julien.grall@arm.com>
Subject: BACKPORT Re: [PATCH 3/7] Arm/atomic: correct asm()
 constraints in build_add_sized()
Date: Wed, 13 Mar 2019 10:25:31 +0000
Message-ID: <04cb358b-5579-d5c6-bddc-5b1468f01bf5@arm.com>
References: <5C869060020000780021D5D4@prv1-mh.provo.novell.com>
 <5C8691A0020000780021D5F7@prv1-mh.provo.novell.com>
 <9314781f-a219-591c-a35e-05163d114057@arm.com>
 <5C88D99F020000780021E06E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ZEN=RQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h414o-0003E1-5x
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 10:25:34 +0000
In-Reply-To: <5C88D99F020000780021E06E@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMy8wMy8yMDE5IDEwOjIxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMS4wMy4x
OSBhdCAxOTowOCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMTEvMDMvMjAx
OSAxNjo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBUaGUgbWVtb3J5IG9wZXJhbmQgaXMgYW4g
aW4vb3V0IG9uZSwgYW5kIHRoZSBhdXhpbGlhcnkgcmVnaXN0ZXIgZ2V0cwo+Pj4gd3JpdHRlbiB0
byBlYXJseS4KPj4+Cj4+PiBUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxzbyBkcm9wIHRoZSBy
ZWR1bmRhbnQgY2FzdCAodGhlIGlubGluZQo+Pj4gZnVuY3Rpb25zJyBwYXJhbWV0ZXJzIGFyZSBh
bHJlYWR5IG9mIHRoZSBjYXN0ZWQtdG8gdHlwZSkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+PiBJIGd1ZXNzIHRoaXMgaXMgY2FuZGlk
YXRlIGZvciBiYWNrcG9ydGluZy4KPiAKPiBCdHcsIGRvIHlvdSB3YW50IG1lIHRvIHF1ZXVlIHRo
aXMsIG9yIHdpbGwgeW91IG9yIFN0ZWZhbm8gd2FudCB0bwo+IHRha2UgY2FyZT8KClN0ZWZhbm8g
aXMgdGFraW5nIGNhcmUgb2YgYmFja3BvcnRpbmcuIFN0ZWZhbm8sIGNhbiB5b3UgcXVldWUgaXQg
Zm9yIGFsbCB0aGUgCnRyZWUgeW91IGNhbiBiYWNrcG9ydCB0bz8KCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
