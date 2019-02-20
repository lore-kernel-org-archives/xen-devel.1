From: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 00/25] chardev: Convert qemu_chr_write()
 to take a size_t argument
Date: Wed, 20 Feb 2019 11:57:49 +0100
Message-ID: <20190220115749.7589f868.cohuck@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <CAMxuvazRLabuNiGdKb9HSxyqJ+9NhxJkqkv824BTFj95j5u9rA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=80LJ=Q3=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1gwPZq-0003Za-0y
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 10:58:10 +0000
In-Reply-To: <CAMxuvazRLabuNiGdKb9HSxyqJ+9NhxJkqkv824BTFj95j5u9rA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMCBGZWIgMjAxOSAxMTo1Mzo0MiArMDEwMApNYXJjLUFuZHLDqSBMdXJlYXUgPG1h
cmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbT4gd3JvdGU6Cgo+IEhpCj4gCj4gT24gV2VkLCBGZWIg
MjAsIDIwMTkgYXQgMjowMiBBTSBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqQo+IDxwaGlsbWRAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGksCj4gPgo+ID4gVGhpcyBzZXJpZXMgY29udmVydCB0
aGUgY2hhcmRldjo6cWVtdV9jaHJfd3JpdGUoKSB0byB0YWtlIHVuc2lnbmVkCj4gPiBsZW5ndGgg
YXJndW1lbnQuIFRvIGRvIHNvIEkgd2VudCB0aHJvdWdoIGFsbCBjYWxsZXIgYW5kIGNoZWNrZWQg
aWYKPiA+IHRoZXJlIGFyZSBubyBuZWdhdGl2ZSB2YWx1ZSBwb3NzaWJsZS4gIAo+IAo+IAo+IENo
YW5naW5nIHNpZ25lZG5lc3MgaXMgcHJvYmxlbWF0aWMgYW5kIGNhbiBlYXNpbHkgaW50cm9kdWNl
IGJ1Z3MgdGhhdAo+IGFyZSBlYXN5IHRvIG1pc3MgZHVyaW5nIHJldmlldy4KPiAKPiBJIGFncmVl
IHdpdGggQ29ybmVsaWEgYWJvdXQgaWRpb21hdGljIHVzZSBvZiBpbnQuIENoYW5naW5nICJpbnQi
IGZvcgo+ICJzaXplX3QiIGlzbid0IHN5c3RlbWF0aWNhbGx5IGEgY2xlYXIgd2luLgo+IAo+IEV2
ZW4gR29vZ2xlIEMrKyBzdHlsZSByZWNvbW1lbmRzIHRvIGF2b2lkIHVuc2lnbmVkIHR5cGVzICIo
ZXhjZXB0IGZvcgo+IHJlcHJlc2VudGluZyBiaXRmaWVsZHMgb3IgbW9kdWxhciBhcml0aG1ldGlj
KS4gRG8gbm90IHVzZSBhbiB1bnNpZ25lZAo+IHR5cGUgbWVyZWx5IHRvIGFzc2VydCB0aGF0IGEg
dmFyaWFibGUgaXMgbm9uLW5lZ2F0aXZlLiIKPiBodHRwczovL2dvb2dsZS5naXRodWIuaW8vc3R5
bGVndWlkZS9jcHBndWlkZS5odG1sI0ludGVnZXJfVHlwZXMgLSBzZWUgcmF0aW9uYWxlCj4gCj4g
U2luY2UgUGFvbG8geW91IHN1Z2dlc3RlZCB0aGUgY2hhbmdlLCBjb3VsZCB5b3UgZ2l2ZSBzb21l
IGNvbnZpbmNpbmcKPiBhcmd1bWVudHMgdGhhdCBpdCdzIHdvcnRoIHRha2luZyB0aGUgcGx1bmdl
PwoKRldJVywgdXNpbmcgYW4gZXhwbGljaXRseSB1bnNpZ25lZCB0eXBlIGZvciBhIGxlbmd0aCBz
b3VuZHMgZmluZTsgYnV0Cm5vdCBhbGwgY29udmVyc2lvbnMgYXJlIHJlYWxseSBjb252aW5jaW5n
IChhbGJlaXQgbm90IHdyb25nKS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
