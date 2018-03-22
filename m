From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 1/2] make: move generated headers to
 qemu-build/
Date: Thu, 22 Mar 2018 22:04:26 +0200
Message-ID: <20180322215555-mutt-send-email-mst__43073.0618573309$1521749018$gmane$org@kernel.org>
References: <1521746188-496856-1-git-send-email-mst@redhat.com>
 <e149388d-eb17-ffd3-b54c-cbdf6a309882@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rlrs=gm=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1ez6Rx-0005Ou-J2
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 20:04:37 +0000
Content-Disposition: inline
In-Reply-To: <e149388d-eb17-ffd3-b54c-cbdf6a309882@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eric Blake <eblake@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>, Max Reitz <mreitz@redhat.com>, Yongbok Kim <yongbok.kim@mips.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Michael Roth <mdroth@linux.vnet.ibm.com>"Richard W.M. Jones" <r>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMjIsIDIwMTggYXQgMDI6NDI6NTVQTSAtMDUwMCwgRXJpYyBCbGFrZSB3cm90
ZToKPiBPbiAwMy8yMi8yMDE4IDAyOjI3IFBNLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4g
PiBNYWtlIHN1cmUgYWxsIGdlbmVyYXRlZCBmaWxlcyBnbyBpbnRvIHFlbXUtYnVpbGQgc3ViZGly
ZWN0b3J5Lgo+ID4gV2UgY2FuIHRoZW4gaW5jbHVkZSB0aGVtIGxpa2UgdGhpczoKPiA+ICAgI2lu
Y2x1ZGUgInFlbXUtYnVpbGQvdHJhY2UuaCIKPiA+IAo+ID4gVGhpcyBzZXJ2ZXMgdHdvIHB1cnBv
c2VzOgo+ID4gLSBtYWtlIGl0IGVhc3kgdG8gZGV0ZWN0IHdoaWNoIGZpbGVzIGFyZSBpbiB0aGUg
c291cmNlCj4gPiAgICBkaXJlY3RvcnkgKGEgYml0IG1vcmUgd29yayBmb3Igd3JpdGVycywgZWFz
aWVyIGZvciByZWFkZXJzKQo+ID4gLSByZWR1Y2UgY2hhbmNlcyBvZiBjb25mbGljdHMgd2l0aCBw
b3NzaWJsZSBzdGFsZSBmaWxlcyBpbiBzb3VyY2UKPiA+ICAgIGRpcmVjdG9yeSAod2hpY2ggY291
bGQgYmUgbGVmdCBvdmVyIGZyb20gZS5nLiBvbGQgcGF0Y2hlcywgZXRjKQo+ID4gCj4gPiBUaGlz
IHBhdGNoIG5lZWRzIHRvIGJlIG1lcmdlZCB3aXRoIHBhdGNoIDIgIG9mIHNlcmllcyB1cGRhdGlu
ZyBhbGwKPiA+IGZpbGVzOiBzZW5kaW5nIGl0IHNlcGFyYXRlbHkgdG8gYXZvaWQgc3BhbW1pbmcg
dGhlIGxpc3QuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0
QHJlZGhhdC5jb20+Cj4gPiAtLS0KPiAKPiA+ICsrKyBiL01ha2VmaWxlCj4gPiBAQCAtODksMTAy
ICs4OSwxMDIgQEAgZW5kaWYKPiA+ICAgaW5jbHVkZSAkKFNSQ19QQVRIKS9ydWxlcy5tYWsKPiA+
IC1HRU5FUkFURURfRklMRVMgPSBxZW11LXZlcnNpb24uaCBjb25maWctaG9zdC5oIHFlbXUtb3B0
aW9ucy5kZWYKPiA+IC1HRU5FUkFURURfRklMRVMgKz0gcWFwaS9xYXBpLWJ1aWx0aW4tdHlwZXMu
aCBxYXBpL3FhcGktYnVpbHRpbi10eXBlcy5jCj4gCj4gVWdnaCAtIEkgcmVhbGx5IG5lZWQgdG8g
Zm9sbG93IHVwIG9uIG15IHRocmVhdCB0byBtYWtlIHNtYXJ0ZXIgdXNlIG9mIG1ha2UKPiB2YXJp
YWJsZXMgYW5kIHN0cmluZyBtYW5pcHVsYXRpb24gdG8gY3V0IGRvd24gb24gdGhlIGJvaWxlcnBs
YXRlIGludm9sdmVkCj4gaGVyZS4gIFNhZGx5LCBJJ20gbm90IGNvbnZpbmNlZCB0aGF0IGRvaW5n
IHNvIGlzIGEgMi4xMiBidWdmaXggcHJpb3JpdHksIHNvCj4gaXQgaXNuJ3QgYXQgdGhlIHRvcCBv
ZiBteSB3b3JrIHF1ZXVlLgo+IAo+IE92ZXJhbGwsIHRoZSBwYXRjaCBpcyBhbiBpbnRlcmVzdGlu
ZyBpZGVhLiAgSSdtIHN0aWxsIG5vdCAxMDAlIHNvbGQgb24gaXQKPiAoYXMgeW91IHNheSwgaXQn
cyBub3cgc2xpZ2h0bHkgbW9yZSB3b3JrIGZvciB3cml0ZXJzKSwgYnV0IEknbSBub3QgY29taW5n
IHVwCj4gd2l0aCBhbnkgc29saWQgcmVhc29ucyB3aHkgaXQgc2hvdWxkIG5vdCBiZSBhcHBsaWVk
IChhdCBsZWFzdCwgZm9yIDIuMTMgLQo+IGRvaW5nIGl0IGR1cmluZyBmcmVlemUgZm9yIDIuMTIg
aXMgYSBiaXQgaGFyZGVyIHRvIGp1c3RpZnkpLgoKSXQncyB1cCB0byBQZXRlciByZWFsbHk6IGl0
IGhlbHBzIHJlZHVjZSBjb25mbGljdHMgaWYgd2UgYXBwbHkgcGF0Y2hlcwpsaWtlIHRoaXMgZHVy
aW5nIGZyZWV6ZS4gIEJ1dCB3aXRoIGVub3VnaCBlZmZvcnQgb24gUGF0ZXIncyBwYXJ0IGl0J3MK
bm90IGEgaHVnZSBkZWFsLgoKPiAtLSAKPiBFcmljIEJsYWtlLCBQcmluY2lwYWwgU29mdHdhcmUg
RW5naW5lZXIKPiBSZWQgSGF0LCBJbmMuICAgICAgICAgICArMS05MTktMzAxLTMyNjYKPiBWaXJ0
dWFsaXphdGlvbjogIHFlbXUub3JnIHwgbGlidmlydC5vcmcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
