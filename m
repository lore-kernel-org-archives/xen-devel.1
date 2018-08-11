From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] xen/netfront: don't cache skb_shinfo()
Date: Sat, 11 Aug 2018 09:42:34 -0700 (PDT)
Message-ID: <20180811.094234.2055249336558539084.davem__24894.2442042337$1534005700$gmane$org@davemloft.net>
References: <20180809144216.18856-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jvwx=k2=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1foWyL-00035E-LL
 for xen-devel@lists.xenproject.org; Sat, 11 Aug 2018 16:42:37 +0000
In-Reply-To: <20180809144216.18856-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jgross@suse.com
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpEYXRlOiBUaHUsICA5IEF1ZyAy
MDE4IDE2OjQyOjE2ICswMjAwCgo+IHNrYl9zaGluZm8oKSBjYW4gY2hhbmdlIHdoZW4gY2FsbGlu
ZyBfX3Bza2JfcHVsbF90YWlsKCk6IERvbid0IGNhY2hlCj4gaXRzIHJldHVybiB2YWx1ZS4KPiAK
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KCkFwcGxpZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
