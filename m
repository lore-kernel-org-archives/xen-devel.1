From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Enhancing Xen's Kconfig infrastructure to support
 tailored solutions
Date: Mon, 18 Feb 2019 11:57:12 +0000
Message-ID: <20190218115712.s7os5yx5sxvqq7n4@zion.uk.xensource.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1B830543-1B7B-4DF4-8D1E-FB862FEE836C@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Cc: James McKenzie <james.mckenzie@bromium.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>, Daniel Smith <dpsmith@apertussolutions.com>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, "Daniel P.Smith" <dpsmith.dev@gmail.com>, robin.randhawa@arm.com, committers@xenproject.org, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jun Nakajima <jun.nakajima@intel.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMTgsIDIwMTkgYXQgMTE6NTM6MTVBTSArMDAwMCwgTGFycyBLdXJ0aCB3cm90
ZToKPiAKPiAKPiA+IE9uIDE4IEZlYiAyMDE5LCBhdCAxMTozMCwgR2VvcmdlIER1bmxhcCA8Z2Vv
cmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPiA+IAo+ID4gT24gMi8xOC8xOSAxMToyMyBB
TSwgV2VpIExpdSB3cm90ZToKPiA+PiBPbiBNb24sIEZlYiAxOCwgMjAxOSBhdCAxMToxNzo1NkFN
ICswMDAwLCBMYXJzIEt1cnRoIHdyb3RlOgo+ID4+PiBUaGFuayB5b3UgV2VpLiBJdCdzIGludGVy
ZXN0aW5nIHRob3VnaCB0aGF0IHRoZSBmdWxsIHZzIEhWTSBvbmx5IGlzIGFsbW9zdCBpZGVudGlj
YWwgaW4gdGVybXMgb2YgU0xPQydzCj4gPj4+IExhcnMKPiA+PiAKPiA+PiBUaGUgY2xvYyB0YXJn
ZXQgY291bnRzIHRoZSBmaWxlcyBpbiB0aGUgZGVwZW5kZW5jeSBncmFwaCBnZW5lcmF0ZWQgYnkK
PiA+PiBtYWtlLgo+IAo+IERvIHdlIGtub3cgZm9yIHN1cmUgdGhhdCBDTE9DIGNvdW50cyBldmVy
eXRoaW5nIGluIGEgZmlsZSBvciBkb2VzIGl0IGhvbm91ciB0aGUgcHJlLXByb2Nlc3NvciBzZXR0
aW5ncz8KCldlIGNlcnRhaW5seSBkb24ndCBmZWVkIGFueSBwcmVwcm9jZXNzb3IgZGVmaW5lcyB0
byBpdC4gSSBkb3VidCBpdAp1bmRlcnN0YW5kIEMgdG8gdGhhdCBsZXZlbCBvZiBkZXRhaWxzIGFu
eXdheS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
