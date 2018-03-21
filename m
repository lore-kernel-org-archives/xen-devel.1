From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2] qemu: replace "" with <> in headers
Date: Wed, 21 Mar 2018 17:58:49 +0200
Message-ID: <20180321175452-mutt-send-email-mst__26060.9644501985$1521647867$gmane$org@kernel.org>
References: <1521642402-197739-1-git-send-email-mst@redhat.com>
 <20180321153439.GC3898@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tsj0=gl=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1eyg8d-0005w4-MO
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 15:58:55 +0000
Content-Disposition: inline
In-Reply-To: <20180321153439.GC3898@localhost.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>, Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Yongbok Kim <yongbok.kim@mips.com>, Michael Roth <mdroth@linux.vnet.ib>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMjEsIDIwMTggYXQgMDQ6MzQ6MzlQTSArMDEwMCwgS2V2aW4gV29sZiB3cm90
ZToKPiBBbSAyMS4wMy4yMDE4IHVtIDE1OjQ2IGhhdCBNaWNoYWVsIFMuIFRzaXJraW4gZ2VzY2hy
aWViZW46Cj4gPiBPdXIgY3VycmVudCBzY2hlbWUgaXMgdG8gdXNlCj4gPiAgI2luY2x1ZGUgIiIK
PiA+IGZvciBpbnRlcm5hbCBoZWFkZXJzLCBhbmQKPiA+ICAjaW5jbHVkZSA8Pgo+ID4gZm9yIGV4
dGVybmFsIG9uZXMuCj4gPiAKPiA+IFVuZm9ydHVuYXRlbHkgdGhpcyBpcyBub3QgYmFzZWQgb24g
Y29tcGlsZXIgc3VwcG9ydDogZnJvbSBDIHBvaW50IG9mCj4gPiB2aWV3LCB0aGUgIiIgZm9ybSBt
ZXJlbHkgbG9va3MgdXAgaGVhZGVycyBpbiB0aGUgY3VycmVudCBkaXJlY3RvcnkKPiA+IGFuZCB0
aGVuIGZhbGxzIGJhY2sgb24gPD4gZGlyZWN0b3JpZXMuCj4gPiAKPiA+IFRodXMsIGZvciBleGFt
cGxlLCBhIHN5c3RlbSBoZWFkZXIgdHJhY2UuaCAtIHNob3VsZCBpdCBiZSBwcmVzZW50IC0gd2ls
bAo+ID4gY29uZmxpY3Qgd2l0aCBvdXIgbG9jYWwgdHJhY2UuaAo+IAo+IFlvdSdyZSByaWdodCB0
aGF0IHRoZXJlIGlzIGEgY29uZmxpY3QsIGV2ZW4gdGhvdWdoIG9ubHkgaW4gb25lCj4gZGlyZWN0
aW9uOiAidHJhY2UuaCIgaXMgdW5hbWJpZ3VvdXNseSB0aGUgbG9jYWwgdHJhY2UuaCBpbiBvdXIg
c291cmNlCj4gdHJlZSwgYnV0IDx0cmFjZS5oPiByZWZlcnMgdG8gdGhlIHNhbWUgbG9jYWwgaGVh
ZGVyIHJhdGhlciB0aGFuIHRoZQo+IHN5c3RlbSBoZWFkZXIgYXMgeW91IHdvdWxkIGV4cGVjdC4K
PiAKPiBBbiBlYXN5IHdheSB0byByZXNvbHZlIHRoaXMgY29uZmxpY3Qgd291bGQgYmUgdXNpbmcg
LWlxdW90ZSByYXRoZXIgdGhhbgo+IC1JIGZvciBkaXJlY3RvcmllcyBpbiB0aGUgc291cmNlIHRy
ZWUsIHNvIHRoYXQgPHRyYWNlLmg+IHVuYW1iaWd1b3VzbHkKPiByZWZlcnMgdG8gdGhlIHN5c3Rl
bSBoZWFkZXIgYW5kICJ0cmFjZS5oIiB1bmFtYmlndW91c2x5IHJlZmVycyB0byB0aGUKPiBRRU1V
IGhlYWRlci4KCkkgcG9zdGVkIHBhdGNoZXMgdG8gdGhhdCBlZmZlY3QgZm9yIDIuMTIuIEl0J3Mg
YWxsIHN0aWxsIHZlcnkgbXVjaAphIG5vbi1zdGFuZGFyZCBjb252ZW50aW9uIGFuZCBzbyBsZXNz
IHJvYnVzdCB0aGFuCnByZWZpeGluZyBmaWxlIG5hbWUgd2l0aCBhIHByb2plY3Qtc3BlY2lmaXgg
cHJlZml4LgoKPiA+IEFzIGFub3RoZXIgZXhhbXBsZSBvZiBwcm9ibGVtcywgYSBoZWFkZXIgYnkg
dGhlIHNhbWUgbmFtZSBpbiB0aGUgc291cmNlCj4gPiBkaXJlY3Rvcnkgd2lsbCBhbHdheXMgYmUg
cGlja2VkIHVwIGZpcnN0IC0gYmVmb3JlIGFueSBoZWFkZXJzIGluCj4gPiB0aGUgaW5jbHVkZSBk
aXJlY3RvcnkuCj4gPiAKPiA+IExldCdzIGNoYW5nZSB0aGUgc2NoZW1lOiBtYWtlIHN1cmUgYWxs
IGhlYWRlcnMgdGhhdCBhcmUgbm90Cj4gPiBpbiB0aGUgc291cmNlIGRpcmVjdG9yeSBhcmUgaW5j
bHVkZWQgdGhyb3VnaCBhIHBhdGgKPiA+IHN0YXJ0aW5nIHdpdGggcWVtdS8gLCB0aHVzOgo+ID4g
Cj4gPiAgI2luY2x1ZGUgPD4KPiA+IAo+ID4gaGVhZGVycyBpbiB0aGUgc2FtZSBkaXJlY3Rvcnkg
YXMgc291cmNlIGFyZSBpbmNsdWRlZCB3aXRoCj4gPiAKPiA+ICAjaW5jbHVkZSAiIgo+ID4gCj4g
PiBhcyBwZXIgc3RhbmRhcmQuCj4gPiAKPiA+IFRoaXMgKHVudGVzdGVkKSBwYXRjaCBpcyBqdXN0
IHRvIHN0YXJ0IHRoZSBkaXNjdXNzaW9uIGFuZCBkb2VzIG5vdAo+ID4gY2hhbmdlIGFsbCBvZiB0
aGUgY29kZWJhc2UuIElmIHRoZXJlJ3MgYWdyZWVtZW50LCB0aGlzIHdpbGwgYmUKPiA+IHJ1biBv
biBhbGwgY29kZSB0byBjb252ZXJ0aW5nIGNvZGUgdG8gdGhpcyBzY2hlbWUuCj4gCj4gUmVuYW1p
bmcgZmlsZXMgaXMgYWx3YXlzIHBhaW5mdWwuIElmIHRoYXQncyB0aGUgZml4LCB0aGUgY3VyZSBt
aWdodCBiZQo+IHdvcnNlIHRoYW4gdGhlIGRpc2Vhc2UuIEFzIGZhciBhcyBJIGtub3csIHRoZSBj
b25mbGljdCBpcyBvbmx5Cj4gdGhlb3JldGljYWwsIHNvIGluIHRoYXQgY2FzZSBJJ2Qgc2F5OiBJ
ZiBpdCBhaW4ndCBicm9rZSwgZG9uJ3QgZml4IGl0Lgo+IAo+IEtldmluCgpJdCdzIGJyb2tlIEkg
dGhpbmssIGl0J3MgdmVyeSBoYXJkIGZvciBuZXcgcGVvcGxlIHRvIGNvbnRyaWJ1dGUgdG8gUUVN
VS4KTG9vayBlLmcuIGF0IHJkbWEgd2hpY2ggYWxsIGhhcyBtZXNzZWQgdXAgaW5jbHVkZXMgLSBh
bmQgdGhhdCdzIGZyb20gYW4KZXhwZXJpZW5jZWQgY29ucmlidXRvciB3aG8ganVzdCBpc24ndCBh
biBleHBlcmllbmNlZCBtYWludGFpbmVyLgoKQW1vdW50IG9mIHRpbWUgc3BlbnQgb24gdGVhY2hp
bmcgbmV3IHBlb3BsZSB0cml2aWEgYWJvdXQgb3VyCmNvbnZlbnRpb25zIGp1c3QgaXNuJ3QgZnVu
bnkuIFRoZXkgc2hvdWxkIGJlIHNlbGYtZG9jdW1lbnRpbmcKYW5kIHZpb2xhdGlvbnMgc2hvdWxk
IGNhdXNlIHRoZSBidWlsZCB0byBmYWlsLgoKLS0gCk1TVAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
