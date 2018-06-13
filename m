From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 9/9] xen/gntdev: Implement dma-buf import
 functionality
Date: Wed, 13 Jun 2018 12:04:49 +0300
Message-ID: <cca7b9dd-a0c6-8052-c294-9e6c5d65e9eb__15228.7443787374$1528880626$gmane$org@epam.com>
References: <20180612134200.17456-1-andr2000@gmail.com>
 <20180612134200.17456-10-andr2000@gmail.com>
 <b08fdccf-2f1b-a902-f00b-a4cecf44a1b1@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7gzq=i7=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1fT1i9-0007Ib-90
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 09:05:01 +0000
In-Reply-To: <b08fdccf-2f1b-a902-f00b-a4cecf44a1b1@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTMvMjAxOCAwNjoxNCBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Cj4KPiBPbiAw
Ni8xMi8yMDE4IDA5OjQyIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPgo+PiDC
oCBpbnQgZ250ZGV2X2RtYWJ1Zl9pbXBfcmVsZWFzZShzdHJ1Y3QgZ250ZGV2X2RtYWJ1Zl9wcml2
ICpwcml2LCB1MzIgZmQpCj4+IMKgIHsKPj4gLcKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gK8Kg
wqDCoCBzdHJ1Y3QgZ250ZGV2X2RtYWJ1ZiAqZ250ZGV2X2RtYWJ1ZjsKPj4gK8KgwqDCoCBzdHJ1
Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2g7Cj4+ICvCoMKgwqAgc3RydWN0IGRtYV9idWYg
KmRtYV9idWY7Cj4+ICsKPj4gK8KgwqDCoCBnbnRkZXZfZG1hYnVmID0gZG1hYnVmX2ltcF9maW5k
X3VubGluayhwcml2LCBmZCk7Cj4+ICvCoMKgwqAgaWYgKElTX0VSUihnbnRkZXZfZG1hYnVmKSkK
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKGdudGRldl9kbWFidWYpOwo+PiArCj4+
ICvCoMKgwqAgcHJfZGVidWcoIlJlbGVhc2luZyBETUEgYnVmZmVyIHdpdGggZmQgJWRcbiIsIGZk
KTsKPj4gKwo+PiArwqDCoMKgIGF0dGFjaCA9IGdudGRldl9kbWFidWYtPnUuaW1wLmF0dGFjaDsK
Pj4gKwo+PiArwqDCoMKgIGlmIChnbnRkZXZfZG1hYnVmLT51LmltcC5zZ3QpCj4+ICvCoMKgwqDC
oMKgwqDCoCBkbWFfYnVmX3VubWFwX2F0dGFjaG1lbnQoYXR0YWNoLCBnbnRkZXZfZG1hYnVmLT51
LmltcC5zZ3QsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERN
QV9CSURJUkVDVElPTkFMKTsKPj4gK8KgwqDCoCBkbWFfYnVmID0gYXR0YWNoLT5kbWFidWY7Cj4+
ICvCoMKgwqAgZG1hX2J1Zl9kZXRhY2goYXR0YWNoLT5kbWFidWYsIGF0dGFjaCk7Cj4+ICvCoMKg
wqAgZG1hX2J1Zl9wdXQoZG1hX2J1Zik7Cj4+ICsKPj4gK8KgwqDCoCBkbWFidWZfaW1wX2VuZF9m
b3JlaWduX2FjY2VzcyhnbnRkZXZfZG1hYnVmLT51LmltcC5yZWZzLAo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdudGRldl9kbWFidWYtPm5yX3BhZ2VzKTsK
Pgo+Cj4KPiBTaG91bGQgeW91IGZpcnN0IGVuZCBmb3JlaWduIGFjY2VzcywgYmVmb3JlIGRvaW5n
IGFueXRoaW5nPwo+CkkgYW0gcm9sbGluZyBiYWNrIGluIHJldmVyc2Ugb3JkZXIgaGVyZSwgc28g
SSB0aGluayB3ZSBmaXJzdCBuZWVkCnRvIGZpbmlzaCBsb2NhbCBhY3Rpdml0aWVzIHdpdGggdGhl
IGJ1ZmZlciBhbmQgdGhlbiBlbmQgZm9yZWlnbgphY2Nlc3MuCj4gLWJvcmlzCj4KPgo+PiArIGRt
YWJ1Zl9pbXBfZnJlZV9zdG9yYWdlKGdudGRldl9kbWFidWYpOwo+PiArwqDCoMKgIHJldHVybiAw
Owo+PiDCoCB9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
