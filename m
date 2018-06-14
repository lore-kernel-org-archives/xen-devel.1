From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 9/9] xen/gntdev: Implement dma-buf import
 functionality
Date: Thu, 14 Jun 2018 09:39:34 +0300
Message-ID: <987f26ca-b1a7-9175-ffd7-23d247402b41__32355.59666432$1528958306$gmane$org@epam.com>
References: <20180612134200.17456-1-andr2000@gmail.com>
 <20180612134200.17456-10-andr2000@gmail.com>
 <b08fdccf-2f1b-a902-f00b-a4cecf44a1b1@oracle.com>
 <cca7b9dd-a0c6-8052-c294-9e6c5d65e9eb@epam.com>
 <0f1d87e5-823e-8b51-4ee5-029cc94eff99@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fdvk=ja=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1fTLv9-0007D9-OG
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 06:39:48 +0000
In-Reply-To: <0f1d87e5-823e-8b51-4ee5-029cc94eff99@oracle.com>
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

T24gMDYvMTQvMjAxOCAwMTowMyBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA2LzEz
LzIwMTggMDU6MDQgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBPbiAwNi8x
My8yMDE4IDA2OjE0IEFNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+Pgo+Pj4gT24gMDYvMTIv
MjAxOCAwOTo0MiBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+Pgo+Pj4+ICDC
oCBpbnQgZ250ZGV2X2RtYWJ1Zl9pbXBfcmVsZWFzZShzdHJ1Y3QgZ250ZGV2X2RtYWJ1Zl9wcml2
ICpwcml2LCB1MzIKPj4+PiBmZCkKPj4+PiAgwqAgewo+Pj4+IC3CoMKgwqAgcmV0dXJuIC1FSU5W
QUw7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZ250ZGV2X2RtYWJ1ZiAqZ250ZGV2X2RtYWJ1ZjsKPj4+
PiArwqDCoMKgIHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaDsKPj4+PiArwqDCoMKg
IHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmOwo+Pj4+ICsKPj4+PiArwqDCoMKgIGdudGRldl9kbWFi
dWYgPSBkbWFidWZfaW1wX2ZpbmRfdW5saW5rKHByaXYsIGZkKTsKPj4+PiArwqDCoMKgIGlmIChJ
U19FUlIoZ250ZGV2X2RtYWJ1ZikpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJS
KGdudGRldl9kbWFidWYpOwo+Pj4+ICsKPj4+PiArwqDCoMKgIHByX2RlYnVnKCJSZWxlYXNpbmcg
RE1BIGJ1ZmZlciB3aXRoIGZkICVkXG4iLCBmZCk7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgYXR0YWNo
ID0gZ250ZGV2X2RtYWJ1Zi0+dS5pbXAuYXR0YWNoOwo+Pj4+ICsKPj4+PiArwqDCoMKgIGlmIChn
bnRkZXZfZG1hYnVmLT51LmltcC5zZ3QpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRtYV9idWZfdW5t
YXBfYXR0YWNobWVudChhdHRhY2gsIGdudGRldl9kbWFidWYtPnUuaW1wLnNndCwKPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBETUFfQklESVJFQ1RJT05BTCk7
Cj4+Pj4gK8KgwqDCoCBkbWFfYnVmID0gYXR0YWNoLT5kbWFidWY7Cj4+Pj4gK8KgwqDCoCBkbWFf
YnVmX2RldGFjaChhdHRhY2gtPmRtYWJ1ZiwgYXR0YWNoKTsKPj4+PiArwqDCoMKgIGRtYV9idWZf
cHV0KGRtYV9idWYpOwo+Pj4+ICsKPj4+PiArwqDCoMKgIGRtYWJ1Zl9pbXBfZW5kX2ZvcmVpZ25f
YWNjZXNzKGdudGRldl9kbWFidWYtPnUuaW1wLnJlZnMsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnbnRkZXZfZG1hYnVmLT5ucl9wYWdlcyk7Cj4+Pgo+
Pj4KPj4+IFNob3VsZCB5b3UgZmlyc3QgZW5kIGZvcmVpZ24gYWNjZXNzLCBiZWZvcmUgZG9pbmcg
YW55dGhpbmc/Cj4+Pgo+PiBJIGFtIHJvbGxpbmcgYmFjayBpbiByZXZlcnNlIG9yZGVyIGhlcmUs
IHNvIEkgdGhpbmsgd2UgZmlyc3QgbmVlZAo+PiB0byBmaW5pc2ggbG9jYWwgYWN0aXZpdGllcyB3
aXRoIHRoZSBidWZmZXIgYW5kIHRoZW4gZW5kIGZvcmVpZ24KPj4gYWNjZXNzLgo+IExvb2tpbmcg
YXQgZ250ZGV2X2RtYWJ1Zl9pbXBfdG9fcmVmcygpLCB0aGUgb3JkZXIgaXMKPiAgwqDCoMKgIGRt
YWJ1Zl9pbXBfYWxsb2Nfc3RvcmFnZSgpCj4gIMKgwqDCoCBkbWFfYnVmX2F0dGFjaCgpCj4gIMKg
wqDCoCBkbWFfYnVmX21hcF9hdHRhY2htZW50KCkKPiAgwqDCoMKgIGRtYWJ1Zl9pbXBfZ3JhbnRf
Zm9yZWlnbl9hY2Nlc3MoKQo+Cj4gT3Igd2FzIEkgbG9va2luZyBhdCB3cm9uZyBwbGFjZT8KQWdy
ZWUsIHdpbGwgbW92ZSBhcyB5b3Ugc3VnZ2VzdAo+IC1ib3JpcwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
