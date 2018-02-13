From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC XEN PATCH v4 00/41] Add vNVDIMM support to HVM
 domains
Date: Tue, 13 Feb 2018 06:40:20 -0700
Message-ID: <5A82F8D402000078001A75D9@prv-mh.provo.novell.com>
References: <20171207101030.22364-1-haozhong.zhang@intel.com>
 <20180209123323.pm6bw4xl2slo3x7a@MacBook-Pro-de-Roger.local>
 <20180212012542.2fn4anzvuuhcmvm4@hz-desktop>
 <20180212100556.pg76xpb3vdkp257g@MacBook-Pro-de-Roger.local>
 <5A82C6B002000078001A7425@prv-mh.provo.novell.com>
 <20180213102929.ae54b66t664kdqx2@MacBook-Pro-de-Roger.local>
 <5A82D49902000078001A74B2@prv-mh.provo.novell.com>
 <20180213111324.fvftrlr6yryltwhz@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180213111324.fvftrlr6yryltwhz@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: TimDeegan <tim@xen.org>, StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xen.org, Shane Wang <shane.wang@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, GangWei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAyLjE4IGF0IDEyOjEzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgRmViIDEzLCAyMDE4IGF0IDA0OjA1OjQ1QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTMuMDIuMTggYXQgMTE6MjksIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gVHVlLCBGZWIgMTMsIDIwMTggYXQgMDM6MDY6MjRBTSAtMDcwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+PiBPbiAxMi4wMi4xOCBhdCAxMTowNSwgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiBJZiB5b3UgbWFwIHRoZSBOVkRJTU0gYXMgTU1J
TyB0byBEb20wIHlvdSBkb24ndCBuZWVkIHRoZSBNMlAgZW50cmllcwo+PiA+PiA+IElJUkMsIGFu
ZCBpZiBpdCdzIG1hcHBlZCB1c2luZyAxR0IgcGFnZXMgaXQgc2hvdWxkbid0IHVzZSB0aGF0IG11
Y2gKPj4gPj4gPiBtZW1vcnkgZm9yIHRoZSBwYWdlIHRhYmxlcyAoaWU6IHlvdSBjb3VsZCBqdXN0
IHVzZSBub3JtYWwgUkFNIGZvciB0aGUKPj4gPj4gPiBwYWdlIHRhYmxlcyB0aGF0IG1hcCB0aGUg
TlZESU1NIElNTykuIE9mIGNvdXJzZSB0aGF0IG9ubHkgYXBwbGllcyB0bwo+PiA+PiA+IFBWSC9I
Vk0uCj4+ID4+IAo+PiA+PiBCdXQgaW4gb3JkZXIgdG8gdXNlIChwYXJ0IG9mKSBpdCBpbiBhIFJB
TS1saWtlIG1hbm5lciB3ZSBuZWVkIHN0cnVjdAo+PiA+PiBwYWdlX2luZm8gZm9yIGl0Lgo+PiA+
IAo+PiA+IEkgZ3Vlc3MgdGhlIG1haW4gdXNlIG9mIHRoaXMgd291bGQgYmUgdG8gZ3JhbnQgTlZE
SU1NIHBhZ2VzPyBBbmQKPj4gPiB3aXRob3V0IGEgcGFnZV9pbmZvIHRoYXQncyBub3QgcG9zc2li
bGUuCj4+IAo+PiBXaHkgZ3JhbnQ/IFNpbXBseSBnaXZpbmcgc3VjaCBhIHBhZ2UgYXMgUkFNIHRv
IGEgZ3Vlc3Qgd291bGQKPj4gYWxyZWFkeSBiZSBhIHByb2JsZW0gd2l0aG91dCBzdHJ1Y3QgcGFn
ZV9pbmZvIChhcyB0aGVuIHdlIGNhbid0Cj4+IHRyYWNrIHRoZSBwYWdlIG93bmVyLCBub3IgY2Fu
IHdlIHJlZmNvdW50IHRoZSBwYWdlKS4KPiAKPiBNeSBwb2ludCB3YXMgdG8gYXZvaWQgZG9pbmcg
dGhhdCwgYW5kIGFsd2F5cyBhc3NpZ24gdGhlIHBhZ2VzIGFzCj4gTU1JTywgd2hpY2ggSUlSQyBk
b2Vzbid0IHJlcXVpcmUgYSBzdHJ1Y3QgcGFnZV9pbmZvLgoKTU1JTyBwYWdlcyBjYW4ndCBiZSB1
c2VkIGZvciB0aGluZ3MgbGlrZSBwYWdlIHRhYmxlcywgYmVjYXVzZSBvZgp0aGUgcmVmY291bnRp
bmcgdGhhdCdzIG5lZWRlZC4gVGhlIHBhZ2UgYmVpbmcgbGlrZSBSQU0sIGhvd2V2ZXIsCmltcGxp
ZXMgdGhhdCB0aGUgZ3Vlc3QgbmVlZHMgdG8gYmUgYWJsZSB0byB1c2UgaXQgYXMgYW55dGhpbmcg
YSBSQU0KcGFnZSBjYW4gYmUgdXNlZCBmb3IuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
