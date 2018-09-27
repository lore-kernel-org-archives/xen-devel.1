From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] mem_access: Fix npfec.kind propagation
Date: Thu, 27 Sep 2018 12:26:46 +0100
Message-ID: <ccfdb0ac-2685-4751-265d-9766ec5eebdb@citrix.com>
References: <20180927112536.6909-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xlny=mj=citrix.com=prvs=8017a36a5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g5URV-0006iy-JT
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 11:26:49 +0000
In-Reply-To: <20180927112536.6909-1-george.dunlap@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alexandru Isaila <aisaila@bitdefender.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>, Tim Deegan <tim@xen.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDkvMTggMTI6MjUsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gVGhlIG5hbWUgb2YgdGhl
ICJ3aXRoX2dsYSIgZmxhZyBpcyBjb25mdXNpbmc7IGl0IGhhcyBub3RoaW5nIHRvIGRvCj4gd2l0
aCB0aGUgZXhpc3RlbmNlIG9yIGxhY2sgdGhlcmVvZiBvZiBhIGZhdWx0aW5nIEdMQSwgYnV0IHJh
dGhlciB3aGVyZQo+IHRoZSBmYXVsdCBvcmlnaW5hdGVkLiAgVGhlIG5wZmVjLmtpbmQgdmFsdWUg
aXMgYWx3YXlzIHZhbGlkLCBhbmQKPiBzaG91bGQgdGh1cyBiZSBwcm9wYWdhdGVkLCByZWdhcmRs
ZXNzIG9mIHdoZXRoZXIgZ2xhX3ZhbGlkIGlzIHNldCBvcgo+IG5vdC4KPgo+IEluIHBhcnRpY3Vs
YXIsIGdsYV92YWxpZCB3aWxsIG5ldmVyIGJlIHNldCBvbiBBTUQgc3lzdGVtczsgYnV0Cj4gbnBm
ZWMua2luZCB3aWxsIHN0aWxsIGJlIHZhbGlkIGFuZCBzaG91bGQgc3RpbGwgYmUgcHJvcGFnYXRl
ZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5k
ZXIuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0
cml4LmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
