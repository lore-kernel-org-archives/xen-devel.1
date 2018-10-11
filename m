From: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH] chardev: Convert IOReadHandler to read an
 unsigned number of bytes
Date: Thu, 11 Oct 2018 16:08:48 +0200
Message-ID: <w514ldsmv7z.fsf@maestria.local.igalia.com>
References: <20181011131413.22208-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=drwx=mx=igalia.com=berto@srs-us1.protection.inumbo.net>)
 id 1gAbe2-0006jx-Vs
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 14:08:57 +0000
In-Reply-To: <20181011131413.22208-1-philmd@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Prasad J Pandit <ppandit@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>, "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>, "open list:PXA2XX" <qemu-arm@nongnu.org>, "open list:sPAPR" <qemu-ppc@nongnu.org>, qemu-devel@nongnu.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1IDExIE9jdCAyMDE4IDAzOjE0OjEzIFBNIENFU1QsIFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIHdyb3RlOgo+IGRpZmYgLS1naXQgYS9ody9jaGFyL2lwb2N0YWwyMzIuYyBiL2h3L2NoYXIv
aXBvY3RhbDIzMi5jCj4gaW5kZXggNWUwOWNhZjg1MS4uYmEzZjM0MDhhMiAxMDA2NDQKPiAtLS0g
YS9ody9jaGFyL2lwb2N0YWwyMzIuYwo+ICsrKyBiL2h3L2NoYXIvaXBvY3RhbDIzMi5jCj4gQEAg
LTQ2MSwxNCArNDYxLDE0IEBAIHN0YXRpYyB2b2lkIG1lbV93cml0ZTgoSVBhY2tEZXZpY2UgKmlw
LCB1aW50MzJfdCBhZGRyLCB1aW50OF90IHZhbCkKPiAgICAgIH0KPiAgfQo+ICAKPiAtc3RhdGlj
IGludCBob3N0ZGV2X2Nhbl9yZWNlaXZlKHZvaWQgKm9wYXF1ZSkKPiArc3RhdGljIHNpemVfdCBo
b3N0ZGV2X2Nhbl9yZWNlaXZlKHZvaWQgKm9wYXF1ZSkKPiAgewo+ICAgICAgU0NDMjY5OENoYW5u
ZWwgKmNoID0gb3BhcXVlOwo+ICAgICAgaW50IGF2YWlsYWJsZV9ieXRlcyA9IFJYX0ZJRk9fU0la
RSAtIGNoLT5yeF9wZW5kaW5nOwo+ICAgICAgcmV0dXJuIGNoLT5yeF9lbmFibGVkID8gYXZhaWxh
YmxlX2J5dGVzIDogMDsKPiAgfQo+ICAKPiAtc3RhdGljIHZvaWQgaG9zdGRldl9yZWNlaXZlKHZv
aWQgKm9wYXF1ZSwgY29uc3QgdWludDhfdCAqYnVmLCBpbnQgc2l6ZSkKPiArc3RhdGljIHZvaWQg
aG9zdGRldl9yZWNlaXZlKHZvaWQgKm9wYXF1ZSwgY29uc3QgdWludDhfdCAqYnVmLCBzaXplX3Qg
c2l6ZSkKPiAgewo+ICAgICAgU0NDMjY5OENoYW5uZWwgKmNoID0gb3BhcXVlOwo+ICAgICAgSVBP
Y3RhbFN0YXRlICpkZXYgPSBjaC0+aXBvY3RhbDsKCkFja2VkLWJ5OiBBbGJlcnRvIEdhcmNpYSA8
YmVydG9AaWdhbGlhLmNvbT4KCkJlcnRvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
