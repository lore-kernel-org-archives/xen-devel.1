From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v4 8/9] xen/gntdev: Implement dma-buf export
 functionality
Date: Fri, 15 Jun 2018 17:02:23 -0400
Message-ID: <901a32b1-baae-7717-31f7-23bd31e23f05__5631.99372631988$1529096490$gmane$org@oracle.com>
References: <20180615062753.9229-1-andr2000@gmail.com>
 <20180615062753.9229-9-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=if9m=jb=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fTvrq-0006tv-Kd
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 21:02:46 +0000
In-Reply-To: <20180615062753.9229-9-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTUvMjAxOCAwMjoyNyBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgo+Cj4gMS4gQ3JlYXRlIGEgZG1hLWJ1ZiBmcm9tIGdyYW50IHJlZmVyZW5jZXMgcHJv
dmlkZWQgYnkgdGhlIGZvcmVpZ24KPiAgICBkb21haW4uIEJ5IGRlZmF1bHQgZG1hLWJ1ZiBpcyBi
YWNrZWQgYnkgc3lzdGVtIG1lbW9yeSBwYWdlcywgYnV0Cj4gICAgYnkgcHJvdmlkaW5nIEdOVERF
Vl9ETUFfRkxBR19YWFggZmxhZ3MgaXQgY2FuIGFsc28gYmUgY3JlYXRlZAo+ICAgIGFzIGEgRE1B
IHdyaXRlLWNvbWJpbmUvY29oZXJlbnQgYnVmZmVyLCBlLmcuIGFsbG9jYXRlZCB3aXRoCj4gICAg
Y29ycmVzcG9uZGluZyBkbWFfYWxsb2NfeHh4IEFQSS4KPiAgICBFeHBvcnQgdGhlIHJlc3VsdGlu
ZyBidWZmZXIgYXMgYSBuZXcgZG1hLWJ1Zi4KPgo+IDIuIEltcGxlbWVudCB3YWl0aW5nIGZvciB0
aGUgZG1hLWJ1ZiB0byBiZSByZWxlYXNlZDogYmxvY2sgdW50aWwgdGhlCj4gICAgZG1hLWJ1ZiB3
aXRoIHRoZSBmaWxlIGRlc2NyaXB0b3IgcHJvdmlkZWQgaXMgcmVsZWFzZWQuCj4gICAgSWYgd2l0
aGluIHRoZSB0aW1lLW91dCBwcm92aWRlZCB0aGUgYnVmZmVyIGlzIG5vdCByZWxlYXNlZCB0aGVu
Cj4gICAgLUVUSU1FRE9VVCBlcnJvciBpcyByZXR1cm5lZC4gSWYgdGhlIGJ1ZmZlciB3aXRoIHRo
ZSBmaWxlIGRlc2NyaXB0b3IKPiAgICBkb2VzIG5vdCBleGlzdCBvciBoYXMgYWxyZWFkeSBiZWVu
IHJlbGVhc2VkLCB0aGVuIC1FTk9FTlQgaXMKPiAgICByZXR1cm5lZC4gRm9yIHZhbGlkIGZpbGUg
ZGVzY3JpcHRvcnMgdGhpcyBtdXN0IG5vdCBiZSB0cmVhdGVkIGFzCj4gICAgZXJyb3IuCj4KPiAz
LiBNYWtlIGdudGRldidzIGNvbW1vbiBjb2RlIGFuZCBzdHJ1Y3R1cmVzIGF2YWlsYWJsZSB0byBk
bWEtYnVmLgo+Cj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtz
YW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgoKClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zz
a3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
