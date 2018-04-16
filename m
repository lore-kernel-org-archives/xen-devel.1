From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: Weird altp2m behaviour when switching early to a
 new view
Date: Mon, 16 Apr 2018 18:47:18 +0100
Message-ID: <efaa504e-bc4f-243d-f558-cab3dc31b472@citrix.com>
References: <a592fcb3-c2c6-bd83-01a4-0ac7ba9f3fa5@bitdefender.com>
 <d0ae9d3e-31ee-a03b-dc9d-b86ceb92fe52@citrix.com>
 <b21c7573-7ca0-9ccc-eac7-5ff351fc54ce@bitdefender.com>
 <3bc816d7-2426-470a-36a3-83e2cd5c81ad@bitdefender.com>
 <3076ce00-8655-81fe-6dc1-b891da638ea2@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cpa4=hf=citrix.com=prvs=6373aecec=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1f88Ds-000082-Om
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 17:47:24 +0000
In-Reply-To: <3076ce00-8655-81fe-6dc1-b891da638ea2@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTMvMjAxOCAwMzo0NCBQTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE9uIDA0LzEx
LzIwMTggMTE6MDQgQU0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gRGVidWdnaW5nIGNvbnRp
bnVlcy4KPiAKPiBGaW5hbGx5LCB0aGUgYXR0YWNoZWQgcGF0Y2ggc2VlbXMgdG8gZ2V0IHRoZSBk
aXNwbGF5IHVuc3R1Y2sgaW4gbXkKPiBzY2VuYXJpbywgYWx0aG91Z2ggZm9yIG9uZSBndWVzdCBJ
IGdldDoKPiAKPiAoWEVOKSBkMnYwIFVuZXhwZWN0ZWQgdm1leGl0OiByZWFzb24gNDkKPiAoWEVO
KSBkb21haW5fY3Jhc2ggY2FsbGVkIGZyb20gdm14LmM6NDEyMAo+IChYRU4pIERvbWFpbiAyICh2
Y3B1IzApIGNyYXNoZWQgb24gY3B1IzE6Cj4gKFhFTikgLS0tLVsgWGVuLTQuMTEtdW5zdGFibGUg
IHg4Nl82NCAgZGVidWc9eSAgIE5vdCB0YWludGVkIF0tLS0tCj4gKFhFTikgQ1BVOiAgICAxCj4g
KFhFTikgUklQOiAgICAwMDEwOls8ZmZmZmY5NjAwMDg0MjM1ND5dCj4gKFhFTikgUkZMQUdTOiAw
MDAwMDAwMDAwMDEwMjQ2ICAgQ09OVEVYVDogaHZtIGd1ZXN0IChkMnYwKQo+IChYRU4pIHJheDog
ZmZmZmY4ODAwMzAwMDAwMCAgIHJieDogZmZmZmY5MDBjMDA4M2RiMCAgIHJjeDogMDAwMDAwMDBh
YTU1YWE1NQo+IChYRU4pIHJkeDogZmZmZmZhODAwNDFiZGM0MSAgIHJzaTogZmZmZmY5MDBjMDBj
NjlhMCAgIHJkaTogMDAwMDAwMDAwMDAwMDAwMQo+IChYRU4pIHJicDogMDAwMDAwMDAwMDAwMDAw
MCAgIHJzcDogZmZmZmY4ODAwMmVlOWVmMCAgIHI4OiAgZmZmZmZhODAwNDFiZGM0MAo+IChYRU4p
IHI5OiAgZmZmZmY4MDAwMTgxMGU4MCAgIHIxMDogZmZmZmZhODAwMzQyYWE3MCAgIHIxMTogZmZm
ZmY4ODAwMmVlOWU4MAo+IChYRU4pIHIxMjogMDAwMDAwMDAwMDAwMDAwNSAgIHIxMzogMDAwMDAw
MDAwMDAwMDAwMSAgIHIxNDogZmZmZmY5MDBjMDBjMDhiMAo+IChYRU4pIHIxNTogMDAwMDAwMDAw
MDAwMDAwMSAgIGNyMDogMDAwMDAwMDA4MDA1MDAzMSAgIGNyNDogMDAwMDAwMDAwMDA0MDZmOAo+
IChYRU4pIGNyMzogMDAwMDAwMDBlZjc3MTAwMCAgIGNyMjogZmZmZmY5MDBjMDBjODAwMAo+IChY
RU4pIGZzYjogMDAwMDAwMDBmZmZkZTAwMCAgIGdzYjogZmZmZmY4MDAwMTgxMGQwMCAgIGdzczog
MDAwMDA3ZmZmZmZkYzAwMAo+IChYRU4pIGRzOiAwMDJiICAgZXM6IDAwMmIgICBmczogMDA1MyAg
IGdzOiAwMDJiICAgc3M6IDAwMTggICBjczogMDAxMAo+IAo+IGkuZS4gRVhJVF9SRUFTT05fRVBU
X01JU0NPTkZJRyAtIHNvIG5vdCBvZiB0aGUgd29vZHMgeWV0LiBJIGFtIGhvcGluZwo+IHNvbWVi
b2R5IG1vcmUgZmFtaWxpYXIgd2l0aCB0aGUgY29kZSBjYW4gcG9pbnQgdG8gYSBtb3JlIGVsZWdh
bnQKPiBzb2x1dGlvbiBpZiBvbmUgZXhpc3RzLgoKSSB0aGluayBJIGhhdmUgYW4gaWRlYSB3aGF0
J3MgZ29pbmcgb24sIGJ1dCBpdCdzIGNvbXBsaWNhdGVkLiA6LSkKCkJhc2ljYWxseSwgdGhlIGxv
Z2RpcnR5IGZ1bmN0aW9uYWxpdHkgaXNuJ3Qgc2ltcGxlLCBhbmQgbmVlZHMgY2FyZWZ1bAp0aG91
Z2h0IG9uIGhvdyB0byBpbnRlZ3JhdGUgaXQuICBJJ2xsIHdyaXRlIHNvbWUgbW9yZSB0b21vcnJv
dywgYW5kIHNlZQppZiBJIGNhbiBjb21lIHVwIHdpdGggYSBzb2x1dGlvbi4KCiAtR2VvcmdlCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
