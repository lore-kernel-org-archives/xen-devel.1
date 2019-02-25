From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Mon, 25 Feb 2019 09:47:53 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902250942570.4000@sstabellini-ThinkPad-X260>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <b405a7ae-174f-c8d9-41cc-ec511fb69c77@citrix.com>
 <5C73D41B0200007800219C82@prv1-mh.provo.novell.com>
 <CAFLBxZYmBdR7Mte6i75Nn_a7rYx+0eh88mE3ukBb3tZNNVnZ7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rX0y=RA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gyKM8-0004uO-0x
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 17:47:56 +0000
In-Reply-To: <CAFLBxZYmBdR7Mte6i75Nn_a7rYx+0eh88mE3ukBb3tZNNVnZ7Q@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyNSBGZWIgMjAxOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiBNb24sIEZlYiAy
NSwgMjAxOSBhdCAxMTo0MiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+ID4KPiA+ID4+PiBPbiAyMi4wMi4xOSBhdCAyMjozMywgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+IHdyb3RlOgo+ID4gPiBQLlMuIFRoZXJlIGlzIGEgc29sdXRpb24gaGVyZSB3aGljaCBj
b3VsZCB3b3JrLCBidXQgSU1PIGEgYmV0dGVyIHVzZSBvZgo+ID4gPiB0aW1lIGFuZCBlbmVyZ3kg
d291bGQgYmUgdG8gZ2V0IE1JU1JBIHRvIHVwZGF0ZSB0aGVpciBydWxlcyB0byBtYXRjaAo+ID4g
PiB0aGlzIGNlbnR1cnksIGFuZCBzdG9wIGdldHRpbmcgaW4gdGhlIHdheSBvZiBjb21waWxlciBm
ZWF0dXJlcyBpbnRlbmRlZAo+ID4gPiB0byBoZWxwIHRoZSBwcm9ncmFtbWVyIGF2b2lkIGJ1Z3Mu
Cj4gPgo+ID4gQXMgbXVjaCBhcyBJJ20gd2l0aCB5b3UgaW4gZGVzaXJpbmcgdGhlIGNvbXBpbGVy
IGFpZCBnaXZlbiB0byBub3QgZ2V0Cj4gPiB1bmRlcm1pbmVkLCBJIHRoaW5rIHRoaXMgTUlTUkEg
cnVsZSBpc24ndCBpbiBuZWVkIG9mIG1vZGVybml6aW5nOiBJdCdzCj4gPiBvbmUgdGhpbmcgZm9y
IHRoZSBjb21waWxlciB0byBoZWxwIHdpdGggaW4tcmFuZ2UgZW51bWVyYXRvcnMsIGFuZCBpdCdz
Cj4gPiBhbm90aGVyIHRvIGRlbWFuZCB0aGF0IHVuaW50ZW50aW9uYWwgb3V0LW9mLXJhbmdlIG9u
ZXMgZG9uJ3QgY2F1c2UKPiA+IGFjdHVhbCBoYXJtIChsaWtlIGNyYXNoaW5nIHlvdXIgY2FyIGlu
dG8gdGhlIG5leHQgdHJlZSkuIFRoaXMgaXMgZXZlbgo+ID4gbW9yZSBzbyB0aGF0IGlpcmMgdGhl
cmUncyBubyB3YXJuaW5nIGlmIHlvdSBwYXNzIGEgcGxhaW4gaW50ZWdlciBpbnRvIGEKPiA+IGZ1
bmN0aW9uIHdob3NlIHBhcmFtZXRlciBzcGVjaWZpZXMgYW4gZW51bSwgb3IgaWYgeW91IGFzc2ln
biBhIHBsYWluCj4gPiBpbnRlZ2VyIHRvIGFuIGVudW0gdHlwZXMgdmFyaWFibGUuCj4gCj4gRldJ
VyBJIHdhcyB0aGlua2luZyB0aGUgc2FtZSB0aGluZy4KCkphbiBkZXNjcmliZWQgZXhhY3RseSB0
aGUgc2NlbmFyaW8gUnVsZSAxNi40IGF0dGVtcHRzIHRvIHByb3RlY3QgdXMKZnJvbS4gRllJIE1J
U1JBQyBleHBsYWlucyB0aGUgcmVhc29ucyBiZWhpbmQgZWFjaCBydWxlLCB0aGlzIGlzIHdoeSBJ
CnRoaW5rIGl0IHdvdWxkIGJlIGdyZWF0IGZvciB5b3UgKHlvdSBhcyBpbiB0aGUgeDg2IGFuZCBB
cm0gbWFpbnRhaW5lcnMKbWFpbmx5KSB0byBoYXZlIGFjY2VzcyB0byBpdCBzbyB5b3UgY2FuIHJl
YWQgdGhlIGV4cGxhbmF0aW9uIGJ5CnlvdXJzZWx2ZXMuCgpBbHNvLCBhbGwgdGhlIGFsdGVybmF0
aXZlIHN1Z2dlc3Rpb25zIGFib3V0IHVzaW5nIGNvbXBsaWVyIGZlYXR1cmVzIHRvCmNoZWNrIHN3
aXRjaCBzdGF0ZW1lbnRzIGFyZSBiYXNlZCBvbiB0aGUgZmFjdCB0aGF0IG9uZSBjYW4gdXNlIHRo
b3NlCmNvbXBpbGVycy4gSSBkb24ndCB0aGluayB3ZSBjYW4vc2hvdWxkL3dhbnQgdG8gbWFuZGF0
ZSB3aGljaCBjb21waWxlcnMKYXJlIHVzZWQgd2l0aCB0aGUgWGVuIGNvZGViYXNlLiBXZSBkb24n
dCB3YW50IHRvIGdldCBpbnRvIHRoZSBzaXR1YXRpb24Kd2hlcmUgdGhlIGNvZGUgaXMgInNhZmUi
IG9ubHkgd2hlbiBpdCBpcyBidWlsdCB3aXRoIGdjYy4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
