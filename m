From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V3] x86/altp2m: clean up
 p2m_{get/set}_suppress_ve()
Date: Fri, 26 Oct 2018 14:20:30 +0300
Message-ID: <e8150e7a-7991-a926-eb66-0c61fbe26c89@bitdefender.com>
References: <1537873355-5169-1-git-send-email-rcojocaru@bitdefender.com>
 <5BD2F46302000078001F50A6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=h5dl=ng=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gG0AR-0002Pe-Ei
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 11:20:39 +0000
In-Reply-To: <5BD2F46302000078001F50A6@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMjYvMTggMjowMiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjUuMDkuMTgg
YXQgMTM6MDIsIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gTW92ZSBwMm1f
e2dldC9zZXR9X3N1cHByZXNzX3ZlKCkgdG8gcDJtLmMsIHJlcGxhY2UgaW5jb3JyZWN0Cj4+IEFT
U0VSVCgpIGluIHAybS1wdC5jIChzaW5jZSBhIGd1ZXN0IGNhbiBydW4gaW4gc2hhZG93IG1vZGUg
ZXZlbiBvbgo+PiBhIHN5c3RlbSB3aXRoIHZpcnQgZXhjZXB0aW9ucywgd2hpY2ggd291bGQgdHJp
Z2dlciB0aGUgQVNTRVJUKCkpLAo+PiBtb3ZlIHRoZSBWTVgtaXNtcyAoY3B1X2hhc192bXhfdmly
dF9leGNlcHRpb25zIGNoZWNrcykgdG8KPj4gcDJtX2VwdF97Z2V0L3NldH1fZW50cnkoKSwgYW5k
IGZpeCBsb2NraW5nIGNvZGUgaW4KPj4gcDJtX2dldF9zdXBwcmVzc192ZSgpLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4+
Cj4+IC0tLQo+PiBDaGFuZ2VzIHNpbmNlIFYyOgo+PiAgLSBSZWJhc2VkIG9uIHN0YWdpbmcsIGRv
dWJsZS1jaGVja2VkIHRoZSBwYXRjaC4KPj4gLS0tCj4+ICB4ZW4vYXJjaC94ODYvbW0vbWVtX2Fj
Y2Vzcy5jIHwgMTAyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
Pj4gIHhlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMgICAgfCAgMTEgKysrKysKPj4gIHhlbi9hcmNo
L3g4Ni9tbS9wMm0tcHQuYyAgICAgfCAgIDMgKy0KPj4gIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyAg
ICAgICAgfCAgOTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gIDQg
ZmlsZXMgY2hhbmdlZCwgMTAzIGluc2VydGlvbnMoKyksIDEwMyBkZWxldGlvbnMoLSkKPiAKPiBJ
IHN0aWxsIGhhdmUgdGhpcyBpbiBteSB0by1iZS1hcHBsaWVkIGxpc3QsIGJ1dCBJJ20gbm90IHN1
cmUgd2hldGhlciBpdCdzCj4gbm93IHN0YWxlLCBhbmQgaXQncyBzdGlsbCBtaXNzaW5nIGFuIGFj
ayBmcm9tIFRhbWFzLgoKSXQgaGFzIGFscmVhZHkgYmVlbiBhcHBsaWVkIGJ5IEdlb3JnZToKCmh0
dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29tbWl0ZGlmZjtoPTAz
NDgxODRkZDJlZTQzZDM0MzYyM2QzZGI2NDdhZjNlNjM1ZmQwYzMKCgpUaGFua3MsClJhenZhbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
