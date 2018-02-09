From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/3] libxc: xc_dom_parse_elf_kernel: Return
 error for invalid kernel images
Date: Fri, 9 Feb 2018 12:19:05 +0000
Message-ID: <20180209121905.75dvmi2gpzw444t7@MacBook-Pro-de-Roger.local>
References: <20180208214910.10699-1-simon@invisiblethingslab.com>
 <20180208214910.10699-4-simon@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qs32=fd=citrix.com=prvs=5717decf0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ek7eB-0003Au-TA
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 12:19:19 +0000
Content-Disposition: inline
In-Reply-To: <20180208214910.10699-4-simon@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMDgsIDIwMTggYXQgMTA6NDk6MTBQTSArMDEwMCwgU2ltb24gR2Fpc2VyIHdy
b3RlOgo+IENvbW1pdCA5NmVkYjExMWRkICgibGlieGM6IHBhbmljIHdoZW4gdHJ5aW5nIHRvIGNy
ZWF0ZSBhIFBWSCBndWVzdAo+IHdpdGhvdXQga2VybmVsIHN1cHBvcnQiKSBhbHJlYWR5IGltcHJv
dmVkIHRoZSBoYW5kbGluZyBvZiBub24gUFZICj4gY2FwYWJsZSBrZXJuZWxzLiBCdXQgeGNfZG9t
X3BhcnNlX2VsZl9rZXJuZWwoKSBzdGlsbCByZXR1cm5lZCBzdWNjZXNzIG9uCj4gaW52YWxpZCBl
bGYgaW1hZ2VzIGFuZCB0aGUgZG9tYWluIGJ1aWxkIG9ubHkgZmFpbGVkIGxhdGVyLiBOb3cgdGhl
IGJ1aWxkCj4gcHJvY2VzcyB3aWxsIGZhaWwgaW1tZWRpYXRlbHkgb24gZGV0ZWN0aW5nIHRoZSBl
cnJvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBHYWlzZXIgPHNpbW9uQGludmlzaWJsZXRo
aW5nc2xhYi5jb20+CgpMR1RNOgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgoKSSdtIG5vdCBzdXJlIGFib3V0IHRoZSBwb2ludCBvZiByZXR1cm5p
bmcgInhlbi0zLjAtdW5rbm93biIgaW4KeGNfZG9tX2d1ZXN0X3R5cGUgaW4gdGhlIGZpcnN0IHBs
YWNlLCBidXQgbWF5YmUgSSdtIG1pc3Npbmcgc29tZXRoaW5nLgpXaGVuIHBhcnNpbmcgdGhlIGtl
cm5lbCB0aGVyZSdzIG5vIGZhbGxpbmcgYmFjayB0byBvdGhlciBsb2FkZXJzLgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
