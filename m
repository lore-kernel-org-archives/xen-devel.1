From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/5] iommu: introduce dom0-iommu option
Date: Thu, 02 Aug 2018 02:23:23 -0600
Message-ID: <5B62BF7B02000078001DA2F8@prv1-mh.provo.novell.com>
References: <20180801110340.67695-1-roger.pau@citrix.com>
 <20180801110340.67695-3-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912915CF@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zvpq=kr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fl8tL-0004zA-0o
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 08:23:27 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D1912915CF@SHSMSX101.ccr.corp.intel.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA4LjE4IGF0IDA5OjQ2LCA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOgo+
PiAgRnJvbTogUm9nZXIgUGF1IE1vbm5lIFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5jb21dCj4+
IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDEsIDIwMTggNzowNCBQTQo+PiAtLS0gYS9kb2NzL21p
c2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93bgo+PiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1h
bmQtbGluZS5tYXJrZG93bgo+PiBAQCAtMTE1MCwxMiArMTE1MCwxOCBAQCBkZXRlY3Rpb24gb2Yg
c3lzdGVtcyBrbm93biB0byBtaXNiZWhhdmUKPj4gdXBvbiBhY2Nlc3NlcyB0byB0aGF0IHBvcnQu
Cj4+IAo+PiAgPiBgZG9tMC1wYXNzdGhyb3VnaGAKPj4gCj4+ICs+ICoqV0FSTklORzogVGhpcyBj
b21tYW5kIGxpbmUgb3B0aW9uIGlzIGRlcHJlY2F0ZWQsIGFuZCBzdXBlcnNlZGVkCj4+IGJ5Cj4+
ICs+IF9kb20wLWlvbW11PW5vbmVfIC0gdXNpbmcgYm90aCBvcHRpb25zIGluIGNvbWJpbmF0aW9u
IGlzCj4+IHVuZGVmaW5lZC4qKgo+PiArCj4gCj4gaW4gcGF0Y2ggZGVzY3JpcHRpb24geW91IHNh
aWQgJ3N1cGVyc2VkZScuLi4gaXMgaXQgYmV0dGVyIHRvIHNheSB0aGF0Cj4gbmV3IGRvbTBfaW9t
bXUgaXMgZmF2b3JlZCBpZiBib3RoIG9wdGlvbnMgYXJlIHNwZWNpZmllZCB0aGFuCj4gc2F5aW5n
ICd1bmRlZmluZWQnPwoKVGhhdCB3b3VsZCBjb21wbGljYXRlIGhhbmRsaW5nIChwZXJoYXBzIGp1
c3Qgc2xpZ2h0bHksIGJ1dCBhbnl3YXkpLApzaW5jZSB3ZSdkIGhhdmUgdG8gbWFpbnRhaW4gYSBz
ZWNvbmQgYm9vbGVhbi4gV2l0aG91dCB0aGF0IHRoZQpvcmRlciBvbiB0aGUgY29tbWFuZCBsaW5l
IGRldGVybWluZXMgYmVoYXZpb3IuIChBbmQgSSBzZWUgdGhhdCBpbgp0aGUgZW5kIHlvdSd2ZSBm
aWd1cmVkIHRoYXQgb3V0LikKCj4+IEBAIC0xMTk4LDYgKzEyMDQsMzIgQEAgZGV0ZWN0aW9uIG9m
IHN5c3RlbXMga25vd24gdG8gbWlzYmVoYXZlIHVwb24KPj4gYWNjZXNzZXMgdG8gdGhhdCBwb3J0
Lgo+PiAKPj4gID4+IEVuYWJsZSBJT01NVSBkZWJ1Z2dpbmcgY29kZSAoaW1wbGllcyBgdmVyYm9z
ZWApLgo+PiAKPj4gKyMjIyBkb20wLWlvbW11Cj4+ICs+IGA9IExpc3Qgb2YgWyBub25lIHwgc3Ry
aWN0IHwgcmVsYXhlZCBdYAo+PiArCj4+ICs+IFN1Yi1vcHRpb25zIGFyZSBvZiBib29sZWFuIGtp
bmQgYW5kIGNhbiBiZSBwcmVmaXhlZCB3aXRoIGBuby1gIHRvIGVmZmVjdAo+PiB0aGUKPj4gKz4g
aW52ZXJzZSBtZWFuaW5nLgo+IAo+IG5vdCBpbXBvcnRhbnQgY29tbWVudCwgYnV0IGRvZXNuJ3Qg
Im5vLW5vbmUiIHNvdW5kIHdlaXJkPyA6LSkKCk9ubHkgcG9zaXRpdmUgKHRydWUpIHZhbHVlcyBz
aG91bGQgYmUgcGVybWl0dGVkIGZvciBJIHRoaW5rIGFsbCBvZgp0aGVzZS4gSSBkaWRuJ3QgbG9v
ayBhdCB0aGUgcGF0Y2ggeWVzLCBzbyBwZXJoYXBzIHRoYXQncyBhbHJlYWR5CnRoZSBjYXNlLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
