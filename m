From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v3 02/25] chardev: Assert IOCanReadHandler
 can not be negative
Date: Wed, 20 Feb 2019 11:03:22 +0100
Message-ID: <CAMxuvaw_Hgbtxu79NEUAoaKaEnmKRCgorJ_r5mXQQTbrHEMtbQ__9470.50559786788$1550657142$gmane$org@mail.gmail.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-3-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wVrY=Q3=redhat.com=mlureau@srs-us1.protection.inumbo.net>)
 id 1gwOjz-0006yt-52
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 10:04:35 +0000
Received: by mail-qt1-f194.google.com with SMTP id p48so26518976qtk.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 02:04:33 -0800 (PST)
In-Reply-To: <20190220010232.18731-3-philmd@redhat.com>
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
w6kKPHBoaWxtZEByZWRoYXQuY29tPiB3cm90ZToKPgo+IFRoZSBiYWNrZW5kIHNob3VsZCBub3Qg
cmV0dXJuIGEgbmVnYXRpdmUgbGVuZ3RoIHRvIHJlYWQuCj4gV2Ugd2lsbCBsYXRlciBjaGFuZ2Ug
dGhlIHByb3RvdHlwZSBvZiBJT0NhblJlYWRIYW5kbGVyIHRvIHJldHVybiBhbgo+IHVuc2lnbmVk
IGxlbmd0aC4gTWVhbndoaWxlIG1ha2Ugc3VyZSB0aGUgcmV0dXJuIGxlbmd0aCBpcyBwb3NpdGl2
ZS4KPgo+IFN1Z2dlc3RlZC1ieTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5j
b20+CgpJbiBzdWNoIHBhdGNoLCB5b3Ugc2hvdWxkIGRvIGV4dGVuc2l2ZSByZXZpZXcgb2YgZXhp
c3RpbmcgY2FsbGJhY2tzLApvciBmaW5kIGEgY29udmluY2luZyBhcmd1bWVudCB0aGF0IHRoaXMg
Y2FuJ3QgYnJlYWsuCgpUaGUgcHJvYmxlbSBpcyB0aGVyZSBhcmUgYSBsb3Qgb2YgY2FuX3JlYWQg
Y2FsbGJhY2tzLCBhbmQgaXQncyBub3QKdHJpdmlhbC4gVGhlICpmaXJzdCogb2YgZ2l0LWdyZXAg
aXMgcm5nX2VnZF9jaHJfY2FuX3JlYWQoKQoKIDU3ICAgICBRU0lNUExFUV9GT1JFQUNIKHJlcSwg
JnMtPnBhcmVudC5yZXF1ZXN0cywgbmV4dCkgewogNTggICAgICAgICBzaXplICs9IHJlcS0+c2l6
ZSAtIHJlcS0+b2Zmc2V0OwogNTkgICAgIH0KIDYwCiA2MSAgICAgcmV0dXJuIHNpemU7CgpDbGVh
cmx5IG5vdCBvYnZpb3VzIGlmIGl0IHJldHVybnMgPj0gMC4KCkFub3RoZXIgYXBwcm9hY2ggaXMg
dG8gbG9vayBhdCB0aGUgY2FsbGVyIGFuZCB0aGUgcmV0dXJuIHZhbHVlCmhhbmRsaW5nLiBJZiBu
b25lIGhhbmRsZSBuZWdhdGl2ZSB2YWx1ZXMgKG9yIHdvdWxkIGhhdmUgd3JvbmcKYmVoYXZpb3Vy
IHdpdGggbmVnYXRpdmUgdmFsdWVzKSwgdGhlIGFzc2VydCgpIGlzIHBlcmhhcHMganVzdGlmaWVk
LCBhcwppdCBjb3VsZCBwcmV2ZW50IGZyb20gZG9pbmcgbW9yZSBoYXJtLgoKPiAtLS0KPiAgY2hh
cmRldi9jaGFyLmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9jaGFyZGV2L2NoYXIuYyBiL2NoYXJkZXYv
Y2hhci5jCj4gaW5kZXggZjZkNjFmYTVmOC4uNzFlY2QzMmIyNSAxMDA2NDQKPiAtLS0gYS9jaGFy
ZGV2L2NoYXIuYwo+ICsrKyBiL2NoYXJkZXYvY2hhci5jCj4gQEAgLTE1OSwxMiArMTU5LDE1IEBA
IGludCBxZW11X2Nocl93cml0ZShDaGFyZGV2ICpzLCBjb25zdCB1aW50OF90ICpidWYsIGludCBs
ZW4sIGJvb2wgd3JpdGVfYWxsKQo+ICBpbnQgcWVtdV9jaHJfYmVfY2FuX3dyaXRlKENoYXJkZXYg
KnMpCj4gIHsKPiAgICAgIENoYXJCYWNrZW5kICpiZSA9IHMtPmJlOwo+ICsgICAgaW50IHJlY2Vp
dmFibGVfYnl0ZXM7Cj4KPiAgICAgIGlmICghYmUgfHwgIWJlLT5jaHJfY2FuX3JlYWQpIHsKPiAg
ICAgICAgICByZXR1cm4gMDsKPiAgICAgIH0KPgo+IC0gICAgcmV0dXJuIGJlLT5jaHJfY2FuX3Jl
YWQoYmUtPm9wYXF1ZSk7Cj4gKyAgICByZWNlaXZhYmxlX2J5dGVzID0gYmUtPmNocl9jYW5fcmVh
ZChiZS0+b3BhcXVlKTsKPiArICAgIGFzc2VydChyZWNlaXZhYmxlX2J5dGVzID49IDApOwo+ICsg
ICAgcmV0dXJuIHJlY2VpdmFibGVfYnl0ZXM7Cj4gIH0KPgo+ICB2b2lkIHFlbXVfY2hyX2JlX3dy
aXRlX2ltcGwoQ2hhcmRldiAqcywgdWludDhfdCAqYnVmLCBpbnQgbGVuKQo+IC0tCj4gMi4yMC4x
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
