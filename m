From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 20/23] xen: connect guest creation with
 CONFIG_{HVM, PV}
Date: Tue, 28 Aug 2018 14:15:38 +0100
Message-ID: <20180828131538.6x5m3c4yrpbtsxst@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <ca3fb129b9e4707d268df561cb32b50cae902982.1535285866.git-series.wei.liu2@citrix.com>
 <5B85364102000078001E28EE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ardv=ll=citrix.com=prvs=7715574d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fudqR-0006oK-Qn
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 13:15:43 +0000
Content-Disposition: inline
In-Reply-To: <5B85364102000078001E28EE@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMDU6NDc6MTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI2LjA4LjE4IGF0IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IAo+
IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gcHJvdmlkZWQgdGhl
IEFSTSBzaWRlIGlzc3VlIHBvaW50ZWQgb3V0IGJ5IEp1bGllbiBpcyBnb2luZyB0bwo+IGJlIHRh
a2VuIGNhcmUgb2YgKHByZXN1bWFibHkgYnkgYSBwYXRjaCBpbnNlcnRlZCBlYXJsaWVyIGluIHRo
ZQo+IHNlcmllcykuCgpUaGUgaXNzdWUgaXMgZ29pbmcgdG8gYmUgdGFrZW4gY2FyZSBvZiBieSBl
aXRoZXIgdXBkYXRpbmcgdGhlIENPTkZJR19QVgppZmRlZiAoYXMgSSBwcm9wb3NlZCBpbiB0aGUg
cmVwbHkgdG8gSnVsaWVuKSwgc2hyaW5rIHRoZSBzY29wZSBvZiB0aGlzCnBhdGNoIHRvIG9ubHkg
aGFuZGxlIENPTkZJR19IVk0gb3Igd2FpdCB1bnRpbCBKdWxpZW4ncyBzZXJpZXMgaXMKY29tbWl0
dGVkLgoKSW4gYW55IGNhc2UsIEkgaGF2ZSB0YWtlbiBub3RlIHRvIHNvcnQgdGhpcyBvdXQuCgpX
ZWkuCgo+IAo+IEphbgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
