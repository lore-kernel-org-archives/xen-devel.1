From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 v2 2/8] xen/arm: p2m: Introduce
 p2m_get_page_from_gfn
Date: Fri, 21 Dec 2018 10:43:52 +0000
Message-ID: <2ec23e7f-0993-3cee-2637-f4e726c64222@arm.com>
References: <20181220192338.17526-1-julien.grall@arm.com>
 <20181220192338.17526-3-julien.grall@arm.com>
 <alpine.DEB.2.10.1812201455540.15901@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8mGA=O6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gaIHb-0003DP-C1
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 10:43:55 +0000
In-Reply-To: <alpine.DEB.2.10.1812201455540.15901@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDIwLzEyLzIwMTggMjI6NTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUaHUsIDIwIERlYyAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEluIGEgZm9s
bG93LXVwIHBhdGNoZXMsIHdlIHdpbGwgbmVlZCB0byBoYW5kbGUgZ2V0X3BhZ2VfZnJvbV9nZm4K
PiAgICAgICBeIHJlbW92ZSBhCgpJIGhhdmUgcmVtb3ZlZCB0aGUgImVzIiBmcm9tICJwYXRjaGVz
IiBhbmQga2VlcCB0aGUgImEiIGluc3RlYWQuCgo+IAo+IEFzaWRlIGZyb20gdGhhdDoKPiAKPiBS
ZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoK
VGhhbmsgeW91IGZvciB0aGUgcmV2aWV3IQoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
