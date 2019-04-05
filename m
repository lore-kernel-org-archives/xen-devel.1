From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] xen/console: Don't treat NUL character
 as the end of the buffer
Date: Fri, 05 Apr 2019 04:26:57 -0600
Message-ID: <5CA72D710200007800224D5C@prv1-mh.provo.novell.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-3-julien.grall@arm.com>
 <5CA7273C0200007800224D26@prv1-mh.provo.novell.com>
 <cebb63a0-ec60-9862-3723-9a8e514c7582@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCM3o-0004Ad-NP
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 10:27:00 +0000
In-Reply-To: <cebb63a0-ec60-9862-3723-9a8e514c7582@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjA0LjE5IGF0IDEyOjIxLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDA1LzA0LzIwMTkgMTE6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBJbiBhbnkgZXZlbnQs
IGlmIHlvdSBtZWFuIHRvIHRyZWF0IGh3ZG9tIGFuZCBEb21VIGRpZmZlcmVudGx5LAo+PiB0aGVu
IEkgdGhpbmsgdGl0bGUgYW5kL29yIGRlc2NyaXB0aW9uIHNob3VsZCBhY3R1YWxseSBzYXkgc28s
IGFuZCB3aHkuCj4gCj4gSSBkb24ndCBzZWUgaG93IHRoaXMgaXMgdHJlYXRlZCBkaWZmZXJlbnRs
eS4gVGhpcyBjb2RlIGRvZXMgZXhhY3RseSB3aGF0IGNvbW1pdCAKPiB0aXRsZSBzdGF0ZS4gSS5l
IHRoZSBOVUwgZG9lcyBub3QgaW5kaWNhdGUgdGhlIGVuZCBvZiB0aGUgYnVmZmVyIGFueW1vcmUu
Cj4gCj4gU28gSSBkb24ndCBzZWUgd2hhdCBlbHNlIGNhbiBiZSBzYWlkIGluIHRoZSBjb21taXQg
bWVzc2FnZS4gRmVlbCBmcmVlIHRvIAo+IHN1Z2dlc3QgaXQuCgpIbW0sIHRydWUuIFBsZWFzZSBz
Y3JhdGNoIHRoYXQgcmVtYXJrIHRoZW4uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
