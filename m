From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: Enhancing Xen's Kconfig infrastructure to support
 tailored solutions
Date: Mon, 18 Feb 2019 12:11:42 +0000
Message-ID: <d9d2054f-0241-ca87-d2f4-9d3f3bf562f8@citrix.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a20dd648-286d-c1ec-1ab0-427fae3a145b@citrix.com>
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

T24gMi8xOC8xOSAxMjowMSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOC8wMi8yMDE5
IDExOjU3LCBXZWkgTGl1IHdyb3RlOgo+PiBPbiBNb24sIEZlYiAxOCwgMjAxOSBhdCAxMTo1Mzox
NUFNICswMDAwLCBMYXJzIEt1cnRoIHdyb3RlOgo+Pj4KPj4+PiBPbiAxOCBGZWIgMjAxOSwgYXQg
MTE6MzAsIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6Cj4+
Pj4KPj4+PiBPbiAyLzE4LzE5IDExOjIzIEFNLCBXZWkgTGl1IHdyb3RlOgo+Pj4+PiBPbiBNb24s
IEZlYiAxOCwgMjAxOSBhdCAxMToxNzo1NkFNICswMDAwLCBMYXJzIEt1cnRoIHdyb3RlOgo+Pj4+
Pj4gVGhhbmsgeW91IFdlaS4gSXQncyBpbnRlcmVzdGluZyB0aG91Z2ggdGhhdCB0aGUgZnVsbCB2
cyBIVk0gb25seSBpcyBhbG1vc3QgaWRlbnRpY2FsIGluIHRlcm1zIG9mIFNMT0Mncwo+Pj4+Pj4g
TGFycwo+Pj4+PiBUaGUgY2xvYyB0YXJnZXQgY291bnRzIHRoZSBmaWxlcyBpbiB0aGUgZGVwZW5k
ZW5jeSBncmFwaCBnZW5lcmF0ZWQgYnkKPj4+Pj4gbWFrZS4KPj4+IERvIHdlIGtub3cgZm9yIHN1
cmUgdGhhdCBDTE9DIGNvdW50cyBldmVyeXRoaW5nIGluIGEgZmlsZSBvciBkb2VzIGl0IGhvbm91
ciB0aGUgcHJlLXByb2Nlc3NvciBzZXR0aW5ncz8KPj4gV2UgY2VydGFpbmx5IGRvbid0IGZlZWQg
YW55IHByZXByb2Nlc3NvciBkZWZpbmVzIHRvIGl0LiBJIGRvdWJ0IGl0Cj4+IHVuZGVyc3RhbmQg
QyB0byB0aGF0IGxldmVsIG9mIGRldGFpbHMgYW55d2F5Lgo+IAo+IExvQyBpc24ndCBhIGZhbnRh
c3RpYyBtZXRyaWMgdW5kZXIgYW55IGNpcmN1bXN0YW5jZS4KPiAKPiBCaWdnZXIgY29kZSBpcyBk
ZWZpbml0ZWx5IGJldHRlciwgaWYgdGhlIHJlYXNvbiBpdCBpcyBiaWdnZXIgaXMgYmVjYXVzZQo+
IGl0IGlzIGJlY2F1c2UgaXQgaXMgZm9ybWF0dGVkIGZvciByZWFkYWJpbGl0eS9jbGFyaXR5IGV0
Yy4KPiAKPiBBdHRlbXB0aW5nIHRvIG9wdGltaXNlIGZvciBzbWFsbGVyIExvQywgb3RoZXIgdGhh
biBtYWtpbmcgZW50aXJlCj4gZnVuY3Rpb25hbCBhcmVhcyBvcHRpb25hbCwgaXMgdXN1YWxseSBz
aG9ydCBzaWdodGVkLgoKRm9yIGluc3RhbmNlLCB3ZSBjb3VsZCBwcm9iYWJseSBkZWNyZWFzZSB0
aGUgTG9DIGJ5IG5lYXJseSAyMGsgYnkKY2hhbmdpbmcgdGhlIHN0eWxlIG5vdCB0byBnaXZlIHRo
ZSBvcGVuaW5nIGJyYWNrZXQgaXRzIG93biBsaW5lOgoKJCBmaW5kIC4gLW5hbWUgJyouYycgfCB4
YXJncyBncmVwICdeW1s6c3BhY2U6XV0qeycgfCB3YyAtbAoxOTg5NgokIGZpbmQgLiAtbmFtZSAn
Ki5bY2hdJyB8IHhhcmdzIGdyZXAgJ15bWzpzcGFjZTpdXSp7JyB8IHdjIC1sCjIxODQ3CgogLUdl
b3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
