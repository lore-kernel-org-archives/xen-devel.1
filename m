From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 25/25] chardev: Let
 qemu_chr_write[_all] use size_t
Date: Wed, 20 Feb 2019 11:42:02 +0100
Message-ID: <CAMxuvayMF+3Y-cMkvBW8KqfuBy_AQCg771wyV660nnsmeG-q2g@mail.gmail.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-26-philmd@redhat.com>
 <20190220103836.GC21870@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wVrY=Q3=redhat.com=mlureau@srs-us1.protection.inumbo.net>)
 id 1gwPKR-00025G-0P
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 10:42:15 +0000
Received: by mail-qt1-f193.google.com with SMTP id z25so4838389qti.13
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 02:42:13 -0800 (PST)
In-Reply-To: <20190220103836.GC21870@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>St
List-Id: xen-devel@lists.xenproject.org

SGkKCk9uIFdlZCwgRmViIDIwLCAyMDE5IGF0IDExOjM5IEFNIERhbmllbCBQLiBCZXJyYW5nw6kg
PGJlcnJhbmdlQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBGZWIgMjAsIDIwMTkgYXQg
MDI6MDI6MzJBTSArMDEwMCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4KPiA+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2NoYXJkZXYvY2hhci5oIGIvaW5jbHVkZS9jaGFyZGV2L2NoYXIu
aAo+ID4gaW5kZXggMDM0MWRkMWJhMi4uMmUzYjVhMTVjYSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1
ZGUvY2hhcmRldi9jaGFyLmgKPiA+ICsrKyBiL2luY2x1ZGUvY2hhcmRldi9jaGFyLmgKPiA+IEBA
IC0yMjEsNyArMjIxLDcgQEAgdm9pZCBxZW11X2Nocl9zZXRfZmVhdHVyZShDaGFyZGV2ICpjaHIs
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBDaGFyZGV2RmVhdHVyZSBmZWF0dXJlKTsK
PiA+ICBRZW11T3B0cyAqcWVtdV9jaHJfcGFyc2VfY29tcGF0KGNvbnN0IGNoYXIgKmxhYmVsLCBj
b25zdCBjaGFyICpmaWxlbmFtZSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGJvb2wgcGVybWl0X211eF9tb24pOwo+ID4gLWludCBxZW11X2Nocl93cml0ZShDaGFyZGV2ICpz
LCBjb25zdCB1aW50OF90ICpidWYsIGludCBsZW4sIGJvb2wgd3JpdGVfYWxsKTsKPiA+ICtpbnQg
cWVtdV9jaHJfd3JpdGUoQ2hhcmRldiAqcywgY29uc3QgdWludDhfdCAqYnVmLCBzaXplX3QgbGVu
LCBib29sIHdyaXRlX2FsbCk7Cj4KPiBTZWVpbmcgdGhpcyBjbGVhbnVwIHJlbWluZHMgbWUgdGhh
dCBJIHRoaW5rIHdlIG91Z2h0IHRvIGNoYW5nZQo+IHRoZSBjaGFyZGV2IHJlYWQgJiB3cml0ZSBm
dW5jdGlvbnMgdG8gdGFrZSAidm9pZCAqYnVmIiBpbnN0ZWFkLgo+IGFzIGlzIGRvbmUgZm9yIHJl
Z3VsYXIgbGliYyAgcmVhZC93cml0ZSBmdW5jdGlvbnMuIFRoaXMgd291bGQKPiBhdm9pZCBjYXN0
cyBpbiB0aGUgY2FsbGVycyBiZXR3ZWVuIGNoYXIgKi91aW50OF90ICoKPgo+IFNvbWV0aGluZyB0
byB0aGluayBhYm91dCBmb3IgYSBmdXR1cmUgY2xlYW51cCBqb2IuLi4uc2FtZSBhcHBsaWVzCj4g
Zm9yIHRoZSBRSU9DaGFubmVsIEFQSXMgd2hpY2ggdGFrZSBhICdjaGFyICpidWYnLCBhbm5veWlu
Z2x5Cj4gZGlmZmVyZW50IGZyb20gdGhlIGNoYXJkZXYgQVBJcyA6LSggQm90aCBvdWdodCB0byBo
YXZlIHZvaWQgKmJ1ZgoKSSBmdWxseSBhZ3JlZSwgYW5kIEkgc3RhcnRlZCB0aGF0IGNvbnZlcnNp
b24gc29tZSB0aW1lIGFnbywgYW5kIGxvc3QKaXQgc29tZXdoZXJlLiBUaGF0IHNob3VsZCBiZSBl
YXNpZXIgdGhhbiBjaGFuZ2luZyB0aGUgc2lnbiBvZiByZXR1cm4KdmFsdWVzIHRob3VnaCEKCj4K
Pgo+IFJlZ2FyZHMsCj4gRGFuaWVsCj4gLS0KPiB8OiBodHRwczovL2JlcnJhbmdlLmNvbSAgICAg
IC1vLSAgICBodHRwczovL3d3dy5mbGlja3IuY29tL3Bob3Rvcy9kYmVycmFuZ2UgOnwKPiB8OiBo
dHRwczovL2xpYnZpcnQub3JnICAgICAgICAgLW8tICAgICAgICAgICAgaHR0cHM6Ly9mc3RvcDEz
OC5iZXJyYW5nZS5jb20gOnwKPiB8OiBodHRwczovL2VudGFuZ2xlLXBob3RvLm9yZyAgICAtby0g
ICAgaHR0cHM6Ly93d3cuaW5zdGFncmFtLmNvbS9kYmVycmFuZ2UgOnwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
