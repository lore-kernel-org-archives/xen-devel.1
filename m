From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC v1 66/74] xen/shim: allow DomU to have
 as many vcpus as available
Date: Wed, 10 Jan 2018 16:14:00 +0000
Message-ID: <20180110161400.f4u5lcv7dybkc34j@MacBook-Pro-de-Roger.local>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-67-wei.liu2@citrix.com>
 <5A54AEA5020000780019CA37@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=8asd=ef=citrix.com=prvs=541767f32=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eZJ4l-0005cK-Di
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 16:18:03 +0000
Content-Disposition: inline
In-Reply-To: <5A54AEA5020000780019CA37@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMDksIDIwMTggYXQgMDM6NTk6MzNBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4g
Cj4gPiBTaW5jZSB0aGUgc2hpbSBWQ1BVT1Bfe3VwL2Rvd259IGh5cGVyY2FsbCBpcyB3aXJlZCB0
byB0aGUgcGx1Zy91bnBsdWcKPiA+IG9mIENQVXMgdG8gdGhlIHNoaW0gaXRzZWxmLCBzdGFydCB0
aGUgc2hpbSBEb21VIHdpdGggb25seSB0aGUgQlNQCj4gPiBvbmxpbmUsIGFuZCBsZXQgdGhlIGd1
ZXN0IGJyaW5nIHVwIG90aGVyIENQVXMgYXMgaXQgbmVlZHMgdGhlbS4KPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4gV2hh
dCBhcmUgdGhlIHJhbWlmaWNhdGlvbnMgb2Ygbm90IG1ha2luZyB0aGlzIGNoYW5nZT8gU2hvdWxk
bid0Cj4gdGhlIHNoaW0ncyBwQ1BVIGNvdW50IChwQ1BVIGFzIHZpZXdlZCBmcm9tIGl0cyBvd24g
cGVyc3BlY3RpdmUpCj4gc2ltcGx5IGFsd2F5cyBtYXRjaCBpdHMgY2xpZW50J3MgdkNQVSBjb3Vu
dD8KClllcywgdGhhdCdzIHRoZSBwb2ludCBvZiB0aGlzIGNoYW5nZS4gQnkgZGVmYXVsdCBEb20w
IHdpbGwgZ2V0IGEgbWFueQp2Q1BVcyBhcyBvbmxpbmUgcENQVXMuIMOHSW4gdGhlIHNoaW0gY2Fz
ZSB0aGUgbnVtYmVyIG9mIG9ubGluZSBwQ1BVcyBpcwphbHdheXMgMSwgYW5kIHRodXMgd2UgbmVl
ZCB0byBzZXQgbWF4X3ZjcHVzIHRvIG1hdGNoIHRoZSBudW1iZXIgb2YKcG9zc2libGUgcENQVXMu
Cgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYwo+ID4gKysrIGIveGVuL2Fy
Y2gveDg2L3B2L2RvbTBfYnVpbGQuYwo+ID4gQEAgLTY5NSw3ICs2OTUsOCBAQCBpbnQgX19pbml0
IGRvbTBfY29uc3RydWN0X3B2KHN0cnVjdCBkb21haW4gKmQsCj4gPiAgICAgIGZvciAoIGkgPSAw
OyBpIDwgWEVOX0xFR0FDWV9NQVhfVkNQVVM7IGkrKyApCj4gPiAgICAgICAgICBzaGFyZWRfaW5m
byhkLCB2Y3B1X2luZm9baV0uZXZ0Y2huX3VwY2FsbF9tYXNrKSA9IDE7Cj4gPiAgCj4gPiAtICAg
IHByaW50aygiRG9tMCBoYXMgbWF4aW11bSAldSBWQ1BVc1xuIiwgZC0+bWF4X3ZjcHVzKTsKPiA+
ICsgICAgcHJpbnRrKCIlcyBoYXMgbWF4aW11bSAldSBWQ1BVc1xuIiwgcHZfc2hpbSA/ICJEb21V
IiA6ICJEb20wIiwKPiAKPiAiRG9tJWMgLi4uIiBwZXJoYXBzPwoKV2UgY291bGQgZXZlbiB1c2Ug
RG9tJXUgYW5kIGQtPmRvbWFpbl9pZC4gVGhhdCB3b3VsZCByZW1vdmUgdGhlCmRlcGVuZGVuY3kg
b24gcHZfc2hpbS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
