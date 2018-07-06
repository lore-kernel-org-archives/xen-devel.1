From: Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: 4.11.0 RC1 panic
Date: Fri, 6 Jul 2018 16:26:38 +0200
Message-ID: <20180706142638.GA6124@mail.soc.lip6.fr>
References: <5B1FE90D020000F804A5F2B5@prv1-mh.provo.novell.com>
 <5B20335B0200008603B30F33@prv1-mh.provo.novell.com>
 <5B20D0C102000078001CABB9@prv1-mh.provo.novell.com>
 <5B20DC910200000204A693B0@prv1-mh.provo.novell.com>
 <5B20EAF702000078001CACA3@prv1-mh.provo.novell.com>
 <5B2197D3020000F004A75E9B@prv1-mh.provo.novell.com>
 <5B227CAD02000078001CB51F@prv1-mh.provo.novell.com>
 <5B30A8DD0200007003BD270D@prv1-mh.provo.novell.com>
 <5B3B92D602000078001D0619@prv1-mh.provo.novell.com>
 <20180703161728.GB18182@mail.soc.lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1bax=jw=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1fbRh6-0007rD-Hz
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 14:26:44 +0000
Content-Disposition: inline
In-Reply-To: <20180703161728.GB18182@mail.soc.lip6.fr>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMDMsIDIwMTggYXQgMDY6MTc6MjhQTSArMDIwMCwgTWFudWVsIEJvdXllciB3
cm90ZToKPiA+IFNvIGluc3RlYWQgb2YgdGhlIGRlYnVnZ2luZyBwYXRjaCwgY291bGQgeW91IGdp
dmUgdGhlIG9uZSBiZWxvdwo+ID4gYSB0cnk/Cj4gCj4gU3VyZSwgdGhlIHRlc3Qgc2VydmVyIGlz
IG5vdyBydW5uaW5nIHdpdGggaXQuCj4gQXMgSSdtIHN0aWxsIHVzaW5nIDQuMTFyYzQgc291cmNl
cyBJIGhhZCB0byBhZGp1c3QgaXQgYSBiaXQgKHRoZSBzZWNvbmQgY2h1bmsKPiBkaWRuJ3QgYXBw
bHkgY2xlYW5seSkgYnV0IGl0IGRpZG4ndCBsb29rIGRpZmZpY3VsdCB0byBmaXggaXQuCj4gCj4g
Tm93IGxldHMgd2FpdCBmb3Igc29tZSBhdXRvbWF0ZWQgdGVzdHMgcnVuIHRvIGNvbXBsZXRlIC4u
LgoKU28gZmFyIG5vIGNyYXNoLCBzbyB0aGlzIGxvb2tzIGdvb2QuIEJ1dCB0aGVyZSBoYXMgYmVl
biBvbmx5IDE0IHJ1bnMsCmFuZCBhIGZldyBvZiB0aGVtIGRpZCBub3QgY29tcGxldGUgZm9yIHVu
cmVsYXRlZCBpc3N1ZXMsIHNvIGl0IHdvdWxkIG5lZWQKYSBiaXQgbW9yZSB0aW1lIHRvIGJlIHN1
cmUuCgpJJ20gYWJvdXQgdG8gbGVhdmUgZm9yIGEgb25lIHdlZWsgdmFjYXRpb247IEkgbWF5IGhh
dmUgbmV0d29yayBhY2NlcwphbmQga2VlcCBhbiBleWUgb24gaXQgYnV0IG5vIHByb21pc2UuIE1v
cmUgbmV3IG9uIG1vbmRheSAxNi4KCi0tIApNYW51ZWwgQm91eWVyIDxib3V5ZXJAYW50aW9jaGUu
ZXUub3JnPgogICAgIE5ldEJTRDogMjYgYW5zIGQnZXhwZXJpZW5jZSBmZXJvbnQgdG91am91cnMg
bGEgZGlmZmVyZW5jZQotLQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
