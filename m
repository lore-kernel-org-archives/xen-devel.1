From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 19/23] x86: PIT emulation is common to
 both PV and HVM
Date: Tue, 28 Aug 2018 15:56:36 +0100
Message-ID: <20180828145636.uauytstcjrwygzxe@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <3c651e5f60a496e3e5661f60bd7e913dab2b05a0.1535285866.git-series.wei.liu2@citrix.com>
 <5B8535B302000078001E28EB@prv1-mh.provo.novell.com>
 <20180828131954.sszmpjeuhy4ulqpv@citrix.com>
 <5B855DF502000078001E29FD@prv1-mh.provo.novell.com>
 <20180828144807.hv2ifgcn6pchmebk@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ardv=ll=citrix.com=prvs=7715574d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fufQ7-0008K3-Q5
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 14:56:39 +0000
Content-Disposition: inline
In-Reply-To: <20180828144807.hv2ifgcn6pchmebk@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMDM6NDg6MDdQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIEF1ZyAyOCwgMjAxOCBhdCAwODozNjozN0FNIC0wNjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+ID4+PiBPbiAyOC4wOC4xOCBhdCAxNToxOSwgPHdlaS5saXUyQGNpdHJpeC5jb20+
IHdyb3RlOgo+ID4gPiBPbiBUdWUsIEF1ZyAyOCwgMjAxOCBhdCAwNTo0NDo1MUFNIC0wNjAwLCBK
YW4gQmV1bGljaCB3cm90ZToKPiA+ID4+ID4+PiBPbiAyNi4wOC4xOCBhdCAxNDoxOSwgPHdlaS5s
aXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gPj4gPiBNb3ZlIHRoZSBmaWxlIHRvIHg4NiBjb21t
b24gY29kZSBhbmQgY2hhbmdlIGl0cyBuYW1lIHRvIGVtdWwtaTgyNTQuYy4KPiA+ID4+ID4gCj4g
PiA+PiA+IFB1dCBIVk0gb25seSBjb2RlIHVuZGVyIENPTkZJR19IVk0gb3IgaXNfaHZtX2RvbWFp
bi4KPiA+ID4+ID4gCj4gPiA+PiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+Cj4gPiA+PiA+IC0tLQo+ID4gPj4gPiB2MjogbW92ZSB0aGUgd2hvbGUgZmlsZS4K
PiA+ID4+ID4gLS0tCj4gPiA+PiA+ICB4ZW4vYXJjaC94ODYvTWFrZWZpbGUgICAgIHwgICAxICst
Cj4gPiA+PiA+ICB4ZW4vYXJjaC94ODYvZW11bC1pODI1NC5jIHwgNjA5ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ID4+ID4gIHhlbi9hcmNoL3g4Ni9odm0vTWFr
ZWZpbGUgfCAgIDEgKy0KPiA+ID4+ID4gIHhlbi9hcmNoL3g4Ni9odm0vaTgyNTQuYyAgfCA1OTcg
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+PiA+ICA0IGZpbGVz
IGNoYW5nZWQsIDYxMCBpbnNlcnRpb25zKCspLCA1OTggZGVsZXRpb25zKC0pCj4gPiA+PiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2VtdWwtaTgyNTQuYwo+ID4gPj4gPiAgZGVs
ZXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9odm0vaTgyNTQuYwo+ID4gPj4gCj4gPiA+PiBP
biB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSBjaGFuZ2VzIHRvIHRoZSBmaWxlIGFyZSBvbmx5IENP
TkZJR19IVk0KPiA+ID4+IGFkZGl0aW9ucwo+ID4gPiAKPiA+ID4gTm8gb25seSB0aGF0LiBUaGVy
ZSBhcmUgYSBmZXcgaXNfaHZtX2RvbWFpbiBjYWxscyBhcyB3ZWxsLgo+ID4gPiAKPiA+ID4+IEFj
a2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiA+IAo+ID4gPiBEb2Vz
IHRoaXMgc3RpbGwgc3RhbmQ/Cj4gPiAKPiA+IFllcywgYWxiZWl0IGxvb2tpbmcgYXQgdGhlIGZ1
bGwgZGlmZiBvZiB0aGUgZmlsZXMgSSdtIHRoZW4gYSBsaXR0bGUKPiA+IHB1enpsZWQgYWJvdXQg
aXNfaHZtX2RvbWFpbigpIHVzZXM6IFdoeSBkb2VzIHBpdF9sb2FkX2NvdW50KCkKPiA+IG5lZWQg
YW4gI2lmZGVmIGFkZGVkIGF0IGFsbCwgd2l0aCB0aGUgaXNfaHZtX3ZjcHUoKSBjaGVjawo+ID4g
cmlnaHQgYmVmb3JlIGl0Pwo+IAo+IEJlY2F1c2UgaWYgSSBkb24ndCBkbyB0aGF0IHdlIGdldCAi
ZGVmaW5lZCBidXQgbm90IHVzZWQiIHdhcm5pbmdzLgoKVGhpcyBpcyBub25zZW5zZS4gSSBtaXNy
ZWFkIHRoZSBmdW5jdGlvbiBuYW1lLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
