From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH for-4.11 v2 0/2] Add Designated Reviewer
 (R:) to MAINTAINERS (plus a test case)
Date: Mon, 30 Apr 2018 14:39:48 +0100
Message-ID: <5d0fc08a-dbbc-9ae1-03fe-25b062df4c5c@citrix.com>
References: <cover.1524851673.git.lars.kurth@citrix.com>
 <5AE6CC2502000078001BF7A0@prv1-mh.provo.novell.com>
 <8A88031C-5A37-43BB-A62D-95495D41AA5C@citrix.com>
 <5AE6D48702000078001BF80C@prv1-mh.provo.novell.com>
 <23271.6343.553058.630893@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xpvw=ht=citrix.com=prvs=651151fe0=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fD921-0004YM-46
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 13:39:53 +0000
In-Reply-To: <23271.6343.553058.630893@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, brian.woods@amd.com
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMzAvMjAxOCAwMjoyMyBQTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gSmFuIEJldWxpY2gg
d3JpdGVzICgiUmU6IFtQQVRDSCBmb3ItNC4xMSB2MiAwLzJdIEFkZCBEZXNpZ25hdGVkIFJldmll
d2VyIChSOikgdG8gTUFJTlRBSU5FUlMgKHBsdXMgYSB0ZXN0IGNhc2UpIik6Cj4+IE9uIDMwLjA0
LjE4IGF0IDEwOjIxLCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToKPj4+IO+7v09uIDMw
LzA0LzIwMTgsIDA4OjU3LCAiSmFuIEJldWxpY2giIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6
Cj4gLi4uCj4+PiBUaGF0IGlzIG15IGZhdWx0OiBJIGdvdCBpbnRvIHRyb3VibGUgd2l0aCBnaXQg
YW5kIG11c3QgaGF2ZSBkb25lIHNvbWV0aGluZyAKPj4+IHdyb25nLiBJZiBpdCBoZWxwcywgSSBj
YW4gc3dpdGNoIHRoZSBvcmRlciBhbmQgcmUtc2VuZC4gCj4+Cj4+IEkgZG9uJ3QgdGhpbmsgdGhh
dCdzIG5lY2Vzc2FyeSAtIHdob2V2ZXIgZW5kcyB1cCBjb21taXR0aW5nIHRoZW0gY2FuIGVhc2ls
eQo+PiBlbm91Z2ggc3dpdGNoIHRoZW0gYXJvdW5kLgo+IAo+IEkgd2lsbCBkbyBzbyB3aGVuIGFs
bCBpcyBjbGVhci4KPiAKPj4gSSB3b3VsZCBjb21taXQgdGhlbSByaWdodCBhd2F5LCBpZiBvbmx5
IEkgd2FzCj4+IHJlYWxseSBjbGVhciB3aGV0aGVyIHdlJ3ZlIGFsbCBzZXR0bGVkIG9uIHRoaXMu
Cj4gCj4gSSBoYXZlIGJlZW4gZm9sbG93aW5nIHRoaXMuICBJIHRoaW5rIHRoaXMgaXMgYSBnb29k
IGlkZWEuCj4gCj4gQmFzaWNhbGx5IGl0IGlzIGEgd2F5IGZvciBzb21lb25lIHRvIGRlY2xhcmUg
YW4gaW50ZXJlc3QgaW4gYW4gYXJlYSBvZgo+IGNvZGUsIGFuZCBnZXQgY29waWVkIG9uIGNoYW5n
ZXMsIHdpdGhvdXQgaGF2aW5nIHRvIGdyYW50IHRoYXQgcGVyc29uCj4gYW55IGZvcm1hbCBkZWNp
c2lvbm1ha2luZyBhdXRob3JpdHkuCj4gCj4gSWYgdGhpcyBpcyBub3Qgc3VmZmljaWVudGx5IGNs
ZWFyLCBkbyB5b3UgdGhpbmsgd2Ugc2hvdWxkIGRvY3VtZW50Cj4gdGhpcyBtb3JlIGNsZWFybHkg
PyAgUGVyaGFwcyB3ZSBjb3VsZCB3cml0ZToKPiAKPiAgICsJUjogRGVzaWduYXRlZCByZXZpZXdl
cjogRnVsbE5hbWUgPGFkZHJlc3NAZG9tYWluPgo+ICAgKyAgICAgICAgUmV2aWV3ZXJzIHNob3Vs
ZCBiZSBDQ2VkIG9uIHBhdGNoZXMuICBIb3dldmVyLCB0aGV5IGRvIG5vdAo+ICAgKyAgICAgICAg
aGF2ZSBhIGZvcm1hbCBnb3Zlcm5hbmNlIHJvbGUsIGFuZCBhcmUgbGlzdGVkIGhlcmUKPiAgICsg
ICAgICAgIHNpbXBseSBiZWNhdXNlIG9mIHRoZWlyIG93biByZXF1ZXN0Lgo+IAo+IG9yIHNvbWV0
aGluZyA/CgorMSB0byB0aGlzIGRlc2NyaXB0aW9uOyBidXQgSSB0b29rIEphbiB0byBtZWFuIHRo
YXQgaXQgd2Fzbid0IGNsZWFyCndoZXRoZXIgd2UgYXMgYSBjb21tdW5pdHkgaGFkIGRlY2lkZWQg
aGF2aW5nIHN1Y2ggYSBmcmFtZXdvcmsgd2FzIGEgZ29vZApvbmUgKGFsdGhvdWdoIGl0IHNvdW5k
ZWQgbGlrZSBoZSB3YXMgcGVyc29uYWxseSBpbiBmYXZvcikuCgpMYXp5IGNvbnNlbnN1cyBzYXlz
IHRoYXQgaWYgcGVvcGxlIGRvbid0IG9iamVjdCwgaXQncyBhc3N1bWVkIHRoYXQKdGhleSdyZSBP
SyB3aXRoIGl0LiAgVGhlIGZpcnN0IHZlcnNpb24gb2YgdGhpcyBzZXJpZXMgd2FzIHBvc3RlZCAy
NQpBcHJpbDsgaWYgcGVvcGxlIGFyZSBjb25jZXJuZWQgYWJvdXQgZ2l2aW5nIHBlb3BsZSBhIGNo
YW5jZSB0byBvYmplY3QsCndlIGNvdWxkIHdhaXQgdW50aWwgMiBNYXkgdG8gY2hlY2sgaXQgaW4u
ICBUaGF0IHdvdWxkIGdpdmUgcGVvcGxlIGEgd2VlawppbiB3aGljaCB0byBvYmplY3QgaWYgdGhl
eSB3YW50LgoKSSB3b3VsZG4ndCBvYmplY3QgdG8gc29tZW9uZSBjaGVja2luZyBpdCBpbiBub3cs
IGhvd2V2ZXI7IEkgdGhpbmsgYWxsCnRoZSBjb21taXR0ZXJzIGhhdmUgaGFkIGEgY2hhbmNlIHRv
IG9iamVjdCwgYW5kIG1vc3QgaGF2ZSBleHByZXNzZWQgc3VwcG9ydC4KCiAtR2VvcmdlCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
