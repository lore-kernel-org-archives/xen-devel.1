From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Tue, 19 Dec 2017 17:20:41 +0100
Message-ID: <ae894c7b-0945-c83c-48e5-4a0e709c22e2@suse.com>
References: <20171201141407.21993-1-jgross@suse.com>
 <20171219153802.355ha2zrocgb6mes@MacBook-Pro-de-Roger.local>
 <3c4b702d-3029-3c38-c3da-1d83b722cef4@suse.com>
 <20171219161150.2tzo6icbplueu65g@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=bixb=dp=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eRKdK-0008N0-Ss
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 16:20:46 +0000
In-Reply-To: <20171219161150.2tzo6icbplueu65g@MacBook-Pro-de-Roger.local>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTIvMTcgMTc6MTEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVHVlLCBEZWMg
MTksIDIwMTcgYXQgMDQ6NDY6MzdQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24g
MTkvMTIvMTcgMTY6MzgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBGcmksIERlYyAw
MSwgMjAxNyBhdCAwMzoxNDowN1BNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+IElu
c3RlYWQgb2YgbG9jYXRpbmcgdGhlIFJTRFAgdGFibGUgYmVsb3cgMU1CIHB1dCBpdCBqdXN0IGJl
bG93IDRHQgo+Pj4+IGxpa2UgdGhlIHJlc3Qgb2YgdGhlIEFDUEkgdGFibGVzIGluIGNhc2Ugb2Yg
UFZIIGd1ZXN0cy4gVGhpcyB3aWxsCj4+Pj4gYXZvaWQgcHVuY2hpbmcgbW9yZSBob2xlcyB0aGFu
IG5lY2Vzc2FyeSBpbnRvIHRoZSBtZW1vcnkgbWFwLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4+IEFja2VkLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgo+Pj4+IC0tLQo+Pj4+ICB0b29scy9saWJ4Yy94Y19kb21faHZt
bG9hZGVyLmMgfCAyICstCj4+Pj4gIHRvb2xzL2xpYnhsL2xpYnhsX3g4Nl9hY3BpLmMgICB8IDUg
KystLS0KPj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfZG9tX2h2bWxvYWRlci5j
IGIvdG9vbHMvbGlieGMveGNfZG9tX2h2bWxvYWRlci5jCj4+Pj4gaW5kZXggNTlmOTRlNTFlNS4u
M2YwYmQ2NTU0NyAxMDA2NDQKPj4+PiAtLS0gYS90b29scy9saWJ4Yy94Y19kb21faHZtbG9hZGVy
LmMKPj4+PiArKysgYi90b29scy9saWJ4Yy94Y19kb21faHZtbG9hZGVyLmMKPj4+PiBAQCAtMTM2
LDcgKzEzNiw3IEBAIHN0YXRpYyBpbnQgbW9kdWxlX2luaXRfb25lKHN0cnVjdCB4Y19kb21faW1h
Z2UgKmRvbSwKPj4+PiAgICAgIHN0cnVjdCB4Y19kb21fc2VnIHNlZzsKPj4+PiAgICAgIHZvaWQg
KmRlc3Q7Cj4+Pj4gIAo+Pj4+IC0gICAgaWYgKCBtb2R1bGUtPmxlbmd0aCApCj4+Pj4gKyAgICBp
ZiAoIG1vZHVsZS0+bGVuZ3RoICYmICFtb2R1bGUtPmd1ZXN0X2FkZHJfb3V0ICkKPj4+Cj4+PiBJ
c24ndCB0aGF0IGtpbmQgb2YgYSBzZXBhcmF0ZSBmaXg/IEFGQUlDVCB0aGlzIGp1c3QgcHJldmVu
dHMKPj4+IGFsbG9jYXRpbmcgbWVtb3J5IGlmIGd1ZXN0X2FkZHJfb3V0IGlzIGFscmVhZHkgc2V0
IHRvIGEgZml4ZWQKPj4+IHBvc2l0aW9uLgo+Pgo+PiBObywgdGhpcyBpcyBtYW5kYXRvcnksIGFz
IEkgaGF2ZSB0byBza2lwIHRoZSBhbGxvY2F0aW9uIGZvciBQVkgsIHdoaWxlCj4+IEhWTSBndWVz
dHMgcmVhbGx5IHdhbnQgdGhlIGFsbG9jYXRpb24gdG8gdGFrZSBwbGFjZS4KPiAKPiBXYXMgdGhp
cyBhbHNvIGEgcHJvYmxlbSBiZWZvcmU/IE90aGVyIEFDUEkgbW9kdWxlcyBhbHNvIHNldAo+IGd1
ZXN0X2FkZHJfb3V0LCBhbmQgcHJldmlvdXNseSB0aGV5IHdvdWxkIGFsc28gZ2V0IG1lbW9yeSBh
bGxvY2F0ZWQuCgptb2R1bGVfaW5pdF9vbmUoKSB3b3VsZCBvbmx5IGJlIGNhbGxlZCBmb3IgdGhl
IGZpcnN0IEFDUEkgbW9kdWxlLCB3aGljaApoYXBwZW5zIHRvIGJlIHRoZSBSU0RQLgoKCkp1ZXJn
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
