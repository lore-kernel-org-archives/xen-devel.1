From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 3/4] x86/HVM: implement memory read
 caching
Date: Wed, 19 Sep 2018 16:57:49 +0100
Message-ID: <20180919155749.empmqzrzlba4gaom@zion.uk.xensource.com>
References: <5B97BEB202000078001E73FB@prv1-mh.provo.novell.com>
 <5B97BFE702000078001E7410@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2erW-0002AW-1v
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 15:57:58 +0000
Content-Disposition: inline
In-Reply-To: <5B97BFE702000078001E7410@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMDc6MTU6MTlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRW11bGF0aW9uIHJlcXVpcmluZyBkZXZpY2UgbW9kZWwgYXNzaXN0YW5jZSB1c2VzIGEg
Zm9ybSBvZiBpbnN0cnVjdGlvbgo+IHJlLWV4ZWN1dGlvbiwgYXNzdW1pbmcgdGhhdCB0aGUgc2Vj
b25kIChhbmQgYW55IGZ1cnRoZXIpIHBhc3MgdGFrZXMKPiBleGFjdGx5IHRoZSBzYW1lIHBhdGgu
IFRoaXMgaXMgYSB2YWxpZCBhc3N1bXB0aW9uIGFzIGZhciB1c2Ugb2YgQ1BVCj4gcmVnaXN0ZXJz
IGdvZXMgKGFzIHRob3NlIGNhbid0IGNoYW5nZSB3aXRob3V0IGFueSBvdGhlciBpbnN0cnVjdGlv
bgo+IGV4ZWN1dGluZyBpbiBiZXR3ZWVuKSwgYnV0IGlzIHdyb25nIGZvciBtZW1vcnkgYWNjZXNz
ZXMuIEluIHBhcnRpY3VsYXIKPiBpdCBoYXMgYmVlbiBvYnNlcnZlZCB0aGF0IFdpbmRvd3MgbWln
aHQgcGFnZSBvdXQgYnVmZmVycyB1bmRlcm5lYXRoIGFuCj4gaW5zdHJ1Y3Rpb24gY3VycmVudGx5
IHVuZGVyIGVtdWxhdGlvbiAoaGl0dGluZyBiZXR3ZWVuIHR3byBwYXNzZXMpLiBJZgo+IHRoZSBm
aXJzdCBwYXNzIHRyYW5zbGF0ZWQgYSBsaW5lYXIgYWRkcmVzcyBzdWNjZXNzZnVsbHksIGFueSBz
dWJzZXF1ZW50Cj4gcGFzcyBuZWVkcyB0byBkbyBzbyB0b28sIHlpZWxkaW5nIHRoZSBleGFjdCBz
YW1lIHRyYW5zbGF0aW9uLgoKTm90IHN1cmUgSSBmb2xsb3cuIElmIHRoZSBidWZmZXJzIGFyZSBw
YWdlZCBvdXQgYmV0d2VlbiB0d28gcGFzc2VzLCBob3cKd291bGQgY2FjaGluZyB0aGUgdHJhbnNs
YXRpb24gaGVscD8gIFllcyB5b3UgZ2V0IHRoZSBzYW1lIHRyYW5zbGF0aW9uCnJlc3VsdCBidXQg
dGhlIGNvbnRlbnQgb2YgdGhlIGFkZHJlc3MgcG9pbnRlZCB0byBieSB0aGUgdHJhbnNsYXRpb24K
cmVzdWx0IGNvdWxkIGJlIGRpZmZlcmVudCwgcmlnaHQ/CgpXZWkuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
