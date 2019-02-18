From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Enhancing Xen's Kconfig infrastructure to support
 tailored solutions
Date: Mon, 18 Feb 2019 11:53:15 +0000
Message-ID: <1B830543-1B7B-4DF4-8D1E-FB862FEE836C@gmail.com>
References: <a49643ec-6bbe-04be-1ae2-b1d731da92cf@gmail.com>
 <20190213182544.2tguperv3yliejch@zion.uk.xensource.com>
 <alpine.DEB.2.10.1902131110270.5641@sstabellini-ThinkPad-X260>
 <5C653AB10200007800216997@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1902140938160.5641@sstabellini-ThinkPad-X260>
 <AB54071B-07B5-4FFC-A1A4-781C24F61D93@gmail.com>
 <20190215110807.jtybxyfl523vwo3y@zion.uk.xensource.com>
 <alpine.DEB.2.10.1902151105580.5641@sstabellini-ThinkPad-X260>
 <20190218111234.r7ae42wswy2hjo7k@zion.uk.xensource.com>
 <1636EB19-FE45-42FF-B4D3-8CE8853BD040@gmail.com>
 <20190218112337.qoyws3pedxav4wmf@zion.uk.xensource.com>
 <59568551-146c-e0b7-2f94-4f9ee19c5325@citrix.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <59568551-146c-e0b7-2f94-4f9ee19c5325@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: James McKenzie <james.mckenzie@bromium.com>, robin.randhawa@arm.com, Wei Liu <wei.liu2@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>, Daniel Smith <dpsmith@apertussolutions.com>, Doug Goldstein <cardoe@cardoe.com>, Christopher Clark <christopher.w.clark@gmail.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, "Daniel P.Smith" <dpsmith.dev@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, committers@xenproject.org, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jun Nakajima <jun.nakajima@intel.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIDE4IEZlYiAyMDE5LCBhdCAxMTozMCwgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxh
cEBjaXRyaXguY29tPiB3cm90ZToKPiAKPiBPbiAyLzE4LzE5IDExOjIzIEFNLCBXZWkgTGl1IHdy
b3RlOgo+PiBPbiBNb24sIEZlYiAxOCwgMjAxOSBhdCAxMToxNzo1NkFNICswMDAwLCBMYXJzIEt1
cnRoIHdyb3RlOgo+Pj4gVGhhbmsgeW91IFdlaS4gSXQncyBpbnRlcmVzdGluZyB0aG91Z2ggdGhh
dCB0aGUgZnVsbCB2cyBIVk0gb25seSBpcyBhbG1vc3QgaWRlbnRpY2FsIGluIHRlcm1zIG9mIFNM
T0Mncwo+Pj4gTGFycwo+PiAKPj4gVGhlIGNsb2MgdGFyZ2V0IGNvdW50cyB0aGUgZmlsZXMgaW4g
dGhlIGRlcGVuZGVuY3kgZ3JhcGggZ2VuZXJhdGVkIGJ5Cj4+IG1ha2UuCgpEbyB3ZSBrbm93IGZv
ciBzdXJlIHRoYXQgQ0xPQyBjb3VudHMgZXZlcnl0aGluZyBpbiBhIGZpbGUgb3IgZG9lcyBpdCBo
b25vdXIgdGhlIHByZS1wcm9jZXNzb3Igc2V0dGluZ3M/Cgo+PiBBIGxvdCBvZiB0aGUgZmlsZXMg
Y29udGFpbiBib3RoIGNvbW1vbiB4ODYgY29kZSBhbmQgUFYgb25seSBjb2RlLgo+PiBTbyBhbiBI
Vk0gb25seSBidWlsZCB3aWxsIGNvdW50IHNvbWUgb2YgdGhlIFBWIGNvZGUuCj4gCj4gU3RpbGws
IHdoYXQgdGhhdCBzaG93cyBpcyB0aGF0IHRoZXJlIGhhdmUgYmVlbiBuZWFybHkgMjVrIGxpa2Vz
IG9mIGNvZGUKPiBpZGVudGlmaWVkIGFzICJIVk0tb25seSIsIHdoaWxlIHRoZXJlIGhhdmUgYmVl
biBsZXNzIHRoYW4gNWsgbGlrZXMgb2YKPiBjb2RlIGlkZW50aWZpZWQgYXMgIlBWLW9ubHkiLiAg
VGhhdCdzIHF1aXRlIGEgYml0IG1vcmUgbG9wc2lkZWQgdGhhbiBJCj4gd2FzIGV4cGVjdGluZy4K
Ckkgd2FzIHRoaW5raW5nIHRoZSBzYW1lCgpMYXJzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
