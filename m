From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH 1/7] x86/wakeup: Stop using %fs for
 lidt/lgdt
Date: Wed, 1 May 2019 13:02:47 +0100
Message-ID: <1c3cb13f-cba7-cc6a-36c7-fc156dd41b21@citrix.com>
References: <cover.1556708225.git.dwmw2@infradead.org>
 <22e1febec473b55fd7e43ffe02fb3a81f70a5e86.1556708226.git.dwmw2@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2zDm=TB=citrix.com=prvs=017a1499b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hLnwy-0007Gi-Nv
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 12:03:00 +0000
In-Reply-To: <22e1febec473b55fd7e43ffe02fb3a81f70a5e86.1556708226.git.dwmw2@infradead.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDUvMjAxOSAxMjoxNywgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IEZyb206IERhdmlk
IFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4KPiBUaGUgd2FrZXVwIGNvZGUgaXMgbm93
IHJlbG9jYXRlZCBhbG9uZ3NpZGUgdGhlIHRyYW1wb2xpbmUgY29kZSwgc28gJWRzCj4gaXMganVz
dCBmaW5lIGhlcmUuCgpBRkFDSVQsIHRoaXMgaXMgYXMgYSBjb25zZXF1ZW5jZSBvZiBjL3MgYmM0
YTY4ZjIxZjQzYzIgIng4NjogbWFrZQpydW4tdGltZSBwYXJ0IG9mIHRyYW1wb2xpbmUgcmVsb2Nh
dGFibGUiID8KCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5j
by51az4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKSSBkb24ndCBoYXZlIGEgc2Vuc2libGUgd2F5IG9mIHRlc3RpbmcgdGhpcyBBVE0sIGJ1dCB0
aGUgY2hhbmdlIGxvb2tzCmNvcnJlY3QuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
