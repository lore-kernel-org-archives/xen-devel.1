From: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2] qemu: replace "" with <> in headers
Date: Wed, 21 Mar 2018 16:34:39 +0100
Message-ID: <20180321153439.GC3898@localhost.localdomain>
References: <1521642402-197739-1-git-send-email-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=sndx=gl=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1eyflO-00045V-N9
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 15:34:54 +0000
Content-Disposition: inline
In-Reply-To: <1521642402-197739-1-git-send-email-mst@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>, Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Yongbok Kim <yongbok.kim@mips.com>, Michael Roth <mdroth@linux.vnet.ib>
List-Id: xen-devel@lists.xenproject.org

QW0gMjEuMDMuMjAxOCB1bSAxNTo0NiBoYXQgTWljaGFlbCBTLiBUc2lya2luIGdlc2NocmllYmVu
Ogo+IE91ciBjdXJyZW50IHNjaGVtZSBpcyB0byB1c2UKPiAgI2luY2x1ZGUgIiIKPiBmb3IgaW50
ZXJuYWwgaGVhZGVycywgYW5kCj4gICNpbmNsdWRlIDw+Cj4gZm9yIGV4dGVybmFsIG9uZXMuCj4g
Cj4gVW5mb3J0dW5hdGVseSB0aGlzIGlzIG5vdCBiYXNlZCBvbiBjb21waWxlciBzdXBwb3J0OiBm
cm9tIEMgcG9pbnQgb2YKPiB2aWV3LCB0aGUgIiIgZm9ybSBtZXJlbHkgbG9va3MgdXAgaGVhZGVy
cyBpbiB0aGUgY3VycmVudCBkaXJlY3RvcnkKPiBhbmQgdGhlbiBmYWxscyBiYWNrIG9uIDw+IGRp
cmVjdG9yaWVzLgo+IAo+IFRodXMsIGZvciBleGFtcGxlLCBhIHN5c3RlbSBoZWFkZXIgdHJhY2Uu
aCAtIHNob3VsZCBpdCBiZSBwcmVzZW50IC0gd2lsbAo+IGNvbmZsaWN0IHdpdGggb3VyIGxvY2Fs
IHRyYWNlLmgKCllvdSdyZSByaWdodCB0aGF0IHRoZXJlIGlzIGEgY29uZmxpY3QsIGV2ZW4gdGhv
dWdoIG9ubHkgaW4gb25lCmRpcmVjdGlvbjogInRyYWNlLmgiIGlzIHVuYW1iaWd1b3VzbHkgdGhl
IGxvY2FsIHRyYWNlLmggaW4gb3VyIHNvdXJjZQp0cmVlLCBidXQgPHRyYWNlLmg+IHJlZmVycyB0
byB0aGUgc2FtZSBsb2NhbCBoZWFkZXIgcmF0aGVyIHRoYW4gdGhlCnN5c3RlbSBoZWFkZXIgYXMg
eW91IHdvdWxkIGV4cGVjdC4KCkFuIGVhc3kgd2F5IHRvIHJlc29sdmUgdGhpcyBjb25mbGljdCB3
b3VsZCBiZSB1c2luZyAtaXF1b3RlIHJhdGhlciB0aGFuCi1JIGZvciBkaXJlY3RvcmllcyBpbiB0
aGUgc291cmNlIHRyZWUsIHNvIHRoYXQgPHRyYWNlLmg+IHVuYW1iaWd1b3VzbHkKcmVmZXJzIHRv
IHRoZSBzeXN0ZW0gaGVhZGVyIGFuZCAidHJhY2UuaCIgdW5hbWJpZ3VvdXNseSByZWZlcnMgdG8g
dGhlClFFTVUgaGVhZGVyLgoKPiBBcyBhbm90aGVyIGV4YW1wbGUgb2YgcHJvYmxlbXMsIGEgaGVh
ZGVyIGJ5IHRoZSBzYW1lIG5hbWUgaW4gdGhlIHNvdXJjZQo+IGRpcmVjdG9yeSB3aWxsIGFsd2F5
cyBiZSBwaWNrZWQgdXAgZmlyc3QgLSBiZWZvcmUgYW55IGhlYWRlcnMgaW4KPiB0aGUgaW5jbHVk
ZSBkaXJlY3RvcnkuCj4gCj4gTGV0J3MgY2hhbmdlIHRoZSBzY2hlbWU6IG1ha2Ugc3VyZSBhbGwg
aGVhZGVycyB0aGF0IGFyZSBub3QKPiBpbiB0aGUgc291cmNlIGRpcmVjdG9yeSBhcmUgaW5jbHVk
ZWQgdGhyb3VnaCBhIHBhdGgKPiBzdGFydGluZyB3aXRoIHFlbXUvICwgdGh1czoKPiAKPiAgI2lu
Y2x1ZGUgPD4KPiAKPiBoZWFkZXJzIGluIHRoZSBzYW1lIGRpcmVjdG9yeSBhcyBzb3VyY2UgYXJl
IGluY2x1ZGVkIHdpdGgKPiAKPiAgI2luY2x1ZGUgIiIKPiAKPiBhcyBwZXIgc3RhbmRhcmQuCj4g
Cj4gVGhpcyAodW50ZXN0ZWQpIHBhdGNoIGlzIGp1c3QgdG8gc3RhcnQgdGhlIGRpc2N1c3Npb24g
YW5kIGRvZXMgbm90Cj4gY2hhbmdlIGFsbCBvZiB0aGUgY29kZWJhc2UuIElmIHRoZXJlJ3MgYWdy
ZWVtZW50LCB0aGlzIHdpbGwgYmUKPiBydW4gb24gYWxsIGNvZGUgdG8gY29udmVydGluZyBjb2Rl
IHRvIHRoaXMgc2NoZW1lLgoKUmVuYW1pbmcgZmlsZXMgaXMgYWx3YXlzIHBhaW5mdWwuIElmIHRo
YXQncyB0aGUgZml4LCB0aGUgY3VyZSBtaWdodCBiZQp3b3JzZSB0aGFuIHRoZSBkaXNlYXNlLiBB
cyBmYXIgYXMgSSBrbm93LCB0aGUgY29uZmxpY3QgaXMgb25seQp0aGVvcmV0aWNhbCwgc28gaW4g
dGhhdCBjYXNlIEknZCBzYXk6IElmIGl0IGFpbid0IGJyb2tlLCBkb24ndCBmaXggaXQuCgpLZXZp
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
