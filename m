From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 3/6] libxc: allow HVM guest to have
 modules
Date: Thu, 5 Jul 2018 11:35:54 +0100
Message-ID: <20180705103554.prdqjzoilkdp2q3o@citrix.com>
References: <20180626111334.9251-1-wei.liu2@citrix.com>
 <20180626111334.9251-4-wei.liu2@citrix.com>
 <23357.62229.523334.147604@mariner.uk.xensource.com>
 <20180705103427.hhulatb3ndr42yid@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rzas=jv=citrix.com=prvs=717a9f9c1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fb1cE-0003UO-81
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 10:35:58 +0000
Content-Disposition: inline
In-Reply-To: <20180705103427.hhulatb3ndr42yid@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMDUsIDIwMTggYXQgMTE6MzQ6MjdBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIEp1bCAwNSwgMjAxOCBhdCAxMToyOTo0MUFNICswMTAwLCBJYW4gSmFja3NvbiB3
cm90ZToKPiA+IFdlaSBMaXUgd3JpdGVzICgiW1BBVENIIHYzIDMvNl0gbGlieGM6IGFsbG93IEhW
TSBndWVzdCB0byBoYXZlIG1vZHVsZXMiKToKPiA+ID4gTGlmdCB0aGUgbG9hZGluZyBjb2RlIG91
dCBvZiBQVkggc3BlY2lmaWMgYnJhbmNoLiBUYWtlIHRoZSBjaGFuY2UgdG8KPiA+ID4gbWFrZSB0
aGUgZGVidWcgbWVzc2FnZSBtb3JlIHVzZWZ1bC4gIE5vdyB0aGUgY29kZSBuZWVkcyB0byB0YWtl
IGludG8KPiA+ID4gYWNjb3VudCB2aXJ0X2Jhc2UuCj4gPiAKPiA+IEknbSBhZnJhaWQgdGhpcyBj
b21taXQgbWVzc2FnZSdzIG5vdGUgYWJvdXQgdmlydF9iYXNlIGlzIGEgYml0IG9wYXF1ZSwKPiA+
IGFuZCBsb29rcyB3cm9uZyB0byBtZS4KPiA+IAo+ID4gQUlVSSB5b3UgbWVhbiBzb21ldGhpbmcg
bW9yZSBsaWtlCj4gPiAKPiA+ICAgTm93IHRoZSBjb2RlIG5lZWRzIHRvIGhhbmRsZSB2aXJ0X2Jh
c2UgYmVpbmcgVU5TRVRfQUREUiwgd2hpY2ggaXQgaXMKPiA+ICAgZm9yIEhWTSBndWVzdHMuICBJ
biB0aGF0IGNhc2Ugc2VnLnZzdGFydCBpcyBpbnRlcnByZXRlZCBieSA/Pz8KPiA+ICAgYXMgYW4g
Pz8/IG9mZnNldCBmcm9tIHplcm8gPz8/Cj4gCj4gTm93IHRoZSBjb2RlIG5lZWRzIHRvIGhhbmRs
ZSB2aXJ0X2Jhc2UgYmVpbmcgVU5TRVRfQUREUiwgd2hpY2ggaXQgaXMgZm9yCj4gSFZNIGd1ZXN0
LiBJbiBjYXNlIFBWSCBhbmQgUFYsIHZpcnRfYmFzZSBpcyBzZXQgYnkgdGhlIHJlc3BlY3RpdmUg
bG9hZGVyCj4gYnkgcGFyc2luZyB0aGUgYmluYXJ5LgoKSW4gY2FzZSB2aXJ0X2Jhc2UgaXMgbm90
IHNldCwgaXQgc2hvdWxkIGJlIHRyZWF0ZWQgYXMgemVyby4KCldlaS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
