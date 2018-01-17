From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH] ocaml: fix arm build
Date: Wed, 17 Jan 2018 16:51:09 +0000
Message-ID: <1adc1d89-18ae-62df-53a4-04f8810200e5@linaro.org>
References: <20180117164354.9964-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=a0fp=em=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ebqvh-0001ao-55
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 16:51:13 +0000
Received: by mail-wm0-x244.google.com with SMTP id 81so22691407wmb.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2018 08:51:11 -0800 (PST)
In-Reply-To: <20180117164354.9964-1-wei.liu2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgV2VpLAoKT24gMTcvMDEvMTggMTY6NDMsIFdlaSBMaXUgd3JvdGU6Cj4gQVJNIGRvZXNuJ3Qg
aGF2ZSBlbXVsYXRpb25fZmxhZ3MgaW4gdGhlIGFyY2hfZG9tYWluY29uZmlnLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAbGluYXJvLm9yZz4KCkNoZWVycywKCj4gLS0tCj4gQ2M6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgo+IC0tLQo+ICAgdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0
dWJzLmMgfCA2ICsrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyBiL3Rvb2xz
L29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jCj4gaW5kZXggMGI1YTIzNjFjMC4uZmQxMjg3
NzhiMyAxMDA2NDQKPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYwo+
ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jCj4gQEAgLTE3NSwxMSAr
MTc1LDE1IEBAIENBTUxwcmltIHZhbHVlIHN0dWJfeGNfZG9tYWluX2NyZWF0ZSh2YWx1ZSB4Y2gs
IHZhbHVlIHNzaWRyZWYsCj4gICAJCWNhbWxfZmFpbHdpdGgoIlVuaGFuZGxlZDogQVJNIik7Cj4g
ICAJCWJyZWFrOwo+ICAgCj4gKyNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9feDg2
XzY0X18pCj4gICAJY2FzZSAxOiAvKiBYODYgLSBlbXVsYXRpb24gZmxhZ3MgaW4gdGhlIGJsb2Nr
ICovCj4gICAJCWZvciAobCA9IEZpZWxkKEZpZWxkKGRvbWNvbmZpZywgMCksIDApOwo+ICAgCQkg
ICAgIGwgIT0gVmFsX25vbmU7Cj4gICAJCSAgICAgbCA9IEZpZWxkKGwsIDEpKQo+ICAgCQkJY29u
ZmlnLmVtdWxhdGlvbl9mbGFncyB8PSAxdSA8PCBJbnRfdmFsKEZpZWxkKGwsIDApKTsKPiArI2Vs
c2UKPiArCQljYW1sX2ZhaWx3aXRoKCJVbmhhbmRsZWQ6IHg4NiIpOwo+ICsjZW5kaWYKPiAgIAkJ
YnJlYWs7Cj4gICAKPiAgIAlkZWZhdWx0Ogo+IEBAIC0zMjAsNiArMzI0LDcgQEAgc3RhdGljIHZh
bHVlIGFsbG9jX2RvbWFpbmluZm8oeGNfZG9tYWluaW5mb190ICogaW5mbykKPiAgIAo+ICAgCVN0
b3JlX2ZpZWxkKHJlc3VsdCwgMTUsIHRtcCk7Cj4gICAKPiArI2lmIGRlZmluZWQoX19pMzg2X18p
IHx8IGRlZmluZWQoX194ODZfNjRfXykKPiAgIAkvKiBlbXVsYXRpb25fZmxhZ3M6IHg4Nl9hcmNo
X2VtdWxhdGlvbl9mbGFncyBsaXN0OyAqLwo+ICAgCXRtcCA9IGVtdWxfbGlzdCA9IFZhbF9lbXB0
eWxpc3Q7Cj4gICAJZm9yIChpID0gMDsgaSA8IDEwOyBpKyspIHsKPiBAQCAtMzQxLDYgKzM0Niw3
IEBAIHN0YXRpYyB2YWx1ZSBhbGxvY19kb21haW5pbmZvKHhjX2RvbWFpbmluZm9fdCAqIGluZm8p
Cj4gICAJU3RvcmVfZmllbGQoYXJjaF9jb25maWcsIDAsIHg4Nl9hcmNoX2NvbmZpZyk7Cj4gICAK
PiAgIAlTdG9yZV9maWVsZChyZXN1bHQsIDE2LCBhcmNoX2NvbmZpZyk7Cj4gKyNlbmRpZgo+ICAg
Cj4gICAJQ0FNTHJldHVybihyZXN1bHQpOwo+ICAgfQo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
