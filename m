From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3 9/9] xen/gntdev: Implement dma-buf import
 functionality
Date: Tue, 12 Jun 2018 23:14:42 -0400
Message-ID: <b08fdccf-2f1b-a902-f00b-a4cecf44a1b1__44556.5053182237$1528859622$gmane$org@oracle.com>
References: <20180612134200.17456-1-andr2000@gmail.com>
 <20180612134200.17456-10-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvra=i7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fSwFL-000554-4k
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 03:14:55 +0000
In-Reply-To: <20180612134200.17456-10-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNi8xMi8yMDE4IDA5OjQyIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToK
Cj4gICBpbnQgZ250ZGV2X2RtYWJ1Zl9pbXBfcmVsZWFzZShzdHJ1Y3QgZ250ZGV2X2RtYWJ1Zl9w
cml2ICpwcml2LCB1MzIgZmQpCj4gICB7Cj4gLQlyZXR1cm4gLUVJTlZBTDsKPiArCXN0cnVjdCBn
bnRkZXZfZG1hYnVmICpnbnRkZXZfZG1hYnVmOwo+ICsJc3RydWN0IGRtYV9idWZfYXR0YWNobWVu
dCAqYXR0YWNoOwo+ICsJc3RydWN0IGRtYV9idWYgKmRtYV9idWY7Cj4gKwo+ICsJZ250ZGV2X2Rt
YWJ1ZiA9IGRtYWJ1Zl9pbXBfZmluZF91bmxpbmsocHJpdiwgZmQpOwo+ICsJaWYgKElTX0VSUihn
bnRkZXZfZG1hYnVmKSkKPiArCQlyZXR1cm4gUFRSX0VSUihnbnRkZXZfZG1hYnVmKTsKPiArCj4g
Kwlwcl9kZWJ1ZygiUmVsZWFzaW5nIERNQSBidWZmZXIgd2l0aCBmZCAlZFxuIiwgZmQpOwo+ICsK
PiArCWF0dGFjaCA9IGdudGRldl9kbWFidWYtPnUuaW1wLmF0dGFjaDsKPiArCj4gKwlpZiAoZ250
ZGV2X2RtYWJ1Zi0+dS5pbXAuc2d0KQo+ICsJCWRtYV9idWZfdW5tYXBfYXR0YWNobWVudChhdHRh
Y2gsIGdudGRldl9kbWFidWYtPnUuaW1wLnNndCwKPiArCQkJCQkgRE1BX0JJRElSRUNUSU9OQUwp
Owo+ICsJZG1hX2J1ZiA9IGF0dGFjaC0+ZG1hYnVmOwo+ICsJZG1hX2J1Zl9kZXRhY2goYXR0YWNo
LT5kbWFidWYsIGF0dGFjaCk7Cj4gKwlkbWFfYnVmX3B1dChkbWFfYnVmKTsKPiArCj4gKwlkbWFi
dWZfaW1wX2VuZF9mb3JlaWduX2FjY2VzcyhnbnRkZXZfZG1hYnVmLT51LmltcC5yZWZzLAo+ICsJ
CQkJICAgICAgZ250ZGV2X2RtYWJ1Zi0+bnJfcGFnZXMpOwoKCgpTaG91bGQgeW91IGZpcnN0IGVu
ZCBmb3JlaWduIGFjY2VzcywgYmVmb3JlIGRvaW5nIGFueXRoaW5nPwoKLWJvcmlzCgoKPiArCWRt
YWJ1Zl9pbXBfZnJlZV9zdG9yYWdlKGdudGRldl9kbWFidWYpOwo+ICsJcmV0dXJuIDA7Cj4gICB9
Cj4gICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
