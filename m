From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Enhancing Xen's Kconfig infrastructure to support
 tailored solutions
Date: Fri, 15 Feb 2019 09:27:13 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902150925230.5641@sstabellini-ThinkPad-X260>
References: <a49643ec-6bbe-04be-1ae2-b1d731da92cf@gmail.com>
 <20190213182544.2tguperv3yliejch@zion.uk.xensource.com>
 <alpine.DEB.2.10.1902131110270.5641@sstabellini-ThinkPad-X260>
 <5C653AB10200007800216997@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1902140938160.5641@sstabellini-ThinkPad-X260>
 <5C667DBE0200007800216E51@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C667DBE0200007800216E51@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: James McKenzie <james.mckenzie@bromium.com>, robin.randhawa@arm.com, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Daniel Smith <dpsmith@apertussolutions.com>, Doug Goldstein <cardoe@cardoe.com>, Christopher Clark <christopher.w.clark@gmail.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, "Daniel P.Smith" <dpsmith.dev@gmail.com>, Lars Kurth <lars.kurth.xen@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, committers@xenproject.org, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, Xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAxNSBGZWIgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDE0LjAyLjE5
IGF0IDE5OjMyLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBEbyB5b3UgaGF2
ZSBhbnkgb3RoZXIgc3VnZ2VzdGlvbnMgYWJvdXQgdGhpbmdzIHRoYXQgY291bGQgYmUgcmVtb3Zl
ZCB0bwo+ID4gcmVhY2ggZG93biB0byAxMDBLIExPQywgaW4gYWRkaXRpb24gdG8gd2hhdCB5b3Ug
aGF2ZSBhbHJlYWR5IHdyaXR0ZW4KPiA+IGFib3ZlIChJbnRlbC9BTUQsIHNoYWRvdyk/Cj4gCj4g
SWYgeW91IG1lYW4gb25lcyB3ZSBhbHJlYWR5IGhhdmUgS2NvbmZpZyBvcHRpb25zIGZvciwgdGhl
biB5b3UKPiBjb3VsZCBkcm9wIFRCT09ULCB3aGljaCBpbiB0dXJuIGRyb3BzIENSWVBUTywgd2hp
Y2ggdG9nZXRoZXIKPiBpcyBhYm91dCAzayBMT0MuIFR1cm5pbmcgb2ZmIFhFTk9QUk9GIHdvdWxk
IHlpZWxkIGFub3RoZXIgMmsuCj4gSSBhc3N1bWUgeW91J3ZlIGFscmVhZHkgcmVzdHJpY3RlZCB5
b3Vyc2VsZiB0byBqdXN0IHRoZSBudWxsCj4gc2NoZWR1bGVyPyBCdXQgdGhhdCdzIGFib3V0IGl0
LCBJIHRoaW5rLCB3aXRob3V0IGFjdHVhbCBjb2RlIChvciBhdAo+IGxlYXN0IEtjb25maWcpIGNo
YW5nZXMuCgpJIG1lYW50IHN1Z2dlc3Rpb25zIGZvciB0aGluZ3MgdGhhdCBjb3VsZCBiZSBkaXNh
YmxlZCBpbiB0aGUgYnVpbGQsIGJ1dAp3ZSBkb24ndCBoYXZlIGEga2NvbmZpZyBvcHRpb24gZm9y
IGl0IHlldC4gU3VjaCBhcyBzb21lIG9mIHRoZQpkZWNvbXByZXNzaW9uIGFsZ29yaXRobXMgKGFz
IFdlaSBwb2ludGVkIG91dCkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
