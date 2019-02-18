From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Enhancing Xen's Kconfig infrastructure to support
 tailored solutions
Date: Mon, 18 Feb 2019 12:01:57 +0000
Message-ID: <a20dd648-286d-c1ec-1ab0-427fae3a145b@citrix.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190218115712.s7os5yx5sxvqq7n4@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Lars Kurth <lars.kurth.xen@gmail.com>
Cc: James McKenzie <james.mckenzie@bromium.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Stefano Stabellini <sstabellini@kernel.org>, 'Jan Beulich' <JBeulich@suse.com>, Daniel Smith <dpsmith@apertussolutions.com>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, "Daniel P.Smith" <dpsmith.dev@gmail.com>, robin.randhawa@arm.com, committers@xenproject.org, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jun Nakajima <jun.nakajima@intel.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDIvMjAxOSAxMTo1NywgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIEZlYiAxOCwgMjAx
OSBhdCAxMTo1MzoxNUFNICswMDAwLCBMYXJzIEt1cnRoIHdyb3RlOgo+Pgo+Pj4gT24gMTggRmVi
IDIwMTksIGF0IDExOjMwLCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+
IHdyb3RlOgo+Pj4KPj4+IE9uIDIvMTgvMTkgMTE6MjMgQU0sIFdlaSBMaXUgd3JvdGU6Cj4+Pj4g
T24gTW9uLCBGZWIgMTgsIDIwMTkgYXQgMTE6MTc6NTZBTSArMDAwMCwgTGFycyBLdXJ0aCB3cm90
ZToKPj4+Pj4gVGhhbmsgeW91IFdlaS4gSXQncyBpbnRlcmVzdGluZyB0aG91Z2ggdGhhdCB0aGUg
ZnVsbCB2cyBIVk0gb25seSBpcyBhbG1vc3QgaWRlbnRpY2FsIGluIHRlcm1zIG9mIFNMT0Mncwo+
Pj4+PiBMYXJzCj4+Pj4gVGhlIGNsb2MgdGFyZ2V0IGNvdW50cyB0aGUgZmlsZXMgaW4gdGhlIGRl
cGVuZGVuY3kgZ3JhcGggZ2VuZXJhdGVkIGJ5Cj4+Pj4gbWFrZS4KPj4gRG8gd2Uga25vdyBmb3Ig
c3VyZSB0aGF0IENMT0MgY291bnRzIGV2ZXJ5dGhpbmcgaW4gYSBmaWxlIG9yIGRvZXMgaXQgaG9u
b3VyIHRoZSBwcmUtcHJvY2Vzc29yIHNldHRpbmdzPwo+IFdlIGNlcnRhaW5seSBkb24ndCBmZWVk
IGFueSBwcmVwcm9jZXNzb3IgZGVmaW5lcyB0byBpdC4gSSBkb3VidCBpdAo+IHVuZGVyc3RhbmQg
QyB0byB0aGF0IGxldmVsIG9mIGRldGFpbHMgYW55d2F5LgoKTG9DIGlzbid0IGEgZmFudGFzdGlj
IG1ldHJpYyB1bmRlciBhbnkgY2lyY3Vtc3RhbmNlLgoKQmlnZ2VyIGNvZGUgaXMgZGVmaW5pdGVs
eSBiZXR0ZXIsIGlmIHRoZSByZWFzb24gaXQgaXMgYmlnZ2VyIGlzIGJlY2F1c2UKaXQgaXMgYmVj
YXVzZSBpdCBpcyBmb3JtYXR0ZWQgZm9yIHJlYWRhYmlsaXR5L2NsYXJpdHkgZXRjLgoKQXR0ZW1w
dGluZyB0byBvcHRpbWlzZSBmb3Igc21hbGxlciBMb0MsIG90aGVyIHRoYW4gbWFraW5nIGVudGly
ZQpmdW5jdGlvbmFsIGFyZWFzIG9wdGlvbmFsLCBpcyB1c3VhbGx5IHNob3J0IHNpZ2h0ZWQuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
