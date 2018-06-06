From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v2 3/9] xen/balloon: Share common memory
 reservation routines
Date: Wed, 6 Jun 2018 10:24:06 +0300
Message-ID: <05e361c2-c7f3-2f57-908c-e2c9b98b18e7__47404.5032788583$1528269781$gmane$org@gmail.com>
References: <20180601114132.22596-1-andr2000@gmail.com>
 <20180601114132.22596-4-andr2000@gmail.com>
 <4fd46fd8-f936-1514-06e4-34c5d3ed8960@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yvez=iy=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fQSnj-000442-IL
 for xen-devel@lists.xenproject.org; Wed, 06 Jun 2018 07:24:11 +0000
Received: by mail-lf0-x243.google.com with SMTP id 36-v6so7474647lfr.11
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jun 2018 00:24:10 -0700 (PDT)
In-Reply-To: <4fd46fd8-f936-1514-06e4-34c5d3ed8960@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDQvMjAxOCAwNzozNyBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA2LzAx
LzIwMTggMDc6NDEgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS94ZW4vbWVtLXJlc2VydmF0aW9uLmggYi9pbmNsdWRlL3hlbi9tZW0tcmVz
ZXJ2YXRpb24uaAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAu
LmE3MjdkNjVhMWU2MQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2luY2x1ZGUveGVuL21lbS1y
ZXNlcnZhdGlvbi5oCj4+IEBAIC0wLDAgKzEsNjUgQEAKPj4gKy8qIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wICovCj4+ICsKPj4gKy8qCj4+ICsgKiBYZW4gbWVtb3J5IHJlc2VydmF0
aW9uIHV0aWxpdGllcy4KPj4gKyAqCj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMDMsIEIgRHJhZ292
aWMKPj4gKyAqIENvcHlyaWdodCAoYykgMjAwMy0yMDA0LCBNIFdpbGxpYW1zb24sIEsgRnJhc2Vy
Cj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMDUgRGFuIE0uIFNtaXRoLCBJQk0gQ29ycG9yYXRpb24K
Pj4gKyAqIENvcHlyaWdodCAoYykgMjAxMCBEYW5pZWwgS2lwZXIKPj4gKyAqIENvcHlyaWdodCAo
YykgMjAxOCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbywgRVBBTSBTeXN0ZW1zIEluYy4KPj4gKyAq
Lwo+PiArCj4+ICsjaWZuZGVmIF9YRU5NRU1fUkVTRVJWQVRJT05fSAo+PiArI2RlZmluZSBfWEVO
TUVNX1JFU0VSVkFUSU9OX0gKPj4gKwo+PiArI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+PiAr
I2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPj4gKwo+PiArI2luY2x1ZGUgPGFzbS94ZW4vaHlwZXJj
YWxsLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL3RsYi5oPgo+PiArCj4+ICsjaW5jbHVkZSA8eGVuL2lu
dGVyZmFjZS9tZW1vcnkuaD4KPj4gKyNpbmNsdWRlIDx4ZW4vcGFnZS5oPgo+PiArCj4+ICsjaWZk
ZWYgQ09ORklHX1hFTl9TQ1JVQl9QQUdFUwo+PiArdm9pZCB4ZW5tZW1fcmVzZXJ2YXRpb25fc2Ny
dWJfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSk7Cj4+ICsjZWxzZQo+PiArc3RhdGljIGlubGluZSB2
b2lkIHhlbm1lbV9yZXNlcnZhdGlvbl9zY3J1Yl9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+PiAr
ewo+PiArfQo+PiArI2VuZGlmCj4KPiBHaXZlbiB0aGF0IHRoaXMgaXMgYSB3cmFwcGVyIGFyb3Vu
ZCBhIHNpbmdsZSBjYWxsIEknZCBwcmVmZXIKPgo+IGlubGluZSB2b2lkIHhlbm1lbV9yZXNlcnZh
dGlvbl9zY3J1Yl9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+IHsKPiAjaWZkZWYgQ09ORklHX1hF
Tl9TQ1JVQl9QQUdFUwo+ICDCoMKgwqAgY2xlYXJfaGlnaHBhZ2UocGFnZSk7Cj4gI2VuZGlmCj4g
fQpVbmZvcnR1bmF0ZWx5IHRoaXMgY2FuJ3QgYmUgZG9uZSBiZWNhdXNlIG9mCkVYUE9SVF9TWU1C
T0xfR1BMKHhlbm1lbV9yZXNlcnZhdGlvbl9zY3J1Yl9wYWdlKTsKd2hpY2ggaXMgb2J2aW91c2x5
IGNhbm5vdCBiZSB1c2VkIGZvciBzdGF0aWMgaW5saW5lIGZ1bmN0aW9ucy4KU28sIEknbGwga2Vl
cCBpdCBhcyBpcy4KPgo+Cj4gLWJvcmlzCj4KPgpUaGFuayB5b3UsCk9sZWtzYW5kcgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
