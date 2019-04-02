From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 02/15] x86/cpu: Fix common cpuid faulting
 probing for AMD and Hygon
Date: Tue, 02 Apr 2019 04:19:44 -0600
Message-ID: <5CA337400200007800223D81@prv1-mh.provo.novell.com>
References: <cover.1553935727.git.puwen@hygon.cn>
 <96396a5ea9e1acc527705f71e9cd657b16585a75.1553935727.git.puwen@hygon.cn>
 <5CA1CE900200007800223782@prv1-mh.provo.novell.com>
 <3584da10-e33c-b382-bbb3-c12b538de30a@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hBGWC-0007xg-7L
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 10:19:48 +0000
In-Reply-To: <3584da10-e33c-b382-bbb3-c12b538de30a@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA0LjE5IGF0IDA4OjQ2LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvNC8xIDE2OjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMzAuMDMuMTkgYXQgMTE6NDIs
IDxwdXdlbkBoeWdvbi5jbj4gd3JvdGU6Cj4+PiBUaGVyZSBpcyBubyBNU1JfSU5URUxfUExBVEZP
Uk1fSU5GTyBmb3IgQU1EIGFuZCBIeWdvbiBmYW1pbGllcy4gU28gZGlyZWN0bHkKPj4+IHJldHVy
biBmYWxzZSBpbiB0aGUgZnVuY3Rpb24gcHJvYmVfY3B1aWRfZmF1bHRpbmcoKSBpZiAhY3B1X2hh
c19oeXBlcnZpc29yLgo+PiAKPj4gSSB0aGluayBpdCB3b3VsZCBoYXZlIGJlZW4gbmljZSBpZiB5
b3UgaGFkIG1lbnRpb25lZCB0aGUgcmVhbAo+PiByZWFzb24gd2h5IHlvdSB3YW50IHRvIGJ5cGFz
cyB0aGUgTVNSIGFjY2Vzc2VzLiBUaGlzIHdheSBpdAo+PiBzb3VuZHMgYXMgaWYgdGhlIGNoYW5n
ZSB3YXMgb25seSBjb3NtZXRpYywgYW5kIGhlbmNlIGNvdWxkIGJlCj4+IGxlZnQgb3V0Lgo+IAo+
IE9rYXksIGhvdyBhYm91dCB0aGUgbmV3IGRlc2NyaXB0aW9uOgo+IFRoZXJlIGlzIG5vIE1TUl9J
TlRFTF9QTEFURk9STV9JTkZPIGZvciBBTUQgYW5kIEh5Z29uIGZhbWlsaWVzLiBSZWFkCj4gdGhp
cyBNU1Igd2lsbCBzdG9wIHRoZSBYZW4gaW5pdGlhbGl6YXRpb24gcHJvY2VzcwoKIi4uLiBmb3Ig
c29tZSBlYXJseSBIeWdvbiBzdGVwcGluZ3MiKD8pLiBJJ20gdW5hd2FyZSBvZiBBTUQgQ1BVcwpo
YXZpbmcgdGhpcyBpc3N1ZSAtIGFyZSB5b3UgdGVsbGluZyB1cyBvdGhlcndpc2U/CgpKYW4KCj4g
b3IgcHJvZHVjZSBHUEYoMCkuCj4gU28gZGlyZWN0bHkgcmV0dXJuIGZhbHNlIGluIHRoZSBmdW5j
dGlvbiBwcm9iZV9jcHVpZF9mYXVsdGluZygpIGlmCj4gIWNwdV9oYXNfaHlwZXJ2aXNvci4KPiAK
PiAtLSAKPiBSZWdhcmRzLAo+IFB1IFdlbgoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
