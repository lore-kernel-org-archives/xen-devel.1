From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 19/23] x86: PIT emulation is common to
 both PV and HVM
Date: Tue, 28 Aug 2018 15:58:41 +0100
Message-ID: <20180828145841.rhwyepzafn3b5vse@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <3c651e5f60a496e3e5661f60bd7e913dab2b05a0.1535285866.git-series.wei.liu2@citrix.com>
 <5B8535B302000078001E28EB@prv1-mh.provo.novell.com>
 <20180828131954.sszmpjeuhy4ulqpv@citrix.com>
 <5B855DF502000078001E29FD@prv1-mh.provo.novell.com>
 <20180828144807.hv2ifgcn6pchmebk@citrix.com>
 <36619222-2197-0cd2-dbdc-7ad95f0094ca@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ardv=ll=citrix.com=prvs=7715574d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fufS9-00006V-Hx
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 14:58:45 +0000
Content-Disposition: inline
In-Reply-To: <36619222-2197-0cd2-dbdc-7ad95f0094ca@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMDM6NTE6NTFQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyOC8wOC8xOCAxNTo0OCwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFR1ZSwgQXVn
IDI4LCAyMDE4IGF0IDA4OjM2OjM3QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4+
IE9uIDI4LjA4LjE4IGF0IDE1OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4+
IE9uIFR1ZSwgQXVnIDI4LCAyMDE4IGF0IDA1OjQ0OjUxQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4+Pj4+Pj4gT24gMjYuMDguMTggYXQgMTQ6MTksIDx3ZWkubGl1MkBjaXRyaXguY29t
PiB3cm90ZToKPiA+Pj4+PiBNb3ZlIHRoZSBmaWxlIHRvIHg4NiBjb21tb24gY29kZSBhbmQgY2hh
bmdlIGl0cyBuYW1lIHRvIGVtdWwtaTgyNTQuYy4KPiA+Pj4+Pgo+ID4+Pj4+IFB1dCBIVk0gb25s
eSBjb2RlIHVuZGVyIENPTkZJR19IVk0gb3IgaXNfaHZtX2RvbWFpbi4KPiA+Pj4+Pgo+ID4+Pj4+
IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPj4+Pj4gLS0t
Cj4gPj4+Pj4gdjI6IG1vdmUgdGhlIHdob2xlIGZpbGUuCj4gPj4+Pj4gLS0tCj4gPj4+Pj4gIHhl
bi9hcmNoL3g4Ni9NYWtlZmlsZSAgICAgfCAgIDEgKy0KPiA+Pj4+PiAgeGVuL2FyY2gveDg2L2Vt
dWwtaTgyNTQuYyB8IDYwOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
Cj4gPj4+Pj4gIHhlbi9hcmNoL3g4Ni9odm0vTWFrZWZpbGUgfCAgIDEgKy0KPiA+Pj4+PiAgeGVu
L2FyY2gveDg2L2h2bS9pODI1NC5jICB8IDU5NyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiA+Pj4+PiAgNCBmaWxlcyBjaGFuZ2VkLCA2MTAgaW5zZXJ0aW9ucygrKSwg
NTk4IGRlbGV0aW9ucygtKQo+ID4+Pj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2
L2VtdWwtaTgyNTQuYwo+ID4+Pj4+ICBkZWxldGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2h2
bS9pODI1NC5jCj4gPj4+PiBPbiB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSBjaGFuZ2VzIHRvIHRo
ZSBmaWxlIGFyZSBvbmx5IENPTkZJR19IVk0KPiA+Pj4+IGFkZGl0aW9ucwo+ID4+PiBObyBvbmx5
IHRoYXQuIFRoZXJlIGFyZSBhIGZldyBpc19odm1fZG9tYWluIGNhbGxzIGFzIHdlbGwuCj4gPj4+
Cj4gPj4+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4+PiBE
b2VzIHRoaXMgc3RpbGwgc3RhbmQ/Cj4gPj4gWWVzLCBhbGJlaXQgbG9va2luZyBhdCB0aGUgZnVs
bCBkaWZmIG9mIHRoZSBmaWxlcyBJJ20gdGhlbiBhIGxpdHRsZQo+ID4+IHB1enpsZWQgYWJvdXQg
aXNfaHZtX2RvbWFpbigpIHVzZXM6IFdoeSBkb2VzIHBpdF9sb2FkX2NvdW50KCkKPiA+PiBuZWVk
IGFuICNpZmRlZiBhZGRlZCBhdCBhbGwsIHdpdGggdGhlIGlzX2h2bV92Y3B1KCkgY2hlY2sKPiA+
PiByaWdodCBiZWZvcmUgaXQ/Cj4gPiBCZWNhdXNlIGlmIEkgZG9uJ3QgZG8gdGhhdCB3ZSBnZXQg
ImRlZmluZWQgYnV0IG5vdCB1c2VkIiB3YXJuaW5ncy4KPiAKPiAoaG9wZWZ1bGx5KSBub3Qgd2l0
aCB0aGUgbmV3ZXIgaXNfaHZtX3ZjcHUoKSB3aGljaCBldmFsdWF0ZXMgaXRzCj4gYXJndW1lbnRz
IHByb3Blcmx5LgoKVGhlIHJlYWwgcmVhc29uIGlzIEkgcHV0IHBpdF90aW1lX2ZpcmVkIHVuZGVy
IENPTkZJR19IVk0gYmVjYXVzZSBpdCBpcwpvbmx5IHVzZWQgYXMgYSBIVk0gb25seSBjYWxsYmFj
ayAtLSBwYXNzZWQgYXMgYSBwYXJhbWV0ZXIgdG8KY3JlYXRlX3BlcmlvZGljX3RpbWUuCgpJZiBJ
IHJlbW92ZSBDT05GSUdfSFZNIGFyb3VuZCBwaXRfdGltZV9maXJlZCwgSSBjYW4gcmVtb3ZlIENP
TkZJR19IVk0gaW4KcGl0X2xvYWRfY291bnQuICBMZXQgbWUga25vdyBpZiB5b3UgcHJlZmVyIHRo
aXMuCgpXZWkuCgoKPiAKPiB+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
