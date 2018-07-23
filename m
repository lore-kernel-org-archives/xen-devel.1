From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 3/6] x86/HVM: implement memory read caching
Date: Mon, 23 Jul 2018 16:45:11 +0100
Message-ID: <20180723154511.GB25077@deinos.phlegethon.org>
References: <5B506A6E02000078001D5D17@prv1-mh.provo.novell.com>
 <5B506C8502000078001D5D52@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=dgdj=kh=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1fhd1j-0000dk-DF
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 15:45:35 +0000
Content-Disposition: inline
In-Reply-To: <5B506C8502000078001D5D52@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpBdCAwNDo0OCAtMDYwMCBvbiAxOSBKdWwgKDE1MzE5NzU3MTcpLCBKYW4gQmV1bGljaCB3
cm90ZToKPiBFbXVsYXRpb24gcmVxdWlyaW5nIGRldmljZSBtb2RlbCBhc3Npc3RhbmNlIHVzZXMg
YSBmb3JtIG9mIGluc3RydWN0aW9uCj4gcmUtZXhlY3V0aW9uLCBhc3N1bWluZyB0aGF0IHRoZSBz
ZWNvbmQgKGFuZCBhbnkgZnVydGhlcikgcGFzcyB0YWtlcwo+IGV4YWN0bHkgdGhlIHNhbWUgcGF0
aC4gVGhpcyBpcyBhIHZhbGlkIGFzc3VtcHRpb24gYXMgZmFyIHVzZSBvZiBDUFUKPiByZWdpc3Rl
cnMgZ29lcyAoYXMgdGhvc2UgY2FuJ3QgY2hhbmdlIHdpdGhvdXQgYW55IG90aGVyIGluc3RydWN0
aW9uCj4gZXhlY3V0aW5nIGluIGJldHdlZW4pLCBidXQgaXMgd3JvbmcgZm9yIG1lbW9yeSBhY2Nl
c3Nlcy4gSW4gcGFydGljdWxhcgo+IGl0IGhhcyBiZWVuIG9ic2VydmVkIHRoYXQgV2luZG93cyBt
aWdodCBwYWdlIG91dCBidWZmZXJzIHVuZGVybmVhdGggYW4KPiBpbnN0cnVjdGlvbiBjdXJyZW50
bHkgdW5kZXIgZW11bGF0aW9uIChoaXR0aW5nIGJldHdlZW4gdHdvIHBhc3NlcykuIElmCj4gdGhl
IGZpcnN0IHBhc3MgdHJhbnNsYXRlZCBhIGxpbmVhciBhZGRyZXNzIHN1Y2Nlc3NmdWxseSwgYW55
IHN1YnNlcXVlbnQKPiBwYXNzIG5lZWRzIHRvIGRvIHNvIHRvbywgeWllbGRpbmcgdGhlIGV4YWN0
IHNhbWUgdHJhbnNsYXRpb24uCj4gCj4gSW50cm9kdWNlIGEgY2FjaGUgKHVzZWQganVzdCBieSBn
dWVzdCBwYWdlIHRhYmxlIGFjY2Vzc2VzIGZvciBub3cpIHRvCj4gbWFrZSBzdXJlIGFib3ZlIGRl
c2NyaWJlZCBhc3N1bXB0aW9uIGhvbGRzLiBUaGlzIGlzIGEgdmVyeSBzaW1wbGlzdGljCj4gaW1w
bGVtZW50YXRpb24gZm9yIG5vdzogT25seSBleGFjdCBtYXRjaGVzIGFyZSBzYXRpc2ZpZWQgKG5v
IG92ZXJsYXBzIG9yCj4gcGFydGlhbCByZWFkcyBvciBhbnl0aGluZykuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKRm9yIHRoZSBjaGFuZ2UgdG8g
c2hhZG93IGNvZGU6CgpBY2tlZC1ieTogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
