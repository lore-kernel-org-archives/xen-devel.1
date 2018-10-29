From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/7] x86/pvh: allow PVH Dom0 to use the
 debug IO port console
Date: Mon, 29 Oct 2018 16:53:56 +0000
Message-ID: <47ce00b7-6f15-90f6-3ce3-b9316fae9845@citrix.com>
References: <20181019152021.64607-1-roger.pau@citrix.com>
 <20181019152021.64607-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rbrb=nj=citrix.com=prvs=833c35ccb=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gHAnf-0002kQ-JW
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 16:53:59 +0000
In-Reply-To: <20181019152021.64607-4-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTAvMTggMTY6MjAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBBZGQgYW4gb3B0aW9u
IHRvIGFsbG93IHRyYXBwaW5nIGFjY2Vzc2VzIHRvIElPIHBvcnQgMHhlOSBmb3IgYSBQVkgKPiBE
b20wLCBzbyBpdCBjYW4gcHJpbnQgdG8gdGhlIEhWTSBkZWJ1ZyBjb25zb2xlLiBOb3RlIHRoaXMg
aXMgbm90Cj4gZW5hYmxlZCBieSBkZWZhdWx0IGluIG9yZGVyIHRvIHByZXZlbnQgY2xhc2hlcyB3
aXRoIGhhcmR3YXJlIG9uIHRoZQo+IHN5c3RlbSB1c2luZyAweGU5Lgo+Cj4gU2lnbmVkLW9mZi1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2M6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
PiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ICAtIFVzZSBhIGRlZmluZSBmb3IgMHhlOS4KPiAg
LSBFeHBhbmQgJ0xpc3Qgb2YnIGluIHRoZSBYZW4gY29tbWFuZCBkb2MuCgpBcyBzYWlkIGR1cmlu
ZyB2MSwgbWFrZSB0aGlzIHVuY29uZGl0aW9uYWwgYW5kIGRvIGF3YXkgdGhlIGNvbW1hbmQgbGlu
ZQpvcHRpb24uCgpOb29uZSB3aXRoIGEgUFZIIGRvbTAgaXMgZ29pbmcgdG8gaGF2ZSBhIHJlYWwg
Q29aZXQgSW5mbyBQQyByYWRpbyBvbiBhbgpJU0EgYnVzLgoKfkFuZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
