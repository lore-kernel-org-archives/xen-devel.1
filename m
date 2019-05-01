From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH 1/7] x86/wakeup: Stop using %fs for
 lidt/lgdt
Date: Wed, 1 May 2019 17:09:27 +0100
Message-ID: <eb9f67d6-80d3-5be0-7804-e3178ad00b93@citrix.com>
References: <cover.1556708225.git.dwmw2@infradead.org>
 <22e1febec473b55fd7e43ffe02fb3a81f70a5e86.1556708226.git.dwmw2@infradead.org>
 <1c3cb13f-cba7-cc6a-36c7-fc156dd41b21@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2zDm=TB=citrix.com=prvs=017a1499b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hLrno-0004Iq-ER
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 16:09:48 +0000
In-Reply-To: <1c3cb13f-cba7-cc6a-36c7-fc156dd41b21@citrix.com>
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

T24gMDEvMDUvMjAxOSAxMzowMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8wNS8yMDE5
IDEyOjE3LCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4+IEZyb206IERhdmlkIFdvb2Rob3VzZSA8
ZHdtd0BhbWF6b24uY28udWs+Cj4+Cj4+IFRoZSB3YWtldXAgY29kZSBpcyBub3cgcmVsb2NhdGVk
IGFsb25nc2lkZSB0aGUgdHJhbXBvbGluZSBjb2RlLCBzbyAlZHMKPj4gaXMganVzdCBmaW5lIGhl
cmUuCj4gQUZBQ0lULCB0aGlzIGlzIGFzIGEgY29uc2VxdWVuY2Ugb2YgYy9zIGJjNGE2OGYyMWY0
M2MyICJ4ODY6IG1ha2UKPiBydW4tdGltZSBwYXJ0IG9mIHRyYW1wb2xpbmUgcmVsb2NhdGFibGUi
ID8KPgo+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVr
Pgo+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+
Cj4gSSBkb24ndCBoYXZlIGEgc2Vuc2libGUgd2F5IG9mIHRlc3RpbmcgdGhpcyBBVE0sIGJ1dCB0
aGUgY2hhbmdlIGxvb2tzCj4gY29ycmVjdC4KCkknbSBhZnJhaWQgdGVzdGluZyBzYXlzIG5vLsKg
IFMzIHdvcmtzIGZpbmUgd2l0aG91dCB0aGlzIGNoYW5nZSwgYW5kCnJlc2V0cyB3aXRoIGl0LgoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
