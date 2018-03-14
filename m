From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] xenbaked.c: Avoid divide by zero issue on
	dump_stats()
Date: Tue, 13 Mar 2018 22:24:26 -0400
Message-ID: <20180314022426.GQ3543@char.us.oracle.com>
References: <560fcc42-d01f-f60d-0c9f-4373d4e8e8f4@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=hg23=ge=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1evw5p-0002xk-VR
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 02:24:41 +0000
Content-Disposition: inline
In-Reply-To: <560fcc42-d01f-f60d-0c9f-4373d4e8e8f4@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joe Jin <joe.jin@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Philip Lee <philip.lee@oracle.com>, Wei Liu <wei.liu2@citrix.com>, Ian Campbell <ian.campbell@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMDY6Mzg6MjRQTSAtMDcwMCwgSm9lIEppbiB3cm90ZToK
PiBydW5fdGltZSBvbiBkdW1wX3N0YXRzKCkgbWF5YmUgemVybyBpZiBicmVhayB4ZW5tb24ucHkg
aW1tZWRpYXRlbHkgYWZ0ZXIgaXQKCnMvbWF5YmUvY2FuIGJlLwo+IHN0YXJ0ZWQsIHRoZW4geGVu
YmFrZWQgaGl0IGRpdmlkZSBieSB6ZXJvIGZhdWx0LgoKQW5kOgoKIk5vdGUgdGhhdCBydW5fdGlt
ZSBpcyBjb21wdXRlZCB1c2luZyB0d28gdmFsdWVzIHdoaWNoIGFyZSByZXRyaWV2ZWQgdXNpbmcg
J3RpbWUnCnN5c3RlbSBjYWxsIHdoaWNoIGdpdmVzIHVzIHJlc29sdXRpb24gaW4gc2Vjb25kcy4i
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvZSBKaW4gPGpvZS5qaW5Ab3JhY2xlLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+
Cj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ2M6IElhbiBDYW1wYmVsbCA8
aWFuLmNhbXBiZWxsQGNpdHJpeC5jb20+Cj4gLS0tCj4gIHRvb2xzL3hlbm1vbi94ZW5iYWtlZC5j
IHwgOCArKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy94ZW5tb24veGVuYmFrZWQuYyBiL3Rvb2xz
L3hlbm1vbi94ZW5iYWtlZC5jCj4gaW5kZXggM2Q5ZTBlZDkwMC4uZDNmOTQwYTI2YiAxMDA2NDQK
PiAtLS0gYS90b29scy94ZW5tb24veGVuYmFrZWQuYwo+ICsrKyBiL3Rvb2xzL3hlbm1vbi94ZW5i
YWtlZC5jCj4gQEAgLTI0MywxMCArMjQzLDEyIEBAIHN0YXRpYyB2b2lkIGR1bXBfc3RhdHModm9p
ZCkKPiAgICAgIH0KPiAgCj4gICAgICBwcmludGYoInByb2Nlc3NlZCAlZCB0b3RhbCByZWNvcmRz
IGluICVkIHNlY29uZHMgKCVsZCBwZXIgc2Vjb25kKVxuIiwKPiAtICAgICAgICAgICByZWNfY291
bnQsIChpbnQpcnVuX3RpbWUsIChsb25nKShyZWNfY291bnQvcnVuX3RpbWUpKTsKPiArICAgICAg
ICAgICByZWNfY291bnQsIChpbnQpcnVuX3RpbWUsCj4gKyAgICAgICAgICAgcnVuX3RpbWUgPyAo
bG9uZykocmVjX2NvdW50L3J1bl90aW1lKSA6IDBMKTsKPiAgCj4gLSAgICBwcmludGYoIndva2Ug
dXAgJWQgdGltZXMgaW4gJWQgc2Vjb25kcyAoJWxkIHBlciBzZWNvbmQpXG4iLCB3YWtldXBzLAo+
IC0JICAgKGludCkgcnVuX3RpbWUsIChsb25nKSh3YWtldXBzL3J1bl90aW1lKSk7Cj4gKyAgICBw
cmludGYoIndva2UgdXAgJWQgdGltZXMgaW4gJWQgc2Vjb25kcyAoJWxkIHBlciBzZWNvbmQpXG4i
LAo+ICsgICAgICAgICAgIHdha2V1cHMsIChpbnQpIHJ1bl90aW1lLAo+ICsgICAgICAgICAgIHJ1
bl90aW1lID8gKGxvbmcpKHdha2V1cHMvcnVuX3RpbWUpIDogMEwpOwo+ICAKPiAgICAgIGNoZWNr
X2dvdHRlbl9zdW0oKTsKPiAgfQo+IC0tIAo+IDIuMTQuMyAoQXBwbGUgR2l0LTk4KQo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
