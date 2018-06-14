From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: How to deal with hypercalls returning -EFAULT
Date: Thu, 14 Jun 2018 04:21:49 -0600
Message-ID: <5B2241BD02000078001CB37D@prv1-mh.provo.novell.com>
References: <ad5db530-fea5-7f28-2c7f-4244fc006583@suse.com>
 <10af8cc2-43cb-8b9e-e700-56b467c26a7d@citrix.com>
 <7922636b-e78e-6da6-0467-5c0831f75abd@suse.com>
 <CAF3u54AyNyrfiAGN4zMq1BeX8ojjZX7FbSiJP53+6EC3ayJ61Q@mail.gmail.com>
 <37b12549-a61b-c80d-82b0-3687bc9b173c@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vplz=ja=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fTPO5-0000et-Dz
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 10:21:53 +0000
In-Reply-To: <37b12549-a61b-c80d-82b0-3687bc9b173c@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@gmail.com>, committers@xenproject.org, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA2LjE4IGF0IDEwOjQ4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
NC8wNi8xOCAxMDoxNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiBUaHUsIDE0IEp1biAyMDE4
LCAwNzo0MCBKdWVyZ2VuIEdyb3NzLCA8amdyb3NzQHN1c2UuY29tIAo+PiA8bWFpbHRvOmpncm9z
c0BzdXNlLmNvbT4+IHdyb3RlOgo+PiAKPj4gICAgIE9uIDEzLzA2LzE4IDE4OjI1LCBBbmRyZXcg
Q29vcGVyIHdyb3RlOgo+PiAgICAgPiBPbiAxMy8wNi8xOCAxNjoyNywgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPj4gCj4+ICAgICBMb29raW5nIG1vcmUgaW50byB0aGUgcHJpdmNtZCBkcml2ZXIgSSdt
IHJhdGhlciBzdXJlIG5vdyBJIGNhbiBzb2x2ZQo+PiAgICAgdGhpcyB2aWEgbW1hcCgpIHBsdXMg
YW4gaW9jdGwoKS4gU28gdGhlIGtlcm5lbCB3b3VsZCBhbGxvY2F0ZSB0aGUKPj4gICAgIGJvdW5j
ZSBidWZmZXJzIGFuZCBtYXAgdGhlbSBpbnRvIHVzZXIgc3BhY2UuIFRoaXMgd2lsbCByZXF1aXJl
IGNoYW5nZXMKPj4gICAgIG9ubHkgaW4gbGlieGVuY2FsbCB3aXRob3V0IGhhdmluZyB0byBtb2Rp
ZnkgaXRzIGV4dGVybmFsIGludGVyZmFjZS4KPj4gCj4+IAo+PiBJdCBsb29rcyBsaWtlIERhdmlk
IFZyYWJlbCBzZW50IGluIDIwMTYgYSBwYXRjaCBpbXBsZW1lbnRpbmcgdGhhdAo+PiBzb2x1dGlv
biBbMV0uIEl0IHNlZW1zIGl0IGhhcyBub3QgYmVlbiBtZXJnZWQuIERvIHlvdSBoYXZlIGFueSBp
bnNpZ2h0Cj4+IHdoeSBpdCB3YXMgbm90IG1lcmdlZD8KPiAKPiBOby4gSXQgaGFkIGFsbCBuZWVk
ZWQgQWNrcyBhbmQgdGhlcmUgd2VyZSBubyBvcGVuIHF1ZXN0aW9ucy4KPiAKPiBUaGFua3MgZm9y
IHRoZSByZWZlcmVuY2UsIEkgdGhpbmsgSSBjYW4ganVzdCByZXVzZSB0aGUgcGF0Y2ggYWZ0ZXIg
c29tZQo+IHJlYmFzaW5nLgoKQnV0IEkgc3RpbGwgd29uZGVyIHdoZXRoZXIgcmV0YWluaW5nIHJl
ZmVyZW5jZXMgb2J0YWluZWQgdGhyb3VnaApnZXRfdXNlcl9wYWdlc19mYXN0KCkgYWNyb3NzIHN5
c3RlbSBjYWxscyBpcyBhIGxlZ2l0aW1hdGUgdGhpbmcgdG8gZG8uCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
