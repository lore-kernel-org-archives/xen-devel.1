From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH net-next] xen-netfront: mark expected switch
 fall-through
Date: Wed, 24 Apr 2019 14:49:19 -0400
Message-ID: <6fd7d2b3-5a02-12cb-bf0e-c35ae535a90d__11166.9536492386$1556131866$gmane$org@oracle.com>
References: <20190415211141.GA1732@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E0+D=S2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hJMy9-0000x8-GK
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 18:50:09 +0000
In-Reply-To: <20190415211141.GA1732@embeddedor>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "David S. Miller" <davem@davemloft.net>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gNC8xNS8xOSA1OjExIFBNLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+IEluIHByZXBh
cmF0aW9uIHRvIGVuYWJsaW5nIC1XaW1wbGljaXQtZmFsbHRocm91Z2gsIG1hcmsgc3dpdGNoCj4g
Y2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCj4KPiBUaGlzIHBh
dGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKPgo+IGRyaXZlcnMvbmV0L3hlbi1uZXRm
cm9udC5jOiBJbiBmdW5jdGlvbiDigJhuZXRiYWNrX2NoYW5nZWTigJk6Cj4gZHJpdmVycy9uZXQv
eGVuLW5ldGZyb250LmM6MjAzODo2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0
aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPiAgICBpZiAoZGV2LT5zdGF0ZSA9PSBY
ZW5idXNTdGF0ZUNsb3NlZCkKPiAgICAgICBeCj4gZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmM6
MjA0MToyOiBub3RlOiBoZXJlCj4gICBjYXNlIFhlbmJ1c1N0YXRlQ2xvc2luZzoKPiAgIF5+fn4K
Pgo+IFdhcm5pbmcgbGV2ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0zCj4K
PiBOb3RpY2UgdGhhdCwgaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIHRoZSBjb2RlIGNvbW1lbnQg
aXMgbW9kaWZpZWQKPiBpbiBhY2NvcmRhbmNlIHdpdGggd2hhdCBHQ0MgaXMgZXhwZWN0aW5nIHRv
IGZpbmQuCj4KPiBUaGlzIHBhdGNoIGlzIHBhcnQgb2YgdGhlIG9uZ29pbmcgZWZmb3J0cyB0byBl
bmFibGUKPiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLgo+Cj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2
byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KCkFwcGxpZWQgdG8gZm9yLWxp
bnVzLTUuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
