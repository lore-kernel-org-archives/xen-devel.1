From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] qemu: replace "" with <> in headers
Date: Thu, 22 Mar 2018 21:33:29 +0100
Message-ID: <aba29cf7-637a-c967-9b2f-59060a1c1330__13774.8547051617$1521750821$gmane$org@redhat.com>
References: <1521642402-197739-1-git-send-email-mst@redhat.com>
 <20180321153439.GC3898@localhost.localdomain>
 <20180321175452-mutt-send-email-mst@kernel.org>
 <20180321162203.GE3898@localhost.localdomain>
 <20180322211902-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q6qb=gm=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1ez6uj-0007QB-HO
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 20:34:21 +0000
In-Reply-To: <20180322211902-mutt-send-email-mst@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>, Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Yongbok Kim <yongbok.kim@mips.com>, Michael Roth <mdroth@linux.vnet.ib>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDMvMjAxOCAyMDoyOSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IE9uIFdlZCwg
TWFyIDIxLCAyMDE4IGF0IDA1OjIyOjAzUE0gKzAxMDAsIEtldmluIFdvbGYgd3JvdGU6Cj4+PiBJ
dCdzIGFsbCBzdGlsbCB2ZXJ5IG11Y2ggYSBub24tc3RhbmRhcmQgY29udmVudGlvbiBhbmQgc28g
bGVzcyByb2J1c3QKPj4+IHRoYW4gcHJlZml4aW5nIGZpbGUgbmFtZSB3aXRoIGEgcHJvamVjdC1z
cGVjaWZpeCBwcmVmaXguCj4+IEkndmUgYWx3YXlzIGhhZCB0aGUgaW1wcmVzc2lvbiB0aGF0IGl0
J3MgYnkgZmFyIHRoZSBtb3N0IGNvbW1vbgo+PiBjb252ZW50aW9uLCB0byB0aGUgcG9pbnQgdGhh
dCBJJ2QgYmxpbmRseSBhc3N1bWUgaXQgd2hlbiBqb2luaW5nIGEgbmV3Cj4+IHByb2plY3QuCj4g
Cj4gQW55IGV4YW1wbGVzPwoKR0NDIC0gaHR0cHM6Ly9naXRodWIuY29tL2djYy1taXJyb3IvZ2Nj
L2Jsb2IvbWFzdGVyL2djYy9yZWxvYWQuYwpMaWJ2aXJ0IC0gaHR0cHM6Ly9naXRodWIuY29tL2xp
YnZpcnQvbGlidmlydC9ibG9iL21hc3Rlci9zcmMvdXRpbC92aXJwcm9jZXNzLmMKU0RMIC0gaHR0
cHM6Ly9naXRodWIuY29tL1NETC1taXJyb3IvU0RML2Jsb2IvbWFzdGVyL3NyYy9jb3JlL3VuaXgv
U0RMX3BvbGwuYwoKQW55dGhpbmcgYnV0IExpbnV4IHJlYWxseS4KCkkgZmluZCA8cWVtdS9mb28v
YmFyLmg+IHZlcmJvc2UgYW5kIHVubmVjZXNzYXJ5LiAgVGhlIG9ubHkgYWR2YW50YWdlCm9mIHlv
dXIgcHJvcG9zYWwgaXMgdGhhdCBmaWxlcyBpbmNsdWRlZCBmcm9tIHRoZSBzb3VyY2UgZGlyZWN0
b3J5IHdvdWxkIGJlCmNsZWFybHkgbm90aWNlYWJsZS4gIFRoYXQgc2FpZCwgaXQncyBlYXN5IHRv
IGFkZCBhIGNoZWNrcGF0Y2gucGwgcnVsZSB0aGF0CmRldGVjdHMgd2hlbiAiLi4uLy4uLiIgaXMg
dXNlZCBvbiBhIGZpbGUgbm90IHVuZGVyIGluY2x1ZGUvLgoKUGFvbG8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
