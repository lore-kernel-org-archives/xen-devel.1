From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 01/14] iommu: introduce the concept of
 BFN...
Date: Tue, 04 Sep 2018 03:08:26 -0600
Message-ID: <5B8E4B8A02000078001E505A@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-2-paul.durrant@citrix.com>
 <5B88147F02000078001E39FB@prv1-mh.provo.novell.com>
 <eb9e4dcaf17544338b3b3fb5d40d43d0@AMSPEX02CL03.citrite.net>
 <5B8D1F2602000078001E48B5@prv1-mh.provo.novell.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912EFA15@SHSMSX101.ccr.corp.intel.com>
 <5B8E432E02000078001E4FB5@prv1-mh.provo.novell.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912EFD02@SHSMSX101.ccr.corp.intel.com>
 <5B8E469802000078001E4FE5@prv1-mh.provo.novell.com>
 <777ac29dd97a46938eec6c00ecf51e32@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qfrq=ls=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fx7K6-000107-0I
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 09:08:34 +0000
In-Reply-To: <777ac29dd97a46938eec6c00ecf51e32@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA5LjE4IGF0IDEwOjQ5LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMDQgU2VwdGVtYmVyIDIwMTggMDk6NDcK
Pj4gVG86IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgo+PiBDYzogU3VyYXZlZSBT
dXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT47IEp1bGllbiBHcmFs
bAo+PiA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBj
aXRyaXguY29tPjsgU3RlZmFubwo+PiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgeGVuLWRldmVsIDx4ZW4tCj4+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgo+PiBTdWJq
ZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHY2IDAxLzE0XSBpb21tdTogaW50cm9kdWNlIHRo
ZSBjb25jZXB0IG9mCj4+IEJGTi4uLgo+PiAKPj4gPj4+IE9uIDA0LjA5LjE4IGF0IDEwOjM3LCA8
a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOgo+PiA+PiAgRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gPj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDQs
IDIwMTggNDozMyBQTQo+PiA+PiA+Cj4+ID4+ID4gYnVzIGFkZHJlc3MgaXMgY29tbW9ubHkgdXNl
ZCBhbG9uZyB3aXRoIHBoeXNpY2FsL3ZpcnR1YWwgYWRkcmVzcywgdG8KPj4gPj4gPiByZXByZXNl
bnQgZGlmZmVyZW50IHZpZXdzIGJldHdlZW4gZGV2aWNlcyBhbmQgQ1BVLiBGcm9tIHRoYXQgYW5n
bGUKPj4gPj4gPiBJIHRoaW5rIEJGTiBpcyBhIGNsZWFyIHRlcm0gaW4gdGhpcyBjb250ZXh0LiBi
dHcgaXQgaXMgbm90IG5lY2Vzc2FyeSB0bwo+PiA+PiA+IGRpZmZlcmVudGlhdGUgR0JGTiBhbmQg
TUJGTiBzaW5jZSB0aGVyZSBpcyBvbmx5IG9uZSBCRk4gdmlldyBwZXIKPj4gPj4gPiBkZXZpY2Uu
Cj4+ID4+Cj4+ID4+IFN1cmUsIGJ1dCB5b3UgbmVnbGVjdCB0aGUgcHJlc2VuY2Ugb2Ygb25lIG9y
IG1vcmUgSU9NTVVzIHdoZW4KPj4gPj4geW91IHNheSAiYmV0d2VlbiBkZXZpY2VzIGFuZCBDUFUi
LiBUaGVyZSBhZGRyZXNzZXMgcHJpb3IgdG8gYW5kCj4+ID4+IGFmdGVyIElPTU1VIHRyYW5zbGF0
aW9uIGFyZSBkaXN0aW5jdCwgYW5kIHdoaWxlIHRoZSBvbmUgYmVmb3JlIHRoZQo+PiA+PiB0cmFu
c2xhdGlvbiBtYXRjaGVzIHRoZSBkZXZpY2UgdmlldywgdGhlIG9uZSBhZnRlciB0cmFuc2xhdGlv
biBkb2VzCj4+ID4+IG5vdCBuZWNlc3NhcmlseSBtYXRjaCB0aGUgQ1BVIHZpZXcuIEhlbmNlIHRo
ZXJlIGFyZSB0d28gImJ1cyIKPj4gPj4gZnJhbWUgbnVtYmVycyBoZXJlIC0gb25lIHJlcHJlc2Vu
dGluZyB0aGUgZGV2aWNlIHZpZXcsIGFuZCB0aGUKPj4gPj4gb3RoZXIgcmVwcmVzZW50aW5nIHRo
ZSBJT01NVSAob3V0cHV0KSB2aWV3Lgo+PiA+Pgo+PiA+Cj4+ID4gSSBkaWRuJ3QgZ2V0LiB0aGUg
b3V0cHV0IGFkZHJlc3MgZnJvbSBJT01NVSBpcyB0aGUgb25lIHNlbnQgdG8KPj4gPiBtZW1vcnkg
Y29udHJvbGxlciwgc2FtZSBhcyB0aGUgb25lIHNlbnQgZnJvbSBDUFUuCj4+IAo+PiBUaGF0J3Mg
b24gcHJlc2VudCB4ODYgc3lzdGVtcywgYnV0IGFpdWkgbm90IGluIHRoZSBnZW5lcmFsIGNhc2Uu
IFRoZQo+PiB0ZXJtaW5vbG9neSB0byBiZSB1c2VkIGluIFhlbiBzaG91bGQgZml0IHRoZSBnZW5l
cmFsIGNhc2UgdGhvdWdoLgo+IAo+IFNvIHlvdXIgY29uY2VybiBpcyBjYXNjYWRlZCBJT01NVXM/
CgpOb3QgcHJpbWFyaWx5LiBNeSBjb25jZXJuIGFyZSBzeXN0ZW1zIHdpdGggYW4gSS9PIGFkZHJl
c3Mgc3BhY2UKKGJlaGluZCB0aGUgSU9NTVUpIGRpc3RpbmN0IGZyb20gdGhlIENQVSBhZGRyZXNz
IHNwYWNlLiBJaXJjIGF0CmxlYXN0IEFscGhhIGlzL3dhcyB0aGF0IHdheS4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
