From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: Enhancing Xen's Kconfig infrastructure to support
 tailored solutions
Date: Mon, 18 Feb 2019 12:16:05 +0000
Message-ID: <775bed6a-1c35-3614-9a86-4fcedf84acd4@citrix.com>
References: <5C653AB10200007800216997@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1902140938160.5641@sstabellini-ThinkPad-X260>
 <AB54071B-07B5-4FFC-A1A4-781C24F61D93@gmail.com>
 <20190215110807.jtybxyfl523vwo3y@zion.uk.xensource.com>
 <alpine.DEB.2.10.1902151105580.5641@sstabellini-ThinkPad-X260>
 <20190218111234.r7ae42wswy2hjo7k@zion.uk.xensource.com>
 <1636EB19-FE45-42FF-B4D3-8CE8853BD040@gmail.com>
 <20190218112337.qoyws3pedxav4wmf@zion.uk.xensource.com>
 <59568551-146c-e0b7-2f94-4f9ee19c5325@citrix.com>
 <1B830543-1B7B-4DF4-8D1E-FB862FEE836C@gmail.com>
 <20190218115712.s7os5yx5sxvqq7n4@zion.uk.xensource.com>
 <a20dd648-286d-c1ec-1ab0-427fae3a145b@citrix.com>
 <d9d2054f-0241-ca87-d2f4-9d3f3bf562f8@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d9d2054f-0241-ca87-d2f4-9d3f3bf562f8@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Lars Kurth <lars.kurth.xen@gmail.com>
Cc: James McKenzie <james.mckenzie@bromium.com>, robin.randhawa@arm.com, 'Jan Beulich' <JBeulich@suse.com>, Daniel Smith <dpsmith@apertussolutions.com>, Doug Goldstein <cardoe@cardoe.com>, Christopher Clark <christopher.w.clark@gmail.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, "Daniel P.Smith" <dpsmith.dev@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, committers@xenproject.org, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jun Nakajima <jun.nakajima@intel.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xOC8xOSAxMjoxMSBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAyLzE4LzE5IDEy
OjAxIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxOC8wMi8yMDE5IDExOjU3LCBXZWkg
TGl1IHdyb3RlOgo+Pj4gT24gTW9uLCBGZWIgMTgsIDIwMTkgYXQgMTE6NTM6MTVBTSArMDAwMCwg
TGFycyBLdXJ0aCB3cm90ZToKPj4+Pgo+Pj4+PiBPbiAxOCBGZWIgMjAxOSwgYXQgMTE6MzAsIEdl
b3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+
IE9uIDIvMTgvMTkgMTE6MjMgQU0sIFdlaSBMaXUgd3JvdGU6Cj4+Pj4+PiBPbiBNb24sIEZlYiAx
OCwgMjAxOSBhdCAxMToxNzo1NkFNICswMDAwLCBMYXJzIEt1cnRoIHdyb3RlOgo+Pj4+Pj4+IFRo
YW5rIHlvdSBXZWkuIEl0J3MgaW50ZXJlc3RpbmcgdGhvdWdoIHRoYXQgdGhlIGZ1bGwgdnMgSFZN
IG9ubHkgaXMgYWxtb3N0IGlkZW50aWNhbCBpbiB0ZXJtcyBvZiBTTE9DJ3MKPj4+Pj4+PiBMYXJz
Cj4+Pj4+PiBUaGUgY2xvYyB0YXJnZXQgY291bnRzIHRoZSBmaWxlcyBpbiB0aGUgZGVwZW5kZW5j
eSBncmFwaCBnZW5lcmF0ZWQgYnkKPj4+Pj4+IG1ha2UuCj4+Pj4gRG8gd2Uga25vdyBmb3Igc3Vy
ZSB0aGF0IENMT0MgY291bnRzIGV2ZXJ5dGhpbmcgaW4gYSBmaWxlIG9yIGRvZXMgaXQgaG9ub3Vy
IHRoZSBwcmUtcHJvY2Vzc29yIHNldHRpbmdzPwo+Pj4gV2UgY2VydGFpbmx5IGRvbid0IGZlZWQg
YW55IHByZXByb2Nlc3NvciBkZWZpbmVzIHRvIGl0LiBJIGRvdWJ0IGl0Cj4+PiB1bmRlcnN0YW5k
IEMgdG8gdGhhdCBsZXZlbCBvZiBkZXRhaWxzIGFueXdheS4KPj4KPj4gTG9DIGlzbid0IGEgZmFu
dGFzdGljIG1ldHJpYyB1bmRlciBhbnkgY2lyY3Vtc3RhbmNlLgo+Pgo+PiBCaWdnZXIgY29kZSBp
cyBkZWZpbml0ZWx5IGJldHRlciwgaWYgdGhlIHJlYXNvbiBpdCBpcyBiaWdnZXIgaXMgYmVjYXVz
ZQo+PiBpdCBpcyBiZWNhdXNlIGl0IGlzIGZvcm1hdHRlZCBmb3IgcmVhZGFiaWxpdHkvY2xhcml0
eSBldGMuCj4+Cj4+IEF0dGVtcHRpbmcgdG8gb3B0aW1pc2UgZm9yIHNtYWxsZXIgTG9DLCBvdGhl
ciB0aGFuIG1ha2luZyBlbnRpcmUKPj4gZnVuY3Rpb25hbCBhcmVhcyBvcHRpb25hbCwgaXMgdXN1
YWxseSBzaG9ydCBzaWdodGVkLgo+IAo+IEZvciBpbnN0YW5jZSwgd2UgY291bGQgcHJvYmFibHkg
ZGVjcmVhc2UgdGhlIExvQyBieSBuZWFybHkgMjBrIGJ5Cj4gY2hhbmdpbmcgdGhlIHN0eWxlIG5v
dCB0byBnaXZlIHRoZSBvcGVuaW5nIGJyYWNrZXQgaXRzIG93biBsaW5lOgo+IAo+ICQgZmluZCAu
IC1uYW1lICcqLmMnIHwgeGFyZ3MgZ3JlcCAnXltbOnNwYWNlOl1dKnsnIHwgd2MgLWwKPiAxOTg5
Ngo+ICQgZmluZCAuIC1uYW1lICcqLltjaF0nIHwgeGFyZ3MgZ3JlcCAnXltbOnNwYWNlOl1dKnsn
IHwgd2MgLWwKPiAyMTg0NwoKVGhpcyBpcyBoeXBlcnZpc29yIG9ubHkgQlRXIChydW4gZnJvbSB4
ZW4uZ2l0L3hlbikuCgpJdCBpcyBhIGJpdCBtaW5kLWJvZ2dsaW5nIHRvIHRoaW5rIHRoYXQgdGhl
cmUgYXJlIG1vcmUgb3BlbiBicmFja2V0cyBpbgp0aGUgWGVuIGNvZGUgYmFzZSB0aGFuIHRoZXJl
IGlzIFBWLXNwZWNpZmljIGNvZGUuIE9fbwoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
