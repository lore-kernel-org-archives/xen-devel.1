From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] [v2] xen: hypercall: fix out-of-bounds
	memcpy
Date: Mon, 5 Feb 2018 15:14:29 +0000
Message-ID: <67d8f0f1-0846-876d-d36a-c8a9f9366243__23169.1688336015$1517843882$gmane$org@citrix.com>
References: <20180205150340.328921-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xio2=e7=citrix.com=prvs=567de97ac=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eiiXj-0001sC-G3
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 15:18:51 +0000
In-Reply-To: <20180205150340.328921-1-arnd@arndb.de>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arnd Bergmann <arnd@arndb.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, David Laight <David.Laight@aculab.com>, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDIvMTggMTU6MDMsIEFybmQgQmVyZ21hbm4gd3JvdGU6CgpTbmlwcGluZyBkZWxldGVk
IGNvZGUgdG8gbWFrZSB0aGluZ3MgY2xlYXJlcjoKCj4gKwlpZiAoY21kID4gQVJSQVlfU0laRShw
aHlzZGV2b3BfbGVuKSkKPiArCQlyZXR1cm4gLUVOT1NZUzsKPgo+ICsJbGVuID0gcGh5c2Rldm9w
X2xlbltjbWRdOwo+ICsJbWVtY3B5KCZvcC51LCBhcmcsIGxlbik7CgpZb3UnbGwgd2FudCBhbiBh
cnJheV9ub3NwZWMoKSBvciB3aGF0ZXZlciBpdHMgY2FsbGVkIHRoZXNlIGRheXMuwqAgVGhpcwpj
b2RlIGlzIFNQMS1sZWFreS4KClVzZXJzcGFjZSBjb250cm9scyBjbWQgYW5kIGNhbiByZXRyaWV2
ZSBsZW4gYnkgdGltaW5nIGhvdyBtYW55IGFkamFjZW50CmNhY2hlIGxpbmVzIHdlcmUgcHVsbGVk
IGluIG15IG1lbWNweSgpLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
