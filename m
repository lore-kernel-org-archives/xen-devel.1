From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/4] x86: fix "xpti=" and "pv-l1tf=" yet
 again
Date: Tue, 2 Oct 2018 17:58:38 +0100
Message-ID: <0f2ea2d7-b8ae-8ac6-72f1-17163fa3fcd9@citrix.com>
References: <5BB20CE602000078001ED341@prv1-mh.provo.novell.com>
 <5BB20EA402000078001ED36B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=okrt=mo=citrix.com=prvs=806f63693=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g7O0O-0000mM-V8
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 16:58:40 +0000
In-Reply-To: <5BB20EA402000078001ED36B@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTAvMTggMTM6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdoaWxlIGNvbW1pdCAyYTNi
MzRlYzQ3ICgieDg2L3NwZWMtY3RybDogWWV0IG1vcmUgZml4ZXMgZm9yIHhwdGk9Cj4gcGFyc2lu
ZyIpIGluZGVlZCBmaXhlZCAieHB0aT1kb20wIiwgaXQgYnJva2UgInhwdGk9bm8tZG9tMCIsIGlu
IHRoYXQKPiB0aGlzIHRoZW4gYmVjYW1lIGVxdWl2YWxlbnQgdG8gInhwdGk9bm8iLiBJbiBwYXJ0
aWN1bGFyLCB0aGUgcHJlc2VuY2UKPiBvZiAieHB0aT0iIGFsb25lIG9uIHRoZSBjb21tYW5kIGxp
bmUgbWVhbnMgbm90aGluZyBhcyB0byB3aGljaCBkZWZhdWx0Cj4gaXMgdG8gYmUgb3ZlcnJpZGRl
bjsgInhwdGk9bm8tZG9tMCIsIGZvciBleGFtcGxlLCBvdWdodCB0byBoYXZlIG5vCj4gZWZmZWN0
IGZvciBEb21VLXMsIGFzIHRoaXMgaXMgZGlzdGluY3QgZnJvbSBib3RoICJ4cHRpPW5vLWRvbTAs
ZG9tdSIKPiBhbmQgInhwdGk9bm8tZG9tMCxuby1kb211Ii4KPgo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
