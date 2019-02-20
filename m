From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v3 03/25] chardev/wctablet: Use unsigned
 type to hold unsigned value
Date: Wed, 20 Feb 2019 11:17:19 +0100
Message-ID: <CAMxuvawsWu1m83qwp=U8m0X9Ar4m9CNiEVetfimhXoHzzkNHJQ__17429.2821016692$1550657972$gmane$org@mail.gmail.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-4-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wVrY=Q3=redhat.com=mlureau@srs-us1.protection.inumbo.net>)
 id 1gwOxU-00087W-Nx
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 10:18:32 +0000
Received: by mail-qk1-f195.google.com with SMTP id x9so1653511qkf.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 02:18:31 -0800 (PST)
In-Reply-To: <20190220010232.18731-4-philmd@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

SGkKCk9uIFdlZCwgRmViIDIwLCAyMDE5IGF0IDI6MDMgQU0gUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kKPHBoaWxtZEByZWRoYXQuY29tPiB3cm90ZToKPgo+IFRhYmxldENoYXJkZXY6OnF1ZXJ5IGlz
IGFuIGFycmF5IG9mIHVpbnQ4X3QuCj4gVXNlIHRoZSBzYW1lIHR5cGUgdG8gaG9sZCBpdCAodGhp
cyBhbHNvIHNpbGVudCBhIC1Xc2lnbi1jb252ZXJzaW9uCj4gd2FybmluZyBpbiB0aGUgdHJhY2Ug
ZnVuY3Rpb24pLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IE1hcmMtQW5kcsOpIEx1cmVhdSA8bWFyY2Fu
ZHJlLmx1cmVhdUByZWRoYXQuY29tPgoKPiAtLS0KPiAgY2hhcmRldi90cmFjZS1ldmVudHMgfCAy
ICstCj4gIGNoYXJkZXYvd2N0YWJsZXQuYyAgIHwgNSArKystLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9jaGFyZGV2
L3RyYWNlLWV2ZW50cyBiL2NoYXJkZXYvdHJhY2UtZXZlbnRzCj4gaW5kZXggZDBlNWYzYmJjMS4u
NTYyYmZlNzBlOSAxMDA2NDQKPiAtLS0gYS9jaGFyZGV2L3RyYWNlLWV2ZW50cwo+ICsrKyBiL2No
YXJkZXYvdHJhY2UtZXZlbnRzCj4gQEAgLTUsNyArNSw3IEBAIHdjdF9pbml0KHZvaWQpICIiCj4g
IHdjdF9jbWRfcmUodm9pZCkgIiIKPiAgd2N0X2NtZF9zdCh2b2lkKSAiIgo+ICB3Y3RfY21kX3Nw
KHZvaWQpICIiCj4gLXdjdF9jbWRfdHMoaW50IGlucHV0KSAiMHglMDJ4Igo+ICt3Y3RfY21kX3Rz
KHVpbnQ4X3QgaW5wdXQpICIweCUwMngiCj4gIHdjdF9jbWRfb3RoZXIoY29uc3QgY2hhciAqY21k
KSAiJXMiCj4gIHdjdF9zcGVlZChpbnQgc3BlZWQpICIlZCIKPgo+IGRpZmYgLS1naXQgYS9jaGFy
ZGV2L3djdGFibGV0LmMgYi9jaGFyZGV2L3djdGFibGV0LmMKPiBpbmRleCAzNWRiZDI5YTMzLi5j
ZjdhMDhhMzYzIDEwMDY0NAo+IC0tLSBhL2NoYXJkZXYvd2N0YWJsZXQuYwo+ICsrKyBiL2NoYXJk
ZXYvd2N0YWJsZXQuYwo+IEBAIC0yMDcsNyArMjA3LDggQEAgc3RhdGljIGludCB3Y3RhYmxldF9j
aHJfd3JpdGUoc3RydWN0IENoYXJkZXYgKmNociwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3QgdWludDhfdCAqYnVmLCBpbnQgbGVuKQo+ICB7Cj4gICAgICBUYWJsZXRDaGFy
ZGV2ICp0YWJsZXQgPSBXQ1RBQkxFVF9DSEFSREVWKGNocik7Cj4gLSAgICB1bnNpZ25lZCBpbnQg
aSwgY2xlbjsKPiArICAgIHNpemVfdCBpOwo+ICsgICAgdW5zaWduZWQgaW50IGNsZW47Cj4gICAg
ICBjaGFyICpwb3M7Cj4KPiAgICAgIGlmICh0YWJsZXQtPmxpbmVfc3BlZWQgIT0gOTYwMCkgewo+
IEBAIC0yNjksNyArMjcwLDcgQEAgc3RhdGljIGludCB3Y3RhYmxldF9jaHJfd3JpdGUoc3RydWN0
IENoYXJkZXYgKmNociwKPgo+ICAgICAgfSBlbHNlIGlmIChzdHJuY21wKChjaGFyICopdGFibGV0
LT5xdWVyeSwgIlRTIiwgMikgPT0gMCAmJgo+ICAgICAgICAgICAgICAgICBjbGVuID09IDMpIHsK
PiAtICAgICAgICB1bnNpZ25lZCBpbnQgaW5wdXQgPSB0YWJsZXQtPnF1ZXJ5WzJdOwo+ICsgICAg
ICAgIHVpbnQ4X3QgaW5wdXQgPSB0YWJsZXQtPnF1ZXJ5WzJdOwo+ICAgICAgICAgIHVpbnQ4X3Qg
Y29kZXNbN10gPSB7Cj4gICAgICAgICAgICAgIDB4YTMsCj4gICAgICAgICAgICAgICgoaW5wdXQg
JiAweDgwKSA9PSAwKSA/IDB4N2UgOiAweDdmLAo+IC0tCj4gMi4yMC4xCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
