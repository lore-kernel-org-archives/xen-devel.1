From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 4/4] xen: use per-vcpu TSS and stacks
	for pv domains
Date: Wed, 10 Jan 2018 11:53:35 +0100
Message-ID: <4c27f409-9783-82cb-966e-dcae43f3ddc1@suse.com>
References: <20180109142700.12028-1-jgross@suse.com>
 <20180109142700.12028-5-jgross@suse.com>
 <3430712a-6b57-fd55-5cf0-727f9817d7da@citrix.com>
 <17111fe9-68d8-5082-385c-caa87e14d6eb@suse.com>
 <5d67a75de9f14baaa48d71a5dcda5720@AMSPEX02CL02.citrite.net>
 <84daf496-aae7-3f14-16f4-b0c600347ef8@suse.com>
 <ce0f9f83-2f5e-c236-bb3e-8f77915f92b1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=y1i6=ef=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eZE0v-0002AP-Q1
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 10:53:45 +0000
In-Reply-To: <ce0f9f83-2f5e-c236-bb3e-8f77915f92b1@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDEvMTggMTE6NDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDkvMDEvMTggMTk6
MzksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA5LzAxLzE4IDIwOjEzLCBBbmRyZXcgQ29v
cGVyIHdyb3RlOgo+Pj4gKHNvcnJ5IGZvciB0aGUgdG9wLXBvc3QuIEknbSBvbiBteSBwaG9uZSkg
Cj4+Pgo+Pj4gSSBjYW4gc2VlIHlvdSBhcmUgdXNpbmcgbHRyLCBidXQgSSBkb24ndCBzZWUgYW55
d2hlcmUgd2hlcmUgd2hlcmUgeW91IGFyZSBjaGFuZ2luZyB0aGUgY29udGVudCBvbiB0aGUgVFNT
LCBvciB0aGUgdG9wLW9mLXN0YWNrIGNvbnRlbnQuCj4+IFRoZSBwZXItdmNwdSBUU1MgaXMgYWxy
ZWFkeSBpbml0aWFsaXplZCB3aXRoIHRoZSBjb3JyZWN0IHN0YWNrCj4+IGFkZHJlc3Nlcywgc28g
aXQgZG9lc24ndCBoYXZlIHRvIGJlIG1vZGlmaWVkIGxhdGVyLgo+Pgo+Pj4gSXQgaXMgdmVyeSBj
b21wbGljYXRlZCB0byBzYWZlbHkgc3dpdGNoIElTVCBzdGFja3Mgd2hlbiB5b3UgbWlnaHQgYmUg
dGFraW5nIGludGVycnVwdHMuCj4+IFVzaW5nIExUUiB3aXRoIGEgbmV3IFRTUyB3aXRoIGJvdGgg
c3RhY2sgYXJlYXMgbWFwcGVkIChvbGQgYW5kIG5ldykKPj4gc2hvdWxkIHdvcmssIHJpZ2h0Pwo+
IAo+IFRoZSB0b3Atb2Ytc3RhY2sgYmxvY2sgaGFzIHBjcHUgaW5mb3JtYXRpb24gb24gaXQsIGlu
Y2x1ZGluZwo+IHNtcF9wcm9jZXNzb3JfaWQoKSBhbmQgcGVydmNwdV9vZmZzZXQuwqAgU3dpdGNo
aW5nIHRoZSBjcjQgc2hhZG93IHdpdGhvdXQKPiBoaXR0aW5nIGFuIGFzc2VydCBpcyB0cmlja3ks
IGFuZCB3YXMgbGVmdCB3aXRoIGEgcmF0aGVyIGxhcmdlIFJGQy9UT0RPCj4gaW4gbXkgcHJlLWth
aXNlciBzZXJpZXMuCj4gCj4gVGhlIHN5c2NhbGwgc3R1YnMgY29udGFpbiBhYnNvbHV0ZSBzdGFj
ayByZWZlcmVuY2VzIGluIHRoZW0sIHNvIGF0IGEKPiBtaW5pbXVtIHRoZXkgYWxzbyBuZWVkIHJl
d3JpdGluZyBvbiBjb250ZXh0IHN3aXRjaC4KCkFhaCwgb2theS4gVGhpcyBpcyB0aGUgaW5mb3Jt
YXRpb24gSSB3YXMgYWZ0ZXIuCgpTbyBJIG5lZWQgdG8gbG9vayBhZnRlciBzdHJ1Y3QgY3B1X2lu
Zm8gYW5kIHRoZSBzeXNjYWxsIHN0dWJzIG5leHQuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
