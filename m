From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86: fix indirect thunk usage of
 CONFIG_INDIRECT_THUNK
Date: Thu, 25 Jan 2018 03:13:03 -0700
Message-ID: <5A69BBBF02000078001A2434@prv-mh.provo.novell.com>
References: <20180124154849.84889-1-roger.pau@citrix.com>
 <20180124154849.84889-3-roger.pau@citrix.com>
 <5A68C11902000078001A20EE@prv-mh.provo.novell.com>
 <20180124165217.6c35apjisrdgioz2@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=vltw=eu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eeeWo-0001YD-1p
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2018 10:13:06 +0000
In-Reply-To: <20180124165217.6c35apjisrdgioz2@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjAxLjE4IGF0IDE3OjUyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgSmFuIDI0LCAyMDE4IGF0IDA5OjIzOjM3QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjQuMDEuMTggYXQgMTY6NDgsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gV2hlbiBpbmRpcmVjdF90aHVua19hc20uaCBpcyBpbnN0YW50aWF0ZWQgZGly
ZWN0bHkgaW50byBhc3NlbWJseSBmaWxlcwo+PiA+IENPTkZJR19JTkRJUkVDVF9USFVOSyBtaWdo
dCBub3QgYmUgZGVmaW5lZCwgYW5kIHRodXMgdXNpbmcgLmlmIGFnYWluc3QKPj4gPiBpdCBpcyB3
cm9uZy4KPj4gPiAKPj4gPiBBZGQgYSBjaGVjayB0byBkZWZpbmUgQ09ORklHX0lORElSRUNUX1RI
VU5LIHRvIDAgaWYgbm90IGRlZmluZWQsIHNvCj4+ID4gdGhhdCB1c2luZyAuaWYgQ09ORklHX0lO
RElSRUNUX1RIVU5LIGlzIGFsd2F5cyBjb3JyZWN0Lgo+PiA+IAo+PiA+IFRoaXMgc3VwcHJlc3Nl
cyB0aGUgZm9sbG93aW5nIGNsYW5nIGVycm9yOgo+PiA+IAo+PiA+IDxpbnN0YW50aWF0aW9uPjo4
Ojk6IGVycm9yOiBleHBlY3RlZCBhYnNvbHV0ZSBleHByZXNzaW9uCj4+ID4gICAgIC5pZiBDT05G
SUdfSU5ESVJFQ1RfVEhVTksgPT0gMQo+PiA+ICAgICAgICAgXgo+PiA+IDxpbnN0YW50aWF0aW9u
PjoxOjE6IG5vdGU6IHdoaWxlIGluIG1hY3JvIGluc3RhbnRpYXRpb24KPj4gPiBJTkRJUkVDVF9C
UkFOQ0ggY2FsbCAlcmR4Cj4+ID4gXgo+PiA+IGVudHJ5LlM6NTg5Ojk6IG5vdGU6IHdoaWxlIGlu
IG1hY3JvIGluc3RhbnRpYXRpb24KPj4gPiAgICAgICAgIElORElSRUNUX0NBTEwgJXJkeAo+PiA+
ICAgICAgICAgXgo+PiAKPj4gV2h5IGlzIHRoZSBzYW1lIG5vIHByb2JsZW0gd2l0aCBnYXM/IEl0
IHdhbnRzIGNvbnN0YW50Cj4+IGV4cHJlc3Npb25zIHdpdGggLmlmIHRvbywgYWZ0ZXIgYWxsLgo+
IAo+IFJpZ2h0LCBhbmQgSSBjYW5ub3QgZmlndXJlIG91dCB3aHkgaXQgd29ya3Mgd2hlbiB1c2lu
Zwo+IC1uby1pbnRlZ3JhdGVkLWFzIGFuZCBub3Qgd2hlbiBub3QgdXNpbmcgaXQuIFRoZSBtb3Jl
IHRoYXQgSSBjYW5ub3QKPiBzZWUgQ09ORklHX0lORElSRUNUX1RIVU5LIGJlaW5nIHVuY29uZGl0
aW9uYWxseSBkZWZpbmVkIHRvIGVpdGhlciAwIG9yCj4gMS4gSSBndWVzcyBJJ20gbWlzc2luZyBz
b21ldGhpbmcuCgpIbW0sIGl0IGxvb2tzIHRvIGJlIChoYWxmIHdheT8pIGludGVuZGVkIGJlaGF2
aW9yIGZvciBnYXMgdG8KY29uc2lkZXIgIjxzeW1ib2w+ID09IDxjb25zdGFudD4iIGFsd2F5cyBm
YWxzZSBpZiA8c3ltYm9sPgppcyB1bmRlZmluZWQgKGFuZCBzaW1pbGFybHkgIjxzeW1ib2w+ICE9
IDxjb25zdGFudD4iIGFsd2F5cwp0cnVlKS4gSSdsbCBpbnF1aXJlIG9uIHRoZSBiaW51dGlscyBs
aXN0IGlmIHRoaXMgaXMgcmVhbGx5IG1lYW50IHRvCnJlbWFpbiB0aGF0IHdheSBmb3JldmVyLCBh
cyBpdCdzIG5vdCBzcGVsbGVkIG91dCB0aGF0IHdheSBpbiB0aGUKZG9jcy4KCkphbgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
