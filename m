From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Xen 4.11.1 panic
Date: Thu, 20 Dec 2018 00:36:35 -0700
Message-ID: <5C1B46830200007800207DFC@prv1-mh.provo.novell.com>
References: <20181218221904.GA1461@antioche.eu.org>
 <5C1A26150200007800207693@prv1-mh.provo.novell.com>
 <20181219115516.GA19518@mail.soc.lip6.fr>
 <5C1A3F92020000780020778D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gZssq-0004FZ-OW
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 07:36:40 +0000
In-Reply-To: <5C1A3F92020000780020778D@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjEyLjE4IGF0IDEzOjU0LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDE5LjEyLjE4IGF0IDEyOjU1LCA8Ym91eWVyQGFudGlvY2hlLmV1Lm9yZz4gd3JvdGU6Cj4+
IE9uIFdlZCwgRGVjIDE5LCAyMDE4IGF0IDA0OjA1OjU3QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+Pj4gSW4gYW55IGV2ZW50LCBib3RoIEFuZHJldyBhbmQgSSBtdXN0IGhhdmUgb3Zlcmxv
b2tlZCB0aGUgb25lCj4+PiBjcnVjaWFsIHBsYWNlIGR1ZSB0byB3aGljaCB0aGUgYXNzZXJ0aW9u
IGlzIGluZGVlZCB3cm9uZyBmcm9tCj4+PiBwdXRfcGFnZV9mcm9tX2wyZSgpOgo+Pj4gCj4+PiAg
ICAgICAgIGludCByYyA9IF9wdXRfcGFnZV90eXBlKHBnLCBmYWxzZSwgbWZuX3RvX3BhZ2UoX21m
bihwZm4pKSk7Cj4+PiAKPj4+IE5vdCBhbGxvd2luZyBmb3IgcHJlZW1wdGlvbiB0aGVyZSBpcyBm
aW5lIGlmIHRoZSBMMkUgaXMgcG9pbnRpbmcgdG8KPj4+IGFuIEwxIHRhYmxlLCBidXQgaXMgbm93
IHdyb25nIGlmIHRoZSBMMkUgcG9pbnRzIHRvIGFub3RoZXIgTDIsCj4+PiB3aGljaCBzdXJlbHkg
aXMgdGhlIGNhc2Ugd2hlbiB5b3Ugc2VlIHRoZSBhc3NlcnRpb24gdHJpZ2dlci4KPj4gCj4+IFNo
b3VsZCB3ZSBqdXN0IGNoYW5nZSBmYWxzZSB0byB0cnVlIGhlcmUsIG9yIHNob3VsZCB0aGUgY2Fz
ZXMgYWJvdmUgYmUgCj4+IGhhbmRsZWQgZGlmZmVyZW50bHkgPwo+IAo+IFN3aXRjaGluZyBmcm9t
IGZhbHNlIHRvIHRydWUgaGVyZSBpcyBqdXN0IHRoZSBpbml0aWFsIHBhcnQgb2YgdGhlCj4gbmVj
ZXNzYXJ5IGNoYW5nZSAtIGlmIHlvdSBkaWQganVzdCB0aGlzLCB5b3UnZCBlbmQgdXAgaGl0dGlu
Zwo+IHRoZSBBU1NFUlQoKSByaWdodCBhZnRlciB0aGUgbGluZSBhYm92ZS4gVGhlcmUncyBxdWl0
ZSBhIGJpdAo+IG1vcmUgdG8gaXQsIGFuZCBpdCBuZWVkcyB0byBiZSBkb25lIHByZXR0eSBjYXJl
ZnVsbHkuCgpBY3R1YWxseSB0aGVyZSB3YXMgbm8gcmVhc29uIHRvIGFsdGVyIHRoZSBmcmVlX2wy
X3RhYmxlKCkgcGF0aHMKaW4gdGhlIFhTQS0yNzMgZml4ZXM6IEEgc3dpdGNoIHRvIHNoYWRvdyBt
b2RlIGNhbiBvbmx5IG9jY3VyCndoZW4gdmFsaWRhdGluZyBwYWdlIHRhYmxlcy4gVGhlcmVmb3Jl
IEkgdGhpbmsgeW91IGNvdWxkIHNhZmVseQpyZXZlcnQgdGhlIHJlc3BlY3RpdmUgaHVua3MsIHdo
aWNoIGluY2x1ZGVzIGRlbGV0aW5nIHRoZQpBU1NFUlQoKSB5b3UgZm91bmQgdHJpZ2dlcmluZy4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
