From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 01/10] x86: add an flag to enable Intel
 Processor Trace in guest
Date: Tue, 03 Jul 2018 05:58:42 -0600
Message-ID: <5B3B64F202000078001D03F7@prv1-mh.provo.novell.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <1527686884-5917-2-git-send-email-luwei.kang@intel.com>
 <5B34EC9F02000078001CEE4B@prv1-mh.provo.novell.com>
 <82D7661F83C1A047AF7DC287873BF1E1680481BC@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <82D7661F83C1A047AF7DC287873BF1E1680481BC@SHSMSX101.ccr.corp.intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Luwei Kang <luwei.kang@intel.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA3LjE4IGF0IDEyOjE4LCA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+IHdyb3RlOgo+
PiA+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLm1hcmtkb3duCj4+ID4gKysrIGIv
ZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUubWFya2Rvd24KPj4gPiBAQCAtMTIxNSw2ICsxMjE1
LDE2IEBAIFJhdGhlciB0aGFuIG9ubHkgbWFwcGluZyBSQU0gcGFnZXMgZm9yIElPTU1VCj4+ID4g
YWNjZXNzZXMgZm9yIERvbTAsIHdpdGggdGhpcyAgb3B0aW9uIGFsbCBwYWdlcyBub3QgbWFya2Vk
IGFzIHVudXNhYmxlCj4+ID4gaW4gdGhlIEU4MjAgdGFibGUgd2lsbCBnZXQgYSBtYXBwaW5nICBl
c3RhYmxpc2hlZC4KPj4gPgo+PiA+ICsjIyMgaXB0Cj4+ID4gKz4gYD0gZ3Vlc3RgCj4+ID4gKwo+
PiA+ICs+IERlZmF1bHQ6IGBvZmZgCj4+ID4gKwo+PiA+ICtUaGlzIG9wdGlvbiBpcyB1c2UgZm9y
IHN3aXRjaCBvbiB0aGUgSW50ZWwgUHJvY2Vzc29yIFRyYWNlIGZlYXR1cmUgaW4KPj4gPiArSFZN
IGd1ZXN0IHdoZW4gJ2lwdD1ndWVzdCcuIEJ5IGRlZmF1bHQsIHRoaXMgZmVhdHVyZSBpcyBkaXNh
YmxlZCBpbgo+PiA+ICtndWVzdC4gSW50ZWwgUHJvY2Vzc29yIFRyYWNlIHZpcnR1YWxpemF0aW9u
IGRlcGVuZCBvbiBFUFQsIHNvIGl0IGNhbgo+PiA+ICtvbmx5IGVuYWJsZWQgaW4gSFZNIGd1ZXN0
IGF0IHByZXNlbnQuCj4+ID4gKwo+PiA+ICAjIyMgaXJxXF9yYXRlbGltaXQgKHg4NikKPj4gCj4+
IERpZCB5b3Ugbm90IG5vdGljZSB0aGUgKHg4NikgaGVyZSB3aGVuIHJlLWJhc2luZz8KPiAKPiBT
bywgdGhlIG9wdGlvbiBzaG91bGQgYmUgIiMjIyBpcHQgKHg4NikiID8KClllcy4KCj4+ID4gKyNp
Zm5kZWYgX19BU01fWDg2X0hWTV9JUFRfSF8KPj4gPiArI2RlZmluZSBfX0FTTV9YODZfSFZNX0lQ
VF9IXwo+PiA+ICsKPj4gPiArI2RlZmluZSBJUFRfTU9ERV9PRkYgICAgICAgIDAKPj4gPiArI2Rl
ZmluZSBJUFRfTU9ERV9HVUVTVCAgICAgICgxPDwwKQo+PiA+ICsKPj4gPiArZXh0ZXJuIHVuc2ln
bmVkIGludCBpcHRfbW9kZTsKPj4gCj4+IEF0IHRoaXMgcG9pbnQgSSBjYW4ndCBzZWUgd2h5IHRo
ZSB2YXJpYWJsZSBjYW4ndCBiZSBib29sLiBXaXRoIHRoZSBwYXRjaCBiZWluZyBwbGFjZWQgZmly
c3QgaW4gdGhlIHNlcmllcyBpdCBpcyBhbHNvIGltcG9zc2libGUgKHdpdGhvdXQKPj4gcGVla2lu
ZyBpbnRvIGxhdGVyIHBhdGNoZXMpIHRvIGp1ZGdlIHdoZXRoZXIgaXRzIF9fcmVhZF9tb3N0bHkg
YXR0cmlidXRlIGlzIGFjdHVhbGx5IGFwcHJvcHJpYXRlLgo+IAo+IE9LLCB3aWxsIGNoYW5nZSBp
dCB0byBib29sLiBBYm91dCBfX3JlYWRfbW9zdGx5IGF0dHJpYnV0ZSwgIEkgd2lsbCByZW1vdmUg
aXQgCj4gaWYgbm90IHJlYWQgZnJlcXVlbmN5LgoKTm8sIHRoZSBwb2ludCB3YXNuJ3QgdG8gcmVt
b3ZlIGl0LCBidXQgd2hldGhlciBpbnN0ZWFkIGl0IGNvdWxkIGJlCl9faW5pdGRhdGEuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
