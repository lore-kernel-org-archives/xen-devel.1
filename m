From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 4/9] drm/xen-front: Implement Xen event
	channel handling
Date: Fri, 23 Feb 2018 16:49:46 +0200
Message-ID: <63c64a2f-211e-2f62-21e7-289f0cc69df0__30171.0334294059$1519397317$gmane$org@gmail.com>
References: <1519200222-20623-1-git-send-email-andr2000@gmail.com>
 <1519200222-20623-5-git-send-email-andr2000@gmail.com>
 <395cdaef-db7e-139c-bbf1-28cb33f41f58@oracle.com>
 <5145287f-40b0-c8e2-1b37-36d7e8cac908@gmail.com>
 <7d8ab151-e90d-baef-93b6-8ca1c7e42908@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vqf1=fr=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1epEfX-0007iv-05
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 14:49:51 +0000
Received: by mail-lf0-x22a.google.com with SMTP id r80so12695000lfe.13
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2018 06:49:49 -0800 (PST)
In-Reply-To: <7d8ab151-e90d-baef-93b6-8ca1c7e42908@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@linux.ie, daniel.vetter@intel.com, seanpaul@chromium.org, gustavo@padovan.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjMvMjAxOCAwNDo0NCBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDAyLzIz
LzIwMTggMDI6MDAgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBPbiAwMi8y
My8yMDE4IDAxOjUwIEFNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+PiBPbiAwMi8yMS8yMDE4
IDAzOjAzIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+PiArCj4+Pj4gK3N0
YXRpYyBpcnFyZXR1cm5fdCBldnRjaG5sX2ludGVycnVwdF9jdHJsKGludCBpcnEsIHZvaWQgKmRl
dl9pZCkKPj4+PiArewo+Pj4+ICsgICAgc3RydWN0IHhlbl9kcm1fZnJvbnRfZXZ0Y2hubCAqZXZ0
Y2hubCA9IGRldl9pZDsKPj4+PiArICAgIHN0cnVjdCB4ZW5fZHJtX2Zyb250X2luZm8gKmZyb250
X2luZm8gPSBldnRjaG5sLT5mcm9udF9pbmZvOwo+Pj4+ICsgICAgc3RydWN0IHhlbmRpc3BsX3Jl
c3AgKnJlc3A7Cj4+Pj4gKyAgICBSSU5HX0lEWCBpLCBycDsKPj4+PiArICAgIHVuc2lnbmVkIGxv
bmcgZmxhZ3M7Cj4+Pj4gKwo+Pj4+ICsgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmZyb250X2luZm8t
PmlvX2xvY2ssIGZsYWdzKTsKPj4+PiArCj4+Pj4gKyAgICBpZiAodW5saWtlbHkoZXZ0Y2hubC0+
c3RhdGUgIT0gRVZUQ0hOTF9TVEFURV9DT05ORUNURUQpKQo+Pj4+ICsgICAgICAgIGdvdG8gb3V0
Owo+Pj4gRG8geW91IG5lZWQgdG8gY2hlY2sgdGhlIHN0YXRlIHVuZGVyIGxvY2s/IChpbiBvdGhl
ciByb3V0aW5lcyB0b28pLgo+PiBub3QgcmVhbGx5LCB3aWxsIG1vdmUgb3V0IG9mIHRoZSBsb2Nr
IGluIGludGVycnVwdCBoYW5kbGVycwo+PiBvdGhlciBwbGFjZXMgKEkgYXNzdW1lIHlvdSByZWZl
ciB0byBiZV9zdHJlYW1fZG9faW8pCj4KPiBJIHdhcyBtb3N0bHkgcmVmZXJyaW5nIHRvIGV2dGNo
bmxfaW50ZXJydXB0X2V2dCgpLgphaCwgdGhlbiB3ZSBhcmUgb24gdGhlIHNhbWUgcGFnZTogSSB3
aWxsIG1vdmUgdGhlIGNoZWNrCmluIGludGVycnVwdCBoYW5kbGVycwo+IC1ib3Jpcwo+Cj4KPj4g
aXQgaXMgc2V0IHVuZGVyIGxvY2sgYXMgYSBwYXJ0IG9mIGF0b21pYyBvcGVyYXRpb24sIGUuZy4K
Pj4gd2UgZ2V0IGEgbmV3IHJlcXVlc3QgcG9pbnRlciBmcm9tIHRoZSByaW5nIGFuZCByZXNldCBj
b21wbGV0aW9uCj4+IFNvLCB0aG9zZSBwbGFjZXMgc3RpbGwgc2VlbSB0byBiZSBvawoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
