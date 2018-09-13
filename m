From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] pass-through: adjust pIRQ migration
Date: Thu, 13 Sep 2018 02:52:17 -0600
Message-ID: <5B9A254102000078001E814B@prv1-mh.provo.novell.com>
References: <5B9678B402000078001E6CD6@prv1-mh.provo.novell.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D191301933@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jl0+=l3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g0NMN-0007xC-0Z
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 08:52:23 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D191301933@SHSMSX101.ccr.corp.intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kevin Tian <kevin.tian@intel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA5LjE4IGF0IDA3OjU2LCA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOgo+
PiAgRnJvbTogSmFuIEJldWxpY2ggW21haWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDog
TW9uZGF5LCBTZXB0ZW1iZXIgMTAsIDIwMTggOTo1OSBQTQo+PiAKPj4gRm9yIG9uZSBpdCBpcyBx
dWl0ZSBwb2ludGxlc3MgdG8gaXRlcmF0ZSBvdmVyIGFsbCBwSVJRLXMgdGhlIGRvbWFpbiBoYXMK
Pj4gd2hlbiBqdXN0IG9uZSBpcyBiZWluZyBhZGp1c3RlZC4gSW50cm9kdWNlIGh2bV9taWdyYXRl
X3BpcnEoKS4KPiAKPiBpdCdzIG1pZ3JhdGVfcGlycSBiZWluZyBpbnRyb2R1Y2VkIGhlcmUuCgpX
ZWxsLCB5ZXMgYW5kIG5vOiBBcyBhIHN0YXRpYyBmdW5jdGlvbiwgaXQgc2hvdWxkIGhhdmUgYmVl
biBuYW1lZAptaWdyYXRlX3BpcnEoKSBhbHJlYWR5IGJlZm9yZS4gVGhlIHN0YXRlbWVudCBhYm92
ZSBpcyBhYm91dCB0aGlzCmJlY29taW5nIGFuIGV4dGVybmFsbHkgYWNjZXNzaWJsZSBmdW5jdGlv
bi4gSSdsbCBhZGQgImV4dGVybmFsbHkKYWNjZXNzaWJsZSIgdG8gdGhlIGRlc2NyaXB0aW9uLgoK
Pj4gQWRkaXRpb25hbGx5IGl0IGlzIGJvZ3VzIHRvIG1pZ3JhdGUgdGhlIHBJUlEgdG8gYSB2Q1BV
IGRpZmZlcmVudCBmcm9tCj4+IHRoZSBvbmUgdGhlIGV2ZW50IGlzIHN1cHBvc2VkIHRvIGJlIHBv
c3RlZCB0byAtIGlmIGFueXRoaW5nLCBpdCBtaWdodCBiZQo+PiB3b3J0aCBjb25zaWRlcmluZyBu
b3QgdG8gbWlncmF0ZSB0aGUgcElSUSBhdCBhbGwgaW4gdGhlIHBvc3RpbmcgY2FzZS4KPj4gCj4+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBSZXZp
ZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpUaGFua3MuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
