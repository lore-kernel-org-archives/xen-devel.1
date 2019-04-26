From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 2/3] x86/mem_sharing: replace use of
 page_lock/unlock with our own lock
Date: Fri, 26 Apr 2019 07:18:26 -0600
Message-ID: <CABfawhmr1pK6BODzxfJpOeRz8U8DCacprBUpLMny0fg6qBZZQg@mail.gmail.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
 <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
 <495a1395-06d4-2ce3-7216-1417ba41fe07@citrix.com>
 <CABfawhm8KxHwY4PB8u-EBqw0K+G1Hv9S9iTC_RYaqOY15bxX4A@mail.gmail.com>
 <5CC2CE3D02000078002295C7@prv1-mh.provo.novell.com>
 <CABfawh=fLVp+b-K_Que5UEDDzMoYysEtVP8itb+cWoXAJdToSA@mail.gmail.com>
 <5CC303B60200007800229748@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jv+f=S4=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hK0ks-0006vv-GX
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 13:19:06 +0000
Received: by mail-wr1-f43.google.com with SMTP id r6so4446445wrm.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 06:19:04 -0700 (PDT)
In-Reply-To: <5CC303B60200007800229748@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgNzoxMiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI2LjA0LjE5IGF0IDE0OjI0LCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBGcmksIEFwciAyNiwgMjAxOSBhdCAzOjI0IEFNIEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiA+Pj4gT24gMjYuMDQu
MTkgYXQgMDI6MTIsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90ZToKPiA+PiA+IEkgd291bGQg
YmUgT0sgd2l0aCBwdXR0aW5nIHRoZSB3aG9sZSB0aGluZyBiZWhpbmQKPiA+PiA+IENPTkZJR19I
QVNfTUVNX1NIQVJJTkcgYW5kIGhhdmluZyB0aGF0IGJlIG9mZiBieSBkZWZhdWx0LiBJcyB0aGF0
IGEKPiA+PiA+IGZlYXNpYmxlIHJvdXRlIGZyb20geW91ciBQT1Y/Cj4gPj4KPiA+PiBTbyBpcyB0
aGVyZSBhbnl0aGluZyB3cm9uZyB3aXRoIG15IGVhcmxpZXIgc3VnZ2VzdGlvbiBvZgo+ID4+IHJl
LXB1cnBvc2luZyB0aGUgc2hhcmluZyBmaWVsZCB0byBhdHRhY2ggYSBzdHJ1Y3R1cmUgdG8gdGhl
IHBhZ2UKPiA+PiB3aGljaCBjb250YWlucyB0aGUgbmVjZXNzYXJ5IGxvY2s/IEkuZS4gaW4gdGhl
IHNpbXBsZXN0IGNhc2UgYnkKPiA+PiBhZGRpbmcgdGhlIGxvY2sgdG8gc3RydWN0IHBhZ2Vfc2hh
cmluZ19pbmZvIGl0c2VsZj8KPiA+Cj4gPiBZZXMsIHRoYXQgd29uJ3Qgd29yayB1bmZvcnR1bmF0
ZWx5LiBUaGUgbG9jayBpcyBzdXBwb3NlZCB0byBwcm90ZWN0Cj4gPiB1cGRhdGVzIG1hZGUgdG8g
dGhlIHN0cnVjdHVyZSBidXQgYWxzbyBmcmVlaW5nIGl0LiBJZiB0aGUgbG9jayBsaXZlcwo+ID4g
d2l0aGluIHRoZSBzdHJ1Y3R1cmUgaXQgb2J2aW91c2x5IHdvdWxkIGhhdmUgdG8gYmUgdW5sb2Nr
ZWQgYmVmb3JlIGl0cwo+ID4gZnJlZWQsIGJ1dCBpZiBpdHMgdW5sb2NrZWQgYmVmb3JlIGZyZWVk
IHRoZW4gYW5vdGhlciB0aHJlYWQgd2FpdGluZyBvbgo+ID4gaXQgY291bGQgY29udGludWUgd2l0
aG91dCByZWFsaXppbmcgaXQgaXMgYmVpbmcgZnJlZWQuCj4KPiBDYW4ndCB5b3UgUkNVLWZyZWUg
dGhlIHN0cnVjdHVyZSBpbnN0ZWFkLCBhZnRlciBkZXRhY2hpbmcgaXQgZnJvbQo+IHRoZSBtYWlu
IHN0cnVjdCBwYWdlX2luZm8gaW5zdGFuY2U/IE9mIGNvdXJzZSBhbGwgaW52b2x2ZWQgcGFydGll
cwo+IHRoZW4gbmVlZCB0byBiZSBhd2FyZSB0aGF0IG9uY2UgdGhleSd2ZSBhY3F1aXJlZCB0aGUg
bG9jaywgdGhlCj4gcG9pbnRlciBpbiBzdHJ1Y3QgcGFnZV9pbmZvIG1heSBoYXZlIGJlY29tZSBO
VUxMLCB3aGljaAo+IHByZXN1bWFibHkgd291bGQgZGlyZWN0IHRoZW0gdG8gZHJvcCB0aGUgbG9j
ayBhZ2FpbiByaWdodCBhd2F5LgoKSXQncyBhIGNoaWNrZW4tYW5kLXRoZS1lZ2cgcHJvYmxlbS4g
SXQgd291bGRuJ3QgYmUgc2FmZSB3aXRob3V0IGEgbG9jawp0byBkbyBhbnl0aGluZyB3aXRoIHRo
YXQgc3RydWN0dXJlLiBIYXZpbmcgYSBjYWxsZXIgYmUgYWJsZSB0byBncmFiCnRoZSBsb2NrIGJ1
dCBoYXZlIGFuIHVuZGVyc3RhbmRpbmcgdGhhdCB0aGUgc3RydWN0dXJlIC0gaW5jbHVkaW5nIHRo
ZQpsb2NrIGl0c2VsZiAtIG1heSBiZSBmcmVlZCBpcyBub3QgYSBmZWFzaWJsZSByb3V0ZS4gSWYg
aXQgd2FzIHBvc3NpYmxlCnRvIGRvIHRoYXQga2luZC1vZiBjb29yZGluYXRpb24gdGhlbiB3ZSB3
b3VsZG4ndCBuZWVkIGEgbG9jayBpbiB0aGUKZmlyc3QgcGxhY2UuCgpUYW1hcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
