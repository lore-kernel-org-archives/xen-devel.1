From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Enhancing Xen's Kconfig infrastructure to support
 tailored solutions
Date: Mon, 18 Feb 2019 12:11:12 +0000
Message-ID: <E3994748-439F-4359-928B-20451271745D@gmail.com>
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
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a20dd648-286d-c1ec-1ab0-427fae3a145b@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: James McKenzie <james.mckenzie@bromium.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>, Daniel Smith <dpsmith@apertussolutions.com>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, "Daniel P.Smith" <dpsmith.dev@gmail.com>, robin.randhawa@arm.com, committers@xenproject.org, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jun Nakajima <jun.nakajima@intel.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIDE4IEZlYiAyMDE5LCBhdCAxMjowMSwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gT24gMTgvMDIvMjAxOSAxMTo1NywgV2VpIExpdSB3
cm90ZToKPj4gT24gTW9uLCBGZWIgMTgsIDIwMTkgYXQgMTE6NTM6MTVBTSArMDAwMCwgTGFycyBL
dXJ0aCB3cm90ZToKPj4+IAo+Pj4+IE9uIDE4IEZlYiAyMDE5LCBhdCAxMTozMCwgR2VvcmdlIER1
bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPj4+PiAKPj4+PiBPbiAyLzE4
LzE5IDExOjIzIEFNLCBXZWkgTGl1IHdyb3RlOgo+Pj4+PiBPbiBNb24sIEZlYiAxOCwgMjAxOSBh
dCAxMToxNzo1NkFNICswMDAwLCBMYXJzIEt1cnRoIHdyb3RlOgo+Pj4+Pj4gVGhhbmsgeW91IFdl
aS4gSXQncyBpbnRlcmVzdGluZyB0aG91Z2ggdGhhdCB0aGUgZnVsbCB2cyBIVk0gb25seSBpcyBh
bG1vc3QgaWRlbnRpY2FsIGluIHRlcm1zIG9mIFNMT0Mncwo+Pj4+Pj4gTGFycwo+Pj4+PiBUaGUg
Y2xvYyB0YXJnZXQgY291bnRzIHRoZSBmaWxlcyBpbiB0aGUgZGVwZW5kZW5jeSBncmFwaCBnZW5l
cmF0ZWQgYnkKPj4+Pj4gbWFrZS4KPj4+IERvIHdlIGtub3cgZm9yIHN1cmUgdGhhdCBDTE9DIGNv
dW50cyBldmVyeXRoaW5nIGluIGEgZmlsZSBvciBkb2VzIGl0IGhvbm91ciB0aGUgcHJlLXByb2Nl
c3NvciBzZXR0aW5ncz8KPj4gV2UgY2VydGFpbmx5IGRvbid0IGZlZWQgYW55IHByZXByb2Nlc3Nv
ciBkZWZpbmVzIHRvIGl0LiBJIGRvdWJ0IGl0Cj4+IHVuZGVyc3RhbmQgQyB0byB0aGF0IGxldmVs
IG9mIGRldGFpbHMgYW55d2F5Lgo+IAo+IExvQyBpc24ndCBhIGZhbnRhc3RpYyBtZXRyaWMgdW5k
ZXIgYW55IGNpcmN1bXN0YW5jZS4KPiAKPiBCaWdnZXIgY29kZSBpcyBkZWZpbml0ZWx5IGJldHRl
ciwgaWYgdGhlIHJlYXNvbiBpdCBpcyBiaWdnZXIgaXMgYmVjYXVzZQo+IGl0IGlzIGJlY2F1c2Ug
aXQgaXMgZm9ybWF0dGVkIGZvciByZWFkYWJpbGl0eS9jbGFyaXR5IGV0Yy4KCkkgZG9uJ3QgZGlz
YWdyZWUuIEEgbWVhc3VyZSBzdWNoIGFzIExvZ2ljYWwgTGluZXMgT2YgQ29kZSBtYXkgYmUgbW9y
ZSBhcHByb3ByaWF0ZSBsb25nZXIgdGVybSwgYXMgaXQgcmVtb3ZlcyB0aGUgZm9ybWF0dGluZy9y
ZWFkYWJpbGl0eSBhc3BlY3QuIAoKPiBBdHRlbXB0aW5nIHRvIG9wdGltaXNlIGZvciBzbWFsbGVy
IExvQywgb3RoZXIgdGhhbiBtYWtpbmcgZW50aXJlCj4gZnVuY3Rpb25hbCBhcmVhcyBvcHRpb25h
bCwgaXMgdXN1YWxseSBzaG9ydCBzaWdodGVkLgoKQWdyZWVkLiAKCldlIGFyZSBiYXNpY2FsbHkg
dXNpbmcgdGhlIFNMT0MgZmlndXJlIGFzIGEgcHJveHkgZm9yICJwb3RlbnRpYWwgY29zdCBvZiBz
YWZldHkgY2VydGlmaWNhdGlvbiIgYXQgbGVhc3QgZm9yIEFybQpJIHdhcyBob3BpbmcgdGhlIHJl
c3VsdHMgd2VyZSBjbGVhcmVyIGFuZCBJIGNvdWxkIHVzZSB0aGUgZmlndXJlcyB0byBpbGx1c3Ry
YXRlIHRoZSBpbXBhY3Qgb2YgYSBQViBvciBIVk0gb25seSBidWlsZCB0byBpbGx1c3RyYXRlIHRo
ZSBzYWZldHkgaW1wYWN0LCBidXQgbWF5YmUgSSBzaG91bGQgc3RheSBjbGVhciBvZiB0aGlzLgoK
UmVnYXJkcwpMYXJzCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
