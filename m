From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 11/15] libxl_dm: Pre-open QMP socket for
 QEMU
Date: Mon, 12 Nov 2018 14:52:56 +0000
Message-ID: <20181112145256.GF1302@perard.uk.xensource.com>
References: <20180907151104.32306-1-anthony.perard@citrix.com>
 <20180907151104.32306-12-anthony.perard@citrix.com>
 <23493.61815.315512.256184@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rjzm=nx=citrix.com=prvs=8477fb41c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gMDaG-0004Ai-AJ
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 14:53:00 +0000
Content-Disposition: inline
In-Reply-To: <23493.61815.315512.256184@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMTYsIDIwMTggYXQgMDM6MTE6MDNQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY1IDExLzE1XSBsaWJ4bF9kbTog
UHJlLW9wZW4gUU1QIHNvY2tldCBmb3IgUUVNVSIpOgo+ID4gICAgICByZXQgPSBsaWJ4bF9fYnVp
bGRfZGV2aWNlX21vZGVsX2FyZ3MoZ2MsICJzdHViZG9tLWRtIiwgZ3Vlc3RfZG9taWQsCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBndWVzdF9jb25maWcsICZh
cmdzLCBOVUxMLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZF9zdGF0ZSwgTlVMTCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBkX3N0YXRlLCBOVUxMLCBOVUxMKTsKPiAKPiBEaWQgeW91IGNvbnNpZGVyIGFkZGluZyBk
bV9tb25pdG9yX2ZkIHRvIGRfc3RhdGUgPwoKTm8sIEkgZGlkbid0LCBJJ20gbm90IHN1ciB3aGF0
IGNhbiBnbyBpbnRvIGRfc3RhdGUuIEJ1dCB0aGF0IHNlZW1zCmJldHRlciB0aGF0IGFkZGluZyBh
biBhcmd1bWVudCB0byBtYW55IGZ1bmN0aW9uIHByb3RvdHlwZXMuCgpPbiB0aGUgb3RoZXIgaGFu
ZCwgSSB3b3VsZCBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IGRtX21vbml0b3JfZmQgaGF2ZSBhCnBy
b3BlciBpbml0aWFsIHZhbHVlICgtMSkgd2hlbiBuZWVkZWQuCgotLSAKQW50aG9ueSBQRVJBUkQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
