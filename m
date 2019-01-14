From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] x86emul: fix test harness and fuzzer build
 dependencies
Date: Mon, 14 Jan 2019 15:09:50 +0000
Message-ID: <23612.42558.631150.227465@mariner.uk.xensource.com>
References: <5C136E9202000078002060C0@prv1-mh.provo.novell.com>
 <23579.43844.578170.901778@mariner.uk.xensource.com>
 <5C1BADB602000078002081A4@prv1-mh.provo.novell.com>
 <23579.46083.675322.495659@mariner.uk.xensource.com>
 <5C1BBDD40200007800208289@prv1-mh.provo.novell.com>
 <5C1C98AC0200007800208613@prv1-mh.provo.novell.com>
 <23580.62909.125592.827301@mariner.uk.xensource.com>
 <5C2F2832020000780020A248@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3TbD=PW=citrix.com=prvs=910b85111=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gj3t8-0000nt-Sh
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 15:10:54 +0000
In-Reply-To: <5C2F2832020000780020A248@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSF0geDg2ZW11bDogZml4
IHRlc3QgaGFybmVzcyBhbmQgZnV6emVyIGJ1aWxkIGRlcGVuZGVuY2llcyIpOgo+IE9uIDIxLjEy
LjE4IGF0IDE1OjE2LCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiBXaHkgaXMg
dGhpcyBwYXJ0aWN1bGFyIGludGVyLWRpcmVjdG9yeSBkZXBlbmRlbmN5IHVudXN1YWwgPyAgRG8g
d2UKPiA+IHBsYW4gdG8gaW50cm9kdWNlIHNpbWlsYXIgTUFLRUxFVkVMLWJhc2VkIGludm9jYXRp
b24gb2YgZGVwZW5kZW5jeQo+ID4gZGlyZWN0b3J5IG1ha2VmaWxlcyBldmVyeWhlcmUgPwo+IAo+
IElmIG5lZWQgYmUsIGFueXdoZXJlIHdoZXJlIGluZGVwZW5kZW50IGJ1aWxkaW5nIG9mIHRoZSBz
dWItdHJlZQo+IGlzIHNwZWNpZmljYWxseSBtZWFudCB0byB3b3JrIGFzIGEgc3RhbmRhbG9uZSBv
cGVyYXRpb24uIFRoYXQKPiBpbnZvY2F0aW9uIG9mICJtYWtlIC1DIC4uLi4vdG9vbHMvaW5jbHVk
ZSAmJiAuLi4iIGlzIGluIHBhcnRpY3VsYXIgbm90Cj4gbWVhbnQgdG8gYmUgbmVjZXNzYXJ5IGZv
ciB0aGUgdGVzdCBoYXJuZXNzJ2VzICJydW4iIHRhcmdldC4gSXQgaXMKPiBhbHNvIG5vdCBpbnRl
bmRlZCB0byBiZSB1c2VkIGZvciB0aGUgZnV6emVyIGJ1aWxkcyAoYXMgcGVyCj4gdG9vbHMvZnV6
ei9SRUFETUUuYWZsKSwgYWxiZWl0IHRoZXJlIG9uZSBtaWdodCBhcyB3ZWxsIGNhbGwgaXQgYSBk
b2MKPiBvbWlzc2lvbi4KClRoaXMgaW50ZXJmYWNlIGludGVudCBpcyBpbmNvbnNpc3RlbnQgd2l0
aCB0aGUgZGVzaWduIHByaW5jaXBsZXMgZm9yCnJlY3Vyc2l2ZSBtYWtlLCBhbmQgY2FuIG5vdCwg
aW4gZ2VuZXJhbCwgYmUgcmVhbGlzZWQuCgpJdCBjYW4gaW4gc29tZSBzcGVjaWFsIGNhc2VzLCBp
bmNsdWRpbmcgSSB0aGluayB0aGlzIG9uZSwgYmUgcmVhbGlzZWQKdXNpbmcgTUFLRUxFVkVMLCBi
dXQgb25seSBhdCB0aGUgY29zdCBvZiBzaWduaWZpY2FudCBleHRyYSBjb21wbGV4aXR5LgpJIHNl
ZSB5b3UndmUgc2VudCBhbm90aGVyIHBhdGNoIGJhc2VkIG9uIE1BS0VMRVZFTC4gIEkgZG9uJ3Qg
aGF2ZSBhCnN0cm9uZyBlbm91Z2ggb2JqZWN0aW9uIHRvIHRoaXMgY2hhbmdlIGluIHRoaXMgb25l
IHBsYWNlIHRvIGJsb2NrIGl0LgoKSG93ZXZlciwgSSB3b3JyeSBpcyB0aGF0IHRoaXMgaXMgc2V0
dGluZyBhIHByZWNlZGVudC4KV2hhdCBpcyB3cm9uZyBpcyB0aGUgaWRlYSB0aGF0IGluIGdlbmVy
YWwgaXQgaXMgT0sgaW4geGVuLmdpdCB0bwpzdGFydCB3aXRoIGEgY2xlYW4gdHJlZSwgb3IgbW9k
aWZ5IGFuIGV4aXN0aW5nIGJ1aWxkIHRyZWUsLCBydW4KICAgbWFrZSAtQyBzb21lL2RpcmVjdC9v
cnkKYW5kIGV4cGVjdCBldmVyeXRoaW5nIHRvIGJlIChyZSlidWlsdCBhcyBuZWVkZWQuICBUaGUg
cmVzdWx0IG9mCnRyeWluZyB0byBpbXBsZW1lbnQgdGhhdCBldmVyeXdoZXJlIHZpYSBNQUtFTEVW
RUwgd291bGQgYmUgYXdmdWwuCgpDYW4geW91IHByb21pc2UgbWUgbm90IHRvIHNlbmQgYW55IG1v
cmUgcGF0Y2hlcyBiYXNlZCBvbiB1c2luZwpNQUtFTEVWRUwgdGhpcyB3YXkgPyAgSWYgbm90LCB3
aGVyZSBkb2VzIGl0IGVuZCA/ICBOb3RpbmcgdGhhdCBldmVuCnlvdXIgdXBkYXRlZCBwYXRjaCBk
b2VzIG5vdCB3b3JrIGZvciAoZWcpOgogICBtYWtlIC1DIHRvb2xzL2Z1enoKClNvcnJ5LApJYW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
