From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] x86/mm: Suppresses vm_events caused by
 page-walks
Date: Mon, 27 Aug 2018 08:08:42 -0600
Message-ID: <5B8405EA02000078001E23DF@prv1-mh.provo.novell.com>
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
 <7714ce55-d6a0-25ef-3d67-0ca3fa53978f@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <7714ce55-d6a0-25ef-3d67-0ca3fa53978f@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Andrei LUTAS <vlutas@bitdefender.com>, Tamas K Lengyel <tamas@tklengyel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, aisaila@bitdefender.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjA4LjE4IGF0IDE1OjQ3LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gOC8yNy8xOCA0OjE3IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjcu
MDguMTggYXQgMTU6MDIsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+IFRo
aXMgc2hvdWxkIGJlIGFyY2hpdGVjdHVyYWxseSBjb3JyZWN0IGFzIGl0IGlzIGV4Y2x1c2l2ZWx5
IGRlcml2ZWQgZnJvbQo+Pj4gaW5mb3JtYXRpb24gcHJvdmlkZWQgYnkgdGhlIFZNRXhpdCwgYW5k
IHdvbid0IGNhdXNlIGRpcnR5IGJpdHMgdG8gYmUKPj4+IHdyaXR0ZW4gaW4gY2FzZXMgd2hlcmUg
dGhlIGhhcmR3YXJlIHdvdWxkbid0IGhhdmUgd3JpdHRlbiB0aGVtCj4+PiAoc3BlY3VsYXRpdmUg
b3Igb3RoZXJ3aXNlKS4gIEl0IGRvZXMgbWVhbiB0aGF0IGFuIGluc3RydWN0aW9uIHdoaWNoCj4+
PiB3b3VsZCBuZWVkIHRvIHNldCBBIGFuZCBEIGJpdHMgaW4gdGhlIHdhbGsgd2lsbCB0YWtlIHR3
byBFUFQgdmlvbGF0aW9ucwo+Pj4gdG8gYWNoaWV2ZSB0aGUgZW5kIHJlc3VsdCwgYnV0IGl0IHBy
b2JhYmx5IGlzIHN0aWxsIHF1aWNrZXIgdGhhbiBzZW5kaW5nCj4+PiB0aGUgdm1fZXZlbnQgb3V0
Lgo+PiAKPj4gSSdtIGFmcmFpZCB0aGlzIGlzIGdvaW5nIHRvIGJlIG9ubHkgbW9zdGx5IGNvcnJl
Y3Q6IEF0b21pY2l0eSBvZiB0aGUgcGFnZQo+PiB0YWJsZSB3cml0ZSBpcyBnb2luZyB0byBiZSBs
b3N0LiBUaGlzIGNvdWxkIGJlY29tZSBhbiBhY3R1YWwgcHJvYmxlbSBpZgo+PiB0aGUgZ3Vlc3Qg
dXNlZCByYWNpbmcgUFRFIGFjY2Vzc2VzLiBTdWNoIHJhY2luZyBhY2Nlc3NlcyBtaWdodCBub3QK
Pj4gYmUgYSBidWcgLSBzaW1wbHkgY29uc2lkZXIgdGhlIE9TIHNjYW5uaW5nIGZvciBzZXQgQSBh
bmQvb3IgRCBiaXRzCj4+IChhbmQgY2xlYXJpbmcgdGhlbSB3aGVuIHRoZXkncmUgc2V0KS4gT3Ig
YW4gZW50aXR5IHRlbXBvcmFyaWx5IGNsZWFyaW5nCj4+IChwYXJ0cyBvZikgUFRFcywgd2l0aCBy
ZWNvdmVyeSBsb2dpYyBpbiBwbGFjZSB0byByZXN0b3JlIHRoZW0gd2hlbgo+PiBuZWVkZWQgZm9y
IGEgc3luY2hyb25vdXMgYWNjZXNzLiBBdCB0aGUgdmVyeSBsZWFzdCB0aGVyZSdzIHRoZW4gdGhl
Cj4+IHJpc2sgb2YgYSBsaXZlIGxvY2sgd2l0aGluIHRoZSBndWVzdC4KPiAKPiBCdXQgaXQncyBu
b3QgY2xlYXIgdG8gbWUgd2h5IHRoYXQgY2FuJ3QgYWxyZWFkeSBoYXBwZW4gd2hlbiBqdXN0Cj4g
ZW11bGF0aW5nIHRoZSBjdXJyZW50IGluc3RydWN0aW9uIChhcyB3ZSBkbyBub3cpLCBpZiBlbXVs
YXRpbmcgc2FpZAo+IGluc3RydWN0aW9uIHdvdWxkIHNldCBBIG9yIEQ/CgpZZXMsIGdvb2QgcG9p
bnQgLSB0aGlzIGlzIGEgcHJvYmxlbSBub3QganVzdCB0byB0aGUgbmV3IGhhbmRsaW5nIHlvdQpw
cm9wb3NlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
