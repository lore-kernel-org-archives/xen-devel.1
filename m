From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC 17/49] xen/sched: move some per-vcpu
 items to struct sched_item
Date: Mon, 1 Apr 2019 09:26:39 +0100
Message-ID: <3fd55965-52dc-7680-496a-7308ab166818@citrix.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-18-jgross@suse.com>
 <ad9f514b-7325-0759-0a80-c8195e8c0b64@citrix.com>
 <cd2b85ff-ccc7-e261-a4b5-6a5f56e98e2a@suse.com>
 <05874d79-0470-2895-d231-c56ddd834dde@suse.com>
 <5CA1C63402000078002236F5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eSOb=SD=citrix.com=prvs=987a6ddbb=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hAsHQ-0002Qb-Kq
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 08:26:56 +0000
In-Reply-To: <5CA1C63402000078002236F5@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDQvMjAxOSAwOTowNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDEuMDQuMTkg
YXQgMDc6NTksIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAzMC8wMy8yMDE5IDEwOjU5
LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gT24gMjkvMDMvMjAxOSAyMjozMywgQW5kcmV3IENv
b3BlciB3cm90ZToKPj4+PiBJZiBhdCBhbGwgcG9zc2libGUsIEknZCBwcmVmZXIgdG8gc2VlIGFi
b3V0IGRpc2VudGFuZ2xpbmcgdGhlIGJpdHMgd2hpY2gKPj4+PiBhY3R1YWxseSBuZWVkIGV4dGVy
bmFsIHVzZSwgYW5kIHB1dHRpbmcgdGhlbSBpbiBzY2hlZC5oLCBhbmQgbWFraW5nCj4+Pj4gc2No
ZWQtaWYuaCBwcm9wZXJseSBwcml2YXRlIHRvIHRoZSBzY2hlZHVsZXJzLiAgSSBhY3R1YWxseSBl
dmVuIHN0YXJ0ZWQKPj4+PiBhIGNsZWFudXAgc2VyaWVzIHdoaWNoIG1vdmVkIGFsbCBvZiB0aGUg
c2NoZWR1bGVyIGluZnJhc3RydWN0dXJlIGludG8KPj4+PiBjb21tb24vc2NoZWQvLCBidXQgZm91
bmQgYSBkaXNhcHBvaW50aW5nIHF1YW50aXR5IG9mIHNjaGVkLWlmLmggYmVpbmcKPj4+PiByZWZl
cmVuY2VkIGV4dGVybmFsbHkuCj4+PiBJIGNhbiBhZGQgc29tZXRoaW5nIGxpa2UgdGhhdCB0byBt
eSBzZXJpZXMgaWYgeW91IHdhbnQuIFNvOgo+Pj4KPj4+IC0gbW92aW5nIHNjaGVkdWxlLmMsIHNj
aGVkXyouYyBhbmQgY3B1cG9vbC5jIHRvIGNvbW1vbi9zY2hlZC8KPj4+IC0gbW92ZSBzdHVmZiBm
cm9tIHNjaGVkLWlmLmggdG8gc2NoZWQuaCBpZiBuZWVkZWQgb3V0c2lkZSBvZgo+Pj4gICBjb21t
b24vc2NoZWQvCj4+PiAtIG1vdmUgc2NoZWQtaWYuaCB0byBjb21tb24vc2NoZWQvCj4+IFF1ZXN0
aW9ucyB0byBlc3BlY2lhbGx5IHRoZSBzY2hlZHVsZXIgbWFpbnRhaW5lcnMgYW5kICJ0aGUgUkVT
VCI6IHNob3VsZAo+PiB3ZSBtb3ZlIHRoZSBzY2hlZHVsZXIgc3R1ZmYgdG8geGVuL2NvbW1vbi9z
Y2hlZC8gb3Igd291bGQgL3hlbi9zY2hlZC8gYmUKPj4gbW9yZSBhcHByb3ByaWF0ZT8KPj4KPj4g
TWF5YmUgaXQgd291bGQgYmUgd29ydGh3aGlsZSB0byBtb3ZlIGUuZy4gdGhlIGNvbnRleHQgc3dp
dGNoaW5nIGZyb20KPj4geGVuL2FyY2gvKi9kb21haW4uYyB0byB4ZW4vc2NoZWQvY29udGV4dF88
YXJjaD4uYz8gSSB0aGluayB0aGlzIGNvZGUgaXMKPj4gcmF0aGVyIHNjaGVkdWxlciByZWxhdGVk
IGFuZCBtb3ZpbmcgaXQgdG8gdGhlIHNjaGVkIGRpcmVjdG9yeSBtaWdodCBoZWxwCj4+IGhpZGlu
ZyBzb21lIHNjaGVkdWxlciBpbnRlcm5hbHMgZnJvbSBvdGhlciBzb3VyY2VzLCBlc3BlY2lhbGx5
IHdpdGggbXkKPj4gY29yZSBzY2hlZHVsaW5nIHNlcmllcy4gSU1PIHRoaXMgd291bGQgbWFrZSB0
aGUgeGVuL3NjaGVkLyBkaXJlY3RvcnkgdGhlCj4+IHByZWZlcnJlZCBvbmUuCj4gRldJVywgSSBk
b24ndCByZWFsbHkgbWluZCBzdWNoIGEgbW92ZSBhcyBsb25nIGFzIGl0IHdvbid0IHJlc3VsdCBp
bgo+IHRoZW4gaGF2aW5nIHRvIGV4cG9zZSB2YXJpb3VzIGFyY2gtaW50ZXJuYWxzIGp1c3QgdG8g
bWFrZSB0aGVtCj4gdXNhYmxlIGZyb20geGVuL3NjaGVkL2NvbnRleHRfPGFyY2g+LmMgKG9yIHdo
YXRldmVyIGl0J3MgZ29pbmcKPiB0byBiZSBuYW1lZCAtIHRoZSBuYW1lIGlzIGEgbGl0dGxlIGxv
bmdpc2ggZm9yIG15IHRhc3RlKS4KPgo+IEJ1dCBtYXkgSSByZWNvbW1lbmQgbm90IHRvIGRvIHRv
byBtYW55IHRoaW5ncyBhbGwgaW4gb25lIGdvPwoKV2hpbGUgSSBkaWQgc3VnZ2VzdCB0aGlzIG9y
aWdpbmFsbHksIEkgdG9vIGFtIGEgbGl0dGxlIHdhcnkgYWJvdXQgdGhlCnNjb3BlIGNyZWVwLgoK
SWYgbW92aW5nIGV2ZXJ5dGhpbmcgaXMgdG9vIG11Y2gsIGNhbiB3ZSBhdCBsZWFzdCB0cnkgdG8g
bm90IG1ha2UgdGhlCnNjaGVkLWlmLmggc2l0dWF0aW9uIGFueSB3b3JzZSB0aGFuIGl0IGN1cnJl
bnRseSBpcy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
