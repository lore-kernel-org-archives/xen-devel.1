From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/3] x86/idle: re-arrange dead-idle
 handling
Date: Mon, 20 May 2019 15:25:49 +0100
Message-ID: <84f00023-400a-fda9-2b47-ab7041a0d35c@citrix.com>
References: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
 <5B61C21202000000000FC1F1@prv1-mh.provo.novell.com>
 <5B61C21202000078001F8805@prv1-mh.provo.novell.com>
 <5B61C21202000000000FC6BD@prv1-mh.provo.novell.com>
 <5B61C212020000780020B6D8@prv1-mh.provo.novell.com>
 <5B61C21202000000000FF27E@prv1-mh.provo.novell.com>
 <5B61C2120200007800224310@prv1-mh.provo.novell.com>
 <5B61C2120200000000101EDC@prv1-mh.provo.novell.com>
 <5B61C212020000780022FF0D@prv1-mh.provo.novell.com>
 <5CDE88900200007800230027@prv1-mh.provo.novell.com>
 <5CDE88EA0200007800230031@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hSjEg-0006ki-1k
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 14:25:54 +0000
In-Reply-To: <5CDE88EA0200007800230031@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDUvMjAxOSAxMToxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW4gb3JkZXIgdG8gYmUg
YWJsZSB0byB3YWtlIHBhcmtlZCBDUFVzIGZyb20gZGVmYXVsdF9kZWFkX2lkbGUoKSAoZm9yCj4g
dGhlbSB0byB0aGVuIGVudGVyIGEgZGlmZmVyZW50IGRlYWQtaWRsZSByb3V0aW5lKSwgdGhlIGZ1
bmN0aW9uIHNob3VsZAo+IG5vdCBpdHNlbGYgbG9vcC4gTW92ZSB0aGUgbG9vcCBpbnRvIHBsYXlf
ZGVhZCgpLCBhbmQgdXNlIHBsYXlfZGVhZCgpIGFzCj4gd2VsbCBvbiB0aGUgQVAgYm9vdCBlcnJv
ciBwYXRoLgo+Cj4gRnVydGhlcm1vcmUsIG5vdCB0aGUgbGVhc3QgY29uc2lkZXJpbmcgdGhlIGNv
bW1lbnQgaW4gcGxheV9kZWFkKCksCj4gbWFrZSBzdXJlIE5NSSByYWlzZWQgKGZvciBub3cgdGhp
cyB3b3VsZCBiZSBhIGJ1ZyBlbHNld2hlcmUsIGJ1dCB0aGF0J3MKPiBhYm91dCB0byBjaGFuZ2Up
IGFnYWluc3QgYSBwYXJrZWQgb3IgZnVsbHkgb2ZmbGluZSBDUFUgd29uJ3QgaW52b2tlIHRoZQo+
IGFjdHVhbCwgZnVsbC1ibG93biBOTUkgaGFuZGxlci4KPgo+IE5vdGUgaG93ZXZlciB0aGF0IHRo
aXMgZG9lc24ndCBtYWtlICNNQyBhbnkgc2FmZXIgZm9yIGZ1bGx5IG9mZmxpbmUKPiBDUFVzLgo+
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
