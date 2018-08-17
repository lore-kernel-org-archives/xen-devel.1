From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] rangeset: make inquiry functions tolerate
 NULL inputs
Date: Fri, 17 Aug 2018 11:55:00 +0200
Message-ID: <20180817095500.q67aeuhjqczbuexn@mac>
References: <5B76934B02000078001DF480@prv1-mh.provo.novell.com>
 <20180817092923.4hmev4c75ckreu4c@mac>
 <5B76984B02000078001DF4A8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qfmz=la=citrix.com=prvs=760927a5f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fqbTL-0002co-0E
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 09:55:11 +0000
Content-Disposition: inline
In-Reply-To: <5B76984B02000078001DF4A8@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDM6NDE6MzFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjA4LjE4IGF0IDExOjI5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQXMgc2FpZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsIHRoaXMgaXMgZG9uZSB0byBh
dm9pZCBhbiBleHRyYSBjaGVjayBpbgo+ID4gZ2V0X3BhZ2VfZnJvbV9sMWUgSSBhc3N1bWUsIHNv
IHNob3VsZCB0aGUgZXh0cmEgY2hlY2sgYWxzbyBiZSBkcm9wcGVkCj4gPiBoZXJlPwo+IAo+IEkn
bSBhZnJhaWQgSSBkb24ndCB1bmRlcnN0YW5kOiBJIGluZGVlZCBtZWFuIHRvIGF2b2lkIGFkZGlu
ZyBhCj4gTlVMTCBjaGVjayBpbiBnZXRfcGFnZV9mcm9tX2wxZSgpLiBCdXQgd2hhdCBjaGVjayBh
cmUgeW91IHRoaW5raW5nCj4gb2YgdGhhdCBjb3VsZCBiZSBkcm9wcGVkPyBPciBpbiBvdGhlciB3
b3Jkcywgd2hhdCBpcyAiaGVyZSIgaW4KPiB5b3VyIHJlcGx5PwoKT2gsIEkgdW5kZXJzdGFuZCBu
b3csIHRoaXMgaXMgdG8gcHJldmVudCBhZGRpbmcgYSBjaGVjaywgbm90IHRvIHJlbW92ZQphIGNo
ZWNrIHRoYXQncyBhbHJlYWR5IGluIHRoZSBjb2RlLgoKJ2hlcmUnIG1lYW50IHRoZSBwYXRjaCwg
c2luY2UgSSB3cm9uZ2x5IGFzc3VtZWQgdGhhdCB0aGlzIHdhcyB0bwpyZW1vdmUgYSBjaGVjayB0
aGF0IHdhcyBhbHJlYWR5IGluIHRoZSBjb2RlIGJhc2UuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
