From: Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 00/25] chardev: Convert
 qemu_chr_write() to take a size_t argument
Date: Wed, 20 Feb 2019 08:20:04 -0600
Message-ID: <2917cc10-3382-b4ce-061f-5ab8e45ea3f7@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <CAMxuvazRLabuNiGdKb9HSxyqJ+9NhxJkqkv824BTFj95j5u9rA@mail.gmail.com>
 <20190220113016.GD21870@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aOoo=Q3=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1gwSk8-0006iJ-3G
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 14:21:00 +0000
In-Reply-To: <20190220113016.GD21870@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>Stef
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMC8xOSA1OjMwIEFNLCBEYW5pZWwgUC4gQmVycmFuZ8OpIHdyb3RlOgoKPj4gU2luY2Ug
UGFvbG8geW91IHN1Z2dlc3RlZCB0aGUgY2hhbmdlLCBjb3VsZCB5b3UgZ2l2ZSBzb21lIGNvbnZp
bmNpbmcKPj4gYXJndW1lbnRzIHRoYXQgaXQncyB3b3J0aCB0YWtpbmcgdGhlIHBsdW5nZT8KPiAK
PiBUaGUgY2hhcmRldiB3cml0ZS9yZWFkIG1ldGhvZHMgd2lsbCBlbmQgdXAgY2FsbGluZyBsaWJj
IHJlYWQvd3JpdGUKPiBtZXRob2RzLCB3aG9zZSBwYXJhbWV0ZXJzIGFyZSAic2l6ZV90IGNvdW50
Ii4KCkluIG15IG1pbmQsIHRoYXQncyB0aGUgY29udmluY2luZyByZWFzb24uIFdlIHNob3VsZCBt
b2RlbCBvdXIgcmVhZC93cml0ZQphZnRlciB0aGUgbGliYyByZWFkL3dyaXRlLCB3aGljaCBtZWFu
cyBzaXplX3QgaW5wdXQgYW5kIHNzaXplX3QgcmV0dXJucy4KCj4gCj4gVGh1cyBpZiB0aGVyZSBp
cyBRRU1VIGNvZGUgdGhhdCBjb3VsZCBjdXJyZW50bHkgKG1pc3Rha2VubHkpIHBhc3MgYQo+IG5l
Z2F0aXZlIHZhbHVlIGZvciBsZW5ndGggdG8gcWVtdV9jaHJfd3JpdGUsIHVubGVzcyBzb21ldGhp
bmcgc3RvcHMKPiBpdCwgdGhpcyBpcyBnb2luZyB0byBiZSBjYXN0IHRvIGEgc2l6ZV90IHdoZW4g
d2UgZmluYWxseSBjYWxsIHJlYWQvCj4gd3JpdGUgb24gdGhlIEZELCBsZWFkaW5nIHRvIGEgbGFy
Z2UgcG9zaXRpdmUgdmFsdWUgJiBhcnJheSBvdXQgb2YKPiBib3VuZHMgcmVhZC93cml0ZS4gCj4g
Cj4gSU9XIHdlIGFscmVhZHkgaGF2ZSBpbmNvbnNpc3RlbnQgdXNlIG9mIHNpZ25lZCB2cyB1bnNp
Z25lZCBpbiBvdXIgY29kZQo+IHdoaWNoIGhhcyBwb3RlbnRpYWwgdG8gY2F1c2UgYnVncy4gQ29u
dmVydGluZyBjaGFyZGV2IHRvIHVzZSBzaXplX3QKPiB3ZSBnZXQgcmlkIGZvIHRoZSBtaXNtYXRj
aCB3aXRoIHRoZSB1bmRlcmx5aW5nIGxpYmMgQVBJcyB3ZSBjYWxsLAo+IHdoaWNoIHVsdGltYXRl
bHkgZWxpbWluYXRlcyBhbiBhcmVhIG9mIHJpc2sgbG9uZ2VyIHRlcm0uIFRoZXJlIGlzIGEKPiBj
aGFuY2UgaXQgY291bGQgdW5jb3ZlciBzb21lIHByZS1leGlzdGluZyBkb3JtYW50IGJ1Z3MsIGJ1
dCBwcm92aWRlZAo+IHdlIGRvIGR1ZSBkaWxpZ2VuY2UgdG8gY2hlY2sgY2FsbGVycyBJIHRoaW5r
IGl0cyBhIHdpbiB0byBiZSBjb25zaXN0ZW50Cj4gd2l0aCBsaWJjIEFQSXMgaW4gc2l6ZV90IHVz
YWdlIGZvciByZWFkL3dyaXRlLgoKQW5kIGhvcGVmdWxseSB0aGlzIGV4ZXJjaXNlIG9mIG1ha2lu
ZyB0aGUgY29udmVyc2lvbiBzZXJ2ZXMgYXMgYSBnb29kCmF1ZGl0IHRvIGhlbHAgdXMgZ2FpbiBj
b25maWRlbmNlIGluIG91ciBjb2RlIGFuZC9vciBmaXggYnVncyBpdCB1bmNvdmVycy4KCi0tIApF
cmljIEJsYWtlLCBQcmluY2lwYWwgU29mdHdhcmUgRW5naW5lZXIKUmVkIEhhdCwgSW5jLiAgICAg
ICAgICAgKzEtOTE5LTMwMS0zMjI2ClZpcnR1YWxpemF0aW9uOiAgcWVtdS5vcmcgfCBsaWJ2aXJ0
Lm9yZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
