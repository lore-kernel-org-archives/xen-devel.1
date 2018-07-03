From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: consolidate legacy FPU state loading
Date: Tue, 03 Jul 2018 05:54:34 -0600
Message-ID: <5B3B63FA02000078001D03ED@prv1-mh.provo.novell.com>
References: <5B31F09302000078001CDD99@prv1-mh.provo.novell.com>
 <20180703104803.ajalohm47ljid5y4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uib8=jt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1faJtH-0007RW-Iz
 for xen-devel@lists.xenproject.org; Tue, 03 Jul 2018 11:54:39 +0000
In-Reply-To: <20180703104803.ajalohm47ljid5y4@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA3LjE4IGF0IDEyOjQ4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBKdW4gMjYsIDIwMTggYXQgMDE6NTE6NDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IEZpcnN0IG9mIGFsbCBpbnRyb2R1Y2UgYSBoZWxwZXIgZnVuY3Rpb24gaW5zdGVhZCBv
ZiByZXBsaWNhdGluZyBhbG1vc3QKPj4gdGhlIHNhbWUgY29kZSBmb3IgUFYgYW5kIEhWTS4gVGhl
IGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIHR3byBwaWVjZXMgb2YKPj4gY29kZSBhY3R1YWxseSBw
b2ludHMgb3V0IGFuIGlzc3VlICh3aGljaCBpcyBhbHNvIGFkZHJlc3NlZCBoZXJlKTogSW4KPj4g
dGhlIEhWTSBjYXNlIEZDVyB3b3VsZCBub3QgaGF2ZSBiZWVuIHNldCB0byBGQ1dfUkVTRVQgaW4g
Y2VydGFpbiBjYXNlcwo+PiAobm90ZSBmb3IgZXhhbXBsZSB0aGF0IFhSU1RPUiBsb2FkcyBGQ1df
REVGQVVMVCByYXRoZXIgdGhlbiBGQ1dfUkVTRVQKPj4gd2hlbiB0aGUgcmVzcGVjdGl2ZSB4c3Rh
dGVfYnYgYml0IGlzIGNsZWFyKS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KPiAKPiBJIGRvIHdvbmRlciBpZiB0aGlzIGZ1bmN0aW9uIGNhbiBiZSB1c2VkIGlu
IGh2bV92Y3B1X3Jlc2V0X3N0YXRlIGFzCj4gd2VsbC4KCk9oLCBpbmRlZWQgLSB0aGlzIGRpZG4n
dCBldmVuIG9jY3VyIHRvIG1lLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
