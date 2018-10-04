From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 07/12] x86/cpuidle: patch some indirect
 calls to direct ones
Date: Thu, 4 Oct 2018 11:35:17 +0100
Message-ID: <519558e7-1df3-fc0c-cba8-ad7d99462751@citrix.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB3453002000078001EDA1A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mrpc=mq=citrix.com=prvs=80816b5da=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g80yW-0001DY-4U
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 10:35:20 +0000
In-Reply-To: <5BB3453002000078001EDA1A@prv1-mh.provo.novell.com>
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

T24gMDIvMTAvMTggMTE6MTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEZvciBub3cgb25seSB0aGUg
b25lcyB1c2VkIGR1cmluZyBlbnRlcmluZy9leGl0aW5nIG9mIGlkbGUgc3RhdGVzIGFyZQo+IGNv
bnZlcnRlZC4gQWRkaXRpb25hbGx5IHBtX2lkbGV7LF9zYXZlfSBhbmQgbGFwaWNfdGltZXJfe29u
LG9mZn0gY2FuJ3QKPiBiZSBjb252ZXJ0ZWQsIGFzIHRoZXkgbWF5IGdldCBlc3RhYmxpc2hlZCBy
YXRoZXIgbGF0ZSAod2hlbiBEb20wIGlzCj4gYWxyZWFkeSBhY3RpdmUpLgo+Cj4gTm90ZSB0aGF0
IGZvciBwYXRjaGluZyB0byBiZSBkZWZlcnJlZCB1bnRpbCBhZnRlciB0aGUgcHJlLVNNUCBpbml0
Y2FsbHMKPiAoZnJvbSB3aGVyZSBjcHVpZGxlX2luaXRfY3B1KCkgcnVucyB0aGUgZmlyc3QgdGlt
ZSkgdGhlIHBvaW50ZXJzIG5lZWQgdG8KPiBzdGFydCBvdXQgYXMgTlVMTC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
