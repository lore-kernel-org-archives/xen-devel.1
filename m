From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V5] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Wed, 26 Sep 2018 16:27:35 +0300
Message-ID: <15b0be88-a710-dec2-ad2d-058451f67b2c@bitdefender.com>
References: <1537947263-8469-1-git-send-email-rcojocaru@bitdefender.com>
 <f04e2217-ee7b-6ade-af17-f87952fe72c5@bitdefender.com>
 <1deabccf-a9e9-186a-9595-5a9790de37d2@bitdefender.com>
 <5BAB87B802000078001EC33E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=twwh=mi=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g59qs-0005gX-1Q
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 13:27:38 +0000
In-Reply-To: <5BAB87B802000078001EC33E@prv1-mh.provo.novell.com>
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

T24gOS8yNi8xOCA0OjIwIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNi4wOS4xOCBh
dCAxNDoyNiwgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+PiBUbyBjbGFyaWZ5
IHRoZSBxdWVzdGlvbiwgSSdsbCBvZiBjb3Vyc2UgZG8gdGhpczoKPj4KPj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vz
cy5jCj4+IGluZGV4IDY3YjRhMWQuLjJiNWE2MjEgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9tbS9tZW1fYWNjZXNzLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+
PiBAQCAtNDg5LDE0ICs0ODksMTMgQEAgbG9uZyBwMm1fc2V0X21lbV9hY2Nlc3NfbXVsdGkoc3Ry
dWN0IGRvbWFpbiAqZCwKPj4gIGludCBwMm1fZ2V0X21lbV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAq
ZCwgZ2ZuX3QgZ2ZuLCB4ZW5tZW1fYWNjZXNzX3QKPj4gKmFjY2VzcywKPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50IGFsdHAybV9pZHgpCj4+ICB7Cj4+IC0gICAgc3RydWN0
IHAybV9kb21haW4gKnAybTsKPj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtID0gcDJtX2dl
dF9ob3N0cDJtKGQpOwo+Pgo+PiArI2lmZGVmIENPTkZJR19IVk0KPj4gICAgICBpZiAoICFhbHRw
Mm1fYWN0aXZlKGQpICkKPj4gICAgICB7Cj4+ICAgICAgICAgIGlmICggYWx0cDJtX2lkeCApCj4+
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gLQo+PiAtICAgICAgICBwMm0gPSBwMm1f
Z2V0X2hvc3RwMm0oZCk7Cj4+ICAgICAgfQo+PiAgICAgIGVsc2UKPj4gICAgICB7Cj4+IEBAIC01
MDYsNiArNTA1LDkgQEAgaW50IHAybV9nZXRfbWVtX2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBn
Zm5fdCBnZm4sCj4+IHhlbm1lbV9hY2Nlc3NfdCAqYWNjZXNzLAo+Pgo+PiAgICAgICAgICBwMm0g
PSBkLT5hcmNoLmFsdHAybV9wMm1bYWx0cDJtX2lkeF07Cj4+ICAgICAgfQo+PiArI2Vsc2UKPj4g
KyAgICBBU1NFUlQoIWFsdHAybV9pZHgpOwo+PiArI2VuZGlmCj4+Cj4+ICAgICAgcmV0dXJuIF9w
Mm1fZ2V0X21lbV9hY2Nlc3MocDJtLCBnZm4sIGFjY2Vzcyk7Cj4+ICB9Cj4+Cj4+IGJ1dCBpcyBp
dCBPSyB0aGF0IHRoZSBoeXBlcnZpc29yIGJ1aWxkcyB3aXRoIGEgc2V0IG9mIGZsYWdzIHRoYXQK
Pj4gaW5jbHVkZXMgQ09ORklHX0hWTSBhbmQgdGhlIGZpcm13YXJlIGNvZGUgd2l0aCBhIHNldCB0
aGF0IGRvZXNuJ3Q/Cj4gCj4gSXMgdGhpcyBwZXJoYXBzIHNpbXBseSAoc28gZmFyIHVubm90aWNl
ZCkgZmFsbG91dCBmcm9tIFdlaSdzIENPTkZJR19IVk0tCj4gZGlzYWJsaW5nIHdvcms/IE9yIGlu
c3VmZmljaWVudCByZS1iYXNpbmcgb2YgeW91ciBjaGFuZ2Ugb24gdG9wIG9mIGhpcwo+IHdvcms/
IFRoZSBzaGltIG5vdyBidWlsZHMgd2l0aCBIVk09biwgd2hpbGUgdGhlIGh5cGVydmlzb3IgKHVu
bGVzcwo+IHlvdSd2ZSBvdmVycmlkZGVuIHRoZSBkZWZhdWx0KSB1c2VzIEhWTT15LgoKSSBiZWxp
ZXZlIEknbSB1cC10by1kYXRlOgoKJCBnaXQgcHVsbCAtLXJlYmFzZSBvcmlnaW4gc3RhZ2luZwpG
cm9tIGdpdDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcveGVuCiAqIGJyYW5jaCAgICAgICAgICAg
IHN0YWdpbmcgICAgLT4gRkVUQ0hfSEVBRApDdXJyZW50IGJyYW5jaCBhbHRwMm0td29yayBpcyB1
cCB0byBkYXRlLgoKSSd2ZSBhbHNvIHJhbiAibWFrZSBjbGVhbiIsICJtYWtlIGRpc3RjbGVhbiIs
ICJjb25maWd1cmUiIC0gYWdhaW4sIGFuZAoibWFrZSBkaXN0IiBvbmUgbW9yZSB0aW1lLCB3aXRo
IHRoZSBzYW1lIHJlc3VsdHMgKG1lbV9hY2Nlc3MuYyB3b24ndApjb21waWxlIGluIHRoZSBzaGlt
KS4KCkluIGFueSBjYXNlLCBJJ2xsIHJlc2VuZCBhIGNvcnJlY3RlZCAoYXMgYWJvdmUpIHZlcnNp
b24gdG9tb3Jyb3csIHRvCmhvcGVmdWxseSBnZXQgbW9yZSBjb21tZW50cyBvbiB0aGUgY3VycmVu
dCB2ZXJzaW9uIGluIHRoZSBtZWFudGltZS4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
