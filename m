From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-ppc] [PATCH] qemu: include generated files
 with <> and not ""
Date: Wed, 21 Mar 2018 15:08:36 +0200
Message-ID: <20180321150543-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
 <20180320135548-mutt-send-email-mst@kernel.org>
 <459fa95d-8f0a-22fa-80fb-4af22ccf49b3@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tsj0=gl=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1eydUO-000790-SD
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 13:09:12 +0000
Content-Disposition: inline
In-Reply-To: <459fa95d-8f0a-22fa-80fb-4af22ccf49b3@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>, Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Yongbok Kim <yongbok.kim@mips.com>, Michael
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMjEsIDIwMTggYXQgMDg6MTY6MDBBTSArMDEwMCwgVGhvbWFzIEh1dGggd3Jv
dGU6Cj4gT24gMjAuMDMuMjAxOCAxMzowNSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+ID4g
T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDk6NTg6MjNBTSArMDEwMCwgTGF1cmVudCBWaXZpZXIg
d3JvdGU6Cj4gPj4gTGUgMjAvMDMvMjAxOCDDoCAwMjo1NCwgTWljaGFlbCBTLiBUc2lya2luIGEg
w6ljcml0wqA6Cj4gPj4+IFFFTVUgY29kaW5nIHN0eWxlIGF0IHRoZSBtb21lbnQgYXNrcyBmb3Ig
YWxsIG5vbi1zeXN0ZW0KPiA+Pj4gaW5jbHVkZSBmaWxlcyB0byBiZSB1c2VkIHdpdGggI2luY2x1
ZGUgImZvby5oIi4KPiA+Pj4gSG93ZXZlciB0aGlzIHJ1bGUgYWN0dWFsbHkgZG9lcyBub3QgbWFr
ZSBzZW5zZSBhbmQKPiA+Pj4gY3JlYXRlcyBpc3N1ZXMgZm9yIHdoZW4gdGhlIGluY2x1ZGVkIGZp
bGUgaXMgZ2VuZXJhdGVkLgo+ID4+Cj4gPj4gSWYgeW91IGNoYW5nZSB0aGF0LCB3ZSBjYW4gaGF2
ZSBpc3N1ZSB3aGVuIGEgc3lzdGVtIGluY2x1ZGUgaGFzIHRoZSBzYW1lCj4gPj4gbmFtZSBhcyBv
dXIgbG9jYWwgaW5jbHVkZS4gV2l0aCAiPEZJTEU+Iiwgc3lzdGVtIGhlYWRlciBhcmUgdGFrZW4g
Zmlyc3QuCj4gPiAKPiA+IEFyZSB5b3Ugc3VyZT8gSSBqdXN0IHRlc3RlZCBhbmQgdGhhdCBpcyBu
b3QgdGhlIGNhc2Ugd2l0aAo+ID4gZWl0aGVyIGdjYyBvciBjbGFuZy4KPiA+IAo+ID4+PiBJbiBD
LCBpbmNsdWRlICJmaWxlIiBtZWFucyBsb29rIGluIGN1cnJlbnQgZGlyZWN0b3J5LAo+ID4+PiB0
aGVuIG9uIGluY2x1ZGUgc2VhcmNoIHBhdGguIEN1cnJlbnQgZGlyZWN0b3J5IGhlcmUKPiA+Pj4g
bWVhbnMgdGhlIHNvdXJjZSBmaWxlIGRpcmVjdG9yeS4KPiA+Pj4gQnkgY29tcGFyaXNvbiBpbmNs
dWRlIDxmaWxlPiBtZWFucyBsb29rIG9uIGluY2x1ZGUgc2VhcmNoIHBhdGguCj4gPj4KPiA+PiBO
b3QgZXhhY3RseSwgdGhlcmUgaXMgdGhlIG5vdGlvbiBvZiAic3lzdGVtIGhlYWRlciIgdG9vLgo+
ID4+Cj4gPj4gaHR0cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzL2NwcC9JbmNsdWRlLVN5bnRh
eC5odG1sCj4gPj4KPiA+PiAjaW5jbHVkZSA8ZmlsZT4KPiA+PiBUaGlzIHZhcmlhbnQgaXMgdXNl
ZCBmb3Igc3lzdGVtIGhlYWRlciBmaWxlcy4gSXQgc2VhcmNoZXMgZm9yIGEgZmlsZQo+ID4+IG5h
bWVkIGZpbGUgaW4gYSBzdGFuZGFyZCBsaXN0IG9mIHN5c3RlbSBkaXJlY3Rvcmllcy4gWW91IGNh
biBwcmVwZW5kCj4gPj4gZGlyZWN0b3JpZXMgdG8gdGhpcyBsaXN0IHdpdGggdGhlIC1JIG9wdGlv
biAoc2VlIEludm9jYXRpb24pLgo+ID4gCj4gPiBUaGlzIGlzIGV4YWN0bHkgd2hhdCB3ZSBkby4K
PiA+IAo+ID4+ICNpbmNsdWRlICJmaWxlIgo+ID4+IFRoaXMgdmFyaWFudCBpcyB1c2VkIGZvciBo
ZWFkZXIgZmlsZXMgb2YgeW91ciBvd24gcHJvZ3JhbS4gSXQgc2VhcmNoZXMKPiA+PiBmb3IgYSBm
aWxlIG5hbWVkIGZpbGUgZmlyc3QgaW4gdGhlIGRpcmVjdG9yeSBjb250YWluaW5nIHRoZSBjdXJy
ZW50Cj4gPj4gZmlsZSwgdGhlbiBpbiB0aGUgcXVvdGUgZGlyZWN0b3JpZXMgYW5kIHRoZW4gdGhl
IHNhbWUgZGlyZWN0b3JpZXMgdXNlZAo+ID4+IGZvciA8ZmlsZT4uIFlvdSBjYW4gcHJlcGVuZCBk
aXJlY3RvcmllcyB0byB0aGUgbGlzdCBvZiBxdW90ZSBkaXJlY3Rvcmllcwo+ID4+IHdpdGggdGhl
IC1pcXVvdGUgb3B0aW9uLgo+ID4gCj4gPiBTaW5jZSB3ZSBkbyBub3QgdXNlIC1pcXVvdGUsICIi
IGp1c3QgYWRkcyB0aGUgY3VycmVudCBkaXJlY3RvcnkuCj4gCj4gU28gd2h5IGRvbid0IHdlIHNp
bXBseSBzd2l0Y2ggdG8gdXNlIC1pcXVvdGUgaW5zdGVhZCBvZiAtSSBmb3IgYWRkaW5nCj4gc2Vh
cmNoIHBhdGhzIGZvciBvdXIgb3duIGhlYWRlcnM/IFdlIHRoZW4gd291bGQgZ2V0IGEgY2xlYW4g
c2VwYXJhdGlvbgo+IG9mIFFFTVUgaGVhZGVycyBmcm9tIHN5c3RlbSBoZWFkZXJzLgo+IAo+ICBU
aG9tYXMKCkl0IHN0aWxsIGxlYXZlcyB1cyB3aXRoIGEgaG9zdCBvZiBwcm9ibGVtcyBlLmcuIHRo
ZSBwcm9ibGVtIG9mIHN0YWxlCmhlYWRlcnMgaW4gdGhlIHNvdXJjZSBkaXJlY3RvcnkuCgotLSAK
TVNUCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
