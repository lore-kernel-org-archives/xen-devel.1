From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] xen/netfront: remove unnecessary wmb
Date: Fri, 09 Nov 2018 15:17:09 -0800 (PST)
Message-ID: <20181109.151709.1128248834308208677.davem__42758.7017570206$1541805353$gmane$org@davemloft.net>
References: <20181109065359.14900-1-jian.w.wen@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=id+r=nu=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1gLG1Y-0002da-3F
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 23:17:12 +0000
In-Reply-To: <20181109065359.14900-1-jian.w.wen@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jian.w.wen@oracle.com
Cc: jgross@suse.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSmFjb2IgV2VuIDxqaWFuLncud2VuQG9yYWNsZS5jb20+CkRhdGU6IEZyaSwgIDkgTm92
IDIwMTggMTQ6NTM6NTkgKzA4MDAKCj4gUklOR19QVVNIX1JFUVVFU1RTX0FORF9DSEVDS19OT1RJ
RlkgaXMgYWxyZWFkeSBhYmxlIHRvIG1ha2Ugc3VyZSBiYWNrZW5kIHNlZXMKPiByZXF1ZXN0cyBi
ZWZvcmUgcmVxX3Byb2QgaXMgdXBkYXRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWNvYiBXZW4g
PGppYW4udy53ZW5Ab3JhY2xlLmNvbT4KCkFwcGxpZWQgdG8gbmV0LW5leHQuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
