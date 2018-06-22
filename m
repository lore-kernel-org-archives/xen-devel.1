From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen: Remove unnecessary BUG_ON from
 __unbind_from_irq()
Date: Fri, 22 Jun 2018 09:09:20 +0200
Message-ID: <20180622070920.wbawc3poyvwvguwu__46179.133866872$1529651312$gmane$org@mac>
References: <1529602184-2861-1-git-send-email-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=33vo=ji=citrix.com=prvs=704d538d6=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fWGCL-0006Oq-4L
 for xen-devel@lists.xenproject.org; Fri, 22 Jun 2018 07:09:33 +0000
Content-Disposition: inline
In-Reply-To: <1529602184-2861-1-git-send-email-boris.ostrovsky@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, ben.hutchings@codethink.co.uk, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdW4gMjEsIDIwMTggYXQgMDE6Mjk6NDRQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IENvbW1pdCA5MTBmOGJlZmRmNWIgKCJ4ZW4vcGlycTogZml4IGVycm9yIHBhdGgg
Y2xlYW51cCB3aGVuIGJpbmRpbmcKPiBNU0lzIikgZml4ZWQgYSBjb3VwbGUgb2YgZXJyb3JzIGlu
IGVycm9yIGNsZWFudXAgcGF0aCBvZgo+IHhlbl9iaW5kX3BpcnFfbXNpX3RvX2lycSgpLiBUaGlz
IGNsZWFudXAgYWxsb3dlZCBhIGNhbGwgdG8KPiBfX3VuYmluZF9mcm9tX2lycSgpIHdpdGggYW4g
dW5ib3VuZCBpcnEsIHdoaWNoIHdvdWxkIHJlc3VsdCBpbgo+IHRyaWdnZXJpbmcgdGhlIEJVR19P
TiB0aGVyZS4KPiAKPiBTaW5jZSB0aGVyZSBpcyByZWFsbHkgbm8gcmVhc29uIGZvciB0aGUgQlVH
X09OICh4ZW5fZnJlZV9pcnEoKSBjYW4KPiBvcGVyYXRlIG9uIHVuYm91bmQgaXJxcykgd2UgY2Fu
IHJlbW92ZSBpdC4KPiAKPiBSZXBvcnRlZC1ieTogQmVuIEh1dGNoaW5ncyA8YmVuLmh1dGNoaW5n
c0Bjb2RldGhpbmsuY28udWs+Cj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jp
cy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcywgSSBoYWQgdGhpcyBvbiBteSBxdWV1ZSBvZiBU
T0RPcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
