From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 3/6] x86/shadow: ignore sh_pin() failure in
	one more case
Date: Wed, 20 Dec 2017 08:08:35 +0000
Message-ID: <20171220080835.GD76516@deinos.phlegethon.org>
References: <5A2FFB8D0200007800196DDF@prv-mh.provo.novell.com>
 <5A2FFE7B0200007800196E04@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=t+nq=dq=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1eRZQg-00030l-0R
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 08:08:42 +0000
Content-Disposition: inline
In-Reply-To: <5A2FFE7B0200007800196E04@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXQgMDg6MDYgLTA3MDAgb24gMTIgRGVjICgxNTEzMDY1OTc5KSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gRm9sbG93aW5nIHdoYXQgd2UndmUgYWxyZWFkeSBkb25lIGluIHRoZSBYU0EtMjUwIGZpeCwg
Y29udmVydCBhbm90aGVyCj4gc2hfcGluKCkgY2FsbGVyIHRvIG5vIGxvbmdlciBmYWlsIHRoZSBo
aWdoZXIgbGV2ZWwgb3BlcmF0aW9uIGlmIHBpbm5pbmcKPiBmYWlscywgYXMgcGlubmluZyBpcyBh
IHBlcmZvcm1hbmNlIG9wdGltaXphdGlvbiBvbmx5IGluIHRob3NlIHBsYWNlcy4KPiAKPiBTdWdn
ZXN0ZWQtYnk6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBUaW0gRGVlZ2FuIDx0aW1A
eGVuLm9yZz4KCj4gV291bGQgaXQgYmUgd29ydGggbWFraW5nIHNoX3BpbigpIHJldHVybiB2b2lk
LCBieSBhZGRpbmcgYSBib29sCj4gcGFyYW1ldGVyIHdoaWNoIHRoZSBvdGhlciBjYWxsIHNpdGUg
aW4gc2hfc2V0X3RvcGxldmVsX3NoYWRvdygpIGNvdWxkCj4gdXNlIHRvIGluZGljYXRlIGEgcmVm
IGlzIGF2YWxhYmxlIHRvIGJlIHVzZWQgKGluc3RlYWQgb2YgYXF1aXJpbmcgYQo+IG5ldyBvbmUp
PyBUaGlzIHdvdWxkIGFsbG93IHRvIGRyb3AgYW5vdGhlciBkb21haW5fY3Jhc2goKS4KCk5vLCBs
ZXQncyBrZWVwIHRoZSBjYWxsaW5nIGNvbnZlbnRpb24gYXMgaXQgaXMsIHBsZWFzZS4KCkNoZWVy
cwoKVGltLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
