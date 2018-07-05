From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Thu, 5 Jul 2018 13:13:11 -0500
Message-ID: <20180705181311.tqt43urlygigkfhs@doug-macbook.localdomain>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <20180703100733.mhfeia2vfywt6czx@mac.bytemobile.com>
 <8E144174-5EFE-474C-9C00-F10D3469FBD0@citrix.com>
 <416f5015-93da-1832-aa63-abac54815e60@suse.com>
 <23357.65017.175500.267696@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=plan=jv=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1fb8lH-0002qu-J0
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 18:13:47 +0000
Received: by mail-qt0-x244.google.com with SMTP id f18-v6so7883065qtp.10
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jul 2018 11:13:46 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <23357.65017.175500.267696@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, 'Jan Beulich' <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMDUsIDIwMTggYXQgMTI6MTY6MDlQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gSnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW05vdGVzIGZvciB4
ZW4gc3VtbWl0IDIwMTggZGVzaWduIHNlc3Npb25dIFByb2Nlc3MgY2hhbmdlczogaXMgdGhlIDYg
bW9udGhseSByZWxlYXNlIENhZGVuY2UgdG9vIHNob3J0LCBTZWN1cml0eSBQcm9jZXNzLCAuLi4i
KToKPiA+IFdlIGRpZG4ndCBsb29rIGF0IHRoZSBzcG9yYWRpYyBmYWlsaW5nIHRlc3RzIHRob3Jv
dWdobHkgZW5vdWdoLiBUaGUKPiA+IGh5cGVyY2FsbCBidWZmZXIgZmFpbHVyZSBoYXMgYmVlbiB0
aGVyZSBmb3IgYWdlcywgYSBuZXdlciBrZXJuZWwganVzdAo+ID4gbWFkZSBpdCBtb3JlIHByb2Jh
YmxlLiBUaGlzIHdvdWxkIGhhdmUgc2F2ZWQgdXMgc29tZSB3ZWVrcy4KPiAKPiBJbiBnZW5lcmFs
LCBhcyBhIGNvbW11bml0eSwgd2UgYXJlIHZlcnkgYmFkIGF0IHRoaXMga2luZCBvZiB0aGluZy4K
PiAKPiBJbiBteSBleHBlcmllbmNlLCB0aGUgZGV2ZWxvcG1lbnQgY29tbXVuaXR5IGlzIG5vdCBy
ZWFsbHkgaW50ZXJlc3RlZAo+IGluIGZpeGluZyBidWdzIHdoaWNoIGFyZW4ndCBkaXJlY3RseSBp
biB0aGVpciB3YXkuCj4gCj4gWW91IGNhbiBvYnNlcnZlIHRoaXMgZWFzaWx5IGluIHRoZSB3YXkg
dGhhdCByZWdyZXNzaW9uIGluIExpbnV4LAo+IHNwb3R0ZWQgYnkgb3NzdGVzdCwgYXJlIGhhbmRs
ZWQuICBMaW51eCA0LjkgaGFzIGJlZW4gYnJva2VuIGZvciA0Mwo+IGRheXMuICBMaW51eCBtYWlu
bGluZSBpcyBicm9rZW4gdG9vLgo+IAo+IFdlIGRvIG5vdCBoYXZlIGEgdGVhbSBvZiBwZW9wbGUg
cmVhZGluZyB0aGVzZSB0ZXN0IHJlcG9ydHMsIGFuZAo+IGNoYXNpbmcgZGV2ZWxvcGVycyB0byBm
aXggdGhlbS4gIEkgY2VydGFpbmx5IGRvIG5vdCBoYXZlIHRpbWUgdG8gZG8KPiB0aGlzIHRyaWFn
ZS4gIE9uIHRyZWVzIHdoZXJlIG9zc3Rlc3QgZmFpbHVyZXMgZG8gbm90IGJsb2NrCj4gZGV2ZWxv
cG1lbnQsIHRoaW5ncyBnbyB1bmZpeGVkIGZvciB3ZWVrcywgc29tZXRpbWVzIG1vbnRocy4KCkhv
bmVzdGx5IHRoaXMgaXMgd2hlcmUgd2UgbmVlZCBzb21lIGtpbmQgb2YgbWV0cmljcyB3aXRoIG91
dHB1dCB0aGF0IG15CjUteWVhciBvbGQgY291bGQgZGVjaXBoZXIuIFRoZSBPU1NURVNUIGVtYWls
cyBhcmUgbGFyZ2UgYW5kIG92ZXJ3aGVsbWluZwphbmQgcmVxdWlyZSBhIGJpdCBvZiB0aW1lIGNv
bW1pdG1lbnQgdG8gZGlnZXN0IHRoZSB2b2x1bWUgYW5kIGFtb3VudCBvZgpkYXRhLgoKSmVua2lu
cyB1c2VzIHdlYXRoZXIgaWNvbnMgdG8gYXR0ZW1wdCB0byBjb252ZXkgaWYgdGhpcyB0ZXN0IGlz
CnRyZW5kaW5nIHdvcnNlIG9yIGJldHRlciBvciBzdWNjZXNzZnVsIG9yIGJyb2tlbi4gSWYgaXQg
ZmFpbHMgYnV0IG5vdApldmVyeSB0aW1lIGFuZCB0aGUgYW1vdW50IG9mIGZhaWx1cmVzIGlzIGlu
Y3JlYXNpbmcgb3ZlciB0aW1lIHRoZW4gaXRzCmdvdCBzdG9ybSBjbG91ZHMuIElmIHRoZSBhbW91
bnQgb2YgZmFpbHVyZXMgaXMgZGVjcmVhc2luZyB0aGVyZSdzIGEKbGl0dGxlIGJpdCBvZiBzdW4g
cGVha2luZyBvdXQuCgpKdXN0IHNvbWUga2luZCBvZiBkYXNoYm9hcmQgd2hpY2ggd291bGQgdGVs
bCBtZSB3aGF0IHdvdWxkIHByb3ZpZGUgdGhlCm1vc3QgdmFsdWUgdG8gZHJpbGwgaW50byB3b3Vs
ZCBsaWtlbHkgZ28gYSBsb25nIHdheS4gQnV0IGFnYWluLCB0aGlzIGlzCmp1c3QgYW4gYXNzdW1w
dGlvbiBhbmQgY291bGQgYmUgYSB0aW1lIHdhc3RlLgoKLS0KRG91ZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
