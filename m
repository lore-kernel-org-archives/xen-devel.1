From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 4/6] x86/XPTI: use %r12 to write zero
 into xen_cr3
Date: Thu, 15 Mar 2018 10:39:20 -0600
Message-ID: <5AAAAFC802000078001B2561@prv-mh.provo.novell.com>
References: <5AA7E24402000078001B0F41@prv-mh.provo.novell.com>
 <5AA7E4FC02000078001B0F59@prv-mh.provo.novell.com>
 <d5665059-e8f7-b782-c3bf-380e14c05803@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovtz=gf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewVuX-0005vw-I5
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 16:39:25 +0000
In-Reply-To: <d5665059-e8f7-b782-c3bf-380e14c05803@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDE3OjAyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDMvMTggMTM6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBOb3cgdGhhdCB3
ZSB6ZXJvIGFsbCByZWdpc3RlcnMgZWFybHkgb24gYWxsIGVudHJ5IHBhdGhzLCB1c2UgdGhhdCB0
bwo+PiBhdm9pZCBhIGNvdXBsZSBvZiBpbW1lZGlhdGVzIGhlcmUuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gLS0tCj4+IFdlIG1heSB3YW50
IHRvIGNvbnNpZGVyIGVsaW1pbmF0aW5nIGEgZmV3IG1vcmUgJDAgdGhpcyB3YXkuIEJ1dAo+PiBl
c3BlY2lhbGx5IGZvciBieXRlIG9uZXMgSSdtIG5vdCBzdXJlIGl0J3Mgd29ydGggaXQsIGR1ZSB0
byB0aGUgUkVYCj4+IHByZWZpeCB0aGUgdXNlIG9mICVyMTIgd291bGQgaW5jdXIuCj4+Cj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvY29tcGF0L2VudHJ5LlMKPj4gKysrIGIveGVuL2FyY2gv
eDg2L3g4Nl82NC9jb21wYXQvZW50cnkuUwo+PiBAQCAtMjE2LDcgKzIxNiw3IEBAIEVOVFJZKGNz
dGFyX2VudGVyKQo+PiAgICAgICAgICBtb3YgICAlcmN4LCBTVEFDS19DUFVJTkZPX0ZJRUxEKHhl
bl9jcjMpKCVyYngpCj4+ICAgICAgICAgIG5lZyAgICVyY3gKPj4gICAgICAgICAgbW92ICAgJXJj
eCwgJWNyMwo+PiAtICAgICAgICBtb3ZxICAkMCwgU1RBQ0tfQ1BVSU5GT19GSUVMRCh4ZW5fY3Iz
KSglcmJ4KQo+PiArICAgICAgICBtb3YgICAlcjEyLCBTVEFDS19DUFVJTkZPX0ZJRUxEKHhlbl9j
cjMpKCVyYngpCj4gCj4gSXQgaXMgdW5yZWFzb25hYmxlIHRvIGV4cGVjdCBwZW9wbGUgdG8gcmVh
bGlzZSB0aGF0IHRoaXMgdXNlIG9mICVyMTIgaXMKPiBmb3IgYSB6ZXJvLCBiZWNhdXNlIHRoZXJl
IGlzIG5vIHdyaXRlIHRvICVyMTIgdmlzaWJsZS4gIFRoZXNlIG5lZWQgc29tZQo+IGtpbmQgb2Yg
Y29tbWVudC4KCldlbGwsIG9rYXksIEknbGwgYWRkIHRoZSBzYW1lIGNvbW1lbnQgaW4gYWxsIDcg
cGxhY2VzLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
