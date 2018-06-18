From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2] drm: Replace NULL with error value in
 drm_prime_pages_to_sg
Date: Mon, 18 Jun 2018 15:32:48 +0300
Message-ID: <a0b8ffa2-cf75-5a8c-7341-29855780fc00__9423.9346487031$1529325108$gmane$org@epam.com>
References: <20180618060709.14290-1-andr2000@gmail.com>
 <20180618122951.v55dxtjg4azezjvg@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jri7=je=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1fUtLE-0008Jj-8d
 for xen-devel@lists.xenproject.org; Mon, 18 Jun 2018 12:33:04 +0000
In-Reply-To: <20180618122951.v55dxtjg4azezjvg@mwanda>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: jgross@suse.com, airlied@linux.ie, gustavo@padovan.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, seanpaul@chromium.org, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTgvMjAxOCAwMzoyOSBQTSwgRGFuIENhcnBlbnRlciB3cm90ZToKPiBPbiBNb24sIEp1
biAxOCwgMjAxOCBhdCAwOTowNzowOUFNICswMzAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3
cm90ZToKPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMgICAgfCAyICst
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jIHwgMiArLQo+PiAg
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jCj4+IGluZGV4IDgwYTUxMTVjMzg0Ni4uY2U4
NjhjZTI4OGZiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVs
cGVyLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jCj4+IEBA
IC00MzYsNyArNDM2LDcgQEAgc3RydWN0IHNnX3RhYmxlICpkcm1fZ2VtX2NtYV9wcmltZV9nZXRf
c2dfdGFibGUoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCj4+ICAgCj4+ICAgCXNndCA9IGt6
YWxsb2Moc2l6ZW9mKCpzZ3QpLCBHRlBfS0VSTkVMKTsKPj4gICAJaWYgKCFzZ3QpCj4+IC0JCXJl
dHVybiBOVUxMOwo+PiArCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKPj4gICAKPj4gICAJcmV0
ID0gZG1hX2dldF9zZ3RhYmxlKG9iai0+ZGV2LT5kZXYsIHNndCwgY21hX29iai0+dmFkZHIsCj4+
ICAgCQkJICAgICAgY21hX29iai0+cGFkZHIsIG9iai0+c2l6ZSk7Cj4KPiBJZiBkbWFfZ2V0X3Nn
dGFibGUoKSBmYWlscyB0aGVuIHdlIHJldHVybiBOVUxMLgo+Cj4gRml4IHRoYXQgYW5kIGl0IHNo
b3VsZCBiZSBnb29kLgpZb3UgbWVhbiBJIGNhbiBwdXQgeW91ciByLWIgd2l0aCB0aGF0IGZpeGVk
Pwo+IHJlZ2FyZHMsCj4gZGFuIGNhcnBlbnRlcgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
