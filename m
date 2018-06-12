From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] xen/altp2m: set access_required properly
 for all altp2ms
Date: Tue, 12 Jun 2018 18:07:58 +0300
Message-ID: <71eda7fd-3dd2-997a-9973-7ef14fdcc8da@bitdefender.com>
References: <1528729942-4384-1-git-send-email-rcojocaru@bitdefender.com>
 <5B1FBB3202000078001CA6D7@prv1-mh.provo.novell.com>
 <f45802c8-1484-cb1d-91e1-bec3345272e7@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f45802c8-1484-cb1d-91e1-bec3345272e7@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMjAxOCAwMzozNSBQTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+Pj4gQEAgLTIx
MCw3ICsyMTEsNyBAQCBzdGF0aWMgaW50IHAybV9pbml0X2FsdHAybShzdHJ1Y3QgZG9tYWluICpk
KQo+Pj4gICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+Pj4gICAgICAgICAgfQo+Pj4gICAg
ICAgICAgcDJtLT5wMm1fY2xhc3MgPSBwMm1fYWx0ZXJuYXRlOwo+Pj4gLSAgICAgICAgcDJtLT5h
Y2Nlc3NfcmVxdWlyZWQgPSAxOwo+Pj4gKyAgICAgICAgcDJtLT5hY2Nlc3NfcmVxdWlyZWQgPSBo
b3N0cDJtLT5hY2Nlc3NfcmVxdWlyZWQ7Cj4+IFRoZXJlIG11c3QgaGF2ZSBiZWVuIGEgcmVhc29u
IHRvIGhhdmUgaXQgc3RhcnQgb3V0IGFzIDEuIFlvdQo+PiBtZW50aW9uIHRoZSBmYWN0IGluIHRo
ZSBkZXNjcmlwdGlvbiwgYnV0IG5vdCB3aHkgaXQgaXMgb2theSAob3IKPj4gZXZlbiBuZWNlc3Nh
cnkpIHRvIGNoYW5nZSBpdC4KPiBJZiB0aGVyZSB3YXMgb25lLCBJIGNhbid0IHNlZSB3aGF0IGl0
IHdhcy4gSXQgaW4gYW55IGNhc2UgbWFrZSBhbHRwMm1zCj4gYmVoYXZlIGRpZmZlcmVudGx5IHRo
YW4gdGhlIGhvc3RwMm0uIFRoZSBtZW1fYWNjZXNzIHN5c3RlbSBoYXMgYmVlbgo+IGRlc2lnbmVk
IHNvIHRoYXQgdGhlIHVzZXIgY2FuIHNheSAidGhpcyBkb21haW4gc2hvdWxkIG5vdyBubyBsb25n
ZXIgYmUKPiBhYmxlIHRvIGNvbnRpbnVlIGlmIHRoZXJlIGFyZSBFUFQgdmlvbGF0aW9zIGFuZCB0
aGVyZSdzIG5vIHZtX2V2ZW50Cj4gc3Vic2NyaWJlciBhdHRhY2hlZCIuCj4gCj4gT3VyIGFwcGxp
Y2F0aW9uLCBmb3Igb25lLCBleHBsaWNpdGx5IF9kaXNhYmxlc18gYWNjZXNzX3JlcXVpcmVkIC0g
c28KPiB0aGF0IGl0IGlzIGFibGUgdG8gZGV0YWNoIGZyb20gdGhlIGRvbWFpbiBhbmQgcmVhdHRh
Y2ggbGF0ZXIuIEhlbmNlIHRoZQo+IHN1cnByaXNlIHdoZW4gYW4gYWx0cDJtLWVuYWJsZWQgZG9t
YWluIGNyYXNoZWQgd2hlbiB0aGUgaW50cm9zcGVjdGlvbgo+IGFnZW50IGRldGFjaGVkLgo+IAo+
IEJhc2ljYWxseSwgdGhlIGFsdHAybSBiZWhhdmlvdXIgY2FuJ3QgYmUgY29udHJvbGxlZCBhdCBh
bGwgaGVyZS4gTWF5YmUKPiBUYW1hcyByZW1lbWJlcnMgLyBrbm93cyBtb3JlIGFib3V0IHdoeSBh
Y2Nlc3NfcmVxdWlyZWQgZW5kZWQgdXAgYmVpbmcgMQo+IGFsd2F5cywgYnV0IGl0IHdhcyBwcm9i
YWJseSBqdXN0IHRoZSBxdWlja2VzdCB3YXkgdG8gd3JpdGUgdGhlIG9yaWdpbmFsCj4gcGF0Y2gu
CgpDQ2QgVGFtYXMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
