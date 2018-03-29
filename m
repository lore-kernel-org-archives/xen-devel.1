From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: possible I/O emulation state machine issue
Date: Thu, 29 Mar 2018 00:31:35 -0600
Message-ID: <5ABCA46702000078001B6FFA@prv1-mh.provo.novell.com>
References: <5AB3D5E802000078001B530F@prv-mh.provo.novell.com>
 <9038fd3e-6726-0418-8ce6-e023efb9f012@citrix.com>
 <5AB4BB1E02000078001B5633@gwmail.emea.novell.com>
 <cee96de9e1e94475bc55b3add0f14a44@AMSPEX02CL03.citrite.net>
 <5AB4F4A102000078001B5815@gwmail.emea.novell.com>
 <45c762bb12af4d3289060a452a58e8ec@AMSPEX02CL03.citrite.net>
 <5AB8CE9602000078001B5F5F@prv1-mh.provo.novell.com>
 <af3e3bd283ec4ad89fc8bcfc956d3f1d@AMSPEX02CL03.citrite.net>
 <5ABBD7F202000078001B6E27@prv1-mh.provo.novell.com>
 <1c787264bd5f4be397b3a3b27479d0c2@AMSPEX02CL03.citrite.net>
 <bed2ff64-9459-dcad-33d7-dd5d1bb2c617@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fhp7=gt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f1R63-00035L-Ds
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 06:31:39 +0000
In-Reply-To: <bed2ff64-9459-dcad-33d7-dd5d1bb2c617@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <Paul.Durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAzLjE4IGF0IDE4OjM1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjgvMDMvMTggMTc6MjIsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+IEZyb206IEph
biBCZXVsaWNoIFttYWlsdG86SkJldWxpY2hAc3VzZS5jb21dCj4+PiBTZW50OiAyOCBNYXJjaCAy
MDE4IDE2OjU5Cj4+Pgo+Pj4gSSB0aG91Z2h0IHdlIGNhY2hlIHRoZSB0cmFuc2xhdGlvbiByZXN1
bHQsIHRodXMgYXZvaWRpbmcgdGhlIG5lZWQKPj4+IGZvciBhIHRyYW5zbGF0aW9uIGR1cmluZyB0
aGUgcmV0cnkgY3ljbGUsIHNvIGVpdGhlciBJJ20gbWlzcmVtZW1iZXJpbmcKPj4+IG9yIHRoaXMg
ZG9lc24ndCB3b3JrIGFzIGludGVuZGVkLiBBbmQgaW4gZmFjdCBkb2luZyB0aGUgdHJhbnNsYXRp
b24gYQo+Pj4gc2Vjb25kIHRpbWUgKHdpdGggdGhlIHBvdGVudGlhbCBvZiBpdCBmYWlsaW5nKSBp
cyB3cm9uZyBoZXJlIC0gd2hlbiB0aGUKPj4+IHBvcnQgYWNjZXNzIGhhcyBvY2N1cnJlZCwgd2Ug
bXVzdCBub3QgZmFpbCB0aGUgZW11bGF0aW9uIGFueW1vcmUKPj4+IChyZXBlYXRpbmcgdGhlIHBv
cnQgd3JpdGUgd291bGQgcHJvYmFibHkgYmUgZmluZSBmb3IgdGhlIFZHQSwgYnV0Cj4+PiB3b3Vs
ZCBoYXJkbHkgYmUgZmluZSBmb3IgZS5nLiBhbiBJREUgaW50ZXJmYWNlKS4KPj4+Cj4+IFllcywg
SSB0aG91Z2h0IHdlIG1hZGUgc3VyZSBhbGwgcmVwcyB3ZXJlIGNvbXBsZXRlZCB1c2luZyBjYWNo
ZWQgCj4gdHJhbnNsYXRpb25zIGJlZm9yZSByZXR1cm5pbmcgdG8gZ3Vlc3QuCj4gCj4gSXRzIG9u
ZSBvZiB0aGUgbWFueSBpdGVtcyBvbiB0aGUgVE9ETyBsaXN0LCBhbG9uZyB3aXRoIG1haW50YWlu
aW5nIGEKPiBwcm9wZXIgdmlydHVhbCBUTEIgdG8gYXZvaWQgcmV3YWxrcyBkdXJpbmcgYSBzaW5n
bGUgZW11bGF0aW9uLgoKSSBkb24ndCB0aGluayBhIHZpcnR1YWwgVExCIHdpbGwgYmUgdGhlIHJp
Z2h0IGFuc3dlci4gV2UgbmVlZCB0bwpyZWNvcmQgdGhlIHJlc3VsdHMgb2YgdGhlICJ1b3BzIiB3
ZSBicmVhayB0aGUgcmVxdWVzdCB1cCBpbnRvLAphbmQgc2ltcGx5IHJldHVybiBwcmV2aW91c2x5
IHJlY29yZGVkIHZhbHVlcyBmb3IgcmVwbGF5ZWQgb25lcy4KSS5lLiBqdXN0IGxpa2Ugd2UgZG9u
J3QgKGFueW1vcmUpIHJlLWZldGNoIHRoZSBpbnNuIGR1cmluZyByZXBsYXkuClRoYXQncyBjbG9z
ZXIgdG8gaG93IEkgYXNzdW1lIGhhcmR3YXJlIGJlbGlldmVzIC0gaW4gcGFydGljdWxhcgpJIGRv
bid0IHRoaW5rIGl0IHdvdWxkIHJlcGVhdCBUTEIgd2Fsa3MgZm9yIGEgc2luZ2xlIHVvcC4KCkph
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
