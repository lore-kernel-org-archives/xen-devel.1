From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/x86: fix paging_max_paddr_bits()
Date: Wed, 28 Nov 2018 05:55:34 -0700
Message-ID: <5BFE90460200007800200BBE@prv1-mh.provo.novell.com>
References: <20181128075224.30765-1-jgross@suse.com>
 <20181128084120.sznv4wwpca6uzbtr@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fbbp=oh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRzPP-0000fJ-0j
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 12:57:39 +0000
In-Reply-To: <20181128084120.sznv4wwpca6uzbtr@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjExLjE4IGF0IDA5OjQxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgTm92IDI4LCAyMDE4IGF0IDA4OjUyOjI0QU0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mg
d3JvdGU6Cj4+IHBhZ2luZ19tYXhfcGFkZHJfYml0cygpIGhhcyBhbiBpbnZhbGlkIHVzZSBvZiBJ
U19FTkFCTEVEKCk6IGluc3RlYWQgb2YKPj4gSVNfRU5BQkxFRChDT05GSUdfQklHTUVNKSBpdCBp
cyB1c2luZyBJU19FTkFCTEVEKEJJR01FTSkuIEZpeCB0aGF0Lgo+PiAKPj4gU2lnbmVkLW9mZi1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tbz4KPiAKPiBSZXZpZXdlZC1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
