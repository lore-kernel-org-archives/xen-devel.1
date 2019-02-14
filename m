From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/pv: Fix construction of 32bit dom0's
Date: Thu, 14 Feb 2019 12:02:36 +0000
Message-ID: <de3e137e-28c8-53a4-6361-429751fe2033@citrix.com>
References: <20190214111009.16448-1-wei.liu2@citrix.com>
 <5C6555C10200007800216A6F@prv1-mh.provo.novell.com>
 <20190214115454.uxo7sjhjyblkpnos@zion.uk.xensource.com>
 <5C6558920200007800216A7D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CfJi=QV=citrix.com=prvs=941bb452b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1guFiy-0005Yd-2j
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 12:02:40 +0000
In-Reply-To: <5C6558920200007800216A7D@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDIvMjAxOSAxMjowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTQuMDIuMTkg
YXQgMTI6NTQsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToKPj4gT24gVGh1LCBGZWIgMTQs
IDIwMTkgYXQgMDQ6NDk6MjFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAx
NC4wMi4xOSBhdCAxMjoxMCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+IEZyb206
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+Pj4KPj4+PiBkb20w
X2NvbnN0cnVjdF9wdigpIGhhcyBsb2dpYyB0byB0cmFuc2l0aW9uIGRvbTAgaW50byBhIGNvbXBh
dCBkb21haW4gd2hlbgo+Pj4+IGJvb3RpbmcgYW4gRUxGMzIgaW1hZ2UuCj4+Pj4KPj4+PiBPbmUg
YXNwZWN0IHdoaWNoIGlzIG1pc3NpbmcgaXMgdGhlIENQVUlEIHBvbGljeSByZWNhbGN1bGF0aW9u
LCBtZWFuaW5nIHRoYXQgYQo+Pj4+IDMyYml0IGRvbTAgc2VlcyBhIDY0Yml0IHBvbGljeSwgd2hp
Y2ggZGlmZmVyIGJ5IHRoZSBMb25nIE1vZGUgZmVhdHVyZSBmbGFnIGluCj4+Pj4gcGFydGljdWxh
ci4gIEFub3RoZXIgbWlzc2luZyBpdGVtIGlzIHRoZSB4ODdfZmlwX3dpZHRoIGluaXRpYWxpc2F0
aW9uLgo+Pj4+Cj4+Pj4gVXBkYXRlIGRvbTBfY29uc3RydWN0X3B2KCkgdG8gdXNlIHN3aXRjaF9j
b21wYXQoKSwgcmF0aGVyIHRoYW4gcmV0YWluaW5nIHRoZQo+Pj4+IG9wZW5jb2RpbmcuICBQb3Np
dGlvbiB0aGUgY2FsbCB0byBzd2l0Y2hfY29tcGF0KCkgc3VjaCB0aGF0IHRoZSBjb21wYXQzMiBs
b2NhbAo+Pj4+IHZhcmlhYmxlIGNhbiBkaXNhcHBlYXIgZW50aXJlbHkuCj4+Pj4KPj4+PiBUaGUg
MzJiaXQgbW9uaXRvciB0YWJsZSBpcyBub3cgY3JlYXRlZCBieSBzZXR1cF9jb21wYXRfbDQoKSwg
YXZvaWRpbmcgdGhlIG5lZWQKPj4+PiB0byBmb3IgbWFudWFsIGNyZWF0aW9uIGxhdGVyLiAgRnVy
dGhlcm1vcmUsIHRoZSBMMyB0YWJsZSBjcmVhdGlvbiBpcyByZWR1bmRhbnQKPj4+PiB3aXRoIHRo
ZSBsb2dpYyBpbnNpZGUgdGhlIG1haW4gbWFwcGluZyBsb29wLCBzbyBjYW4gYmUgZHJvcHBlZCBh
cyB3ZWxsLgo+Pj4gVGhpcyBsYXN0IHNlbnRlbmNlIGlzIG5vIGxvbmdlciBhcHBsaWNhYmxlIGFm
YWljdC4KPj4gR29vZCBjYXRjaC4KPj4KPj4gSSB0aGluayB0aGUgc3ViamVjdCBsaW5lIGFsc28g
bmVlZHMgZml4aW5nLiBJdCBzaG91bGQgcmVhZDoKPj4KPj4gICAgIHg4Ni9wdjogRml4IGNvbnN0
cnVjdGlvbiBvZiAzMmJpdCBkb20wCj4+Cj4+IGkuZS4gdGhlIHBvc3Nlc3NpdmUgZm9ybSBpcyB3
cm9uZy4KPiBQZXJoYXBzLiBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IEFuZHJldyBt
ZWFudCBwbHVyYWwuCgpJIGRpZCwgYmVjYXVzZSBpbiBwcmFjdGljZSB0aGlzIGlzICJmaXggcnVu
bmluZyAzMmJpdCBQViBYVEYgdGVzdHMgd2hlbgp5b3VyIHdvcmtpbmcgb24gWGVuIGluIFBWSCBt
b2RlIi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
