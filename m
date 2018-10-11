From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] chardev: Convert IOReadHandler
 to read an unsigned number of bytes
Date: Thu, 11 Oct 2018 17:14:11 +0200
Message-ID: <7762db82-6044-df69-a1b7-c05100a0e938@redhat.com>
References: <20181011131413.22208-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zwzl=mx=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gAcfL-00059g-3h
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 15:14:19 +0000
Received: by mail-wm1-f65.google.com with SMTP id y11-v6so9367820wma.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Oct 2018 08:14:16 -0700 (PDT)
In-Reply-To: <20181011131413.22208-1-philmd@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Prasad J Pandit <ppandit@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>, Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, Markus Armbruster <armbru@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Antony Pavlov <antonynpavlov@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Laurent Vivier <lvivier@redhat.com>C
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTAvMjAxOCAxNToxNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4gVGhl
IG51bWJlciBvZiBieXRlcyBjYW4gbm90IGJlIG5lZ2F0aXZlIG5vciB6ZXJvLgo+IAo+IEZpeGVk
IDIgZm9ybWF0IHN0cmluZzoKPiAtIGh3L2NoYXIvc3BhcHJfdnR5LmMKPiAtIGh3L3VzYi9jY2lk
LWNhcmQtcGFzc3RocnUuYwo+IAo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPiAtLS0KPiBTZWU6IGh0dHBzOi8vbGlzdHMuZ251Lm9y
Zy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDE4LTEwL21zZzAyMjEyLmh0bWwKCk5vdCB0aGF0
IGVhc3k7IHlvdSBuZWVkIHRvIGFkanVzdCBxZW11X2Nocl9iZV9jYW5fd3JpdGUsCnFlbXVfY2hy
X2JlX3dyaXRlX2ltcGwsIHFlbXVfY2hyX2JlX3dyaXRlICh3aGljaCBpcyB3aGVyZSB0aGUgY2Fs
bGJhY2tzCmFyZSBpbnZva2VkKS4KCk9uIHRoZSBvdGhlciBoYW5kLCBmZF9jaHJfcmVhZF9wb2xs
IGlzIG5vdCBhbiBJT0NhblJlYWRIYW5kbGVyLCBhbmQgdGhpcwpwYXRjaCB0aGVyZWZvcmUgcHJv
YmFibHkgZG9lc24ndCBjb21waWxlPwoKUGFvbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
