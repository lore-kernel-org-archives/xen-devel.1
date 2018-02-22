From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/HVM: don't give the wrong impression of
 WRMSR succeeding
Date: Thu, 22 Feb 2018 17:16:38 -0500
Message-ID: <2aa2cf71-64e1-a810-f194-a4a62279a1ce@oracle.com>
References: <5A8ED75E02000078001AA6A4@prv-mh.provo.novell.com>
 <4a278c80-0009-b875-c7ec-ea3333ae83b0@citrix.com>
 <5A8EF37002000078001AA7AB@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qayk=fq=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eoz9r-0001Kz-PR
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 22:16:07 +0000
In-Reply-To: <5A8EF37002000078001AA7AB@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjIvMjAxOCAxMDo0NCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMDIu
MTggYXQgMTU6NTMsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjIv
MDIvMTggMTM6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gLi4uIGZvciB1bmtub3duIE1TUnM6
IHdybXNyX2h5cGVydmlzb3JfcmVncygpJ3MgY29tbWVudCBjbGVhcmx5IHNheXMKPj4+IHRoYXQg
dGhlIGZ1bmN0aW9uIHJldHVybnMgMCBmb3IgdW5yZWNvZ25pemVkIE1TUnMsIHNvCj4+PiB7c3Zt
LHZteH1fbXNyX3dyaXRlX2ludGVyY2VwdCgpIHNob3VsZCBub3QgY29udmVydCB0aGlzIGludG8g
c3VjY2Vzcy4KPj4+Cj4+PiBBdCB0aGUgdGltZSBpdCB3ZW50IGluLCBjb21taXQgMDEzZTM0ZjVh
NiAoIng4NjogaGFuZGxlIHBhZ2VkIGdmbiBpbgo+Pj4gd3Jtc3JfaHlwZXJ2aXNvcl9yZWdzIikg
d2FzIHByb2JhYmx5IG9rYXksIHNpbmNlIHByaW9yIHRvIHRoYXQgdGhlCj4+PiByZXR1cm4gdmFs
dWUgd2Fzbid0IGNoZWNrZWQgYXQgYWxsLiBCdXQgdGhhdCdzIG5vdCBob3cgd2Ugd2FudCB0aGlu
Z3MKPj4+IHRvIGJlIGhhbmRsZWQgbm93YWRheXMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBJIGFncmVlIGluIHByaW5jaXBsZSwgYnV0
IHRoaXMgZG9lcyBoYXZlIGEgbGFyZ2UgcG90ZW50aWFsIHJpc2sgZm9yCj4+IGd1ZXN0cy4gIEFu
eSB1bmtub3duIE1TUiB3aGljaCBndWVzdHMgZG9uJ3QgY2hlY2sgZm9yICNHUCBmYXVsdHMgZnJv
bQo+PiB3aWxsIG5vdyBjYXVzZSB0aGUgZ3Vlc3RzIHRvIGNyYXNoLgo+Pgo+PiBUaGF0IHNhaWQs
IGl0IGlzIHRoZSBjb3JyZWN0IGRpcmVjdGlvbiB0byBnbyBsb25nLXRlcm0sIGFuZCB3ZSd2ZSBn
b3QgdG8KPj4gdGhyb3cgdGhlIHN3aXRjaCBzb21lIHRpbWUsIGJ1dCBJIGV4cGVjdCB0aGlzIHdp
bGwgY2F1c2UgcHJvYmxlbXMgaW4gdGhlCj4+IHNob3J0IHRlcm0sIGVzcGVjaWFsbHkgZm9yIG1p
Z3JhdGVkLWluIGd1ZXN0cy4KPiBUaGlua2luZyBhYm91dCB0aGlzIGFnYWluLCB0aGUgUkRNU1Ig
c2lkZSBvZiB0aGluZ3MgYWxyZWFkeSByYWlzZXMKPiAjR1AgZm9yIGluYWNjZXNzaWJsZSBNU1Jz
LiBXZSBvYnZpb3VzbHkgY2FuJ3QgZG8gYSBwcm9iaW5nIFdSTVNSCj4gaW4ge3N2bSx2bXh9X21z
cl93cml0ZV9pbnRlcmNlcHQoKSwgYnV0IGNvdWxkbid0IHdlIHJkbXNyX3NhZmUoKQo+IGluIHRo
ZSAiY2FzZSAwOiIgYmxvY2ssIHRyZWF0aW5nIHRoZSByZXN1bHQgYXMgdGhlIHZlcmRpY3Qgd2hl
dGhlciB0bwo+IHJhaXNlICNHUCB0byB0aGUgZ3Vlc3Q/IEFzIHRoZSByZWFkIHBhdGggZG9lcyB0
aGlzIGFueXdheSwgd2UncmUKPiBub3QgZXhwb3Npbmcgb3Vyc2VsdmVzIHRvIG5ldyByaXNrcy4K
CldoYXQgYWJvdXQgd3JpdGUtb25seSBNU1JzPwoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
