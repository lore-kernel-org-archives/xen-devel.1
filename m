From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/upcall: inject a spurious event
 after setting upcall vector
Date: Thu, 04 Jan 2018 05:27:01 -0700
Message-ID: <5A4E2BA5020000780019AF74@prv-mh.provo.novell.com>
References: <20180104121121.19825-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=q53i=d7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eX4bw-0005Go-HJ
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 12:27:04 +0000
In-Reply-To: <20180104121121.19825-1-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDEzOjExLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEluIGNhc2UgdGhlIHZDUFUgaGFzIHBlbmRpbmcgZXZlbnRzIHRvIGluamVjdC4gVGhpcyBmaXhl
cyBhIGJ1ZyB0aGF0Cj4gaGFwcGVuZWQgaWYgdGhlIGd1ZXN0IG1hcHBlZCB0aGUgdmNwdSBpbmZv
IGFyZWEgdXNpbmcKPiBWQ1BVT1BfcmVnaXN0ZXJfdmNwdV9pbmZvIHdpdGhvdXQgaGF2aW5nIHNl
dHVwIHRoZSBldmVudCBjaGFubmVsCj4gdXBjYWxsLCBhbmQgdGhlbiBzZXR1cCB0aGUgdXBjYWxs
IHZlY3Rvci4KPiAKPiBJbiB0aGlzIHNjZW5hcmlvIHRoZSBndWVzdCB3b3VsZCBub3QgcmVjZWl2
ZSBhbnkgdXBjYWxscywgYmVjYXVzZSB0aGUKPiBjYWxsIHRvIFZDUFVPUF9yZWdpc3Rlcl92Y3B1
X2luZm8gd291bGQgaGF2ZSBtYXJrZWQgdGhlIHZDUFUgYXMgaGF2aW5nCj4gcGVuZGluZyBldmVu
dHMsIGJ1dCB0aGUgdmVjdG9yIGNvdWxkIG5vdCBiZSBpbmplY3RlZCBiZWNhdXNlIGl0IHdhcwo+
IG5vdCB5ZXQgc2V0dXAuCj4gCj4gVGhpcyBoYXMgbm90IGNhdXNlZCBpc3N1ZXMgc28gZmFyIGJl
Y2F1c2UgYWxsIHRoZSBjb25zdW1lcnMgZmlyc3QKPiBzZXR1cCB0aGUgdmVjdG9yIGNhbGxiYWNr
IGFuZCB0aGVuIG1hcCB0aGUgdmNwdSBpbmZvIHBhZ2UsIGJ1dCB0aGVyZSdzCj4gbm8gbGltaXRh
dGlvbiB0aGF0IHByZXZlbnRzIGRvaW5nIGl0IGluIHRoZSBpbnZlcnNlIG9yZGVyLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKRGVz
cGl0ZSBteSBzbWFsbCBjb25jZXJuClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
