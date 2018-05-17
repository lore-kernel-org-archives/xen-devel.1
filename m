From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen-netfront: fix xennet_start_xmit()'s
 return type
Date: Thu, 17 May 2018 08:43:28 +0200
Message-ID: <934aa4fe-30ef-10b7-96d7-995ee7a4d6a0__20274.3966402069$1526539329$gmane$org@suse.com>
References: <20180424131815.5064-1-luc.vanoostenryck@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ents=ie=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fJCdP-0004ha-JF
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 06:43:31 +0000
In-Reply-To: <20180424131815.5064-1-luc.vanoostenryck@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDQvMTggMTU6MTgsIEx1YyBWYW4gT29zdGVucnljayB3cm90ZToKPiBUaGUgbWV0aG9k
IG5kb19zdGFydF94bWl0KCkgaXMgZGVmaW5lZCBhcyByZXR1cm5pbmcgYW4gJ25ldGRldl90eF90
JywKPiB3aGljaCBpcyBhIHR5cGVkZWYgZm9yIGFuIGVudW0gdHlwZSwgYnV0IHRoZSBpbXBsZW1l
bnRhdGlvbiBpbiB0aGlzCj4gZHJpdmVyIHJldHVybnMgYW4gJ2ludCcuCj4gCj4gRml4IHRoaXMg
YnkgcmV0dXJuaW5nICduZXRkZXZfdHhfdCcgaW4gdGhpcyBkcml2ZXIgdG9vLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEx1YyBWYW4gT29zdGVucnljayA8bHVjLnZhbm9vc3RlbnJ5Y2tAZ21haWwuY29t
PgoKUHVzaGVkIHRvIHhlbi90aXAuZ2l0IGZvci1saW51cy00LjE4CgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
