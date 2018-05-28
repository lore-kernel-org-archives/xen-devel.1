From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining
 in general)
Date: Mon, 28 May 2018 06:26:54 +0200
Message-ID: <458022ea-4a28-69c4-aabd-fec2cbffb50d@suse.com>
References: <5B06C0F902000078001C5925@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jm/y=ip=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fNKT7-00070A-Er
 for xen-devel@lists.xenproject.org; Mon, 28 May 2018 15:53:57 +0000
In-Reply-To: <5B06C0F902000078001C5925@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Simon Gaiser <simon@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDUvMTggMTU6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEluIGNvbW1pdCBkMWQ2ZmM5
N2Q2ICgieDg2L3hwdGk6IHJlYWxseSBoaWRlIGFsbW9zdCBhbGwgb2YgWGVuIGltYWdlIikKPiBJ
J3ZlIGZhaWxlZCB0byByZW1lbWJlciB0aGUgZmFjdCB0aGF0IG11bHRpcGxlIENQVXMgc2hhcmUg
YSBzdHViCj4gbWFwcGluZyBwYWdlLiBUaGVyZWZvcmUgaXQgaXMgd3JvbmcgdG8gdW5jb25kaXRp
b25hbGx5IHphcCB0aGUgbWFwcGluZwo+IHdoZW4gYnJpbmdpbmcgZG93biBhIENQVTsgaXQgbWF5
IG9ubHkgYmUgdW5tYXBwZWQgd2hlbiBubyBvdGhlciBvbmxpbmUKPiBDUFUgdXNlcyB0aGF0IHNh
bWUgcGFnZS4KPiAKPiBSZXBvcnRlZC1ieTogU2ltb24gR2Fpc2VyIDxzaW1vbkBpbnZpc2libGV0
aGluZ3NsYWIuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
CgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
