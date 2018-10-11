From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] chardev: Convert IOReadHandler
 to read an unsigned number of bytes
Date: Thu, 11 Oct 2018 17:24:01 +0200
Message-ID: <4b664769-9830-e186-05c4-132a8cfc423b@redhat.com>
References: <20181011131413.22208-1-philmd@redhat.com>
 <7762db82-6044-df69-a1b7-c05100a0e938@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uyyi=mx=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gAcos-0006Jk-EJ
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 15:24:10 +0000
Received: by mail-wr1-f65.google.com with SMTP id a13-v6so10170960wrt.5
 for <xen-devel@lists.xenproject.org>; Thu, 11 Oct 2018 08:24:08 -0700 (PDT)
In-Reply-To: <7762db82-6044-df69-a1b7-c05100a0e938@redhat.com>
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

T24gMTEvMTAvMjAxOCAxNzoxNCwgUGFvbG8gQm9uemluaSB3cm90ZToKPiBPbiAxMS8xMC8yMDE4
IDE1OjE0LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToKPj4gVGhlIG51bWJlciBvZiBi
eXRlcyBjYW4gbm90IGJlIG5lZ2F0aXZlIG5vciB6ZXJvLgo+Pgo+PiBGaXhlZCAyIGZvcm1hdCBz
dHJpbmc6Cj4+IC0gaHcvY2hhci9zcGFwcl92dHkuYwo+PiAtIGh3L3VzYi9jY2lkLWNhcmQtcGFz
c3RocnUuYwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhp
bG1kQHJlZGhhdC5jb20+Cj4+IC0tLQo+PiBTZWU6IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNo
aXZlL2h0bWwvcWVtdS1kZXZlbC8yMDE4LTEwL21zZzAyMjEyLmh0bWwKPiAKPiBOb3QgdGhhdCBl
YXN5OyB5b3UgbmVlZCB0byBhZGp1c3QgcWVtdV9jaHJfYmVfY2FuX3dyaXRlLAo+IHFlbXVfY2hy
X2JlX3dyaXRlX2ltcGwsIHFlbXVfY2hyX2JlX3dyaXRlICh3aGljaCBpcyB3aGVyZSB0aGUgY2Fs
bGJhY2tzCj4gYXJlIGludm9rZWQpLgoKT0suCgo+IE9uIHRoZSBvdGhlciBoYW5kLCBmZF9jaHJf
cmVhZF9wb2xsIGlzIG5vdCBhbiBJT0NhblJlYWRIYW5kbGVyLCBhbmQgdGhpcwo+IHBhdGNoIHRo
ZXJlZm9yZSBwcm9iYWJseSBkb2Vzbid0IGNvbXBpbGU/CgpJdCBkb2VzIGNvbXBpbGUuCgpmZF9j
aHJfdXBkYXRlX3JlYWRfaGFuZGxlcigpIHVzZXMgZmRfY2hyX3JlYWRfcG9sbCB3aXRoIGlvX2Fk
ZF93YXRjaF9wb2xsKCk6CgpHU291cmNlICppb19hZGRfd2F0Y2hfcG9sbChDaGFyZGV2ICpjaHIs
CiAgICAgICAgICAgICAgICAgICAgICAgIFFJT0NoYW5uZWwgKmlvYywKICAgICAgICAgICAgICAg
ICAgICAgICAgSU9DYW5SZWFkSGFuZGxlciAqZmRfY2FuX3JlYWQsCiAgICAgICAgICAgICAgICAg
ICAgICAgIFFJT0NoYW5uZWxGdW5jIGZkX3JlYWQsCiAgICAgICAgICAgICAgICAgICAgICAgIGdw
b2ludGVyIHVzZXJfZGF0YSwKICAgICAgICAgICAgICAgICAgICAgICAgR01haW5Db250ZXh0ICpj
b250ZXh0KTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
