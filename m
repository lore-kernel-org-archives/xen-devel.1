From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] x86/hvm: Fix
 hvm_cr4_guest_valid_bits() for PVH dom0
Date: Mon, 28 Jan 2019 08:50:58 -0700
Message-ID: <5C4F24E20200007800211D1B@prv1-mh.provo.novell.com>
References: <1548683789-21610-1-git-send-email-andrew.cooper3@citrix.com>
 <5C4F1E300200007800211CD6@prv1-mh.provo.novell.com>
 <f8ecb58b-f198-d80b-2f9e-4e55a4acb937@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f8ecb58b-f198-d80b-2f9e-4e55a4acb937@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAxLjE5IGF0IDE2OjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjgvMDEvMjAxOSAxNToyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI4
LjAxLjE5IGF0IDE0OjU2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBC
ZWZvcmUgdGhlIGNwdWlkX3BvbGljeSBsb2dpYyBjYW1lIGFsb25nLCAlY3I0IGF1ZGl0aW5nIG9u
IG1pZ3JhdGUtaW4gd2FzCj4+PiBjb21wbGljYXRlZCwgYmVjYXVzZSBhdCB0aGF0IHBvaW50IG5v
IENQVUlEIGluZm9ybWF0aW9uIGhhZCBiZWVuIHNldCBmb3IgdGhlCj4+PiBndWVzdC4gIEF1ZGl0
aW5nIGFnYWluc3QgdGhlIGhvc3QgQ1BVSUQgd2FzIGJldHRlciB0aGFuIG5vdGhpbmcsIGJ1dCBu
b3QKPj4+IGlkZWFsLgo+Pj4KPj4+IE9yZGVyIG9mIGluZm9ybWF0aW9uIGluIHRoZSBtaWdyYXRp
b24gc3RyZWFtIGlzIHN0aWxsIGFuIGlzc3VlIChoZW5jZSB3ZSAKPiBzdGlsbAo+Pj4gbmVlZCB0
byBrZWVwIHRoZSByZXN0b3JlIHBhcmFtZXRlciB0byBjb3BlIHdpdGggYSBuZXN0ZWQgdmlydCBj
b3JuZXIgY2FzZSksCj4+PiBidXQgc2luY2UgWGVuIDQuOSwgdGhlIGRvbWFpbiBzdGFydHMgd2l0
aCB0aGUgYXBwbGljYWJsZSBtYXggcG9saWN5LCB3aGljaCAKPiBpcwo+Pj4gYSBtb3JlIGFwcHJv
cHJpYXRlIHVwcGVyIGJvdW5kIHRoYW4gdGhlIGhvc3QgY3B1aWQgcG9saWN5Lgo+Pj4KPj4+IFRo
aXMgYWxzbyBtYWtlcyB0aGUgZml4IGZyb20gYy9zIDlkMmVmYmFmYjggb2Jzb2xldGUsIGFzIG5v
dCBldmVuIGRvbTAgCj4gc3RhcnRzCj4+PiB3aXRob3V0IGEgcG9saWN5Lgo+PiBXaGlsZSBJIGFn
cmVlIHdpdGggdGhlIGNoYW5nZSBpdHNlbGYsIEknbSBzdHJ1Z2dsaW5nIHRvIG1ha2UgYSBjb25u
ZWN0aW9uCj4+IGZyb20gdGhpcyBkZXNjcmlwdGlvbiB0byB3aGF0IHdhcyBhY3R1YWxseSB3cm9u
ZyBmb3IgUFZIIERvbTAuIFlvdQo+PiBtb3N0bHkgdGFsayBhYm91dCBtaWdyYXRpb24sIHdoaWNo
IGlzIG5vdCByZWxldmFudCBkbyBEb20wIGFzIGFuIG9iamVjdAo+PiAoYW5kIEkgZG9uJ3Qgc2Vl
IGEgY29ubmVjdGlvbiB0byBkb21haW5zIGJlaW5nIG1pZ3JhdGVkIGJ5IFBWSCBEb20wKS4KPiAK
PiBUaGUgUFZIIERvbTAgYW5nbGUgaXMgc2ltcGx5IHRoYXQgaXQgaXMgd3JvbmcgdG8gYXVkaXQg
YWdhaW5zdCB0aGUgaG9zdAo+IHBvbGljeS4KClNvIEknZCBhcHByZWNpYXRlIGlmIHlvdSBjb3Vs
ZCBtYWtlIHRoZSBjb25uZWN0aW9uIGEgbGl0dGxlIG1vcmUKZXhwbGljaXQuIEluIGFueSBldmVu
dApSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
