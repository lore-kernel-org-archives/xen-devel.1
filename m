From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: Setting up a Xen x86 community call
Date: Mon, 5 Mar 2018 11:39:38 +0100
Message-ID: <20180305103938.GQ20614@olila.local.net-space.pl>
References: <B2025C1A-199C-4019-9ECF-AFF34FE8D702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qi6c=f3=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1esnXG-0001dv-2e
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 10:40:02 +0000
Content-Disposition: inline
In-Reply-To: <B2025C1A-199C-4019-9ECF-AFF34FE8D702@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>, tamas@tklengyel.com, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Susie Li <susie.li@intel.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <royger@freebsd.org>, John Ji <john.ji@intel.com>, Babu Moger <Babu.Moger@amd.com>, Rich Persaud <persaur@gmail.com>, paul.durrant@citrix.com, committers@xenproject.org, Jan Beulich <jbeulich@suse.com>, "Hurwitz,
 Sherry" <sherry.hurwitz@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, joao.m.martins@oracle.com, Brian Woods <brian.woods@amd.com>, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMDIsIDIwMTggYXQgMDQ6Mzk6NTlQTSArMDEwMCwgTGFycyBLdXJ0aCB3cm90
ZToKPiBIaSBhbGwsCj4gKHNvcnJ5IGZvciB0aGUgZXh0ZW5zaXZlIGRpc3RyaWJ1dGlvbiBsaXN0
IC0gSSB3ZW50IHRocm91Z2ggTUFJTlRBSU5FUlMgYW5kIHBlb3BsZSB3aG8gbWF5IGhhdmUgYW4g
aW50ZXJlc3QpCj4KPiBJIHdvdWxkIGxpa2UgdG8gc3RhcnQgb3JnYW5pemluZyBhIHJlY3Vycmlu
ZyB4ODYgY29tbXVuaXR5IGNhbGwgdG8gZGlzY3VzcyBhbmQgc3luYy11cCBvbiB1cGNvbWluZyBm
ZWF0dXJlcyBmb3IgWGVuIG9uIHg4Ni4gVGhpcyBjYWxsIHdvdWxkIG1pcnJvciBhbmQgZm9sbG93
IGEgc2ltaWxhciBzdHJ1Y3R1cmUgdG8gdGhlIEFSTSBjYWxsIChzZWUgaHR0cDovL3hlbi5tYXJr
bWFpbC5vcmcvdGhyZWFkL3hxZHh2cWNqcGYyeTVmdHUgZm9yIHRoZSBsYXN0IG9uZSkKPgo+IEkg
ZXhwZWN0IHRoYXQgdGhlIGNhbGwgd2lsbCBjb250YWluCj4KPiBhKSBDb29yZGluYXRpb24gYW5k
IFBsYW5uaW5nCj4gQ29vcmRpbmF0aW5nIHdobyBkb2VzIHdoYXQsIHdoYXQgbmVlZHMgYXR0ZW50
aW9uLCB3aGF0IGlzIGJsb2NrZWQsIGV0Yy4KPiBJIHdvdWxkIHByZXBhcmUgYSBsaXN0IG9mIG5v
bi1tZXJnZWQgcGF0Y2ggc2VyaWVzIG9mIGEgY2VydGFpbiBzaXplIChlLmcuIG1vcmUgdGhhbiA1
IHBhdGNoZXMpIGFuZCBhdHRhY2ggdG8gdGhlIGludml0ZQo+IElmIGFueXRoaW5nIGlzIG1pc3Nl
ZCwgSSB3b3VsZCBleHBlY3QgdGhhdCB0aGVzZSBhcmUgc2VudCB0byBtZSBiZWZvcmUgdGhlIG1l
ZXRpbmcKPgo+IGIpIERlc2lnbiBhbmQgYXJjaGl0ZWN0dXJlIHJlbGF0ZWQgZGlzY3Vzc2lvbnM6
IGluIHBhcnRpY3VsYXIgZm9yIGJpZ2dlciwgbW9yZSBjb21wbGV4IGl0ZW1zLCAuLi4KPiBBbHRo
b3VnaCBhbGwgb2YgdGhpcyBjb3VsZCBiZSBkb25lIGJ5IGVtYWlsLCBpbiByZWFsaXR5LCB3ZSBh
cmUgYWxsIGh1bWFuIGFuZCBtYW55IHBlb3BsZSBmaW5kIGl0IGVhc2llciB0byBjb2xsYWJvcmF0
ZQo+IGFuZCBjb21tdW5pY2F0ZSBieSB0YWxraW5nIHRvIGVhY2ggb3RoZXIsIHJhdGhlciB0aGFu
IGJ5IGVtYWlsLiBUaGlzIGlzIG5vdCBhIG11c3QsIGJ1dCBhbiBvcHRpb24gdG8gaGlnaGxpZ2h0
IGlzc3Vlcwo+Cj4gYykgRGVtb3MsIFNoYXJpbmcgb2YgRXhwZXJpZW5jZXMsIFNvbWV0aW1lcyBk
aXNjdXNzaW9uIG9mIHNwZWNpZmljIGlzc3Vlcy9idWdzL3Byb2JsZW1zLy4uLgo+IFRoaXMgaXMg
c29tZXRoaW5nIHdoaWNoIGhhcHBlbnMgZnJlcXVlbnRseSBvbiB0aGUgQVJNIGNhbGwgYW5kIHNl
ZW1zIHRvIHdvcmsgdmVyeSB3ZWxsCj4KPiBJIHdvdWxkIHN1Z2dlc3QgdG8gc3RhcnQgd2l0aCBh
IDEgaG91ciBtb250aGx5IG1lZXRpbmc6IHBvc3NpYmx5IGV2ZXJ5IDJuZCBUdWUgb3IgVGh1IGVh
Y2ggbW9udGggKGRlcGVuZHMgb24gdGltaW5nKS4gSSBrbm93IHRoYXQgcGVvcGxlIGFyZSBzcHJl
YWQgYWNyb3NzIGRpZmZlcmVudCB0aW1lem9uZXMgKGZyb20gQ2hpbmEgdG8gdGhlIFVTKSwgc28g
SSB3b3VsZCBsaWtlIHRvIGdhdGhlciB0aG91Z2h0cyBiZWZvcmUgY2hvb3NpbmcgYSB0aW1lLiBX
ZSBtYXkgaGF2ZSB0byBoYXZlIGFsdGVybmF0aW5nIHRpbWUtc2xvdHMgZXZlcnkgb3RoZXIgbW9u
dGg6IGJ1dCB0aGlzIGlzIG5vdCBpZGVhbCBmb3Igc29tZS4KPgo+IFRvIGRvIHRoaXMsIHBsZWFz
ZQo+ICogUmFpc2UgeW91ciBoYW5kcyBvbiB3aGV0aGVyIHlvdSBvciB5b3VyIG9yZyB3b3VsZCB3
YW50IHRvIHBhcnRpY2lwYXRlCgpcby8KCj4gKiBQcm92aWRlIHlvdXIgdGltZXpvbmUKCkNFVC9D
RVNUCgo+ICogUHJvdmlkZSBhIFVUQyB0aW1lIHJhbmdlIHdoZW4geW91IGNhbiBhdHRlbmQKClR1
ZXNkYXkgZXhjZXB0IDE2OjAwLTE3OjAwLzE1OjAwLTE2OjAwIFVUQyB3b3JrcyBmb3IgbWUuClRo
dXJzZGF5IGRvZXMgbm90IGF0IGFsbC4KCkRhbmllbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
