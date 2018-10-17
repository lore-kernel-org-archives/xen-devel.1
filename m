From: Tamas Lengyel <tamas.lengyel@zentific.com>
Subject: Re: [PATCH] mem_access: Fix npfec.kind propagation
Date: Wed, 17 Oct 2018 09:30:25 -0600
Message-ID: <CABfawh=uG2v=x0vmRCz9fOv_=sFPvcgUUm29J4x20qNJtBVJoA@mail.gmail.com>
References: <20180927112536.6909-1-george.dunlap@citrix.com>
 <81f65685-d9fc-4939-542f-47427f862ded@bitdefender.com>
 <293fda3a-73b1-c194-0ece-7261a4718680@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=grbz=m5=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gCnms-00035n-Pt
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 15:31:06 +0000
Received: by mail-wm1-x341.google.com with SMTP id 193-v6so2630373wme.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Oct 2018 08:31:05 -0700 (PDT)
In-Reply-To: <293fda3a-73b1-c194-0ece-7261a4718680@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMTcsIDIwMTggYXQgNzo0MSBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gT24gMTAvNS8xOCAyOjAwIFBNLCBSYXp2YW4g
Q29qb2NhcnUgd3JvdGU6Cj4gPiBPbiA5LzI3LzE4IDI6MjUgUE0sIEdlb3JnZSBEdW5sYXAgd3Jv
dGU6Cj4gPj4gVGhlIG5hbWUgb2YgdGhlICJ3aXRoX2dsYSIgZmxhZyBpcyBjb25mdXNpbmc7IGl0
IGhhcyBub3RoaW5nIHRvIGRvCj4gPj4gd2l0aCB0aGUgZXhpc3RlbmNlIG9yIGxhY2sgdGhlcmVv
ZiBvZiBhIGZhdWx0aW5nIEdMQSwgYnV0IHJhdGhlciB3aGVyZQo+ID4+IHRoZSBmYXVsdCBvcmln
aW5hdGVkLiAgVGhlIG5wZmVjLmtpbmQgdmFsdWUgaXMgYWx3YXlzIHZhbGlkLCBhbmQKPiA+PiBz
aG91bGQgdGh1cyBiZSBwcm9wYWdhdGVkLCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgZ2xhX3ZhbGlk
IGlzIHNldCBvcgo+ID4+IG5vdC4KPiA+Pgo+ID4+IEluIHBhcnRpY3VsYXIsIGdsYV92YWxpZCB3
aWxsIG5ldmVyIGJlIHNldCBvbiBBTUQgc3lzdGVtczsgYnV0Cj4gPj4gbnBmZWMua2luZCB3aWxs
IHN0aWxsIGJlIHZhbGlkIGFuZCBzaG91bGQgc3RpbGwgYmUgcHJvcGFnYXRlZC4KPiA+Pgo+ID4+
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29t
Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4
LmNvbT4KPiA+Cj4gPiBBY2tlZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVm
ZW5kZXIuY29tPgo+Cj4gRG9lcyB0aGlzIGFsc28gbmVlZCBUYW1hcycgYWNrIHRvIGdvIGluPwoK
SG0sIEkgcmVjYWxsIGFja2luZyB0aGlzIHBhdGNoIGJlZm9yZS4gSW4gYW55IGNhc2U6CkFja2Vk
LWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
