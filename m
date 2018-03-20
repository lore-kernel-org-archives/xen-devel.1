From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [Qemu-devel] [PATCH] qemu: include generated files
 with <> and not ""
Date: Tue, 20 Mar 2018 17:33:42 +0100
Message-ID: <b068cb91-b8ba-175c-40f5-a7c9c8163575__18902.5832027712$1521563565$gmane$org@weilnetz.de>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=8vht=gk=weilnetz.de=sw@srs-us1.protection.inumbo.net>)
 id 1eyKCx-0001E9-HZ
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 16:33:55 +0000
In-Reply-To: <1521510562-529051-1-git-send-email-mst@redhat.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Alexander Graf <agraf@suse.de>, Markus Armbruster <armbru@redhat.com>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>, Yongbok Kim <yongbok.kim@mips.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>
List-Id: xen-devel@lists.xenproject.org

QW0gMjAuMDMuMjAxOCB1bSAwMjo1NCBzY2hyaWViIE1pY2hhZWwgUy4gVHNpcmtpbjoKPiBRRU1V
IGNvZGluZyBzdHlsZSBhdCB0aGUgbW9tZW50IGFza3MgZm9yIGFsbCBub24tc3lzdGVtCj4gaW5j
bHVkZSBmaWxlcyB0byBiZSB1c2VkIHdpdGggI2luY2x1ZGUgImZvby5oIi4KPiBIb3dldmVyIHRo
aXMgcnVsZSBhY3R1YWxseSBkb2VzIG5vdCBtYWtlIHNlbnNlIGFuZAo+IGNyZWF0ZXMgaXNzdWVz
IGZvciB3aGVuIHRoZSBpbmNsdWRlZCBmaWxlIGlzIGdlbmVyYXRlZC4KPiAKPiBJbiBDLCBpbmNs
dWRlICJmaWxlIiBtZWFucyBsb29rIGluIGN1cnJlbnQgZGlyZWN0b3J5LAo+IHRoZW4gb24gaW5j
bHVkZSBzZWFyY2ggcGF0aC4gQ3VycmVudCBkaXJlY3RvcnkgaGVyZQo+IG1lYW5zIHRoZSBzb3Vy
Y2UgZmlsZSBkaXJlY3RvcnkuCj4gQnkgY29tcGFyaXNvbiBpbmNsdWRlIDxmaWxlPiBtZWFucyBs
b29rIG9uIGluY2x1ZGUgc2VhcmNoIHBhdGguCgoKSGVsbG8gTWljaGFlbCwKCnRoZSBjb21waWxl
ciAob3IgdG8gYmUgbW9yZSBwcmVjaXNlIHRoZSBwcmVwcm9jZXNzb3IpIHdvcmtzIGFzIHlvdQpk
ZXNjcmliZSBpdCwgc28gdGVjaG5pY2FsbHkgYWxsIGluY2x1ZGUgZmlsZXMgd2hpY2ggYXJlIG9u
bHkgZm91bmQgYnkKc2VhcmNoaW5nIHRoZSBpbmNsdWRlIHBhdGhzIHdvdWxkIGJlIGZvdW5kIGZh
c3RlciB3aXRoIDw+IHRoYW4gd2l0aCAiIjoKdGhlIHVuc3VjY2Vzc2Z1bCBzZWFyY2ggcmVsYXRp
dmUgdG8gdGhlIHNvdXJjZSBmaWxlIGRpcmVjdG9yeSB3b3VsZCBiZQpvbWl0dGVkLiBQcmFjdGlj
YWxseSB0aGlzIHdpbGwgbm90IHNhdmUgbXVjaCBidWlsZCB0aW1lIGJlY2F1c2Ugb2YKY2FjaGlu
ZyBlZmZlY3RzLiBTbyB0aGUgc3VnZ2VzdGVkIGNoYW5nZSBpcyBub3QgcmVxdWlyZWQgdG8gZ2V0
IGZhc3RlcgpidWlsZCBzcGVlZC4KClVzaW5nIDw+IGZvciBzeXN0ZW0gaW5jbHVkZSBmaWxlcyBh
bmQgIiIgZm9yIGxvY2FsIGluY2x1ZGUgZmlsZXMgaXMgYQpjb252ZW50aW9uLCBhbmQgYXMgZmFy
IGFzIEkga25vdyBtb3N0IHByb2plY3RzIGFkaGVyZSB0byB0aGF0CmNvbnZlbnRpb24uIFNvIGRv
ZXMgUUVNVSBjdXJyZW50bHkuIFN1Y2ggY29udmVudGlvbnMgYXJlIG5vdCBvbmx5CmltcG9ydGFu
dCBmb3IgaHVtYW5zLCBidXQgYWxzbyBmb3IgdG9vbHMuIFRoZXJlIGFyZSBtb3JlIHRvb2xzIHRo
YW4gdGhlCkMgcHJlcHJvY2Vzc29yIHdoaWNoIGhhbmRsZSA8PiBhbmQgIiIgZGlmZmVyZW50bHku
IEZvciBleGFtcGxlIHRoZSBHTlUKY29tcGlsZXIgdXNlcyAtTUQgb3IgLU1NRCB0byBhdXRvbWF0
aWNhbGx5IGdlbmVyYXRlIGRlcGVuZGVuY3kgcnVsZXMgZm9yCm1ha2UuIFdoaWxlIC1NRCBnZW5l
cmF0ZXMgZGVwZW5kZW5jaWVzIHRvIGFsbCBpbmNsdWRlIGZpbGVzLCAtTU1EIGRvZXMKc28gb25s
eSBmb3IgdXNlciBpbmNsdWRlIGZpbGVzLCBidXQgbm90IGZvciBzeXN0ZW0gaW5jbHVkZSBmaWxl
cy4gInVzZXIiCmFuZCAic3lzdGVtIiBtZWFucyB0aGUgZGlmZmVyZW50IGZvcm1zIGhvdyBpbmNs
dWRlIHN0YXRlbWVudHMgYXJlCndyaXR0ZW4uIFFFTVUgc3RpbGwgc2VlbXMgdG8gdXNlIC1NTUQ6
CgpydWxlcy5tYWs6UUVNVV9ER0ZMQUdTICs9IC1NTUQgLU1QIC1NVCAkQCAtTUYgJChARCkvJCgq
RikuZAoKT3RoZXIgdG9vbHMgbGlrZSBzdGF0aWMgY29kZSBhbmFseXNlcnMgY291bGQgcmVzdHJp
Y3QgdGhlaXIgd2FybmluZyBhbmQKZXJyb3IgbWVzc2FnZXMgdG8gdXNlciBpbmNsdWRlIGZpbGVz
IGFuZCBpZ25vcmUgcHJvYmxlbXMgaW4gc3lzdGVtCmluY2x1ZGUgZmlsZXMuCgpWZXJ5IGxhcmdl
IHByb2plY3RzIG9mdGVuIHNwbGl0IGluIHN1YiBwcm9qZWN0cywgbWF5YmUgb25lIG9mIHRoZW0K
ZGVzY3JpYmluZyB0aGUgQVBJLiBUaGVuIHRoYXQgQVBJIGhlYWRlcnMgYXJlIHNpbWlsYXIgdG8g
c3lzdGVtIGhlYWRlcnMKYW5kIGNhbiBiZSBpbmNsdWRlZCB1c2luZyA8PiwgYWx0aG91Z2ggdGhl
eSBzdGlsbCBiZWxvbmcgdG8gdGhlIHNhbWUKbGFyZ2VyIHByb2plY3QuIERvIHdlIGhhdmUgYSBz
dGFibGUgUUVNVSBBUEkgZGVzY3JpYmVkIGluIGEgKHNtYWxsKQpudW1iZXIgb2YgaW5jbHVkZSBm
aWxlcyB3aGljaCB0eXBpY2FsbHkgZG8gbm90IGNoYW5nZT8gSWYgeWVzLCB0aGVuCnRob3NlIGlu
Y2x1ZGUgZmlsZXMgY291bGQgYmUgaW5jbHVkZWQgdXNpbmcgPD4gYmVjYXVzZSB3ZSBkb24ndCBu
ZWVkCnRoZW0gaW4gZGVwZW5kZW5jeSBsaXN0cyBvciBpbiBzdGF0aWMgY29kZSBhbmFseXNpcyBy
ZXBvcnRzLgoKRm9yIGFsbCBvdGhlciBRRU1VIGluY2x1ZGUgZmlsZXMsIEknZCBzdGljayB0byB1
c2luZyAiIi4KClJlZ2FyZHMKU3RlZmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
