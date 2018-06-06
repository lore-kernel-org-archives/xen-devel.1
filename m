From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 3/9] xen/balloon: Share common memory
 reservation routines
Date: Wed, 6 Jun 2018 17:09:50 -0400
Message-ID: <6cba4317-b517-3e12-ba1b-3ccbe414ada0__35768.3064452887$1528319102$gmane$org@oracle.com>
References: <20180601114132.22596-1-andr2000@gmail.com>
 <20180601114132.22596-4-andr2000@gmail.com>
 <4fd46fd8-f936-1514-06e4-34c5d3ed8960@oracle.com>
 <05e361c2-c7f3-2f57-908c-e2c9b98b18e7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=c6s6=iy=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fQfdD-0003HH-UY
 for xen-devel@lists.xenproject.org; Wed, 06 Jun 2018 21:06:11 +0000
In-Reply-To: <05e361c2-c7f3-2f57-908c-e2c9b98b18e7@gmail.com>
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

T24gMDYvMDYvMjAxOCAwMzoyNCBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDYvMDQvMjAxOCAwNzozNyBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAwNi8w
MS8yMDE4IDA3OjQxIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL3hlbi9tZW0tcmVzZXJ2YXRpb24uaAo+Pj4gYi9pbmNsdWRlL3hlbi9t
ZW0tcmVzZXJ2YXRpb24uaAo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAw
MDAwMDAwMC4uYTcyN2Q2NWExZTYxCj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9pbmNsdWRl
L3hlbi9tZW0tcmVzZXJ2YXRpb24uaAo+Pj4gQEAgLTAsMCArMSw2NSBAQAo+Pj4gKy8qIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4+PiArCj4+PiArLyoKPj4+ICsgKiBYZW4g
bWVtb3J5IHJlc2VydmF0aW9uIHV0aWxpdGllcy4KPj4+ICsgKgo+Pj4gKyAqIENvcHlyaWdodCAo
YykgMjAwMywgQiBEcmFnb3ZpYwo+Pj4gKyAqIENvcHlyaWdodCAoYykgMjAwMy0yMDA0LCBNIFdp
bGxpYW1zb24sIEsgRnJhc2VyCj4+PiArICogQ29weXJpZ2h0IChjKSAyMDA1IERhbiBNLiBTbWl0
aCwgSUJNIENvcnBvcmF0aW9uCj4+PiArICogQ29weXJpZ2h0IChjKSAyMDEwIERhbmllbCBLaXBl
cgo+Pj4gKyAqIENvcHlyaWdodCAoYykgMjAxOCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbywgRVBB
TSBTeXN0ZW1zIEluYy4KPj4+ICsgKi8KPj4+ICsKPj4+ICsjaWZuZGVmIF9YRU5NRU1fUkVTRVJW
QVRJT05fSAo+Pj4gKyNkZWZpbmUgX1hFTk1FTV9SRVNFUlZBVElPTl9ICj4+PiArCj4+PiArI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4+PiAr
Cj4+PiArI2luY2x1ZGUgPGFzbS94ZW4vaHlwZXJjYWxsLmg+Cj4+PiArI2luY2x1ZGUgPGFzbS90
bGIuaD4KPj4+ICsKPj4+ICsjaW5jbHVkZSA8eGVuL2ludGVyZmFjZS9tZW1vcnkuaD4KPj4+ICsj
aW5jbHVkZSA8eGVuL3BhZ2UuaD4KPj4+ICsKPj4+ICsjaWZkZWYgQ09ORklHX1hFTl9TQ1JVQl9Q
QUdFUwo+Pj4gK3ZvaWQgeGVubWVtX3Jlc2VydmF0aW9uX3NjcnViX3BhZ2Uoc3RydWN0IHBhZ2Ug
KnBhZ2UpOwo+Pj4gKyNlbHNlCj4+PiArc3RhdGljIGlubGluZSB2b2lkIHhlbm1lbV9yZXNlcnZh
dGlvbl9zY3J1Yl9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+Pj4gK3sKPj4+ICt9Cj4+PiArI2Vu
ZGlmCj4+Cj4+IEdpdmVuIHRoYXQgdGhpcyBpcyBhIHdyYXBwZXIgYXJvdW5kIGEgc2luZ2xlIGNh
bGwgSSdkIHByZWZlcgo+Pgo+PiBpbmxpbmUgdm9pZCB4ZW5tZW1fcmVzZXJ2YXRpb25fc2NydWJf
cGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKPj4gewo+PiAjaWZkZWYgQ09ORklHX1hFTl9TQ1JVQl9Q
QUdFUwo+PiDCoMKgwqDCoCBjbGVhcl9oaWdocGFnZShwYWdlKTsKPj4gI2VuZGlmCj4+IH0KPiBV
bmZvcnR1bmF0ZWx5IHRoaXMgY2FuJ3QgYmUgZG9uZSBiZWNhdXNlIG9mCj4gRVhQT1JUX1NZTUJP
TF9HUEwoeGVubWVtX3Jlc2VydmF0aW9uX3NjcnViX3BhZ2UpOwo+IHdoaWNoIGlzIG9idmlvdXNs
eSBjYW5ub3QgYmUgdXNlZCBmb3Igc3RhdGljIGlubGluZSBmdW5jdGlvbnMuCgoKCldoeSBkbyB5
b3UgbmVlZCB0byBleHBvcnQgaXQ/IEl0J3MgYW4gaW5saW5lIGRlZmluZWQgaW4gdGhlIGhlYWRl
ciBmaWxlLgpKdXN0IGxpa2UgY2xlYXJfaGlnaHBhZ2UoKS4KCgotYm9yaXMKCj4gU28sIEknbGwg
a2VlcCBpdCBhcyBpcy4KPj4KPj4KPj4gLWJvcmlzCj4+Cj4+Cj4gVGhhbmsgeW91LAo+IE9sZWtz
YW5kcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
