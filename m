From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 20/25] s390x/sclp: Use a const variable
 to improve readability
Date: Fri, 8 Mar 2019 20:12:53 +0100
Message-ID: <a1b27f90-5c20-c23a-ce1b-30e06d06fa08@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-21-philmd@redhat.com>
 <20190220115316.3e471bff.cohuck@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=v1h2=RL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1h2KvX-0007JA-KT
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 19:13:03 +0000
Received: by mail-wm1-f67.google.com with SMTP id x7so13533245wmj.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2019 11:12:56 -0800 (PST)
In-Reply-To: <20190220115316.3e471bff.cohuck@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMC8xOSAxMTo1MyBBTSwgQ29ybmVsaWEgSHVjayB3cm90ZToKPiBPbiBXZWQsIDIwIEZl
YiAyMDE5IDAyOjAyOjI3ICswMTAwCj4gUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBy
ZWRoYXQuY29tPiB3cm90ZToKPiAKPj4gV2Ugd2lsbCByZXVzZSB0aGlzIHZhcmlhYmxlIGluIHRo
ZSBuZXh0IHBhdGNoLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQHJlZGhhdC5jb20+Cj4+IC0tLQo+PiAgaHcvY2hhci9zY2xwY29uc29sZS1sbS5j
IHwgNyArKysrLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaHcvY2hhci9zY2xwY29uc29sZS1sbS5jIGIvaHcv
Y2hhci9zY2xwY29uc29sZS1sbS5jCj4+IGluZGV4IGRiYzkxYTFlNWIuLjQ5NTQzZTJjODMgMTAw
NjQ0Cj4+IC0tLSBhL2h3L2NoYXIvc2NscGNvbnNvbGUtbG0uYwo+PiArKysgYi9ody9jaGFyL3Nj
bHBjb25zb2xlLWxtLmMKPj4gQEAgLTIxMCwxMyArMjEwLDE0IEBAIHN0YXRpYyBpbnQgcHJvY2Vz
c19tZGIoU0NMUEV2ZW50ICpldmVudCwgTURCTyAqbWRibykKPj4gICAgICBpbnQgcmM7Cj4+ICAg
ICAgaW50IGxlbjsKPj4gICAgICB1aW50OF90IGJ1ZmZlcltTSVpFX0JVRkZFUl07Cj4+IC0KPj4g
LSAgICBsZW4gPSBiZTE2X3RvX2NwdShtZGJvLT5sZW5ndGgpOwo+PiAtICAgIGxlbiAtPSBzaXpl
b2YobWRiby0+bGVuZ3RoKSArIHNpemVvZihtZGJvLT50eXBlKQo+PiArICAgIGNvbnN0IHNpemVf
dCBobGVuID0gc2l6ZW9mKG1kYm8tPmxlbmd0aCkKPj4gKyAgICAgICAgICAgICsgc2l6ZW9mKG1k
Ym8tPnR5cGUpCj4+ICAgICAgICAgICAgICArIHNpemVvZihtZGJvLT5tdG8ubGluZV90eXBlX2Zs
YWdzKQo+PiAgICAgICAgICAgICAgKyBzaXplb2YobWRiby0+bXRvLmFsYXJtX2NvbnRyb2wpCj4+
ICAgICAgICAgICAgICArIHNpemVvZihtZGJvLT5tdG8uX3Jlc2VydmVkKTsKPj4gIAo+PiArICAg
IGxlbiA9IGJlMTZfdG9fY3B1KG1kYm8tPmxlbmd0aCk7Cj4+ICsgICAgbGVuIC09IGhsZW47Cj4+
ICAgICAgYXNzZXJ0KGxlbiA8PSBTSVpFX0JVRkZFUik7Cj4+ICAKPj4gICAgICAvKiBjb252ZXJ0
IEVCQ0RJQyBTQ0xQIGNvbnRlbnRzIHRvIEFTQ0lJIGNvbnNvbGUgbWVzc2FnZSAqLwo+IAo+IEkn
ZCBwcm9iYWJseSBtZXJnZSB0aGlzIHdpdGggdGhlIG5leHQgcGF0Y2gsIHRob3VnaC4KClRoZSBj
b250ZXh0IGlzIGVhc2llciB0byByZXZpZXcgaW4gMiBkaWZmZXJlbnQgcGF0Y2hlcyBJTUhPLgoK
PiBSZXZpZXdlZC1ieTogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+Cj4gCgpUaGFu
a3MhCgpQaGlsLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
