From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
Date: Tue, 23 Apr 2019 11:56:58 +0200
Message-ID: <14e58f7e-305b-9ed9-9217-2b0b489521c7@suse.com>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
 <38C4FE16-299B-4726-9BC2-9AC99D6D1F59@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jhle=SZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hIsAi-0002XV-2D
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 09:57:04 +0000
In-Reply-To: <38C4FE16-299B-4726-9BC2-9AC99D6D1F59@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDQvMjAxOSAxMTo1MCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiAKPiAKPj4gT24gQXBy
IDIwLCAyMDE5LCBhdCA0OjI0IFBNLCBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29t
PiB3cm90ZToKPj4KPj4gSW4gc2NoZWR1bGUoKSwgaWYgd2UgcGljaywgYXMgdGhlIG5leHQgdmNw
dSB0byBydW4gKG5leHQpIHRoZSBzYW1lIG9uZQo+PiB0aGF0IGlzIHJ1bm5pbmcgYWxyZWFkeSAo
cHJldiksIHdlIG5ldmVyIGdldCB0byBjYWxsIGNvbnRleHRfc3dpdGNoKCkuCj4+Cj4+IFdlIGNh
biwgdGhlcmVmb3JlLCBnZXQgcmlkIG9mIGFsbCB0aGUgYGlmYC1zIHRlc3RpbmcgcHJldiBhbmQg
bmV4dCBiZWluZwo+PiBkaWZmZXJlbnQsIHRyYWRpbmcgdGhlbSB3aXRoIGFuIEFTU0VSVCgpIChv
biBBUk0sIHRoZSBBU1NFUlQoKSB3YXMgZXZlbgo+PiBhbHJlYWR5IHRoZXJlISkKPiAKPiBLZWVw
aW5nIGluIG1pbmQgdGhhdCBBU1NFUlQoKSBpcyBtZXJlbHkgYSBkZWJ1Z2dpbmcgYWlkOiBzdXBw
b3NlIHRoYXQgdGVzdGluZyBkaWRu4oCZdCBkaXNjb3ZlciB0aGlzLCBhbmQgYSBidWcgdGhhdCB2
aW9sYXRlZCB0aGlzIGFzc3VtcHRpb24gc2xpcHBlZCBpbnRvIHByb2R1Y3Rpb24uICBXb3VsZCB0
aGUgcGF0Y2hlZCBjb2RlIERUUlQ/CgpUaGUgdW5wYXRjaGVkIGNvZGUgd291bGQgYWxyZWFkeSBk
byBzb21ldGhpbmcgd3Jvbmc6IGl0IHdvdWxkIGNsZWFyCnYtPmlzX3J1bm5pbmcgKHRocm91Z2gg
Y29udGV4dF9zYXZlZCgpKSBmb3IgdGhlIHJ1bm5pbmcgdmNwdSwKcG90ZW50aWFsbHkgbGVhZGlu
ZyB0byBhbGwgc29ydHMgb2Ygd3JvbmcgZGVjaXNpb25zIGluIHRoZSBzY2hlZHVsaW5nCmNvZGUg
bGF0ZXIuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
