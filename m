From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 03/25] chardev/wctablet: Use unsigned
 type to hold unsigned value
Date: Wed, 20 Feb 2019 08:32:06 +0100
Message-ID: <20190220073206.gkzviu3v5xpu65n7__2283.71351711161$1550648006$gmane$org@sirius.home.kraxel.org>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-4-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hWxu=Q3=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1gwMMc-00021R-84
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 07:32:18 +0000
Content-Disposition: inline
In-Reply-To: <20190220010232.18731-4-philmd@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDI6MDI6MTBBTSArMDEwMCwgUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgd3JvdGU6Cj4gVGFibGV0Q2hhcmRldjo6cXVlcnkgaXMgYW4gYXJyYXkgb2YgdWlu
dDhfdC4KPiBVc2UgdGhlIHNhbWUgdHlwZSB0byBob2xkIGl0ICh0aGlzIGFsc28gc2lsZW50IGEg
LVdzaWduLWNvbnZlcnNpb24KPiB3YXJuaW5nIGluIHRoZSB0cmFjZSBmdW5jdGlvbikuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29t
PgoKUmV2aWV3ZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgoKPiAtLS0K
PiAgY2hhcmRldi90cmFjZS1ldmVudHMgfCAyICstCj4gIGNoYXJkZXYvd2N0YWJsZXQuYyAgIHwg
NSArKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvY2hhcmRldi90cmFjZS1ldmVudHMgYi9jaGFyZGV2L3RyYWNl
LWV2ZW50cwo+IGluZGV4IGQwZTVmM2JiYzEuLjU2MmJmZTcwZTkgMTAwNjQ0Cj4gLS0tIGEvY2hh
cmRldi90cmFjZS1ldmVudHMKPiArKysgYi9jaGFyZGV2L3RyYWNlLWV2ZW50cwo+IEBAIC01LDcg
KzUsNyBAQCB3Y3RfaW5pdCh2b2lkKSAiIgo+ICB3Y3RfY21kX3JlKHZvaWQpICIiCj4gIHdjdF9j
bWRfc3Qodm9pZCkgIiIKPiAgd2N0X2NtZF9zcCh2b2lkKSAiIgo+IC13Y3RfY21kX3RzKGludCBp
bnB1dCkgIjB4JTAyeCIKPiArd2N0X2NtZF90cyh1aW50OF90IGlucHV0KSAiMHglMDJ4Igo+ICB3
Y3RfY21kX290aGVyKGNvbnN0IGNoYXIgKmNtZCkgIiVzIgo+ICB3Y3Rfc3BlZWQoaW50IHNwZWVk
KSAiJWQiCj4gIAo+IGRpZmYgLS1naXQgYS9jaGFyZGV2L3djdGFibGV0LmMgYi9jaGFyZGV2L3dj
dGFibGV0LmMKPiBpbmRleCAzNWRiZDI5YTMzLi5jZjdhMDhhMzYzIDEwMDY0NAo+IC0tLSBhL2No
YXJkZXYvd2N0YWJsZXQuYwo+ICsrKyBiL2NoYXJkZXYvd2N0YWJsZXQuYwo+IEBAIC0yMDcsNyAr
MjA3LDggQEAgc3RhdGljIGludCB3Y3RhYmxldF9jaHJfd3JpdGUoc3RydWN0IENoYXJkZXYgKmNo
ciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdWludDhfdCAqYnVmLCBp
bnQgbGVuKQo+ICB7Cj4gICAgICBUYWJsZXRDaGFyZGV2ICp0YWJsZXQgPSBXQ1RBQkxFVF9DSEFS
REVWKGNocik7Cj4gLSAgICB1bnNpZ25lZCBpbnQgaSwgY2xlbjsKPiArICAgIHNpemVfdCBpOwo+
ICsgICAgdW5zaWduZWQgaW50IGNsZW47Cj4gICAgICBjaGFyICpwb3M7Cj4gIAo+ICAgICAgaWYg
KHRhYmxldC0+bGluZV9zcGVlZCAhPSA5NjAwKSB7Cj4gQEAgLTI2OSw3ICsyNzAsNyBAQCBzdGF0
aWMgaW50IHdjdGFibGV0X2Nocl93cml0ZShzdHJ1Y3QgQ2hhcmRldiAqY2hyLAo+ICAKPiAgICAg
IH0gZWxzZSBpZiAoc3RybmNtcCgoY2hhciAqKXRhYmxldC0+cXVlcnksICJUUyIsIDIpID09IDAg
JiYKPiAgICAgICAgICAgICAgICAgY2xlbiA9PSAzKSB7Cj4gLSAgICAgICAgdW5zaWduZWQgaW50
IGlucHV0ID0gdGFibGV0LT5xdWVyeVsyXTsKPiArICAgICAgICB1aW50OF90IGlucHV0ID0gdGFi
bGV0LT5xdWVyeVsyXTsKPiAgICAgICAgICB1aW50OF90IGNvZGVzWzddID0gewo+ICAgICAgICAg
ICAgICAweGEzLAo+ICAgICAgICAgICAgICAoKGlucHV0ICYgMHg4MCkgPT0gMCkgPyAweDdlIDog
MHg3ZiwKPiAtLSAKPiAyLjIwLjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
