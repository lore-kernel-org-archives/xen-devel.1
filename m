From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3 9/9] xen/gntdev: Implement dma-buf import
 functionality
Date: Wed, 13 Jun 2018 18:03:07 -0400
Message-ID: <0f1d87e5-823e-8b51-4ee5-029cc94eff99__25382.4233579964$1528927349$gmane$org@oracle.com>
References: <20180612134200.17456-1-andr2000@gmail.com>
 <20180612134200.17456-10-andr2000@gmail.com>
 <b08fdccf-2f1b-a902-f00b-a4cecf44a1b1@oracle.com>
 <cca7b9dd-a0c6-8052-c294-9e6c5d65e9eb@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvra=i7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fTDrY-0001YG-P1
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 22:03:32 +0000
In-Reply-To: <cca7b9dd-a0c6-8052-c294-9e6c5d65e9eb@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTMvMjAxOCAwNTowNCBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDYvMTMvMjAxOCAwNjoxNCBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pgo+Pgo+PiBP
biAwNi8xMi8yMDE4IDA5OjQyIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4K
Pj4+IMKgIGludCBnbnRkZXZfZG1hYnVmX2ltcF9yZWxlYXNlKHN0cnVjdCBnbnRkZXZfZG1hYnVm
X3ByaXYgKnByaXYsIHUzMgo+Pj4gZmQpCj4+PiDCoCB7Cj4+PiAtwqDCoMKgIHJldHVybiAtRUlO
VkFMOwo+Pj4gK8KgwqDCoCBzdHJ1Y3QgZ250ZGV2X2RtYWJ1ZiAqZ250ZGV2X2RtYWJ1ZjsKPj4+
ICvCoMKgwqAgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoOwo+Pj4gK8KgwqDCoCBz
dHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZjsKPj4+ICsKPj4+ICvCoMKgwqAgZ250ZGV2X2RtYWJ1ZiA9
IGRtYWJ1Zl9pbXBfZmluZF91bmxpbmsocHJpdiwgZmQpOwo+Pj4gK8KgwqDCoCBpZiAoSVNfRVJS
KGdudGRldl9kbWFidWYpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKGdudGRl
dl9kbWFidWYpOwo+Pj4gKwo+Pj4gK8KgwqDCoCBwcl9kZWJ1ZygiUmVsZWFzaW5nIERNQSBidWZm
ZXIgd2l0aCBmZCAlZFxuIiwgZmQpOwo+Pj4gKwo+Pj4gK8KgwqDCoCBhdHRhY2ggPSBnbnRkZXZf
ZG1hYnVmLT51LmltcC5hdHRhY2g7Cj4+PiArCj4+PiArwqDCoMKgIGlmIChnbnRkZXZfZG1hYnVm
LT51LmltcC5zZ3QpCj4+PiArwqDCoMKgwqDCoMKgwqAgZG1hX2J1Zl91bm1hcF9hdHRhY2htZW50
KGF0dGFjaCwgZ250ZGV2X2RtYWJ1Zi0+dS5pbXAuc2d0LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRE1BX0JJRElSRUNUSU9OQUwpOwo+Pj4gK8KgwqDCoCBk
bWFfYnVmID0gYXR0YWNoLT5kbWFidWY7Cj4+PiArwqDCoMKgIGRtYV9idWZfZGV0YWNoKGF0dGFj
aC0+ZG1hYnVmLCBhdHRhY2gpOwo+Pj4gK8KgwqDCoCBkbWFfYnVmX3B1dChkbWFfYnVmKTsKPj4+
ICsKPj4+ICvCoMKgwqAgZG1hYnVmX2ltcF9lbmRfZm9yZWlnbl9hY2Nlc3MoZ250ZGV2X2RtYWJ1
Zi0+dS5pbXAucmVmcywKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZ250ZGV2X2RtYWJ1Zi0+bnJfcGFnZXMpOwo+Pgo+Pgo+Pgo+PiBTaG91bGQgeW91IGZp
cnN0IGVuZCBmb3JlaWduIGFjY2VzcywgYmVmb3JlIGRvaW5nIGFueXRoaW5nPwo+Pgo+IEkgYW0g
cm9sbGluZyBiYWNrIGluIHJldmVyc2Ugb3JkZXIgaGVyZSwgc28gSSB0aGluayB3ZSBmaXJzdCBu
ZWVkCj4gdG8gZmluaXNoIGxvY2FsIGFjdGl2aXRpZXMgd2l0aCB0aGUgYnVmZmVyIGFuZCB0aGVu
IGVuZCBmb3JlaWduCj4gYWNjZXNzLgoKTG9va2luZyBhdCBnbnRkZXZfZG1hYnVmX2ltcF90b19y
ZWZzKCksIHRoZSBvcmRlciBpcwrCoMKgwqAgZG1hYnVmX2ltcF9hbGxvY19zdG9yYWdlKCkKwqDC
oMKgIGRtYV9idWZfYXR0YWNoKCkKwqDCoMKgIGRtYV9idWZfbWFwX2F0dGFjaG1lbnQoKQrCoMKg
wqAgZG1hYnVmX2ltcF9ncmFudF9mb3JlaWduX2FjY2VzcygpCgpPciB3YXMgSSBsb29raW5nIGF0
IHdyb25nIHBsYWNlPwoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
