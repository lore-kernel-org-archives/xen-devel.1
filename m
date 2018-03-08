From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 1/9] x86/mm: add pv prefix to {alloc,
 free}_page_type
Date: Thu, 08 Mar 2018 10:05:03 -0700
Message-ID: <5AA17B4F02000078001AFF1B@prv-mh.provo.novell.com>
References: <20180213200408.5463-1-wei.liu2@citrix.com>
 <20180213200408.5463-2-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=bbjo=f6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1etyyd-00033x-Vf
 for xen-devel@lists.xenproject.org; Thu, 08 Mar 2018 17:05:12 +0000
In-Reply-To: <20180213200408.5463-2-wei.liu2@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAyLjE4IGF0IDIxOjA0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhlIHR3byBmdW5jdGlvbnMgYXJlIG9ubHkgdXNlZCBieSBQViBjb2RlIHBhdGhzIGJlY2F1c2U6
Cj4gCj4gMS4gVG8gYWxsb2NhdGUgYSBQR1RfbCpfcGFnZV90YWJsZSB0eXBlIHBhZ2UsIGEgRG9t
VSBtdXN0IGV4cGxpY2l0bHkKPiAgICByZXF1ZXN0IHN1Y2ggdHlwZXMgdmlhIFBWIE1NVSBoeXBl
cmNhbGwuCj4gMi4gUFYgRG9tMCBidWlsZGVyIGV4cGxpY2l0bHkgYXNrcyBmb3IgUEdUX2wqX3Bh
Z2VfdGFibGUgdHlwZSBwYWdlcywKPiAgICBidXQgaXQgaXMgb2J2aW91c2x5IFBWIG9ubHkuCj4g
My4gcDJtX2FsbG9jX3B0cCBleHBsaWNpdGx5IHNldHMgUEdUX2wxX3BhZ2VfdGFibGUsIGJ1dCB0
aGUgYWxsb2NhdGlvbgo+ICAgIGFuZCBkZWFsbG9jYXRpb24gb2Ygc3VjaCBwYWdlcyBkb24ndCBn
byB0aHJvdWdoIHRoZSB0d28gZnVuY3Rpb25zCj4gICAgdG91Y2hlZCBpbiB0aGlzIHBhdGNoLgo+
IDQuIHNoYWRvd19lbmFibGUgZXhwbGljaXRseSBzZXRzIFBHVF9sMl9wYWdlX3RhYmxlLCBidXQg
dGhlIGFsbG9jYXRpb24KPiAgICBhbmQgZGVhbGxvY2F0aW9uIG9mIHN1Y2ggcGFnZXMgZG9uJ3Qg
Z28gdGhyb3VnaCB0aGUgdHdvIGZ1bmN0aW9ucwo+ICAgIHRvdWNoZWQgaW4gdGhpcyBwYXRjaC4K
PiAKPiBBbHNvIG1vdmUgdGhlIGRlY2xhcmF0aW9ucyB0byBwdi9tbS5oLiBUaGUgY29kZSB3aWxs
IGJlIG1vdmVkIGxhdGVyLgo+IFRha2UgdGhlIGNoYW5jZSB0byBjaGFuZ2UgcHJlZW1wdGlibGUg
dG8gYm9vbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
Pgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgfCAgMiArLQo+ICB4ZW4vYXJj
aC94ODYvbW0uYyAgICAgICAgICAgfCAxNCArKysrKysrLS0tLS0tLQo+ICB4ZW4vaW5jbHVkZS9h
c20teDg2L21tLmggICAgfCAgMyAtLS0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9wdi9tbS5oIHwg
MTEgKysrKysrKysrKysKCk9oLCBidHcgLSB3aHkgbm90IHhlbi9hcmNoL3g4Ni9wdi9tbS5oPwoK
SmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
