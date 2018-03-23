From: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 1/2] make: move generated headers to
 qemu-build/
Date: Fri, 23 Mar 2018 12:21:43 +0100
Message-ID: <20180323112143.GC5025__1901.71501967615$1521804080$gmane$org@localhost.localdomain>
References: <1521746188-496856-1-git-send-email-mst@redhat.com>
 <20180323102227.GF16270@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=me/8=gn=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1ezKm9-0003d3-Ct
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 11:22:25 +0000
Content-Disposition: inline
In-Reply-To: <20180323102227.GF16270@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <jcody@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>, Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Yongbok Kim <yongbok.kim@mips.com>, David Hildenbrand <david@redhat.c>
List-Id: xen-devel@lists.xenproject.org

QW0gMjMuMDMuMjAxOCB1bSAxMToyMiBoYXQgRGFuaWVsIFAuIEJlcnJhbmfDqSBnZXNjaHJpZWJl
bjoKPiBPbiBUaHUsIE1hciAyMiwgMjAxOCBhdCAwOToyNzo1NVBNICswMjAwLCBNaWNoYWVsIFMu
IFRzaXJraW4gd3JvdGU6Cj4gPiBNYWtlIHN1cmUgYWxsIGdlbmVyYXRlZCBmaWxlcyBnbyBpbnRv
IHFlbXUtYnVpbGQgc3ViZGlyZWN0b3J5Lgo+ID4gV2UgY2FuIHRoZW4gaW5jbHVkZSB0aGVtIGxp
a2UgdGhpczoKPiA+ICAjaW5jbHVkZSAicWVtdS1idWlsZC90cmFjZS5oIgo+ID4gCj4gPiBUaGlz
IHNlcnZlcyB0d28gcHVycG9zZXM6Cj4gPiAtIG1ha2UgaXQgZWFzeSB0byBkZXRlY3Qgd2hpY2gg
ZmlsZXMgYXJlIGluIHRoZSBzb3VyY2UKPiA+ICAgZGlyZWN0b3J5IChhIGJpdCBtb3JlIHdvcmsg
Zm9yIHdyaXRlcnMsIGVhc2llciBmb3IgcmVhZGVycykKPiA+IC0gcmVkdWNlIGNoYW5jZXMgb2Yg
Y29uZmxpY3RzIHdpdGggcG9zc2libGUgc3RhbGUgZmlsZXMgaW4gc291cmNlCj4gPiAgIGRpcmVj
dG9yeSAod2hpY2ggY291bGQgYmUgbGVmdCBvdmVyIGZyb20gZS5nLiBvbGQgcGF0Y2hlcywgZXRj
KQo+IAo+IElmIHBlb3BsZSBjYXJlIGFib3V0IHRoaXMsIHRoZW4gdGhleSBjYW4ganVzdCBiZSBk
b2luZyBhIGJ1aWxkCj4gd2l0aCAgc3JjZGlyICE9IGJ1aWxkZGlyIGNvbmZpZy4gIElmIHBlb3Bs
ZSBhcmUgdXNpbmcgc3JjZGlyID09IGJ1aWxkZGlyCj4gdGhlbiB0aGV5IGxpa2VseSAqd2FudCog
YWxsIHRoZSBnZW5lcmF0ZWQgZmlsZXMgaW4gdGhlaXIgc3JjZGlyLgo+IAo+IElNSE8gaXQgd291
bGQgYmUgdmFsaWQgZm9yIHVzIHRvIGNvbnNpZGVyIGlmIHdlIGNvdWxkIGp1c3QgbWFuZGF0ZQo+
IHNyY2RpciAhPSBidWlsZGRpciwgYnV0IGlmIHBlb3BsZSBvYmplY3QgdG8gc3VjaCBhIHByb3Bv
c2FsLCB0aGVuIEkKPiBkb24ndCB0aGluayB3ZSBzaG91bGQgYXJiaXRyYXJpbHkgbW92ZSBhbGwg
Z2VuZXJhdGVkIHNvdXJjZSBmaWxlcwo+IGluIHRoaXMgd2F5LCBhcyB0aGF0J3MgZWZmZWN0aXZl
bHkgdGhlIHNhbWUgdGhpbmcgZm9yY2VkIG9udG8gZGV2cy4KCk5vdCBuZWNlc3NhcmlseS4gSSBi
dWlsZCBmcm9tIHRoZSBzcmNkaXIgc2ltcGx5IGJlY2F1c2UgaXQncyBtb3JlCmNvbnZlbmllbnQg
dG8gYmUgYWJsZSB0byBlYXNpbHkgc3RhcnQgdGhlIGVkaXRvciBhbmQgbWFrZSBmcm9tIHRoZSBz
YW1lCmRpcmVjdG9yeSAob3Igc29tZXRpbWVzIHN0YXJ0IG1ha2UgZnJvbSBpbnNpZGUgdGhlIGVk
aXRvcikuIEkgc3VwcG9zZQp0aGF0IChvciBmb3IgdXNlcnMsIGJlaW5nIHRvbyBsYXp5IHRvIGNy
ZWF0ZSBhIHNlY29uZCBkaXJlY3RvcnkgZm9yIHRoYXQKb25lLXRpbWUgYnVpbGQpIGlzIHRoZSBt
b3RpdmF0aW9uIGZvciBtb3N0IG90aGVyIHVzZXJzIG9mIHNyY2RpciA9PQpidWlsZGRpciwgdG9v
LgoKSSBkb24ndCByZWFsbHkgbWluZCB3aGVyZSBnZW5lcmF0ZWQgc291cmNlIGZpbGVzIGFyZSBz
dG9yZWQsIHRoZXkganVzdApoYXBwZW4gdG8gZW5kIHVwIGluIG15IHJvb3Qgc291cmNlIGRpcmVj
dG9yeSBpZiBJIHdhbnQgdG8gYmUgYWJsZSB0bwpidWlsZCBmcm9tIHRoZXJlIHdpdGhvdXQgZGVh
bGluZyB3aXRoIHBhdGhzLiBJIHdvbid0IGJlIGFuZ3J5IGlmIHRoZXkKYXJlIHN1ZGRlbmx5IGlu
IGEgZGlmZmVyZW50IGRpcmVjdG9yeSBhcyBsb25nIGFzIGl0IGRvZXNuJ3QgbWVhbiBtb3JlCnR5
cGluZyBmb3IgbWUuIE1vdmluZyB0aGVtIHRvIGEgc2VwYXJhdGUgZGlyZWN0b3J5IG1pZ2h0IGlu
IGZhY3QgbWFrZQp0aGluZ3MgYSBiaXQgbmljZXIgb2NjYXNpb25hbGx5LiBOb3QgZW5vdWdoIGZv
ciBtZSB0byBhY3RpdmVseSBwcm9wb3NlCnN1Y2ggYSBjaGFuZ2UsIGJ1dCBpZiBNaWNoYWVsIHdh
bnRzIHRvIGRvIHRoaXMsIEknbSBjZXJ0YWlubHkgbm90Cm9wcG9zZWQuCgpLZXZpbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
