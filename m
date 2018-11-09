From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/traps: use only one stub function
 for l/cstar
Date: Fri, 09 Nov 2018 03:54:36 -0700
Message-ID: <5BE5676C02000078001FA1BA@prv1-mh.provo.novell.com>
References: <20181109104636.1771-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mulf=nu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gL4Qw-0007hn-Ub
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 10:54:38 +0000
In-Reply-To: <20181109104636.1771-1-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjExLjE4IGF0IDExOjQ2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
QW5kIHBsYWNlIGl0IGludG8gLnRleHQuY29sZC4KPiAKPiBSZXF1ZXN0ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KClRoYW5rcyBmb3IgZG9pbmcgdGhpcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
