From: Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: 4.11.0 RC1 panic
Date: Tue, 3 Jul 2018 18:17:28 +0200
Message-ID: <20180703161728.GB18182@mail.soc.lip6.fr>
References: <5B1FB0E5020000F903B0F0C2@prv1-mh.provo.novell.com>
 <5B1FE90D020000F804A5F2B5@prv1-mh.provo.novell.com>
 <5B20335B0200008603B30F33@prv1-mh.provo.novell.com>
 <5B20D0C102000078001CABB9@prv1-mh.provo.novell.com>
 <5B20DC910200000204A693B0@prv1-mh.provo.novell.com>
 <5B20EAF702000078001CACA3@prv1-mh.provo.novell.com>
 <5B2197D3020000F004A75E9B@prv1-mh.provo.novell.com>
 <5B227CAD02000078001CB51F@prv1-mh.provo.novell.com>
 <5B30A8DD0200007003BD270D@prv1-mh.provo.novell.com>
 <5B3B92D602000078001D0619@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=by1g=jt=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1faNzh-0002KT-Vl
 for xen-devel@lists.xenproject.org; Tue, 03 Jul 2018 16:17:34 +0000
Content-Disposition: inline
In-Reply-To: <5B3B92D602000078001D0619@prv1-mh.provo.novell.com>
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

T24gVHVlLCBKdWwgMDMsIDIwMTggYXQgMDk6MTQ6MzBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI1LjA2LjE4IGF0IDEwOjMzLCA8Ym91eWVyQGFudGlvY2hlLmV1Lm9yZz4g
d3JvdGU6Cj4gPiB0aGUgZG9tMCBoYXMgYmVlbiBydW5uaW5nIGZvciBhIHdlZWsgbm93LCBydW5u
aW5nIHRoZSBkYWlseSBOZXRCU0QgdGVzdHMuCj4gPiBBdHRhY2hlZCBpcyB0aGUgY29uc29sZSBs
b2cuCj4gPiBJIGRpZG4ndCBub3RpY2UgYW55dGhpbmcgc3VzcGVjdCwgZXhlcHQgYSBmZXcgZG9t
VSBjcmFzaGVzIChjcmFzaGluZyBpbgo+ID4gWGVuLCB0aGUgcHJvYmxlbSBpcyBub3QgcmVwb3J0
ZWQgYmFjayB0byB0aGUgZG9tVSkuIEJ1dCBhcyB0aGlzIGlzCj4gPiBydW5uaW5nIE5ldEJTRC1I
RUFEIHRlc3RzIGl0IGNhbiBhbHNvIGJlIGEgYnVnIGluIHRoZSBkb21VLCB0aGF0IGhhcwo+ID4g
YmVlbiBmaXhlZCBzaW5jZSB0aGVuLgo+ID4gCj4gPiBJdCdzIHBvc3NpYmxlIHRoYXQgdGhlIHBy
aW50ayBjaGFuZ2VkIHRpbWluZ3MgaW4gYSB3YXkgdGhhdCBwcmV2ZW50cyB0aGUKPiA+IHJhY2Ug
Y29uZGl0aW9uIGZyb20gaGFwcGVuaW5nIC4uLgo+IAo+IFNvIGluc3RlYWQgb2YgdGhlIGRlYnVn
Z2luZyBwYXRjaCwgY291bGQgeW91IGdpdmUgdGhlIG9uZSBiZWxvdwo+IGEgdHJ5PwoKU3VyZSwg
dGhlIHRlc3Qgc2VydmVyIGlzIG5vdyBydW5uaW5nIHdpdGggaXQuCkFzIEknbSBzdGlsbCB1c2lu
ZyA0LjExcmM0IHNvdXJjZXMgSSBoYWQgdG8gYWRqdXN0IGl0IGEgYml0ICh0aGUgc2Vjb25kIGNo
dW5rCmRpZG4ndCBhcHBseSBjbGVhbmx5KSBidXQgaXQgZGlkbid0IGxvb2sgZGlmZmljdWx0IHRv
IGZpeCBpdC4KCk5vdyBsZXRzIHdhaXQgZm9yIHNvbWUgYXV0b21hdGVkIHRlc3RzIHJ1biB0byBj
b21wbGV0ZSAuLi4KCi0tIApNYW51ZWwgQm91eWVyIDxib3V5ZXJAYW50aW9jaGUuZXUub3JnPgog
ICAgIE5ldEJTRDogMjYgYW5zIGQnZXhwZXJpZW5jZSBmZXJvbnQgdG91am91cnMgbGEgZGlmZmVy
ZW5jZQotLQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
