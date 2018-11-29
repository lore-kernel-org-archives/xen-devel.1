From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: vpci: deferral of register write until p2m changes
 are done
Date: Thu, 29 Nov 2018 07:27:12 -0700
Message-ID: <5BFFF74002000078002013F3@prv1-mh.provo.novell.com>
References: <20181128100949.us5zjhswmxx42635@mac>
 <5BFE91980200007800200BDF@prv1-mh.provo.novell.com>
 <20181128154124.6iyz44hsvm7diovj@mac>
 <5BFEC0B80200007800200DBA@prv1-mh.provo.novell.com>
 <20181128165430.mgirjhqupxjh6nrg@mac>
 <5BFECAA10200007800200E9E@prv1-mh.provo.novell.com>
 <20181128174832.om7dtvdqu5xj6m64@mac>
 <5BFFB06E020000780020113C@prv1-mh.provo.novell.com>
 <20181129102528.ti7bvtklunkpioog@mac>
 <5BFFC2430200007800201210@prv1-mh.provo.novell.com>
 <20181129134422.d3xjeur24to7aj7m@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=suqh=oi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gSNJb-00006u-2n
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 14:29:15 +0000
In-Reply-To: <20181129134422.d3xjeur24to7aj7m@mac>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjExLjE4IGF0IDE0OjQ0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEkgY2Fubm90IHNlZSBob3cgaW50ZXJhY3Rpb25zIHdpdGggYSBkZXZpY2Ugd2l0aCBoYWxmLW1h
cHBlZCBCQVJzCj4gY291bGQgdHJpZ2dlciBhYm9ydHMgdGhhdCBjYW5ub3QgYmUgdHJpZ2dlcmVk
IHdoZW4gdGhlIGRldmljZSBoYXMKPiBmdWxseSBtYXBwZWQgQkFScy4gSWU6IGlmIHRoZXJlJ3Mg
aW5kZWVkIGEgd2F5IHRvIHRyaWdnZXIgc3VjaCBhYm9ydHMKPiBpdCB3b3VsZCBhbHNvIGJlIHBv
c3NpYmxlIHRvIGRvIHNvIHdpdGggZnVsbHkgbWFwcGVkIEJBUnMuCgpXaGV0aGVyIGNvbXBhcmlu
ZyB3aXRoIHRoZSBmdWxseSBtYXBwZWQgY2FzZSBvciB0aGUgZnVsbHkKdW5tYXBwZWQgb25lIGlz
IG1vcmUgcmVsZXZhbnQgSSBjYW4ndCB0ZWxsLiBJbiBhbnkgZXZlbnQgSQpkb24ndCB0aGluayB3
ZSdyZSBnb2luZyB0byBnZXQgYW55d2hlcmUgaGVyZSB3aXRob3V0IGVpdGhlcgpzb21lb25lIGNo
aW1pbmcgaW4gd2hvIGhhcyBiZXR0ZXIgUENJZSBrbm93bGVkZ2UgdGhhbgptZSwgb3Igd2l0aG91
dCB5b3Ugc3VibWl0dGluZyBhIHBhdGNoIHdpdGggYSBzdWZmaWNpZW50bHkKY29udmluY2luZyBk
ZXNjcmlwdGlvbi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
