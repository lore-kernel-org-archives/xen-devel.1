From: Juergen Gross <jgross@suse.com>
Subject: Re: How to deal with hypercalls returning -EFAULT
Date: Thu, 14 Jun 2018 12:39:51 +0200
Message-ID: <3d334a1e-d9d4-cc38-ff35-39d337140777@suse.com>
References: <ad5db530-fea5-7f28-2c7f-4244fc006583@suse.com>
 <10af8cc2-43cb-8b9e-e700-56b467c26a7d@citrix.com>
 <7922636b-e78e-6da6-0467-5c0831f75abd@suse.com>
 <CAF3u54AyNyrfiAGN4zMq1BeX8ojjZX7FbSiJP53+6EC3ayJ61Q@mail.gmail.com>
 <37b12549-a61b-c80d-82b0-3687bc9b173c@suse.com>
 <5B2241BD02000078001CB37D@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ltl4=ja=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fTPfY-0002ZL-If
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 10:39:56 +0000
In-Reply-To: <5B2241BD02000078001CB37D@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Julien Grall <julien.grall@gmail.com>" <julien.grall@gmail.com>, committers@xenproject.org, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDYvMTggMTI6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE0LjA2LjE4IGF0
IDEwOjQ4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMTQvMDYvMTggMTA6MTcsIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+IE9uIFRodSwgMTQgSnVuIDIwMTgsIDA3OjQwIEp1ZXJnZW4g
R3Jvc3MsIDxqZ3Jvc3NAc3VzZS5jb20gCj4+PiA8bWFpbHRvOmpncm9zc0BzdXNlLmNvbT4+IHdy
b3RlOgo+Pj4KPj4+ICAgICBPbiAxMy8wNi8xOCAxODoyNSwgQW5kcmV3IENvb3BlciB3cm90ZToK
Pj4+ICAgICA+IE9uIDEzLzA2LzE4IDE2OjI3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4KPj4+
ICAgICBMb29raW5nIG1vcmUgaW50byB0aGUgcHJpdmNtZCBkcml2ZXIgSSdtIHJhdGhlciBzdXJl
IG5vdyBJIGNhbiBzb2x2ZQo+Pj4gICAgIHRoaXMgdmlhIG1tYXAoKSBwbHVzIGFuIGlvY3RsKCku
IFNvIHRoZSBrZXJuZWwgd291bGQgYWxsb2NhdGUgdGhlCj4+PiAgICAgYm91bmNlIGJ1ZmZlcnMg
YW5kIG1hcCB0aGVtIGludG8gdXNlciBzcGFjZS4gVGhpcyB3aWxsIHJlcXVpcmUgY2hhbmdlcwo+
Pj4gICAgIG9ubHkgaW4gbGlieGVuY2FsbCB3aXRob3V0IGhhdmluZyB0byBtb2RpZnkgaXRzIGV4
dGVybmFsIGludGVyZmFjZS4KPj4+Cj4+Pgo+Pj4gSXQgbG9va3MgbGlrZSBEYXZpZCBWcmFiZWwg
c2VudCBpbiAyMDE2IGEgcGF0Y2ggaW1wbGVtZW50aW5nIHRoYXQKPj4+IHNvbHV0aW9uIFsxXS4g
SXQgc2VlbXMgaXQgaGFzIG5vdCBiZWVuIG1lcmdlZC4gRG8geW91IGhhdmUgYW55IGluc2lnaHQK
Pj4+IHdoeSBpdCB3YXMgbm90IG1lcmdlZD8KPj4KPj4gTm8uIEl0IGhhZCBhbGwgbmVlZGVkIEFj
a3MgYW5kIHRoZXJlIHdlcmUgbm8gb3BlbiBxdWVzdGlvbnMuCj4+Cj4+IFRoYW5rcyBmb3IgdGhl
IHJlZmVyZW5jZSwgSSB0aGluayBJIGNhbiBqdXN0IHJldXNlIHRoZSBwYXRjaCBhZnRlciBzb21l
Cj4+IHJlYmFzaW5nLgo+IAo+IEJ1dCBJIHN0aWxsIHdvbmRlciB3aGV0aGVyIHJldGFpbmluZyBy
ZWZlcmVuY2VzIG9idGFpbmVkIHRocm91Z2gKPiBnZXRfdXNlcl9wYWdlc19mYXN0KCkgYWNyb3Nz
IHN5c3RlbSBjYWxscyBpcyBhIGxlZ2l0aW1hdGUgdGhpbmcgdG8gZG8uCgpBcyBkaXNjdXNzZWQg
b24gSVJDIEkndmUgZGVjaWRlZCB0byBhZGQganVzdCBhbm90aGVyIGRldmljZSBub2RlIHdoaWNo
CmNhbiBiZSB1c2VkIHRvIG1tYXAoKSBhIGh5cGVyY2FsbCBidWZmZXIgd2l0aCBhbGwgbmVlZGVk
IGF0dHJpYnV0ZXMuCgpEYXZpZCdzIHBhdGNoIHNlZW1lZCB0byBiZSBvdmVya2lsbCBmb3IgdGhl
IGZldyBidWZmZXJzIG5vcm1hbGx5IGJlaW5nCmFsbG9jYXRlZCAoZm9yIGRvbWFpbiBjcmVhdGlv
biB0aGUgbWF4aW11bSB3YXMgMyBzaW5nbGUgcGFnZSBidWZmZXJzCmluIGEgc21hbGwgdGVzdCBJ
IGRpZCkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
