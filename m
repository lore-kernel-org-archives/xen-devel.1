From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/mwait-idle: Graceful probe failure when
 MWAIT is disabled
Date: Thu, 22 Nov 2018 13:09:49 +0100
Message-ID: <20181122120949.jsx3ceeqynteejml@mac>
References: <5BF67DAB02000078001FEC32@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mihh=ob=citrix.com=prvs=8571d395d=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gPnny-00089i-7x
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 12:09:58 +0000
Content-Disposition: inline
In-Reply-To: <5BF67DAB02000078001FEC32@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDI6NTg6MDNBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2hlbiBNV0FJVCBpcyBkaXNhYmxlZCwgaW50ZWxfaWRsZSByZWZ1c2VzIHRvIHByb2Jl
Lgo+IEJ1dCBpdCBtYXkgbWlzLWxlYWQgdGhlIHVzZXIgYnkgYmxhbWluZyB0aGlzIG9uIHRoZSBt
b2RlbCBudW1iZXI6Cj4gCj4gaW50ZWxfaWRsZTogZG9lcyBub3QgcnVuIG9uIGZhbWlseSA2IG1v
ZGVzbCA3OQo+IAo+IFNvIGRlZmVyIHRoZSBjaGVjayBmb3IgTVdBSVQgdW50aWwgYWZ0ZXIgdGhl
IG1vZGVsIyB3aGl0ZS1saXN0IGNoZWNrIHN1Y2NlZWRzLAo+IGFuZCBpZiB0aGUgTVdBSVQgY2hl
Y2sgZmFpbHMsIHRlbGwgdGhlIHVzZXIgaG93IHRvIGZpeCBpdDoKPiAKPiBpbnRlbF9pZGxlOiBQ
bGVhc2UgZW5hYmxlIE1XQUlUIGluIEJJT1MgU0VUVVAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBMZW4g
QnJvd24gPGxlbi5icm93bkBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUmFmYWVsIEouIFd5
c29ja2kgPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgo+IFtMaW51eCBjb21taXQ6IGE0YzQ0
NzUzM2ExOGVlODZlMDcyMzJkNjM0NGJhMTJiMWY5YzUwNzddCj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
