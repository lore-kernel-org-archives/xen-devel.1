From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 28/34] x86/vm_event: put vm_event_fill_regs
 under CONFIG_HVM
Date: Tue, 21 Aug 2018 11:45:11 +0100
Message-ID: <20180821104511.ut3tqrknj4tdjpee@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <d8838b921f3d33265ca7ed08ff256a7423a58404.1534518694.git-series.wei.liu2@citrix.com>
 <71b93a62-5bcd-918a-7b9a-0da6e16270c6@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7kme=le=citrix.com=prvs=7644f7420=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fs49z-0002M8-C3
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 10:45:15 +0000
Content-Disposition: inline
In-Reply-To: <71b93a62-5bcd-918a-7b9a-0da6e16270c6@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBBdWcgMTksIDIwMTggYXQgMDc6NDE6MTFQTSArMDMwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IE9uIDgvMTcvMTggNjoxMiBQTSwgV2VpIExpdSB3cm90ZToKPiA+IElkZWFsbHkg
dGhlIEhWTSBzcGVjaWZpYyBwYXJ0IG9mIFZNIGV2ZW50IHNob3VsZCBiZSBtb3ZlZCBpbnRvIGh2
bS8gYXQKPiA+IHNvbWUgcG9pbnQsIGJ1dCB0aGlzIHdpbGwgZG8gZm9yIG5vdy4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4g
IHhlbi9hcmNoL3g4Ni92bV9ldmVudC5jIHwgMiArKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni92bV9ldmVudC5j
IGIveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMKPiA+IGluZGV4IGY5MWFhZGUuLmI0ZjZhZmIgMTAw
NjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvdm1fZXZlbnQuYwo+ID4gKysrIGIveGVuL2FyY2gv
eDg2L3ZtX2V2ZW50LmMKPiA+IEBAIC0xMjQsNiArMTI0LDcgQEAgdm9pZCB2bV9ldmVudF9tb25p
dG9yX25leHRfaW50ZXJydXB0KHN0cnVjdCB2Y3B1ICp2KQo+ID4gIAo+ID4gIHZvaWQgdm1fZXZl
bnRfZmlsbF9yZWdzKHZtX2V2ZW50X3JlcXVlc3RfdCAqcmVxKQo+ID4gIHsKPiA+ICsjaWYgQ09O
RklHX0hWTQo+ID4gICAgICBjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncyA9IGd1ZXN0
X2NwdV91c2VyX3JlZ3MoKTsKPiA+ICAgICAgc3RydWN0IHNlZ21lbnRfcmVnaXN0ZXIgc2VnOwo+
ID4gICAgICBzdHJ1Y3QgaHZtX2h3X2NwdSBjdHh0Owo+ID4gQEAgLTE3Nyw2ICsxNzgsNyBAQCB2
b2lkIHZtX2V2ZW50X2ZpbGxfcmVncyh2bV9ldmVudF9yZXF1ZXN0X3QgKnJlcSkKPiA+ICAKPiA+
ICAgICAgaHZtX2dldF9zZWdtZW50X3JlZ2lzdGVyKGN1cnIsIHg4Nl9zZWdfY3MsICZzZWcpOwo+
ID4gICAgICByZXEtPmRhdGEucmVncy54ODYuY3NfYXJieXRlcyA9IHNlZy5hdHRyOwo+ID4gKyNl
bmRpZgo+ID4gIH0KPiAKPiBTb21lIHJlZ2lzdGVycyBjYW4gYmUgb2J0YWluZWQgaGVyZSB3aXRo
b3V0IHVzaW5nIEhWTS1zcGVjaWZpYyBjb2RlLAo+IHVubGVzcyBJJ20gbWlzdW5kZXJzdGFuZGlu
ZyBob3cgaXQgd29ya3MuIFNvIEkgd29uZGVyIGlmIGl0IHdvdWxkbid0IGJlCj4gYmV0dGVyIHRv
IHB1dCBvbmx5IHRoZSAic3RydWN0IGh2bV9od19jcHUgY3R4dDsiLXJlbGF0ZWQgY29kZSB1bmRl
cgo+IENPTkZJR19IVk0gLSB0aGF0IHdheSB3aGF0IGNhbiBiZSBxdWVyaWVkIHZpYSBndWVzdF9j
cHVfdXNlcl9yZWdzKCkKPiBhbG9uZSB3b24ndCBiZSBsb3N0Lgo+IAoKQnV0IHRoZXJlIGlzIGFu
IGFzc2VydGlvbiBmb3IgaXNfaHZtX3ZjcHUgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUKZnVuY3Rp
b24sIHRoYXQncyBob3cgSSBnb3QgdGhlIGltcHJlc3Npb24gdGhhdCBmdW5jdGlvbiBpcyBzdXBw
b3NlZCB0bwpiZSBIVk0gb25seS4gRG8geW91IHdhbnQgbWUgdG8gcmVtb3ZlIHRoYXQgQVNTRVJU
IHRvbz8KCldlaS4KCj4gCj4gVGhhbmtzLAo+IFJhenZhbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
