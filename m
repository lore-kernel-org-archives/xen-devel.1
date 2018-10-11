From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] chardev: Convert IOReadHandler
 to read an unsigned number of bytes
Date: Thu, 11 Oct 2018 17:53:20 +0200
Message-ID: <f670390d-7409-1989-6ed3-7b31d64e583d@redhat.com>
References: <20181011131413.22208-1-philmd@redhat.com>
 <7762db82-6044-df69-a1b7-c05100a0e938@redhat.com>
 <4b664769-9830-e186-05c4-132a8cfc423b@redhat.com>
 <8d285029-2b6f-a841-2489-c6761e62c02c@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uyyi=mx=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gAdHD-00014m-56
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 15:53:27 +0000
Received: by mail-wm1-f67.google.com with SMTP id 193-v6so9962916wme.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Oct 2018 08:53:26 -0700 (PDT)
In-Reply-To: <8d285029-2b6f-a841-2489-c6761e62c02c@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Prasad J Pandit <ppandit@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>, Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, Markus Armbruster <armbru@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Antony Pavlov <antonynpavlov@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Laurent Vivier <lvivier@redhat.com>C
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTAvMjAxOCAxNzozNCwgUGFvbG8gQm9uemluaSB3cm90ZToKPiBPbiAxMS8xMC8yMDE4
IDE3OjI0LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToKPj4+IE9uIHRoZSBvdGhlciBo
YW5kLCBmZF9jaHJfcmVhZF9wb2xsIGlzIG5vdCBhbiBJT0NhblJlYWRIYW5kbGVyLCBhbmQgdGhp
cwo+Pj4gcGF0Y2ggdGhlcmVmb3JlIHByb2JhYmx5IGRvZXNuJ3QgY29tcGlsZT8KPj4gSXQgZG9l
cyBjb21waWxlLgo+Pgo+PiBmZF9jaHJfdXBkYXRlX3JlYWRfaGFuZGxlcigpIHVzZXMgZmRfY2hy
X3JlYWRfcG9sbCB3aXRoIGlvX2FkZF93YXRjaF9wb2xsKCk6Cj4+Cj4+IEdTb3VyY2UgKmlvX2Fk
ZF93YXRjaF9wb2xsKENoYXJkZXYgKmNociwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgUUlP
Q2hhbm5lbCAqaW9jLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICBJT0NhblJlYWRIYW5kbGVy
ICpmZF9jYW5fcmVhZCwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgUUlPQ2hhbm5lbEZ1bmMg
ZmRfcmVhZCwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgZ3BvaW50ZXIgdXNlcl9kYXRhLAo+
PiAgICAgICAgICAgICAgICAgICAgICAgICBHTWFpbkNvbnRleHQgKmNvbnRleHQpOwo+IAo+IE9o
LCB0aGF0J3Mgc29tZXdoYXQgd2VpcmQuICBJdCBjb3VsZCBqdXN0IGFzIHdlbGwgcmV0dXJuIGEg
Ym9vbC4KPiAKPiBIb3dldmVyLCB0aGlzIG1hZGUgbWUgbm90aWNlIHRoYXQgeW91IG5lZWQgdG8g
Y2hhbmdlIGUuZy4gcy0+bWF4X3NpemUncwo+IGRlY2xhcmF0aW9uIChpbiBpbmNsdWRlL2NoYXJk
ZXYvY2hhci1mZC5oKSBmcm9tIGludCB0byBzaXplX3QsIGFuZAo+IGxpa2V3aXNlIGZvcjogMSkg
YWxsIHVzZXJzIG9mIHMtPm1heF9zaXplLCBzdWNoIGFzIGxlbiBpbiBmZF9jaHJfcmVhZDsKPiAy
KSBhbGwgdGhlIHNpbWlsYXIgdmFyaWFibGVzIGluIG90aGVyIGNoYXIgYmFja2VuZHMuCj4gCj4g
U28gaXQncyBwcm9iYWJseSBiZXN0IHRvIHN0cnVjdHVyZSB0aGUgc2VyaWVzIGFzIGZvbGxvd3M6
Cj4gCj4gMSkgY2hhbmdlIGZkX2Nhbl9yZWFkIGZyb20gSU9DYW5SZWFkSGFuZGxlciB0byBhIEdT
b3VyY2VGdW5jICh3aGljaAo+IHJldHVybnMgYSBib29sZWFuIHZhbHVlKSwgY2hhbmdpbmcgYWxs
ICJyZXR1cm4gcy0+Zm9vIiB0byAicmV0dXJuIHMtPmZvbwo+PiAwOyIuICBUaGVuIHlvdSBjYW4g
cmVtb3ZlIHRoZSA+IDAgZnJvbQo+IAo+ICAgICBib29sIG5vd19hY3RpdmUgPSBpd3AtPmZkX2Nh
bl9yZWFkKGl3cC0+b3BhcXVlKSA+IDA7Cj4gCj4gKEhhdmluZyB0aGUgPiAwIHJlcGVhdGVkIGlu
IGFsbCBiYWNrZW5kcyBpcyBub3cgYSBiaXQgdWdseSwgYnV0IHRoZXJlCj4gYXJlIGZ1dHVyZSBj
bGVhbnVwIG9wcG9ydHVuaXRpZXMgaGVyZSB0byBtb3ZlIHRoZSBxZW11X2Nocl9iZV9jYW5fd3Jp
dGUKPiBjYWxsIHRvIHFlbXVfY2hyX2JlX2Nhbl93cml0ZTsgdGhpcyB3YXkgbW9zdCBjaGFyZGV2
IGJhY2tlbmRzIGNhbiBza2lwCj4gZGVmaW5pbmcgYSByZWFkX3BvbGwgZnVuY3Rpb24uICBCdXQg
SSBkaWdyZXNzKS4KPiAKPiAyKSBhc3NlcnQgaW4gcWVtdV9jaHJfYmVfY2FuX3dyaXRlIHRoYXQg
dGhlIHJldHVybmVkIHZhbHVlIGlzID49IDAKPiAKPiAzKSBmb3IgZWFjaCBiYWNrZW5kLCBjaGFu
Z2UgdGhlIGFzc2lnbmVkIHZhcmlhYmxlIGZyb20gaW50IHRvIHNpemVfdAo+IAo+IDQpIG5vdyB0
aGUgcmVzdCBvZiB5b3VyIHBhdGNoLCB0b3VjaGluZyBhbGwgZnJvbnQtZW5kcy4gIFRoZSBhc3Nl
cnRpb24KPiBmcm9tICgyKSBub3cgZG9lcyBub3QgbWFrZSBzZW5zZSBhbnltb3JlLCBzaW5jZSAt
PmNhbl9yZWFkIHJldHVybnMgYW4KPiB1bnNpZ25lZCB2YWx1ZSwgYnV0IHBlcmhhcHMgeW91IGNh
biBrZWVwIGEgImZhaWwtc2FmZSIgYXNzZXJ0aW9uIHRoYXQKPiAoc3NpemVfdClyZXR1cm5lZF92
YWx1ZSA+PSAwIHRvIGNhdGNoIHVuZGVzaXJlZCBvdmVyZmxvd3MuCgpPSyEgdGhhbmtzIGZvciBz
b3J0aW5nIHRoaXMgOikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
