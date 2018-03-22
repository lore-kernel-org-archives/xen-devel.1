From: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 1/2] make: move generated headers to
 qemu-build/
Date: Thu, 22 Mar 2018 14:42:55 -0500
Message-ID: <e149388d-eb17-ffd3-b54c-cbdf6a309882__3492.89661176062$1521747731$gmane$org@redhat.com>
References: <1521746188-496856-1-git-send-email-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=57vb=gm=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1ez67B-0003tC-CK
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 19:43:09 +0000
In-Reply-To: <1521746188-496856-1-git-send-email-mst@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>, Max Reitz <mreitz@redhat.com>, Yongbok Kim <yongbok.kim@mips.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, "Richard W.M. Jones" <rjones@redhat.com>, Chr
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMjIvMjAxOCAwMjoyNyBQTSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IE1ha2Ug
c3VyZSBhbGwgZ2VuZXJhdGVkIGZpbGVzIGdvIGludG8gcWVtdS1idWlsZCBzdWJkaXJlY3Rvcnku
Cj4gV2UgY2FuIHRoZW4gaW5jbHVkZSB0aGVtIGxpa2UgdGhpczoKPiAgICNpbmNsdWRlICJxZW11
LWJ1aWxkL3RyYWNlLmgiCj4gCj4gVGhpcyBzZXJ2ZXMgdHdvIHB1cnBvc2VzOgo+IC0gbWFrZSBp
dCBlYXN5IHRvIGRldGVjdCB3aGljaCBmaWxlcyBhcmUgaW4gdGhlIHNvdXJjZQo+ICAgIGRpcmVj
dG9yeSAoYSBiaXQgbW9yZSB3b3JrIGZvciB3cml0ZXJzLCBlYXNpZXIgZm9yIHJlYWRlcnMpCj4g
LSByZWR1Y2UgY2hhbmNlcyBvZiBjb25mbGljdHMgd2l0aCBwb3NzaWJsZSBzdGFsZSBmaWxlcyBp
biBzb3VyY2UKPiAgICBkaXJlY3RvcnkgKHdoaWNoIGNvdWxkIGJlIGxlZnQgb3ZlciBmcm9tIGUu
Zy4gb2xkIHBhdGNoZXMsIGV0YykKPiAKPiBUaGlzIHBhdGNoIG5lZWRzIHRvIGJlIG1lcmdlZCB3
aXRoIHBhdGNoIDIgIG9mIHNlcmllcyB1cGRhdGluZyBhbGwKPiBmaWxlczogc2VuZGluZyBpdCBz
ZXBhcmF0ZWx5IHRvIGF2b2lkIHNwYW1taW5nIHRoZSBsaXN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gLS0tCgo+ICsrKyBiL01ha2Vm
aWxlCj4gQEAgLTg5LDEwMiArODksMTAyIEBAIGVuZGlmCj4gICAKPiAgIGluY2x1ZGUgJChTUkNf
UEFUSCkvcnVsZXMubWFrCj4gICAKPiAtR0VORVJBVEVEX0ZJTEVTID0gcWVtdS12ZXJzaW9uLmgg
Y29uZmlnLWhvc3QuaCBxZW11LW9wdGlvbnMuZGVmCj4gLUdFTkVSQVRFRF9GSUxFUyArPSBxYXBp
L3FhcGktYnVpbHRpbi10eXBlcy5oIHFhcGkvcWFwaS1idWlsdGluLXR5cGVzLmMKClVnZ2ggLSBJ
IHJlYWxseSBuZWVkIHRvIGZvbGxvdyB1cCBvbiBteSB0aHJlYXQgdG8gbWFrZSBzbWFydGVyIHVz
ZSBvZiAKbWFrZSB2YXJpYWJsZXMgYW5kIHN0cmluZyBtYW5pcHVsYXRpb24gdG8gY3V0IGRvd24g
b24gdGhlIGJvaWxlcnBsYXRlIAppbnZvbHZlZCBoZXJlLiAgU2FkbHksIEknbSBub3QgY29udmlu
Y2VkIHRoYXQgZG9pbmcgc28gaXMgYSAyLjEyIGJ1Z2ZpeCAKcHJpb3JpdHksIHNvIGl0IGlzbid0
IGF0IHRoZSB0b3Agb2YgbXkgd29yayBxdWV1ZS4KCk92ZXJhbGwsIHRoZSBwYXRjaCBpcyBhbiBp
bnRlcmVzdGluZyBpZGVhLiAgSSdtIHN0aWxsIG5vdCAxMDAlIHNvbGQgb24gCml0IChhcyB5b3Ug
c2F5LCBpdCdzIG5vdyBzbGlnaHRseSBtb3JlIHdvcmsgZm9yIHdyaXRlcnMpLCBidXQgSSdtIG5v
dCAKY29taW5nIHVwIHdpdGggYW55IHNvbGlkIHJlYXNvbnMgd2h5IGl0IHNob3VsZCBub3QgYmUg
YXBwbGllZCAoYXQgbGVhc3QsIApmb3IgMi4xMyAtIGRvaW5nIGl0IGR1cmluZyBmcmVlemUgZm9y
IDIuMTIgaXMgYSBiaXQgaGFyZGVyIHRvIGp1c3RpZnkpLgoKLS0gCkVyaWMgQmxha2UsIFByaW5j
aXBhbCBTb2Z0d2FyZSBFbmdpbmVlcgpSZWQgSGF0LCBJbmMuICAgICAgICAgICArMS05MTktMzAx
LTMyNjYKVmlydHVhbGl6YXRpb246ICBxZW11Lm9yZyB8IGxpYnZpcnQub3JnCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
