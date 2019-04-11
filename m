From: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [edk2-devel] [PATCH v2 11/31]
 OvmfPkg/XenPlatformPei: Use mXenHvmloaderInfo to get E820
Date: Thu, 11 Apr 2019 13:49:03 +0200
Message-ID: <94638c0b-1756-f1ba-da8e-12c1297d15c2@redhat.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-12-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i8R2=SN=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEYCZ-0002ea-T4
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 11:49:07 +0000
In-Reply-To: <20190409110844.14746-12-anthony.perard@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: devel@edk2.groups.io, anthony.perard@citrix.com
Cc: Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFVzZSB0aGUgYWxyZWFk
eSBjaGVja2VkIHBvaW50ZXIgbVhlbkh2bWxvYWRlckluZm8gdG8gcmV0cmlldmUgdGhlIEU4MjAK
PiB0YWJsZSBwcm9kdWNlZCBieSBodm1sb2FkZXIuCj4gCj4gQ29udHJpYnV0ZWQtdW5kZXI6IFRp
YW5vQ29yZSBDb250cmlidXRpb24gQWdyZWVtZW50IDEuMQo+IFNpZ25lZC1vZmYtYnk6IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IC0tLQo+ICBPdm1mUGtnL1hl
blBsYXRmb3JtUGVpL1hlbi5jIHwgMTggKysrKysrKysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL092
bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5j
Cj4gaW5kZXggYTg2NjY0MWI2Ny4uZGY5MDZiNmJlNSAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hl
blBsYXRmb3JtUGVpL1hlbi5jCj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+
IEBAIC01OSwxOCArNTksMTggQEAgWGVuR2V0RTgyME1hcCAoCj4gICAgVUlOVDMyICpDb3VudAo+
ICAgICkKPiAgewo+IC0gIEVGSV9YRU5fT1ZNRl9JTkZPICpJbmZvID0KPiAtICAgIChFRklfWEVO
X09WTUZfSU5GTyAqKShVSU5UTikgT1ZNRl9JTkZPX1BIWVNJQ0FMX0FERFJFU1M7Cj4gKyAgLy8K
PiArICAvLyBHZXQgRTgyMCBwcm9kdWNlZCBieSBodm1sb2FkZXIKPiArICAvLwo+ICsgIGlmICht
WGVuSHZtbG9hZGVySW5mbyAhPSBOVUxMKSB7Cj4gKyAgICBBU1NFUlQgKG1YZW5Idm1sb2FkZXJJ
bmZvLT5FODIwIDwgTUFYX0FERFJFU1MpOwo+ICsgICAgKkVudHJpZXMgPSAoRUZJX0U4MjBfRU5U
Ulk2NCAqKShVSU5UTikgbVhlbkh2bWxvYWRlckluZm8tPkU4MjA7Cj4gKyAgICAqQ291bnQgPSBt
WGVuSHZtbG9hZGVySW5mby0+RTgyMEVudHJpZXNDb3VudDsKPiAgCj4gLSAgaWYgKEFzY2lpU3Ry
Q21wICgoQ0hBUjggKikgSW5mby0+U2lnbmF0dXJlLCAiWGVuSFZNT1ZNRiIpKSB7Cj4gLSAgICBy
ZXR1cm4gRUZJX05PVF9GT1VORDsKPiArICAgIHJldHVybiBFRklfU1VDQ0VTUzsKPiAgICB9Cj4g
IAo+IC0gIEFTU0VSVCAoSW5mby0+RTgyMCA8IE1BWF9BRERSRVNTKTsKPiAtICAqRW50cmllcyA9
IChFRklfRTgyMF9FTlRSWTY0ICopKFVJTlROKSBJbmZvLT5FODIwOwo+IC0gICpDb3VudCA9IElu
Zm8tPkU4MjBFbnRyaWVzQ291bnQ7Cj4gLQo+IC0gIHJldHVybiBFRklfU1VDQ0VTUzsKPiArICBy
ZXR1cm4gRUZJX05PVF9GT1VORDsKPiAgfQo+ICAKPiAgLyoqCj4gCgpBY2tlZC1ieTogTGFzemxv
IEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
