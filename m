From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] drm: Replace NULL with error value in
 drm_prime_pages_to_sg
Date: Thu, 12 Jul 2018 15:16:53 +0300
Message-ID: <20180712121528.gxe2oygqcz4zopyn__18686.6208714948$1531397769$gmane$org@mwanda>
References: <20180618060709.14290-1-andr2000@gmail.com>
 <20180618122951.v55dxtjg4azezjvg@mwanda>
 <a0b8ffa2-cf75-5a8c-7341-29855780fc00@epam.com>
 <a9167704-e687-2688-18b8-f5e6320b1089@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ojnn=j4=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1fdaX7-0004DI-Ja
 for xen-devel@lists.xenproject.org; Thu, 12 Jul 2018 12:17:17 +0000
Content-Disposition: inline
In-Reply-To: <a9167704-e687-2688-18b8-f5e6320b1089@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: jgross@suse.com, Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, airlied@linux.ie, gustavo@padovan.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, seanpaul@chromium.org, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMTIsIDIwMTggYXQgMDI6NTg6MDBQTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gT24gMDYvMTgvMjAxOCAwMzozMiBQTSwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gPiBPbiAwNi8xOC8yMDE4IDAzOjI5IFBNLCBEYW4gQ2FycGVudGVy
IHdyb3RlOgo+ID4gPiBPbiBNb24sIEp1biAxOCwgMjAxOCBhdCAwOTowNzowOUFNICswMzAwLCBP
bGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPiA+ID4gPiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV9jbWFfaGVscGVyLmPCoMKgwqAgfCAyICstCj4gPiA+ID4gwqAgZHJpdmVycy9ncHUvZHJt
L3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jIHwgMiArLQo+ID4gPiA+IMKgIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMKPiA+ID4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYwo+ID4gPiA+IGluZGV4IDgwYTUxMTVj
Mzg0Ni4uY2U4NjhjZTI4OGZiIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX2NtYV9oZWxwZXIuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
X2NtYV9oZWxwZXIuYwo+ID4gPiA+IEBAIC00MzYsNyArNDM2LDcgQEAgc3RydWN0IHNnX3RhYmxl
Cj4gPiA+ID4gKmRybV9nZW1fY21hX3ByaW1lX2dldF9zZ190YWJsZShzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaikKPiA+ID4gPiDCoCDCoMKgwqDCoMKgIHNndCA9IGt6YWxsb2Moc2l6ZW9mKCpz
Z3QpLCBHRlBfS0VSTkVMKTsKPiA+ID4gPiDCoMKgwqDCoMKgIGlmICghc2d0KQo+ID4gPiA+IC3C
oMKgwqDCoMKgwqDCoCByZXR1cm4gTlVMTDsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IEVSUl9QVFIoLUVOT01FTSk7Cj4gPiA+ID4gwqAgwqDCoMKgwqDCoCByZXQgPSBkbWFfZ2V0X3Nn
dGFibGUob2JqLT5kZXYtPmRldiwgc2d0LCBjbWFfb2JqLT52YWRkciwKPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbWFfb2JqLT5wYWRkciwgb2JqLT5zaXpl
KTsKPiA+ID4gCj4gPiA+IElmIGRtYV9nZXRfc2d0YWJsZSgpIGZhaWxzIHRoZW4gd2UgcmV0dXJu
IE5VTEwuCj4gPiA+IAo+ID4gPiBGaXggdGhhdCBhbmQgaXQgc2hvdWxkIGJlIGdvb2QuCj4gPiBZ
b3UgbWVhbiBJIGNhbiBwdXQgeW91ciByLWIgd2l0aCB0aGF0IGZpeGVkPwo+IHBpbmcKClllYWgu
ICBTZW5kIHRoZSB2MiBwYXRjaCBhbmQgSSdsbCByZXZpZXcgaXQuCgpyZWdhcmRzLApkYW4gY2Fy
cGVudGVyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
