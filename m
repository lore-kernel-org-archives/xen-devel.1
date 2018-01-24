From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 5/7] xen/arm32: Invalidate BTB on guest exit
 for Cortex A17 and 12
Date: Wed, 24 Jan 2018 17:22:01 -0500
Message-ID: <20180124222201.GS13334@char.us.oracle.com>
References: <20180119134103.3390-1-julien.grall@linaro.org>
 <20180119134103.3390-6-julien.grall@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180119134103.3390-6-julien.grall@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: sstabellini@kernel.org, andre.przywara@linaro.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTksIDIwMTggYXQgMDE6NDE6MDFQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEluIG9yZGVyIHRvIGF2b2lkIGFsaWFzaW5nIGF0dGFja2VzIGFnYWlucyB0aGUgYnJh
bmNoIHByZWRpY3RvciwgbGV0J3MKPiBpbnZhbGlkYXRlIHRoZSBCVEIgb24gZ3Vlc3QgZXhpc3Qu
IFRoaXMgaXMgbWFkZSBjb21wbGljYXRlZCBieSB0aGUgZmFjdAo+IHRoYXQgd2UgY2Fubm90IHRh
a2UgYSBicmFuY2ggaW52YWxpZGF0aW5nIHRoZSBCVEIuCj4gCj4gVGhpcyBpcyBiYXNlZCBvbiB0
aGUgZmlyc3QgdmVyc2lvbiBwb3NydGVkIGJ5IE1hcmMgWnluZ2llciBvbiBMaW51eC1hcm0KPiBt
YWlsaW5nIGxpc3QgKHNlZSBbMV0pLgo+IAo+IFRoaXMgaXMgcGFydCBvZiBYU0EtMjU0Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE1hcmMgWnluZ2llciA8bWFyYy56eW5naWVyQGFybS5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAbGluYXJvLm9yZz4KPiAKPiBb
MV0gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvYXJtLWtlcm5lbC9tc2c2MjcwMzIuaHRt
bAo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJtMzIvZW50cnkuUyB8IDU1ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgeGVuL2FyY2gvYXJtL2NwdWVycmF0
YS5jICAgfCAxOSArKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvZW50cnkuUyBiL3hl
bi9hcmNoL2FybS9hcm0zMi9lbnRyeS5TCj4gaW5kZXggNTRhMTczM2Y4Ny4uYzZlYzBhYTM5OSAx
MDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIvZW50cnkuUwo+ICsrKyBiL3hlbi9hcmNo
L2FybS9hcm0zMi9lbnRyeS5TCj4gQEAgLTE2MCw2ICsxNjAsNjEgQEAgR0xPQkFMKGh5cF90cmFw
c192ZWN0b3IpCj4gICAgICAgICAgYiB0cmFwX2lycSAgICAgICAgICAgICAgICAgICAgICAvKiAw
eDE4IC0gSVJRICovCj4gICAgICAgICAgYiB0cmFwX2ZpcSAgICAgICAgICAgICAgICAgICAgICAv
KiAweDFjIC0gRklRICovCj4gIAo+ICsgICAgICAgIC5hbGlnbiA1CgpOb3QgLmFsaWduIDg/CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
