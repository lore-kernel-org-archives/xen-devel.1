From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] Make credit2 the default scheduler
Date: Wed, 19 Sep 2018 11:10:28 +0100
Message-ID: <4160ed0a-49ad-acb2-8a88-fa8308784ecc@citrix.com>
References: =?UTF-8?Q?<20180913163848.32216=ef=bf=bd1=ef=bf=bdgeorge.dunlap@?=
 =?UTF-8?Q?citrix.com>_<cc2e661cc8543353929aebf1f190abd109ff2b82.camel@suse.?=
 =?UTF-8?Q?com>_<5B9B752F02000078001E88AD@suse.com>_<448fbac9df715f260587016?=
 =?UTF-8?Q?53faa2a7f4d7d04f9.camel@suse.com>?=
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pksi=mb=citrix.com=prvs=793d3dae2=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g2ZRI-0008FI-S9
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 10:10:32 +0000
In-Reply-To: <448fbac9df715f260587016?=
 =?UTF-8?Q?53faa2a7f4d7d04f9.camel@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, "Ian Jackson <ian.jackson@citrix.com>" <ian.jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTQvMjAxOCAwMToyOSBQTSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gRnJpLCAy
MDE4LTA5LTE0IGF0IDA5OjQ1ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTMu
MDkuMTggYXQgMTg6NTEsIDxkZmFnZ2lvbGlAc3VzZS5jb20+IHdyb3RlOgo+Pj4gSSBmdWxseSBh
Z3JlZSB3aXRoIGFuZCBzZWNvbmQgR2VvcmdlJ3MgcmVhc29uaW5nLCBhbmQgZmVlbCAxMDAlCj4+
PiBsaWtlCj4+PiBwcm92aWRpbmcgbXk6Cj4+Pgo+Pj4gQWNrZWQtYnk6IERhcmlvIEZhZ2dpb2xp
IDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4+Cj4+IEFuZCB0aGF0J3MgZGVzcGl0ZSAic2NoZWQ9Y3Jl
ZGl0MiBjcmFzaGVzIHN5c3RlbSB3aGVuIHVzaW5nCj4+IGNwdXBvb2xzIj8gCj4+Cj4gV2VsbCwg
Y29uc2lkZXJpbmcgdGhhdCwgYXMgeW91IHNheSwgdGhlcmUncyBhIGZpeCBvbiB0aGUgbWFpbGlu
ZyBsaXN0Cj4gYWxyZWFkeSwgeWVzLgo+IAo+IEFuZCBJJ20gZ3Vlc3NpbmcgR2VvcmdlIG11c3Qg
ZmVlbCBraW5kIG9mIHRoZSBzYW1lLCBhcyBoZSBzZW50IHRoaXMKPiBwYXRjaCwgYmVmb3JlIHJl
dmlld2luZy9jb21taXR0aW5nIHRoZSBvdGhlci4KCldlbGwsIGFsc28gYmVjYXVzZSBvdXIgdGVh
bSBoYWQganVzdCBkb25lIG91ciByZXRyb3NwZWN0aXZlIGFuZCBub3RlZAp0aGUgc3RhdGUgb2Yg
Y3JlZGl0MiAoYW5kIEkgdGhpbmsgSWFuIGJyb3VnaHQgaXQgdXAgb24gSVJDKS4gIEl0IHdhcwpl
aXRoZXIgImRvIGl0IG5vdyIgb3IgInB1dCBpdCBvbiBhIGxpc3QgdG8gYmUgZG9uZSBzb29uIjsg
YW5kIG15ICJsaXN0Cm9mIHRoaW5ncyB0byBiZSBkb25lIHNvb24iIGlzIGFscmVhZHkgdG9vIGxv
bmcuIDotKQoKPiBJbiBmYWN0LCB0aGUgc29vbmVyIHdlIHN3aXRjaCwgdGhlIGVhcmxpZXIgT1NT
VGVzdCB3aWxsIHN0YXJ0IHVzZQo+IENyZWRpdDIgZm9yIGV2ZXJ5dGhpbmcsIGFuZCBzaG93IHVz
IHdoZXRoZXIgb3Igbm90IHRoZXJlIGFyZSBvdGhlcgo+IGlzc3Vlcy4gQW5kLCBzcGVha2luZyBh
Ym91dCB0aGF0IHNwZWNpZmljIGJ1ZywgT1NTVGVzdCBkb2VzIG5vdCBbc2ljIV0KPiB0ZXN0IGNw
dXBvb2xzLCBzbyBpdCdzIG5vdCBldmVuIGxpa2UgaXQnbGwgYmxvY2sgcHVzaGVzLgo+IAo+IFRo
YXQgYmVpbmcgc2FpZC4uLgo+IAo+PiBXaGlsZSBJIGFncmVlIHRoYXQgd2Ugc2hvdWxkbid0IGRl
bGF5IHRoZSBzd2l0Y2ggZm9yCj4+IG11Y2ggbG9uZ2VyLCBpbiBwYXJ0aWN1bGFyIHdpdGggdGhl
cmUgYWxyZWFkeSBiZWluZyBhIGZpeCBhdmFpbGFibGUKPj4gZnJvbSB5b3UgSSB0aGluayB0aGF0
IG9uZSBzaG91bGQgZ28gaW4gYmVmb3JlIHRoZSBvbmUgaGVyZS4KPj4KPiAuLi4gSSdtIGZpbmUg
aWYgbWFpbnRhaW5lcnMvY29tbWl0dGVycyBmZWVscyBsaWtlIHdhaXRpbmcgZm9yIHRoZSBvdGhl
cgo+IHBhdGNoIHRvIGdvIGluLiBUaGUgb3JkZXIgaW4gd2hpY2ggdGhleSdyZSBjb21taXR0ZWQs
IGlzIHNvbWV0aGluZyBJCj4gaGF2ZSBubyBjb250cm9sIG9uLiBJIGRvbid0IHRoaW5rIGl0J3Mg
c3RyaWN0bHkgbmVjZXNzYXJ5IGZvciB0aGlzCj4gcGF0Y2ggYW5kIHRoZSBmaXggdG8gaGl0IHRo
ZSByZXBvIGluIGEgcGFydGljdWxhciBvcmRlci4gQnV0IGlmIG90aGVycwo+IGRvLCBubyBwcm9i
bGVtLgoKSSBmZWVsIHRoZSBzYW1lIHdheTogSSBkb24ndCBzZWUgYW55IHJlYXNvbiB0byBkZWxh
eSwgYnV0IEkgZG9uJ3QgdGhpbmsKaXQncyB3b3J0aCBwcmVzc2luZyB0aGUgcG9pbnQgd2hlbiBp
dCdzIGp1c3QgYSBmZXcgZGF5cy4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
