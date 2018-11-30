From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH] x86/shadow: don't enable shadow mode with
 too small a shadow allocation
Date: Fri, 30 Nov 2018 10:27:50 +0000
Message-ID: <20181130102750.GB96875@deinos.phlegethon.org>
References: <5BFFFD58020000780020141D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gtv1=oj=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1gSg1b-0008QN-Ki
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 10:27:55 +0000
Content-Disposition: inline
In-Reply-To: <5BFFFD58020000780020141D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXQgMDc6NTMgLTA3MDAgb24gMjkgTm92ICgxNTQzNDc3OTkyKSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gV2UndmUgaGFkIG1vcmUgdGhhbiBvbmUgcmVwb3J0IG9mIGhvc3QgY3Jhc2hlcyBhZnRlciBm
YWlsZWQgbWlncmF0aW9uLAo+IGFuZCBpbiBhdCBsZWFzdCBvbmUgY2FzZSB3ZSd2ZSBoYWQgYSBo
aW50IHRvd2FyZHMgYSB0b28gZmFyIHNocnVuawo+IHNoYWRvdyBhbGxvY2F0aW9uIHBvb2wuIElu
c3RlYWQgb2YganVzdCBjaGVja2luZyB0aGUgcG9vbCBmb3IgYmVpbmcKPiBlbXB0eSwgY2hlY2sg
d2hldGhlciB0aGUgcG9vbCBpcyBzbWFsbGVyIHRoYW4gd2hhdAo+IHNoYWRvd19zZXRfYWxsb2Nh
dGlvbigpIHdvdWxkIG1pbmltYWxseSBidW1wIGl0IHRvIGlmIGl0IHdhcyBpbnZva2VkIGluCj4g
dGhlIGZpcnN0IHBsYWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KClRoYW5rcywK
ClRpbS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
