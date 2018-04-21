From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v8 1/9] x86/xpti: avoid copying L4 page
 table contents when possible
Date: Sat, 21 Apr 2018 14:32:08 +0100
Message-ID: <20180421133208.GA61756@deinos.phlegethon.org>
References: <20180418083051.8334-1-jgross@suse.com>
 <20180418083051.8334-2-jgross@suse.com>
 <5AD76E5A02000078001BC770@suse.com>
 <35756e6c-dc79-f0a1-df31-bca0495e3352@suse.com>
 <5AD847BD02000078001BC8D9@suse.com>
 <58b2d6ba-381d-4f4e-e0bb-bf6281ba6ac6@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xao6=hk=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1f9sch-0008QY-UH
 for xen-devel@lists.xenproject.org; Sat, 21 Apr 2018 13:32:15 +0000
Content-Disposition: inline
In-Reply-To: <58b2d6ba-381d-4f4e-e0bb-bf6281ba6ac6@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpBdCAwOTo0NCArMDIwMCBvbiAxOSBBcHIgKDE1MjQxMzEwODApLCBKdWVyZ2VuIEdyb3Nz
IHdyb3RlOgo+ID4+IFNvIGVpdGhlciBJJ20gYWRkaW5nIHNvbWUga2luZCBvZiBsb2NraW5nL3Jj
dSwgb3IgSSdtIHN3aXRjaGluZyB0byB1c2UKPiA+PiBJUElzIGFuZCBhY2Nlc3Mgcm9vdF9wZ3Rf
Y2hhbmdlZCBvbmx5IGxvY2FsbHkuCj4gPj4KPiA+PiBEbyB5b3UgaGF2ZSBhbnkgcHJlZmVyZW5j
ZT8KPiA+IAo+ID4gU2luY2UgaXNzdWluZyBhbiBJUEkgaXMganVzdCBhIHNpbmdsZSBjYWxsLCBJ
J2QgcHJlZmVyIG5vdCB0byBoYXZlIG5ldyAobG9ja2luZywKPiA+IHJjdSwgb3Igd2hhdGV2ZXIg
ZWxzZSkgbG9naWMgYWRkZWQgaGVyZS4gVW5sZXNzIG9mIGNvdXJzZSBzb21lb25lLCBpbgo+ID4g
cGFydGljdWxhciBUaW0sIHRoaW5rcyBzZW5kaW5nIGFuIElQSSBoZXJlIGlzIGEgcmF0aGVyIGJh
ZCBpZGVhLgoKQUZBSUNTIHlvdSdyZSBjYWxsaW5nIHRoaXMgZnJvbSBzaGFkb3cgY29kZSB3aGVu
ZXZlciBpdCBjaGFuZ2VzIGFuCkw0ZSwgc28gSSdkIHJhdGhlciBub3QgaGF2ZSBhbiBJUEkgaGVy
ZSBpZiB3ZSBkb24ndCBuZWVkIGl0LgoKPiBBbm90aGVyIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRv
IHBhc3MgYW5vdGhlciBmbGFnIHRvIHRoZSBjYWxsZXJzIHRvCj4gc2lnbmFsIHRoZSBuZWVkIGZv
ciBhIGZsdXNoLiBUaGlzIHdvdWxkIHJlcXVpcmUgcXVpdGUgc29tZSBtb2RpZmljYXRpb25zCj4g
dG8gc2hhZG93IGNvZGUgSSdkIGxpa2UgdG8gYXZvaWQsIHRob3VnaC4gT1RPSCB0aGlzIHdheSB3
ZSBjb3VsZCBjb21iaW5lCj4gZmx1c2hpbmcgdGhlIHRsYiBhbmQgdGhlIHJvb3QgcGFnZSB0YWJs
ZXMuIFRpbSwgYW55IHByZWZlcmVuY2VzPwoKVGhpcyBzb3VuZHMgYSBwcm9taXNpbmcgZGlyZWN0
aW9uIGJ1dCBpdCBzaG91bGQgYmUgZG9hYmwgd2l0aG91dCBtYWpvcgpzdXJnZXJ5IHRvIHRoZSBz
aGFkb3cgY29kZS4gIFRoZSBzaGFkb3cgY29kZSBhbHJlYWR5IGxlYXZlcyBvbGQgc2w0ZXMKdmlz
aWJsZSAoaW4gVExCcykgd2hlbiBpdCdzIHNhZmUgdG8gZG8gc28sIHNvIEkgdGhpbmsgdGhlIHJp
Z2h0IHBsYWNlCnRvIGhvb2sgdGhpcyBpcyBvbiB0aGUgcmVjZWl2aW5nIHNpZGUgb2YgdGhlIFRM
QiBmbHVzaCBJUEkuICBJT1cgYXMKbG9uZyBhczoKIC0geW91IGNvcHkgdGhlIEw0IG9uIGNvbnRl
eHQgc3dpdGNoOyBhbmQKIC0geW91IGNvcHkgaXQgb24gdGhlIFRMQiBmbHVzaCBJUEkgaXMgcmVj
ZWl2ZWQKdGhlbiB5b3UgY2FuIHJlbHkgb24gdGhlIGV4aXN0aW5nIFRMQiBmbHVzaCBtZWNoYW5p
c21zIHRvIGRvIHdoYXQgeW91IG5lZWQuCkFuZCBzaGFkb3cgZG9lc24ndCBoYXZlIHRvIGJlaGF2
ZSBkaWZmZXJlbnRseSBmcm9tICdub3JtYWwnIFBWIE1NLgoKRG8geW91IHRoaW5rIGl0IG5lZWRz
IG1vcmUgKGluIHBhcnRpY3VsYXIgdG8gYXZvaWQgdGhlIEw0IGNvcHkgb24gVExCCmZsdXNoZXM/
KSAgV291bGQgYSBwZXItZG9tYWluIGZsYWcgYmUgZ29vZCBlbm91Z2ggaWYgcGVyLXZjcHUgaXMK
ZGlmZmljdWx0PwoKVGltLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
