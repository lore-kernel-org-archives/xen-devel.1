From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v2] drm: Replace NULL with error value in
 drm_prime_pages_to_sg
Date: Thu, 12 Jul 2018 14:58:00 +0300
Message-ID: <a9167704-e687-2688-18b8-f5e6320b1089__27254.5053544038$1531396606$gmane$org@gmail.com>
References: <20180618060709.14290-1-andr2000@gmail.com>
 <20180618122951.v55dxtjg4azezjvg@mwanda>
 <a0b8ffa2-cf75-5a8c-7341-29855780fc00@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oq85=j4=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fdaEX-0001uT-KC
 for xen-devel@lists.xenproject.org; Thu, 12 Jul 2018 11:58:05 +0000
Received: by mail-lf0-x244.google.com with SMTP id f18-v6so7912698lfc.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jul 2018 04:58:03 -0700 (PDT)
In-Reply-To: <a0b8ffa2-cf75-5a8c-7341-29855780fc00@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: jgross@suse.com, airlied@linux.ie, gustavo@padovan.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, seanpaul@chromium.org, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTgvMjAxOCAwMzozMiBQTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDYvMTgvMjAxOCAwMzoyOSBQTSwgRGFuIENhcnBlbnRlciB3cm90ZToKPj4gT24gTW9uLCBK
dW4gMTgsIDIwMTggYXQgMDk6MDc6MDlBTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
d3JvdGU6Cj4+PiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmPCoMKgwqAgfCAy
ICstCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfZ2VtLmMgfCAyICst
Cj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
Pj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5j
IAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMKPj4+IGluZGV4IDgw
YTUxMTVjMzg0Ni4uY2U4NjhjZTI4OGZiIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9nZW1fY21hX2hlbHBlci5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9j
bWFfaGVscGVyLmMKPj4+IEBAIC00MzYsNyArNDM2LDcgQEAgc3RydWN0IHNnX3RhYmxlIAo+Pj4g
KmRybV9nZW1fY21hX3ByaW1lX2dldF9zZ190YWJsZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9i
aikKPj4+IMKgIMKgwqDCoMKgwqAgc2d0ID0ga3phbGxvYyhzaXplb2YoKnNndCksIEdGUF9LRVJO
RUwpOwo+Pj4gwqDCoMKgwqDCoCBpZiAoIXNndCkKPj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4g
TlVMTDsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKPj4+IMKg
IMKgwqDCoMKgwqAgcmV0ID0gZG1hX2dldF9zZ3RhYmxlKG9iai0+ZGV2LT5kZXYsIHNndCwgY21h
X29iai0+dmFkZHIsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
bWFfb2JqLT5wYWRkciwgb2JqLT5zaXplKTsKPj4KPj4gSWYgZG1hX2dldF9zZ3RhYmxlKCkgZmFp
bHMgdGhlbiB3ZSByZXR1cm4gTlVMTC4KPj4KPj4gRml4IHRoYXQgYW5kIGl0IHNob3VsZCBiZSBn
b29kLgo+IFlvdSBtZWFuIEkgY2FuIHB1dCB5b3VyIHItYiB3aXRoIHRoYXQgZml4ZWQ/CnBpbmcK
Pj4gcmVnYXJkcywKPj4gZGFuIGNhcnBlbnRlcgo+Pgo+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
