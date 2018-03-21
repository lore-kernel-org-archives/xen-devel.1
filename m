From: Thomas Huth <thuth@redhat.com>
Subject: Re: [Qemu-ppc] [PATCH] qemu: include generated files
 with <> and not ""
Date: Wed, 21 Mar 2018 08:16:00 +0100
Message-ID: <459fa95d-8f0a-22fa-80fb-4af22ccf49b3__47189.9401899011$1521616544$gmane$org@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
 <20180320135548-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=j7o7=gl=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1eyXzR-0002uO-NB
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 07:16:53 +0000
In-Reply-To: <20180320135548-mutt-send-email-mst@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>, Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Yongbok Kim <yongbok.kim@mips.com>, Michael
List-Id: xen-devel@lists.xenproject.org

T24gMjAuMDMuMjAxOCAxMzowNSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IE9uIFR1ZSwg
TWFyIDIwLCAyMDE4IGF0IDA5OjU4OjIzQU0gKzAxMDAsIExhdXJlbnQgVml2aWVyIHdyb3RlOgo+
PiBMZSAyMC8wMy8yMDE4IMOgIDAyOjU0LCBNaWNoYWVsIFMuIFRzaXJraW4gYSDDqWNyaXTCoDoK
Pj4+IFFFTVUgY29kaW5nIHN0eWxlIGF0IHRoZSBtb21lbnQgYXNrcyBmb3IgYWxsIG5vbi1zeXN0
ZW0KPj4+IGluY2x1ZGUgZmlsZXMgdG8gYmUgdXNlZCB3aXRoICNpbmNsdWRlICJmb28uaCIuCj4+
PiBIb3dldmVyIHRoaXMgcnVsZSBhY3R1YWxseSBkb2VzIG5vdCBtYWtlIHNlbnNlIGFuZAo+Pj4g
Y3JlYXRlcyBpc3N1ZXMgZm9yIHdoZW4gdGhlIGluY2x1ZGVkIGZpbGUgaXMgZ2VuZXJhdGVkLgo+
Pgo+PiBJZiB5b3UgY2hhbmdlIHRoYXQsIHdlIGNhbiBoYXZlIGlzc3VlIHdoZW4gYSBzeXN0ZW0g
aW5jbHVkZSBoYXMgdGhlIHNhbWUKPj4gbmFtZSBhcyBvdXIgbG9jYWwgaW5jbHVkZS4gV2l0aCAi
PEZJTEU+Iiwgc3lzdGVtIGhlYWRlciBhcmUgdGFrZW4gZmlyc3QuCj4gCj4gQXJlIHlvdSBzdXJl
PyBJIGp1c3QgdGVzdGVkIGFuZCB0aGF0IGlzIG5vdCB0aGUgY2FzZSB3aXRoCj4gZWl0aGVyIGdj
YyBvciBjbGFuZy4KPiAKPj4+IEluIEMsIGluY2x1ZGUgImZpbGUiIG1lYW5zIGxvb2sgaW4gY3Vy
cmVudCBkaXJlY3RvcnksCj4+PiB0aGVuIG9uIGluY2x1ZGUgc2VhcmNoIHBhdGguIEN1cnJlbnQg
ZGlyZWN0b3J5IGhlcmUKPj4+IG1lYW5zIHRoZSBzb3VyY2UgZmlsZSBkaXJlY3RvcnkuCj4+PiBC
eSBjb21wYXJpc29uIGluY2x1ZGUgPGZpbGU+IG1lYW5zIGxvb2sgb24gaW5jbHVkZSBzZWFyY2gg
cGF0aC4KPj4KPj4gTm90IGV4YWN0bHksIHRoZXJlIGlzIHRoZSBub3Rpb24gb2YgInN5c3RlbSBo
ZWFkZXIiIHRvby4KPj4KPj4gaHR0cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzL2NwcC9JbmNs
dWRlLVN5bnRheC5odG1sCj4+Cj4+ICNpbmNsdWRlIDxmaWxlPgo+PiBUaGlzIHZhcmlhbnQgaXMg
dXNlZCBmb3Igc3lzdGVtIGhlYWRlciBmaWxlcy4gSXQgc2VhcmNoZXMgZm9yIGEgZmlsZQo+PiBu
YW1lZCBmaWxlIGluIGEgc3RhbmRhcmQgbGlzdCBvZiBzeXN0ZW0gZGlyZWN0b3JpZXMuIFlvdSBj
YW4gcHJlcGVuZAo+PiBkaXJlY3RvcmllcyB0byB0aGlzIGxpc3Qgd2l0aCB0aGUgLUkgb3B0aW9u
IChzZWUgSW52b2NhdGlvbikuCj4gCj4gVGhpcyBpcyBleGFjdGx5IHdoYXQgd2UgZG8uCj4gCj4+
ICNpbmNsdWRlICJmaWxlIgo+PiBUaGlzIHZhcmlhbnQgaXMgdXNlZCBmb3IgaGVhZGVyIGZpbGVz
IG9mIHlvdXIgb3duIHByb2dyYW0uIEl0IHNlYXJjaGVzCj4+IGZvciBhIGZpbGUgbmFtZWQgZmls
ZSBmaXJzdCBpbiB0aGUgZGlyZWN0b3J5IGNvbnRhaW5pbmcgdGhlIGN1cnJlbnQKPj4gZmlsZSwg
dGhlbiBpbiB0aGUgcXVvdGUgZGlyZWN0b3JpZXMgYW5kIHRoZW4gdGhlIHNhbWUgZGlyZWN0b3Jp
ZXMgdXNlZAo+PiBmb3IgPGZpbGU+LiBZb3UgY2FuIHByZXBlbmQgZGlyZWN0b3JpZXMgdG8gdGhl
IGxpc3Qgb2YgcXVvdGUgZGlyZWN0b3JpZXMKPj4gd2l0aCB0aGUgLWlxdW90ZSBvcHRpb24uCj4g
Cj4gU2luY2Ugd2UgZG8gbm90IHVzZSAtaXF1b3RlLCAiIiBqdXN0IGFkZHMgdGhlIGN1cnJlbnQg
ZGlyZWN0b3J5LgoKU28gd2h5IGRvbid0IHdlIHNpbXBseSBzd2l0Y2ggdG8gdXNlIC1pcXVvdGUg
aW5zdGVhZCBvZiAtSSBmb3IgYWRkaW5nCnNlYXJjaCBwYXRocyBmb3Igb3VyIG93biBoZWFkZXJz
PyBXZSB0aGVuIHdvdWxkIGdldCBhIGNsZWFuIHNlcGFyYXRpb24Kb2YgUUVNVSBoZWFkZXJzIGZy
b20gc3lzdGVtIGhlYWRlcnMuCgogVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
