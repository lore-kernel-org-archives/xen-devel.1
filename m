From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: avoid memory_type_changed()
 invocations when possible
Date: Mon, 16 Jul 2018 18:08:00 +0100
Message-ID: <d98d9f04-e22e-6104-3c21-8f90d8a58db2@citrix.com>
References: <5B4CCBB502000078001D4904@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pxdv=ka=citrix.com=prvs=728a4bfaa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ff6zE-0004ns-UW
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 17:08:36 +0000
In-Reply-To: <5B4CCBB502000078001D4904@prv1-mh.provo.novell.com>
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
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDcvMTggMTc6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZXkncmUgZXhwZW5zaXZl
LCBhbmQgbm90aGluZyBjaGFuZ2VzIGlmIE1UUlJzIGFyZSBkaXNhYmxlZCBhbmQgYW55IG9mCj4g
dGhlIHJhbmdlcyBnZXRzIGNoYW5nZWQsIG9yIGlmIGZpeGVkIHJhbmdlIE1UUlJzIGFyZSBkaXNh
YmxlZCBhbmQgYW55IG9mCj4gdGhlbSBnZXRzIGNoYW5nZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpUaGVyZSBpcyBzdGlsbCBmYXIgbW9yZSBy
b29tIGltcHJvdmUgaGVyZSwgYnV0IHRoaXMgaXMgYSBzdGFydC4KCkFja2VkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
