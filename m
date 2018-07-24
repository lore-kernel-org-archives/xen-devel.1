From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: automation: Creating a patchwork instance to
 improve pre-commit build testing
Date: Tue, 24 Jul 2018 10:24:30 +0100
Message-ID: <20180724092430.puacbfkbimdm5anz@citrix.com>
References: <DD622B30-B54C-4B9A-AA24-05329BD800B9@citrix.com>
 <5B56EC0002000078001D708C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2t9p=ki=citrix.com=prvs=736d78cd4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fhtYZ-0000qZ-MW
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 09:24:35 +0000
Content-Disposition: inline
In-Reply-To: <5B56EC0002000078001D708C@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Minios-devel <minios-devel@lists.xenproject.org>, committers@xenproject.org, xen-devel <xen-devel@lists.xenproject.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMjQsIDIwMTggYXQgMDM6MDY6MDhBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIzLjA3LjE4IGF0IDE4OjQwLCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3
cm90ZToKPiA+ICMgSG93IGRvZXMgdGhpcyBpbXBhY3QgbWU/Cj4gPiBUaGUgY29udHJpYnV0aW9u
IHdvcmtmbG93IGlzICpub3QqIGltcGFjdGVkIGJ5IHRoaXMgY2hhbmdlLCBidXQgb25jZSB1cCBh
bmQgCj4gPiBydW5uaW5nIHRoZSBmb2xsb3dpbmcgd2lsbCBoYXBwZW4gb25jZSB5b3UgcG9zdCBh
IHBhdGNoIG9yIHBhdGNoIHNlcmllcyB0byAKPiA+IHhlbi1kZXZlbDoKPiA+ICogUGF0Y2h3b3Jr
IHdpbGwgdGFrZSBwYXRjaCBzZXJpZXMgZnJvbSB0aGUgbWFpbGluZyBsaXN0IGFuZCBhcHBsaWVz
IGl0Cj4gPiAqIENJL0RDIHRlc3RpbmcgaXMgdHJpZ2dlcmVkCj4gPiAqIEEgdGVzdCByZXBvcnQg
d2lsbCBiZSBzZW50IGFzIGEgbWFpbCB0byB0aGUgcGF0Y2ggb3IgdGhlIHNlcmllcyAoYWthIHRo
ZSAwMCBwYXRjaCBvZiB0aGUgc2VyaWVzKQo+ID4gCj4gPiBUaGlzIGRvZXMgbWVhbiB0aG91Z2gg
dGhhdCBzZXJpZXMgd2hpY2ggZG8gbm90IGJ1aWxkIG9yIHNob3cgb3RoZXIgaXNzdWVzLCAKPiA+
IHdpbGwgbGlrZWx5IG5vdCBiZSByZXZpZXdlZCB1bnRpbCB0aGUgdGVzdHMgcGFzcy4gVGhpcyB3
b3VsZCBsZXNzZW4gdGhlIAo+ID4gYnVyZGVuIG9uIHJldmlld2VycywgYXMgdGhleSB3aWxsIGtu
b3cgd2hldGhlciB0aGUgY29kZSBzdWJtaXR0ZWQgYnVpbGRzIG9uIGEgCj4gPiB3aWRlIGFycmF5
IG9mIGVudmlyb25tZW50cy4gCj4gCj4gU28gaG93IGFyZSBkZXBlbmRlbmNpZXMgYmV0d2VlbiBz
ZXJpZXMgaW50ZW5kZWQgdG8gYmUgZGVhbHQgd2l0aD8gSXQKPiBpcyBub3QgdW5jb21tb24gZm9y
IHNvbWVvbmUgdG8gc2F5ICJhcHBsaWVzIG9ubHkgb24gdG9wIG9mIHh5eiIuIFRoZQo+IGltcGxp
Y2F0aW9uIG9mICJ3aWxsIGxpa2VseSBub3QgYmUgcmV2aWV3ZWQgdW50aWwgdGhlIHRlc3RzIHBh
c3MiIHNlZW1zCj4gdW5zdWl0YWJsZSB0byBtZSBpbiBzdWNoIGEgY2FzZS4KPiAKCldlIGhhdmUg
YmVlbiBhc2tpbmcgZXZlcnlvbmUgdG8gcmViYXNlIHRvIHN0YWdpbmcgYmVmb3JlIHBvc3Rpbmcg
YSBuZXcKdmVyc2lvbiBmb3IgYSBsb25nIHRpbWUuICBJdCBpcyBuYXR1cmFsIGZvciB0aGUgYm90
IHRvIGFzc3VtZSB0aGF0CmV2ZXJ5dGhpbmcgc2hvdWxkIGFwcGx5IG9uIHRvcCBvZiBzdGFnaW5n
LiBUaGF0IHdvdWxkIHByb3ZpZGUgbW9zdCB2YWx1ZQp0byB0aGUgY29tbXVuaXR5LgoKRm9yIHNw
ZWNpYWwgY2FzZXMgbGlrZSB5b3UganVzdCBtZW50aW9uLCB3ZSBzaG91bGQgYWltIHRvIHByb3Zp
ZGUKbWVjaGFuaXNtcyB0byBtYW51YWxseSBhcHBvaW50IGEgYnJhbmNoIHRvIGJlIHRlc3RlZC4K
CldlaS4KCj4gSmFuCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
