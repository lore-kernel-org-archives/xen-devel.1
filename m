From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v1] x86/mm: Suppresses vm_events caused by
 page-walks
Date: Mon, 27 Aug 2018 16:47:17 +0300
Message-ID: <7714ce55-d6a0-25ef-3d67-0ca3fa53978f@bitdefender.com>
References: <1535119879-6555-1-git-send-email-aisaila@bitdefender.com>
 <2b10630e-d047-347e-a131-6af80e14b9be@citrix.com>
 <e51912bb-2c1f-d01f-0b91-9c33959f7694@bitdefender.com>
 <5B83C02B02000078001E20C8@prv1-mh.provo.novell.com>
 <d403cfd8-0f8b-42f8-c180-908f5cdde2d5@bitdefender.com>
 <5B83EA9702000078001E2299@prv1-mh.provo.novell.com>
 <9c8dbc31-f189-0c7c-18ca-72138a98f5d1@citrix.com>
 <73c2ed2e-f5aa-b85a-ca87-36996edf93b6@bitdefender.com>
 <a347f38d-9f0d-ed41-9213-323fd2ebbb7d@citrix.com>
 <5B83F9DC02000078001E234A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B83F9DC02000078001E234A@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Andrei LUTAS <vlutas@bitdefender.com>, Tamas K Lengyel <tamas@tklengyel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, aisaila@bitdefender.com
List-Id: xen-devel@lists.xenproject.org

T24gOC8yNy8xOCA0OjE3IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNy4wOC4xOCBh
dCAxNTowMiwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBUaGlzIHNob3Vs
ZCBiZSBhcmNoaXRlY3R1cmFsbHkgY29ycmVjdCBhcyBpdCBpcyBleGNsdXNpdmVseSBkZXJpdmVk
IGZyb20KPj4gaW5mb3JtYXRpb24gcHJvdmlkZWQgYnkgdGhlIFZNRXhpdCwgYW5kIHdvbid0IGNh
dXNlIGRpcnR5IGJpdHMgdG8gYmUKPj4gd3JpdHRlbiBpbiBjYXNlcyB3aGVyZSB0aGUgaGFyZHdh
cmUgd291bGRuJ3QgaGF2ZSB3cml0dGVuIHRoZW0KPj4gKHNwZWN1bGF0aXZlIG9yIG90aGVyd2lz
ZSkuICBJdCBkb2VzIG1lYW4gdGhhdCBhbiBpbnN0cnVjdGlvbiB3aGljaAo+PiB3b3VsZCBuZWVk
IHRvIHNldCBBIGFuZCBEIGJpdHMgaW4gdGhlIHdhbGsgd2lsbCB0YWtlIHR3byBFUFQgdmlvbGF0
aW9ucwo+PiB0byBhY2hpZXZlIHRoZSBlbmQgcmVzdWx0LCBidXQgaXQgcHJvYmFibHkgaXMgc3Rp
bGwgcXVpY2tlciB0aGFuIHNlbmRpbmcKPj4gdGhlIHZtX2V2ZW50IG91dC4KPiAKPiBJJ20gYWZy
YWlkIHRoaXMgaXMgZ29pbmcgdG8gYmUgb25seSBtb3N0bHkgY29ycmVjdDogQXRvbWljaXR5IG9m
IHRoZSBwYWdlCj4gdGFibGUgd3JpdGUgaXMgZ29pbmcgdG8gYmUgbG9zdC4gVGhpcyBjb3VsZCBi
ZWNvbWUgYW4gYWN0dWFsIHByb2JsZW0gaWYKPiB0aGUgZ3Vlc3QgdXNlZCByYWNpbmcgUFRFIGFj
Y2Vzc2VzLiBTdWNoIHJhY2luZyBhY2Nlc3NlcyBtaWdodCBub3QKPiBiZSBhIGJ1ZyAtIHNpbXBs
eSBjb25zaWRlciB0aGUgT1Mgc2Nhbm5pbmcgZm9yIHNldCBBIGFuZC9vciBEIGJpdHMKPiAoYW5k
IGNsZWFyaW5nIHRoZW0gd2hlbiB0aGV5J3JlIHNldCkuIE9yIGFuIGVudGl0eSB0ZW1wb3Jhcmls
eSBjbGVhcmluZwo+IChwYXJ0cyBvZikgUFRFcywgd2l0aCByZWNvdmVyeSBsb2dpYyBpbiBwbGFj
ZSB0byByZXN0b3JlIHRoZW0gd2hlbgo+IG5lZWRlZCBmb3IgYSBzeW5jaHJvbm91cyBhY2Nlc3Mu
IEF0IHRoZSB2ZXJ5IGxlYXN0IHRoZXJlJ3MgdGhlbiB0aGUKPiByaXNrIG9mIGEgbGl2ZSBsb2Nr
IHdpdGhpbiB0aGUgZ3Vlc3QuCgpCdXQgaXQncyBub3QgY2xlYXIgdG8gbWUgd2h5IHRoYXQgY2Fu
J3QgYWxyZWFkeSBoYXBwZW4gd2hlbiBqdXN0CmVtdWxhdGluZyB0aGUgY3VycmVudCBpbnN0cnVj
dGlvbiAoYXMgd2UgZG8gbm93KSwgaWYgZW11bGF0aW5nIHNhaWQKaW5zdHJ1Y3Rpb24gd291bGQg
c2V0IEEgb3IgRD8KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
