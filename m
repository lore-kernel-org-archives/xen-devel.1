From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH v2 1/1] xen-netback: process malformed
 sk_buff correctly to avoid BUG_ON()
Date: Wed, 28 Mar 2018 21:03:40 -0700
Message-ID: <2c741a81-23b3-fa26-89b2-6c3d94b20b96__46018.2228162468$1522296155$gmane$org@gmail.com>
References: <1522295463-469-1-git-send-email-dongli.zhang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=d3ck=gt=gmail.com=eric.dumazet@srs-us1.protection.inumbo.net>)
 id 1f1Omv-00017Z-4N
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 04:03:45 +0000
Received: by mail-pf0-x242.google.com with SMTP id h69so2369221pfe.13
 for <xen-devel@lists.xenproject.org>; Wed, 28 Mar 2018 21:03:43 -0700 (PDT)
In-Reply-To: <1522295463-469-1-git-send-email-dongli.zhang@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org, paul.durrant@citrix.com, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8yOC8yMDE4IDA4OjUxIFBNLCBEb25nbGkgWmhhbmcgd3JvdGU6Cj4gVGhlICJCVUdf
T04oIWZyYWdfaXRlcikiIGluIGZ1bmN0aW9uIHhlbnZpZl9yeF9uZXh0X2NodW5rKCkgaXMgdHJp
Z2dlcmVkIGlmCj4gdGhlIHJlY2VpdmVkIHNrX2J1ZmYgaXMgbWFsZm9ybWVkLCB0aGF0IGlzLCB3
aGVuIHRoZSBza19idWZmIGhhcyBwYXR0ZXJuCj4gKHNrYi0+ZGF0YV9sZW4gJiYgIXNrYl9zaGlu
Zm8oc2tiKS0+bnJfZnJhZ3MpLiBCZWxvdyBpcyBhIHNhbXBsZSBjYWxsCj4gc3RhY2s6Cj4gCj4u
Li4KCgo+IAo+IFRoZSBpc3N1ZSBpcyBoaXQgYnkgeGVuLW5ldGJhY2sgd2hlbiB0aGVyZSBpcyBi
dWcgd2l0aCBvdGhlciBuZXR3b3JraW5nCj4gaW50ZXJmYWNlIChlLmcuLCBkb20wIHBoeXNpY2Fs
IE5JQyksIHdobyBoYXMgZ2VuZXJhdGVkIGFuZCBmb3J3YXJkZWQKPiBtYWxmb3JtZWQgc2tfYnVm
ZiB0byBkb20wIHZpZlguWS4gSXQgaXMgcG9zc2libGUgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZSBv
bgo+IHB1cnBvc2Ugd2l0aCBiZWxvdyBzYW1wbGUgY29kZSBpbiBhIGtlcm5lbCBtb2R1bGU6Cj4g
Cj4gc2tiLT5kZXYgPSBkZXY7IC8vIGRldiBvZiB2aWZYLlkKPiBza2ItPmxlbiA9IDM4NjsKPiBz
a2ItPmRhdGFfbGVuID0gMzUyOwo+IHNrYi0+dGFpbCA9IDk4Owo+IHNrYi0+ZW5kID0gMzg0Owo+
IHNrYl9zaGluZm8oc2tiKS0+bnJfZnJhZ3MgPSAwOwo+IGRldi0+bmV0ZGV2X29wcy0+bmRvX3N0
YXJ0X3htaXQoc2tiLCBkZXYpOwo+CgpUaGlzIHdvdWxkIGJlIGEgc2VyaW91cyBidWcgaW4gdGhl
IHByb3ZpZGVyIG9mIHN1Y2ggc2tiLgoKQXJlIHlvdSBzdXJlIHlvdSBkbyBub3QgaGF2ZSBpbnN0
ZWFkIGFuIHNrYiB3aXRoIGEgY2hhaW4gb2Ygc2ticyA/Cgooc2tiX3NoaW5mbyhza2IpLT5mcmFn
X2xpc3Qgd291bGQgYmUgbm90IE5VTEwpCgpNYXliZSB5b3VyIGRyaXZlciBpcyB3cm9uZ2x5IGFk
dmVydGlzaW5nIE5FVElGX0ZfRlJBR0xJU1QKCmNvbW1pdCAyMTY3Y2EwMjljMjQ0OTAxODMxIHdv
dWxkIGJlIHRoZSBidWcgb3JpZ2luIHRoZW4uLi4KCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
