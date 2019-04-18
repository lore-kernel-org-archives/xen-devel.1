From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-next 8/9] xen: Introduce HAS_M2P config
 and use to protect mfn_to_gmfn call
Date: Thu, 18 Apr 2019 16:09:21 +0100
Message-ID: <20539440-8014-cd4d-3c95-e88b53bcce32@arm.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-9-julien.grall@arm.com>
 <5C891FA4020000780021E3A0@prv1-mh.provo.novell.com>
 <5b02c8e1-5ff6-a1a1-e1dd-650123d66006@arm.com>
 <5C8A0903020000780021E662@prv1-mh.provo.novell.com>
 <fefbf936-c28d-8ae9-0560-8c0b0d6bc75a@arm.com>
 <20190418114627.GC30543@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z9nG=SU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hH8fH-0002jY-2d
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 15:09:27 +0000
In-Reply-To: <20190418114627.GC30543@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxOC8wNC8yMDE5IDEyOjQ2LCBXZWkgTGl1IHdyb3RlOgo+IE9uIFdlZCwgQXByIDE3
LCAyMDE5IGF0IDA2OjQyOjQ3UE0gKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+
Cj4+IEBXZWksIEBJYW46IERvIHlvdSBoYXZlIGFueSBpbnB1dD8KPiAKPiBTb3JyeSBJIGhhdmVu
J3QgYmVlbiBmb2xsb3dpbmcgdGhpcyBjbG9zZWx5LCBidXQgc2hvdWxkbid0IHdlIGZpeCB0aGUK
PiBpbnRlcmZhY2UgdG8gcmV0dXJuIGdmbiBpbnN0ZWFkPyBBbmQgdGhlbiB0aGUgbWFwcGluZyBv
ZiBpdCBzaG91bGQKPiBpbnRlcnByZXQgdGhlIHZhbHVlIHByb3Blcmx5IHBlciBndWVzdCB0eXBl
LgoKV2UgYWxyZWFkeSByZXR1cm4gYSBHRk4gdG9kYXkuIFRoZSBwcm9ibGVtIGlzIHdlIG9ubHkg
aG9sZCBhbiBNRk4gYXQgdGhhdCB0aW1lLgoKQXQgdGhlIG1vbWVudCwgd2UgcmVseSBvbiB0aGUg
TTJQIHRvIGZpbmQgdGhlIGNvcnJlc3BvbmRpbmcgR0ZOLiBBcyB3ZSBkb24ndCAKaGF2ZSBhbiBN
MlAgb24gQXJtLCB3ZSB3b3VsZCBoYXZlIHRvIHN0b3JlIHRoZSBhc3NvY2lhdGVkIEdGTi4KCkJ1
dCBhbGwgdGhpcyBsb2dpYyBpcyBhIGJpdCBicm9rZW4uIEl0IHJlbGllcyBvbiB0aGUgdG9vbHN0
YWNrIChvciB0aGUgZ3Vlc3QpIHRvIApoYXZlIG1hcHBlZCB0aGUgc2hhcmVkIGluZm8gZnJhbWUg
aW4gdGhlIFAyTSB1c2luZyB0aGUgcGh5c21hcCBoeXBlcnZpc29yIHdpdGggClhFTk1BUFNQQUNF
X3NoYXJlZF9pbmZvIGJlZm9yZWhhbmQuIFRoaXMgaXMgYWxzbyByYWN5IGFzIHlvdSBtYXkgcmV0
dXJuIGEgR0ZOIAp0aGF0IHdhcyB1bm1hcHBlZC9yZW1hcHBlZCB0byBzb21ldGhpbmcgZWxzZSBi
ZWZvcmUgdGhlIHRvb2xzdGFjayBoYXMgYSBjaGFuY2UgCnRvIG1hcCBpbiBpdHMgYWRkcmVzcyBz
cGFjZSB0aGUgcGFnZS4KClRoZSBjb3JyZWN0IHNvbHV0aW9uIHdvdWxkIGJlIHRvIHBoYXNlIG91
dCB0aGUgZmllbGQgc2hhcmVkX2luZm9fZnJhbWUgYW5kIHVzZSAKWEVOTUVNX2FjcXVpcmVfcmVz
b3VyY2UgaW5zdGVhZC4gSG93ZXZlciwgdGhpcyByZXF1aXJlcyB0aGUgYXNzb2NpYXRlZCBpb2N0
bCB0byAKYmUgaW1wbGVtZW50ZWQgaW4gTGludXguCgo+IAo+IEkgZG9uJ3Qgc2VlIGltbWVkaWF0
ZWx5IGhvdyB1c2VyIHNwYWNlIHByb2dyYW0gd2lsbCBuZWVkIHRvIGFjY2VzcyB0aGlzCj4gcGFn
ZSBmb3IgYXV0b3RyYW5zbGF0ZWQgZ3Vlc3RzIHRob3VnaC4KCklmIHRoZXJlIGFyZSBubyB1c2Us
IHRoZW4gSSBhbSBub3QgY29udmluY2VkIGl0IGlzIHdvcnRoIHRyeWluZyB0byBtYWtlIApzaGFy
ZWRfaW5mb19mcmFtZSB3b3JraW5nIG9uIEFybS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
