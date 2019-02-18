From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Enhancing Xen's Kconfig infrastructure to support
 tailored solutions
Date: Mon, 18 Feb 2019 12:00:16 +0000
Message-ID: <24166316-88CE-48CE-8DF9-C4A5AC89E5C4@gmail.com>
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
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190218115712.s7os5yx5sxvqq7n4@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: James McKenzie <james.mckenzie@bromium.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Stefano Stabellini <sstabellini@kernel.org>, 'Jan Beulich' <JBeulich@suse.com>, Daniel Smith <dpsmith@apertussolutions.com>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, "Daniel P.Smith" <dpsmith.dev@gmail.com>, robin.randhawa@arm.com, committers@xenproject.org, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jun Nakajima <jun.nakajima@intel.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIDE4IEZlYiAyMDE5LCBhdCAxMTo1NywgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4gd3JvdGU6Cj4gCj4gT24gTW9uLCBGZWIgMTgsIDIwMTkgYXQgMTE6NTM6MTVBTSArMDAwMCwg
TGFycyBLdXJ0aCB3cm90ZToKPj4gCj4+IAo+Pj4gT24gMTggRmViIDIwMTksIGF0IDExOjMwLCBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gCj4+PiBP
biAyLzE4LzE5IDExOjIzIEFNLCBXZWkgTGl1IHdyb3RlOgo+Pj4+IE9uIE1vbiwgRmViIDE4LCAy
MDE5IGF0IDExOjE3OjU2QU0gKzAwMDAsIExhcnMgS3VydGggd3JvdGU6Cj4+Pj4+IFRoYW5rIHlv
dSBXZWkuIEl0J3MgaW50ZXJlc3RpbmcgdGhvdWdoIHRoYXQgdGhlIGZ1bGwgdnMgSFZNIG9ubHkg
aXMgYWxtb3N0IGlkZW50aWNhbCBpbiB0ZXJtcyBvZiBTTE9DJ3MKPj4+Pj4gTGFycwo+Pj4+IAo+
Pj4+IFRoZSBjbG9jIHRhcmdldCBjb3VudHMgdGhlIGZpbGVzIGluIHRoZSBkZXBlbmRlbmN5IGdy
YXBoIGdlbmVyYXRlZCBieQo+Pj4+IG1ha2UuCj4+IAo+PiBEbyB3ZSBrbm93IGZvciBzdXJlIHRo
YXQgQ0xPQyBjb3VudHMgZXZlcnl0aGluZyBpbiBhIGZpbGUgb3IgZG9lcyBpdCBob25vdXIgdGhl
IHByZS1wcm9jZXNzb3Igc2V0dGluZ3M/Cj4gCj4gV2UgY2VydGFpbmx5IGRvbid0IGZlZWQgYW55
IHByZXByb2Nlc3NvciBkZWZpbmVzIHRvIGl0LiBJIGRvdWJ0IGl0Cj4gdW5kZXJzdGFuZCBDIHRv
IHRoYXQgbGV2ZWwgb2YgZGV0YWlscyBhbnl3YXkuCgpUaGF0IGlzIGludGVyZXN0aW5nLCBiZWNh
dXNlIGVzc2VudGlhbGx5IHRoZSBDTE9DIGNvdW50cyBwcm92aWRlIGFuIHVwcGVyIGJvdW5kIGlu
c3RlYWQgdGhlIHJlYWwgbGluZXMgb2YgY29kZS4gU28gaW4gcmVhbGl0eSwgYm90aCB0aGUgQXJt
IGFuZCB4ODYgY29uZmlncyBtYXkgdHVybiBvdXQgdG8gYmUgbG93ZXIgdGhhbiB3ZSB0aG91Z2h0
CkxhcnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
