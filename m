From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 9/9] xen/gntdev: Expose gntdev's dma-buf
 API for in-kernel use
Date: Wed, 6 Jun 2018 17:51:38 -0400
Message-ID: <398d53c9-9c47-d86a-89bd-b9941e638434__5924.32533526352$1528321601$gmane$org@oracle.com>
References: <20180601114132.22596-1-andr2000@gmail.com>
 <20180601114132.22596-10-andr2000@gmail.com>
 <86f5b340-856c-204f-4ba7-dd51f1e92639@oracle.com>
 <984bcf75-9bea-aceb-3d3a-62e3c65709c7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=c6s6=iy=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fQgHe-0007tJ-AS
 for xen-devel@lists.xenproject.org; Wed, 06 Jun 2018 21:47:58 +0000
In-Reply-To: <984bcf75-9bea-aceb-3d3a-62e3c65709c7@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, dongwon.kim@intel.com, matthew.d.roper@intel.com
Cc: jgross@suse.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org, daniel.vetter@intel.com, linux-media@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDYvMjAxOCAwODo0NiBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDYvMDUvMjAxOCAwMTozNiBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAwNi8w
MS8yMDE4IDA3OjQxIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+IEZyb206
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNv
bT4KPj4+Cj4+PiBBbGxvdyBjcmVhdGluZyBncmFudCBkZXZpY2UgY29udGV4dCBmb3IgdXNlIGJ5
IGtlcm5lbCBtb2R1bGVzIHdoaWNoCj4+PiByZXF1aXJlIGZ1bmN0aW9uYWxpdHksIHByb3ZpZGVk
IGJ5IGdudGRldi4gRXhwb3J0IHN5bWJvbHMgZm9yIGRtYS1idWYKPj4+IEFQSSBwcm92aWRlZCBi
eSB0aGUgbW9kdWxlLgo+PiBDYW4geW91IGdpdmUgYW4gZXhhbXBsZSBvZiB3aG8nZCBiZSB1c2lu
ZyB0aGVzZSBpbnRlcmZhY2VzPwo+IFRoZXJlIGlzIG5vIHVzZS1jYXNlIGF0IHRoZSBtb21lbnQg
SSBjYW4gdGhpbmsgb2YsIGJ1dCBoeXBlciBkbWEtYnVmCj4gWzFdLCBbMl0KPiBJIGxldCBJbnRl
bCBmb2xrcyAoQ0NlZCkgdG8gZGVmZW5kIHRoaXMgcGF0Y2ggYXMgaXQgd2FzIGRvbmUgcHJpbWFy
aWx5Cj4gZm9yIHRoZW0KPiBhbmQgSSBkb24ndCB1c2UgaXQgaW4gYW55IG9mIG15IHVzZS1jYXNl
cy4gU28sIGZyb20gdGhpcyBQT1YgaXQgY2FuIGJlCj4gZHJvcHBlZCwKPiBhdCBsZWFzdCBmcm9t
IHRoaXMgc2VyaWVzLgoKClllcywgbGV0J3MgZHJvcCB0aGlzIHVudGlsIHNvbWVvbmUgYWN0dWFs
bHkgbmVlZHMgaXQuCgotYm9yaXMKCgo+Pgo+PiAtYm9yaXMKPj4KPiBbMV0gaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8zODIwNy8KPiBbMl0gaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzIwNDQ0Ny8KPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
