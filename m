From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] mem_access: Fix npfec.kind propagation
Date: Wed, 17 Oct 2018 16:39:09 +0300
Message-ID: <293fda3a-73b1-c194-0ece-7261a4718680@bitdefender.com>
References: <20180927112536.6909-1-george.dunlap@citrix.com>
 <81f65685-d9fc-4939-542f-47427f862ded@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rnu4=m5=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gCm2b-0008UM-T6
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 13:39:13 +0000
In-Reply-To: <81f65685-d9fc-4939-542f-47427f862ded@bitdefender.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>, Alexandru Isaila <aisaila@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvNS8xOCAyOjAwIFBNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4gT24gOS8yNy8xOCAy
OjI1IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBUaGUgbmFtZSBvZiB0aGUgIndpdGhfZ2xh
IiBmbGFnIGlzIGNvbmZ1c2luZzsgaXQgaGFzIG5vdGhpbmcgdG8gZG8KPj4gd2l0aCB0aGUgZXhp
c3RlbmNlIG9yIGxhY2sgdGhlcmVvZiBvZiBhIGZhdWx0aW5nIEdMQSwgYnV0IHJhdGhlciB3aGVy
ZQo+PiB0aGUgZmF1bHQgb3JpZ2luYXRlZC4gIFRoZSBucGZlYy5raW5kIHZhbHVlIGlzIGFsd2F5
cyB2YWxpZCwgYW5kCj4+IHNob3VsZCB0aHVzIGJlIHByb3BhZ2F0ZWQsIHJlZ2FyZGxlc3Mgb2Yg
d2hldGhlciBnbGFfdmFsaWQgaXMgc2V0IG9yCj4+IG5vdC4KPj4KPj4gSW4gcGFydGljdWxhciwg
Z2xhX3ZhbGlkIHdpbGwgbmV2ZXIgYmUgc2V0IG9uIEFNRCBzeXN0ZW1zOyBidXQKPj4gbnBmZWMu
a2luZCB3aWxsIHN0aWxsIGJlIHZhbGlkIGFuZCBzaG91bGQgc3RpbGwgYmUgcHJvcGFnYXRlZC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRl
ci5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0
cml4LmNvbT4KPiAKPiBBY2tlZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVm
ZW5kZXIuY29tPgoKRG9lcyB0aGlzIGFsc28gbmVlZCBUYW1hcycgYWNrIHRvIGdvIGluPwoKClRo
YW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
