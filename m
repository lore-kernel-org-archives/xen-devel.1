From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] xen-netback: remove redundant assignment to
 err
Date: Fri, 31 May 2019 14:37:11 -0700 (PDT)
Message-ID: <20190531.143711.1406359688787927167.davem__47377.0042693772$1559338684$gmane$org@davemloft.net>
References: <20190530190438.9571-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SPb=T7=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1hWpD9-0001Mz-BU
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 21:37:15 +0000
In-Reply-To: <20190530190438.9571-1-colin.king@canonical.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: colin.king@canonical.com
Cc: wei.liu2@citrix.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, paul.durrant@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQ29saW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgpEYXRlOiBUaHUsIDMw
IE1heSAyMDE5IDIwOjA0OjM4ICswMTAwCgo+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5r
aW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gVGhlIHZhcmlhYmxlIGVyciBpcyBhc3NpZ25lZCB3aXRo
IHRoZSB2YWx1ZSAtRU5PTUVNIHRoYXQgaXMgbmV2ZXIKPiByZWFkIGFuZCBpdCBpcyByZS1hc3Np
Z25lZCBhIG5ldyB2YWx1ZSBsYXRlciBvbi4gIFRoZSBhc3NpZ25tZW50IGlzCj4gcmVkdW5kYW50
IGFuZCBjYW4gYmUgcmVtb3ZlZC4KPiAKPiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiVW51c2VkIHZh
bHVlIikKPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmlj
YWwuY29tPgoKQXBwbGllZCB0byBuZXQtbmV4dC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
