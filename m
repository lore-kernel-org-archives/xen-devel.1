From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [Qemu-ppc] [PATCH] qemu: include generated files
 with <> and not ""
Date: Wed, 21 Mar 2018 13:29:53 +0000
Message-ID: <20180321132953.GK8551@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
 <20180320135548-mutt-send-email-mst@kernel.org>
 <459fa95d-8f0a-22fa-80fb-4af22ccf49b3@redhat.com>
 <20180321150543-mutt-send-email-mst@kernel.org>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xono=gl=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1eydp5-00010z-KZ
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 13:30:35 +0000
Content-Disposition: inline
In-Reply-To: <20180321150543-mutt-send-email-mst@kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>, Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Yongbok Kim <yongbok.kim@mips.com>, Michael
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMjEsIDIwMTggYXQgMDM6MDg6MzZQTSArMDIwMCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+IE9uIFdlZCwgTWFyIDIxLCAyMDE4IGF0IDA4OjE2OjAwQU0gKzAxMDAsIFRo
b21hcyBIdXRoIHdyb3RlOgo+ID4gT24gMjAuMDMuMjAxOCAxMzowNSwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+ID4gPiBPbiBUdWUsIE1hciAyMCwgMjAxOCBhdCAwOTo1ODoyM0FNICswMTAw
LCBMYXVyZW50IFZpdmllciB3cm90ZToKPiA+ID4+IExlIDIwLzAzLzIwMTggw6AgMDI6NTQsIE1p
Y2hhZWwgUy4gVHNpcmtpbiBhIMOpY3JpdMKgOgo+ID4gPj4+IFFFTVUgY29kaW5nIHN0eWxlIGF0
IHRoZSBtb21lbnQgYXNrcyBmb3IgYWxsIG5vbi1zeXN0ZW0KPiA+ID4+PiBpbmNsdWRlIGZpbGVz
IHRvIGJlIHVzZWQgd2l0aCAjaW5jbHVkZSAiZm9vLmgiLgo+ID4gPj4+IEhvd2V2ZXIgdGhpcyBy
dWxlIGFjdHVhbGx5IGRvZXMgbm90IG1ha2Ugc2Vuc2UgYW5kCj4gPiA+Pj4gY3JlYXRlcyBpc3N1
ZXMgZm9yIHdoZW4gdGhlIGluY2x1ZGVkIGZpbGUgaXMgZ2VuZXJhdGVkLgo+ID4gPj4KPiA+ID4+
IElmIHlvdSBjaGFuZ2UgdGhhdCwgd2UgY2FuIGhhdmUgaXNzdWUgd2hlbiBhIHN5c3RlbSBpbmNs
dWRlIGhhcyB0aGUgc2FtZQo+ID4gPj4gbmFtZSBhcyBvdXIgbG9jYWwgaW5jbHVkZS4gV2l0aCAi
PEZJTEU+Iiwgc3lzdGVtIGhlYWRlciBhcmUgdGFrZW4gZmlyc3QuCj4gPiA+IAo+ID4gPiBBcmUg
eW91IHN1cmU/IEkganVzdCB0ZXN0ZWQgYW5kIHRoYXQgaXMgbm90IHRoZSBjYXNlIHdpdGgKPiA+
ID4gZWl0aGVyIGdjYyBvciBjbGFuZy4KPiA+ID4gCj4gPiA+Pj4gSW4gQywgaW5jbHVkZSAiZmls
ZSIgbWVhbnMgbG9vayBpbiBjdXJyZW50IGRpcmVjdG9yeSwKPiA+ID4+PiB0aGVuIG9uIGluY2x1
ZGUgc2VhcmNoIHBhdGguIEN1cnJlbnQgZGlyZWN0b3J5IGhlcmUKPiA+ID4+PiBtZWFucyB0aGUg
c291cmNlIGZpbGUgZGlyZWN0b3J5Lgo+ID4gPj4+IEJ5IGNvbXBhcmlzb24gaW5jbHVkZSA8Zmls
ZT4gbWVhbnMgbG9vayBvbiBpbmNsdWRlIHNlYXJjaCBwYXRoLgo+ID4gPj4KPiA+ID4+IE5vdCBl
eGFjdGx5LCB0aGVyZSBpcyB0aGUgbm90aW9uIG9mICJzeXN0ZW0gaGVhZGVyIiB0b28uCj4gPiA+
Pgo+ID4gPj4gaHR0cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzL2NwcC9JbmNsdWRlLVN5bnRh
eC5odG1sCj4gPiA+Pgo+ID4gPj4gI2luY2x1ZGUgPGZpbGU+Cj4gPiA+PiBUaGlzIHZhcmlhbnQg
aXMgdXNlZCBmb3Igc3lzdGVtIGhlYWRlciBmaWxlcy4gSXQgc2VhcmNoZXMgZm9yIGEgZmlsZQo+
ID4gPj4gbmFtZWQgZmlsZSBpbiBhIHN0YW5kYXJkIGxpc3Qgb2Ygc3lzdGVtIGRpcmVjdG9yaWVz
LiBZb3UgY2FuIHByZXBlbmQKPiA+ID4+IGRpcmVjdG9yaWVzIHRvIHRoaXMgbGlzdCB3aXRoIHRo
ZSAtSSBvcHRpb24gKHNlZSBJbnZvY2F0aW9uKS4KPiA+ID4gCj4gPiA+IFRoaXMgaXMgZXhhY3Rs
eSB3aGF0IHdlIGRvLgo+ID4gPiAKPiA+ID4+ICNpbmNsdWRlICJmaWxlIgo+ID4gPj4gVGhpcyB2
YXJpYW50IGlzIHVzZWQgZm9yIGhlYWRlciBmaWxlcyBvZiB5b3VyIG93biBwcm9ncmFtLiBJdCBz
ZWFyY2hlcwo+ID4gPj4gZm9yIGEgZmlsZSBuYW1lZCBmaWxlIGZpcnN0IGluIHRoZSBkaXJlY3Rv
cnkgY29udGFpbmluZyB0aGUgY3VycmVudAo+ID4gPj4gZmlsZSwgdGhlbiBpbiB0aGUgcXVvdGUg
ZGlyZWN0b3JpZXMgYW5kIHRoZW4gdGhlIHNhbWUgZGlyZWN0b3JpZXMgdXNlZAo+ID4gPj4gZm9y
IDxmaWxlPi4gWW91IGNhbiBwcmVwZW5kIGRpcmVjdG9yaWVzIHRvIHRoZSBsaXN0IG9mIHF1b3Rl
IGRpcmVjdG9yaWVzCj4gPiA+PiB3aXRoIHRoZSAtaXF1b3RlIG9wdGlvbi4KPiA+ID4gCj4gPiA+
IFNpbmNlIHdlIGRvIG5vdCB1c2UgLWlxdW90ZSwgIiIganVzdCBhZGRzIHRoZSBjdXJyZW50IGRp
cmVjdG9yeS4KPiA+IAo+ID4gU28gd2h5IGRvbid0IHdlIHNpbXBseSBzd2l0Y2ggdG8gdXNlIC1p
cXVvdGUgaW5zdGVhZCBvZiAtSSBmb3IgYWRkaW5nCj4gPiBzZWFyY2ggcGF0aHMgZm9yIG91ciBv
d24gaGVhZGVycz8gV2UgdGhlbiB3b3VsZCBnZXQgYSBjbGVhbiBzZXBhcmF0aW9uCj4gPiBvZiBR
RU1VIGhlYWRlcnMgZnJvbSBzeXN0ZW0gaGVhZGVycy4KPiA+IAo+ID4gIFRob21hcwo+IAo+IEl0
IHN0aWxsIGxlYXZlcyB1cyB3aXRoIGEgaG9zdCBvZiBwcm9ibGVtcyBlLmcuIHRoZSBwcm9ibGVt
IG9mIHN0YWxlCj4gaGVhZGVycyBpbiB0aGUgc291cmNlIGRpcmVjdG9yeS4KCldlIGhhdmUgYSBw
YXRjaCBvbiBsaXN0IHdoaWNoIGVmZmVjdGl2ZWx5IHNvbHZlcyB0aGUgcHJvYmxlbSBvZiBzdGFs
ZQpnZW5lcmF0ZWQgZmlsZXMgaW4gc291cmNlIGRpcmVjdG9yeSwgc28gdGhhdCdzIGxhcmdlbHkg
YSBub24taXNzdWUgYXQKdGhpcyBwb2ludCBJTUhPLgoKUmVnYXJkcywKRGFuaWVsCi0tIAp8OiBo
dHRwczovL2JlcnJhbmdlLmNvbSAgICAgIC1vLSAgICBodHRwczovL3d3dy5mbGlja3IuY29tL3Bo
b3Rvcy9kYmVycmFuZ2UgOnwKfDogaHR0cHM6Ly9saWJ2aXJ0Lm9yZyAgICAgICAgIC1vLSAgICAg
ICAgICAgIGh0dHBzOi8vZnN0b3AxMzguYmVycmFuZ2UuY29tIDp8Cnw6IGh0dHBzOi8vZW50YW5n
bGUtcGhvdG8ub3JnICAgIC1vLSAgICBodHRwczovL3d3dy5pbnN0YWdyYW0uY29tL2RiZXJyYW5n
ZSA6fAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
