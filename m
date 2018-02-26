From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] fuzz/x86_emulate: fix bounds for input
 size
Date: Mon, 26 Feb 2018 10:33:40 +0000
Message-ID: <20180226103340.xks2pk5ix5nw3bsq@citrix.com>
References: <20180223163009.b42xfl3euanth3b7@citrix.com>
 <20180223224857.10212-1-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6hhj=fu=citrix.com=prvs=588a5efd2=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eqG6l-0004z1-9z
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 10:34:11 +0000
Content-Disposition: inline
In-Reply-To: <20180223224857.10212-1-semelpaul@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Semel <semelpaul@gmail.com>
Cc: george.dunlap@eu.citrix.com, xen-devel@lists.xenproject.org, wei.liu2@citrix.com, JBeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMjMsIDIwMTggYXQgMTE6NDg6NTdQTSArMDEwMCwgUGF1bCBTZW1lbCB3cm90
ZToKPiBUaGUgbWF4aW11bSBzaXplIGZvciB0aGUgaW5wdXQgc2l6ZSB3YXMgc2V0IHRvIElOUFVU
X1NJWkUsIHdoaWNoIGlzIGFjdHVhbGx5Cj4gdGhlIHNpemUgb2YgdGhlIGRhdGEgYXJyYXkgaW5z
aWRlIHRoZSBmdXp6X2NvcnB1cyBzdHJ1Y3R1cmUgYW5kIHNvIHdhcyBub3QKPiBhYmxpbmcgdXNl
ciAob3IgQUZMKSB0byBmaWxsIGluIHRoZSB3aG9sZSBzdHJ1Y3R1cmUuIENoYW5naW5nIHRvCj4g
c2l6ZW9mKHN0cnVjdCBmdXp6X2NvcnB1cykgY29ycmVjdCB0aGlzIHByb2JsZW0uCj4gCj4gU2ln
bmVkLW9mZi1ieTogUGF1bCBTZW1lbCA8c2VtZWxwYXVsQGdtYWlsLmNvbT4KCkFja2VkLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
