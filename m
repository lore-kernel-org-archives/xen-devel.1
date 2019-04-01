From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 17/49] xen/sched: move some per-vcpu
 items to struct sched_item
Date: Mon, 1 Apr 2019 10:45:40 +0200
Message-ID: <1f48f43d-d747-7368-4426-cc9def996eb5@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-18-jgross@suse.com>
 <ad9f514b-7325-0759-0a80-c8195e8c0b64@citrix.com>
 <cd2b85ff-ccc7-e261-a4b5-6a5f56e98e2a@suse.com>
 <05874d79-0470-2895-d231-c56ddd834dde@suse.com>
 <5CA1C63402000078002236F5@prv1-mh.provo.novell.com>
 <3fd55965-52dc-7680-496a-7308ab166818@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7l/E=SD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hAsZc-0004fU-Iw
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 08:45:44 +0000
In-Reply-To: <3fd55965-52dc-7680-496a-7308ab166818@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDQvMjAxOSAxMDoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8wNC8yMDE5
IDA5OjA1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDEuMDQuMTkgYXQgMDc6NTksIDxq
Z3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gT24gMzAvMDMvMjAxOSAxMDo1OSwgSnVlcmdlbiBH
cm9zcyB3cm90ZToKPj4+PiBPbiAyOS8wMy8yMDE5IDIyOjMzLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+PiBJZiBhdCBhbGwgcG9zc2libGUsIEknZCBwcmVmZXIgdG8gc2VlIGFib3V0IGRpc2Vu
dGFuZ2xpbmcgdGhlIGJpdHMgd2hpY2gKPj4+Pj4gYWN0dWFsbHkgbmVlZCBleHRlcm5hbCB1c2Us
IGFuZCBwdXR0aW5nIHRoZW0gaW4gc2NoZWQuaCwgYW5kIG1ha2luZwo+Pj4+PiBzY2hlZC1pZi5o
IHByb3Blcmx5IHByaXZhdGUgdG8gdGhlIHNjaGVkdWxlcnMuICBJIGFjdHVhbGx5IGV2ZW4gc3Rh
cnRlZAo+Pj4+PiBhIGNsZWFudXAgc2VyaWVzIHdoaWNoIG1vdmVkIGFsbCBvZiB0aGUgc2NoZWR1
bGVyIGluZnJhc3RydWN0dXJlIGludG8KPj4+Pj4gY29tbW9uL3NjaGVkLywgYnV0IGZvdW5kIGEg
ZGlzYXBwb2ludGluZyBxdWFudGl0eSBvZiBzY2hlZC1pZi5oIGJlaW5nCj4+Pj4+IHJlZmVyZW5j
ZWQgZXh0ZXJuYWxseS4KPj4+PiBJIGNhbiBhZGQgc29tZXRoaW5nIGxpa2UgdGhhdCB0byBteSBz
ZXJpZXMgaWYgeW91IHdhbnQuIFNvOgo+Pj4+Cj4+Pj4gLSBtb3Zpbmcgc2NoZWR1bGUuYywgc2No
ZWRfKi5jIGFuZCBjcHVwb29sLmMgdG8gY29tbW9uL3NjaGVkLwo+Pj4+IC0gbW92ZSBzdHVmZiBm
cm9tIHNjaGVkLWlmLmggdG8gc2NoZWQuaCBpZiBuZWVkZWQgb3V0c2lkZSBvZgo+Pj4+ICAgY29t
bW9uL3NjaGVkLwo+Pj4+IC0gbW92ZSBzY2hlZC1pZi5oIHRvIGNvbW1vbi9zY2hlZC8KPj4+IFF1
ZXN0aW9ucyB0byBlc3BlY2lhbGx5IHRoZSBzY2hlZHVsZXIgbWFpbnRhaW5lcnMgYW5kICJ0aGUg
UkVTVCI6IHNob3VsZAo+Pj4gd2UgbW92ZSB0aGUgc2NoZWR1bGVyIHN0dWZmIHRvIHhlbi9jb21t
b24vc2NoZWQvIG9yIHdvdWxkIC94ZW4vc2NoZWQvIGJlCj4+PiBtb3JlIGFwcHJvcHJpYXRlPwo+
Pj4KPj4+IE1heWJlIGl0IHdvdWxkIGJlIHdvcnRod2hpbGUgdG8gbW92ZSBlLmcuIHRoZSBjb250
ZXh0IHN3aXRjaGluZyBmcm9tCj4+PiB4ZW4vYXJjaC8qL2RvbWFpbi5jIHRvIHhlbi9zY2hlZC9j
b250ZXh0XzxhcmNoPi5jPyBJIHRoaW5rIHRoaXMgY29kZSBpcwo+Pj4gcmF0aGVyIHNjaGVkdWxl
ciByZWxhdGVkIGFuZCBtb3ZpbmcgaXQgdG8gdGhlIHNjaGVkIGRpcmVjdG9yeSBtaWdodCBoZWxw
Cj4+PiBoaWRpbmcgc29tZSBzY2hlZHVsZXIgaW50ZXJuYWxzIGZyb20gb3RoZXIgc291cmNlcywg
ZXNwZWNpYWxseSB3aXRoIG15Cj4+PiBjb3JlIHNjaGVkdWxpbmcgc2VyaWVzLiBJTU8gdGhpcyB3
b3VsZCBtYWtlIHRoZSB4ZW4vc2NoZWQvIGRpcmVjdG9yeSB0aGUKPj4+IHByZWZlcnJlZCBvbmUu
Cj4+IEZXSVcsIEkgZG9uJ3QgcmVhbGx5IG1pbmQgc3VjaCBhIG1vdmUgYXMgbG9uZyBhcyBpdCB3
b24ndCByZXN1bHQgaW4KPj4gdGhlbiBoYXZpbmcgdG8gZXhwb3NlIHZhcmlvdXMgYXJjaC1pbnRl
cm5hbHMganVzdCB0byBtYWtlIHRoZW0KPj4gdXNhYmxlIGZyb20geGVuL3NjaGVkL2NvbnRleHRf
PGFyY2g+LmMgKG9yIHdoYXRldmVyIGl0J3MgZ29pbmcKPj4gdG8gYmUgbmFtZWQgLSB0aGUgbmFt
ZSBpcyBhIGxpdHRsZSBsb25naXNoIGZvciBteSB0YXN0ZSkuCj4+Cj4+IEJ1dCBtYXkgSSByZWNv
bW1lbmQgbm90IHRvIGRvIHRvbyBtYW55IHRoaW5ncyBhbGwgaW4gb25lIGdvPwo+IAo+IFdoaWxl
IEkgZGlkIHN1Z2dlc3QgdGhpcyBvcmlnaW5hbGx5LCBJIHRvbyBhbSBhIGxpdHRsZSB3YXJ5IGFi
b3V0IHRoZQo+IHNjb3BlIGNyZWVwLgo+IAo+IElmIG1vdmluZyBldmVyeXRoaW5nIGlzIHRvbyBt
dWNoLCBjYW4gd2UgYXQgbGVhc3QgdHJ5IHRvIG5vdCBtYWtlIHRoZQo+IHNjaGVkLWlmLmggc2l0
dWF0aW9uIGFueSB3b3JzZSB0aGFuIGl0IGN1cnJlbnRseSBpcy4KCk9rYXksIEknbGwgbW92ZSB0
aGUgc2NoZWRfaXRlbSBzdHVmZiBpbnRvIHNjaGVkLmggdGhlbi4gSW4gY2FzZSBhIGxhdGVyCmNs
ZWFudXAgc3VjY2VlZHMgaW4gbWFraW5nIGl0IHNjaGVkdWxlciBwcml2YXRlIGl0IGNhbiBiZSBt
b3ZlZCBhd2F5CmFnYWluLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
