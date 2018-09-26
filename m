From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V5] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Wed, 26 Sep 2018 17:01:00 +0300
Message-ID: <fe06e548-7f78-fffd-5360-4e6eeee496fa@bitdefender.com>
References: <1537947263-8469-1-git-send-email-rcojocaru@bitdefender.com>
 <f04e2217-ee7b-6ade-af17-f87952fe72c5@bitdefender.com>
 <1deabccf-a9e9-186a-9595-5a9790de37d2@bitdefender.com>
 <5BAB87B802000078001EC33E@prv1-mh.provo.novell.com>
 <15b0be88-a710-dec2-ad2d-058451f67b2c@bitdefender.com>
 <5BAB8BF402000078001EC37E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=twwh=mi=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g5ANC-0000hW-9A
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 14:01:02 +0000
In-Reply-To: <5BAB8BF402000078001EC37E@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gOS8yNi8xOCA0OjM5IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNi4wOS4xOCBh
dCAxNToyNywgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+PiBPbiA5LzI2LzE4
IDQ6MjAgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjYuMDkuMTggYXQgMTQ6MjYs
IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4+PiBUbyBjbGFyaWZ5IHRoZSBx
dWVzdGlvbiwgSSdsbCBvZiBjb3Vyc2UgZG8gdGhpczoKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3Mu
Ywo+Pj4+IGluZGV4IDY3YjRhMWQuLjJiNWE2MjEgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2FyY2gv
eDg2L21tL21lbV9hY2Nlc3MuYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNz
LmMKPj4+PiBAQCAtNDg5LDE0ICs0ODksMTMgQEAgbG9uZyBwMm1fc2V0X21lbV9hY2Nlc3NfbXVs
dGkoc3RydWN0IGRvbWFpbiAqZCwKPj4+PiAgaW50IHAybV9nZXRfbWVtX2FjY2VzcyhzdHJ1Y3Qg
ZG9tYWluICpkLCBnZm5fdCBnZm4sIHhlbm1lbV9hY2Nlc3NfdAo+Pj4+ICphY2Nlc3MsCj4+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGFsdHAybV9pZHgpCj4+Pj4gIHsK
Pj4+PiAtICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm07Cj4+Pj4gKyAgICBzdHJ1Y3QgcDJtX2Rv
bWFpbiAqcDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOwo+Pj4+Cj4+Pj4gKyNpZmRlZiBDT05GSUdf
SFZNCj4+Pj4gICAgICBpZiAoICFhbHRwMm1fYWN0aXZlKGQpICkKPj4+PiAgICAgIHsKPj4+PiAg
ICAgICAgICBpZiAoIGFsdHAybV9pZHggKQo+Pj4+ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPj4+PiAtCj4+Pj4gLSAgICAgICAgcDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOwo+Pj4+ICAg
ICAgfQo+Pj4+ICAgICAgZWxzZQo+Pj4+ICAgICAgewo+Pj4+IEBAIC01MDYsNiArNTA1LDkgQEAg
aW50IHAybV9nZXRfbWVtX2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sCj4+Pj4g
eGVubWVtX2FjY2Vzc190ICphY2Nlc3MsCj4+Pj4KPj4+PiAgICAgICAgICBwMm0gPSBkLT5hcmNo
LmFsdHAybV9wMm1bYWx0cDJtX2lkeF07Cj4+Pj4gICAgICB9Cj4+Pj4gKyNlbHNlCj4+Pj4gKyAg
ICBBU1NFUlQoIWFsdHAybV9pZHgpOwo+Pj4+ICsjZW5kaWYKPj4+Pgo+Pj4+ICAgICAgcmV0dXJu
IF9wMm1fZ2V0X21lbV9hY2Nlc3MocDJtLCBnZm4sIGFjY2Vzcyk7Cj4+Pj4gIH0KPj4+Pgo+Pj4+
IGJ1dCBpcyBpdCBPSyB0aGF0IHRoZSBoeXBlcnZpc29yIGJ1aWxkcyB3aXRoIGEgc2V0IG9mIGZs
YWdzIHRoYXQKPj4+PiBpbmNsdWRlcyBDT05GSUdfSFZNIGFuZCB0aGUgZmlybXdhcmUgY29kZSB3
aXRoIGEgc2V0IHRoYXQgZG9lc24ndD8KPj4+Cj4+PiBJcyB0aGlzIHBlcmhhcHMgc2ltcGx5IChz
byBmYXIgdW5ub3RpY2VkKSBmYWxsb3V0IGZyb20gV2VpJ3MgQ09ORklHX0hWTS0KPj4+IGRpc2Fi
bGluZyB3b3JrPyBPciBpbnN1ZmZpY2llbnQgcmUtYmFzaW5nIG9mIHlvdXIgY2hhbmdlIG9uIHRv
cCBvZiBoaXMKPj4+IHdvcms/IFRoZSBzaGltIG5vdyBidWlsZHMgd2l0aCBIVk09biwgd2hpbGUg
dGhlIGh5cGVydmlzb3IgKHVubGVzcwo+Pj4geW91J3ZlIG92ZXJyaWRkZW4gdGhlIGRlZmF1bHQp
IHVzZXMgSFZNPXkuCj4+Cj4+IEkgYmVsaWV2ZSBJJ20gdXAtdG8tZGF0ZToKPj4KPj4gJCBnaXQg
cHVsbCAtLXJlYmFzZSBvcmlnaW4gc3RhZ2luZwo+PiBGcm9tIGdpdDovL3hlbmJpdHMueGVucHJv
amVjdC5vcmcveGVuCj4+ICAqIGJyYW5jaCAgICAgICAgICAgIHN0YWdpbmcgICAgLT4gRkVUQ0hf
SEVBRAo+PiBDdXJyZW50IGJyYW5jaCBhbHRwMm0td29yayBpcyB1cCB0byBkYXRlLgo+Pgo+PiBJ
J3ZlIGFsc28gcmFuICJtYWtlIGNsZWFuIiwgIm1ha2UgZGlzdGNsZWFuIiwgImNvbmZpZ3VyZSIg
LSBhZ2FpbiwgYW5kCj4+ICJtYWtlIGRpc3QiIG9uZSBtb3JlIHRpbWUsIHdpdGggdGhlIHNhbWUg
cmVzdWx0cyAobWVtX2FjY2Vzcy5jIHdvbid0Cj4+IGNvbXBpbGUgaW4gdGhlIHNoaW0pLgo+IAo+
IEkgZGlkbid0IGltcGx5IHlvdSdyZSBvbiBhbiBvdXRkYXRlZCB0cmVlLCBidXQgcmF0aGVyIHRo
YXQgeW91IG1heSBub3QKPiBoYXZlIGRvbmUgYWxsIGNoYW5nZXMgbmVjZXNzYXJ5IHdoaWxlIHJl
LWJhc2luZyB5b3VyIGNoYW5nZSBvdmVyCj4gdXBzdHJlYW0gY29tbWl0cy4KCk90aGVyIHRoYW4g
dGhlIGFib3ZlICNpZmRlZi1lcnksIEkgZG9uJ3QgdGhpbmsgSSd2ZSBtaXNzZWQgYW55dGhpbmcK
ZWxzZSwgbm8uIEkndmUgYWxzbyBub3cgZG9uZSBhbiBmdWxsIGludHJvc3BlY3Rpb24gdGVzdCB3
aXRoIHRoZSBwYXRjaAphbmQgZXZlcnl0aGluZyBzZWVtcyB0byBiZWhhdmUgdGhlIHdheSBpdCdz
IHN1cHBvc2VkIHRvLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
