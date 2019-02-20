From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v3 23/25] hw/ipmi: Assert outlen > outpos
Date: Wed, 20 Feb 2019 14:36:05 +0100
Message-ID: <CAMxuvazeeB6oWe61kLOH_0o3DO7sJ8EDhBYMggMNexwVnsW-AA@mail.gmail.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-24-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wVrY=Q3=redhat.com=mlureau@srs-us1.protection.inumbo.net>)
 id 1gwS2s-00024H-FI
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 13:36:18 +0000
Received: by mail-qt1-f194.google.com with SMTP id o6so27120220qtk.6
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 05:36:17 -0800 (PST)
In-Reply-To: <20190220010232.18731-24-philmd@redhat.com>
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

SGkKCk9uIFdlZCwgRmViIDIwLCAyMDE5IGF0IDI6MDggQU0gUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kKPHBoaWxtZEByZWRoYXQuY29tPiB3cm90ZToKPgo+IEEgdGhyb3VnZnVsbCBhdWRpdCBzaG93
IHRoYXQgYWxsIHRpbWUgZGF0YSBpcyBhZGRlZCB0byBvdXRidWZbXSwKCnRocm91Z2Z1bGw/IDop
IHRob3JvdWdoPwoKPiAnb3V0bGVuJyBpcyBpbmNyZW1lbnRlZC4gVGhlbiBhdCBjcmVhdGlvbiBh
bmQgZWFjaCB0aW1lCj4gY29udGludWVfc2VuZCgpIHJldHVybnMgaXQgcGFzcyB0aHJ1IGNoZWNr
X3Jlc2V0IHdoaWNoIHJlc2V0cwo+ICdvdXRwb3MnLCB0aHVzIHdlIGFsd2F5cyBoYXZlICdvdXRs
ZW4gPj0gb3V0cG9zJy4KPiBBbHNvIGR1ZSB0byB0aGUgY2hlY2sgb24gZW50cnksIHdlIGtub3cg
b3V0bGVuICE9IDAuCj4gV2UgY2FuIHRoZW4gYWRkIGFuIGFzc2VydGlvbiBvbiAnb3V0bGVuID4g
b3V0cG9zJywgd2hpY2ggd2lsbAoKaG1tLCBJIHRoaW5rIHlvdSBjb3VsZCBhc3NlcnQgJ291dGxl
biA+PSBvdXRwb3MnIG9ubHkuIEkgZG9uJ3QgYnV5CnlvdXIgYXJndW1lbnQgYWJvdXQgJ291dGxl
biA+IG91dHBvcycgKGJlY2F1c2Ugb3V0bGVuICE9IDA/KQoKPiBoZWxwcyB0aGUgbmV4dCBwYXRj
aCB0byBzYWZlbHkgY29udmVydCAnb3V0bGVuIC0gb3V0cG9zJyBhcyBhbgo+IHVuc2lnbmVkIHR5
cGUgKHNpemVfdCkuCj4KPiBNYWtlIHRoaXMgYXNzZXJ0aW9uIGV4cGxpY2l0IGJ5IGNhc3Rpbmcg
J291dGxlbiAtIG91dHBvcycgc2l6ZV90Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0
aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgo+IC0tLQo+ICBody9pcG1pL2lwbWlfYm1j
X2V4dGVybi5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2h3L2lwbWkvaXBtaV9ibWNfZXh0ZXJuLmMgYi9o
dy9pcG1pL2lwbWlfYm1jX2V4dGVybi5jCj4gaW5kZXggYmYwYjdlZTBmNS4uY2E2MWIwNDk0MiAx
MDA2NDQKPiAtLS0gYS9ody9pcG1pL2lwbWlfYm1jX2V4dGVybi5jCj4gKysrIGIvaHcvaXBtaS9p
cG1pX2JtY19leHRlcm4uYwo+IEBAIC0xMDcsOCArMTA3LDkgQEAgc3RhdGljIHZvaWQgY29udGlu
dWVfc2VuZChJUE1JQm1jRXh0ZXJuICppYmUpCj4gICAgICAgICAgZ290byBjaGVja19yZXNldDsK
PiAgICAgIH0KPiAgIHNlbmQ6Cj4gKyAgICBhc3NlcnQoaWJlLT5vdXRsZW4gPiBpYmUtPm91dHBv
cyk7Cj4gICAgICByZXQgPSBxZW11X2Nocl9mZV93cml0ZSgmaWJlLT5jaHIsIGliZS0+b3V0YnVm
ICsgaWJlLT5vdXRwb3MsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBpYmUtPm91dGxl
biAtIGliZS0+b3V0cG9zKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIChzaXplX3Qp
KGliZS0+b3V0bGVuIC0gaWJlLT5vdXRwb3MpKTsKPiAgICAgIGlmIChyZXQgPiAwKSB7Cj4gICAg
ICAgICAgaWJlLT5vdXRwb3MgKz0gcmV0Owo+ICAgICAgfQo+IC0tCj4gMi4yMC4xCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
