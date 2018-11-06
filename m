From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 4/8] tools/libvchan: init_xs_srv: Simplify
 error handling (2)
Date: Tue, 6 Nov 2018 11:42:00 +0000
Message-ID: <23521.32264.655635.978393@mariner.uk.xensource.com>
References: <23516.33005.649128.145551@mariner.uk.xensource.com>
 <20181102170113.11646-1-ian.jackson@eu.citrix.com>
 <20181102170113.11646-5-ian.jackson@eu.citrix.com>
 <20181106094811.gcsqvjkhliis7a7l@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdlp=nr=citrix.com=prvs=841612198=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gJzkC-0003bP-Cf
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 11:42:04 +0000
In-Reply-To: <20181106094811.gcsqvjkhliis7a7l@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIDQvOF0gdG9vbHMvbGlidmNoYW46IGluaXRfeHNf
c3J2OiBTaW1wbGlmeSBlcnJvciBoYW5kbGluZyAoMikiKToKPiBPbiBGcmksIE5vdiAwMiwgMjAx
OCBhdCAwNTowMTowOVBNICswMDAwLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+ICogQWJvbGlzaCBm
YWlsX3hzX29wZW4gd2hpY2ggaXMgbm93IGV4YWN0bHkgdGhlIHNhbWUgYXMgZmFpbC4KPiA+ICog
Q2hhbmdlIGFsbCBnb3RvcyB0byByZWZlciB0byBmYWlsIGluc3RlYWQuCj4gPiBObyBmdW5jdGlv
bmFsIGNoYW5nZS4KPiAKPiBPaCAgaGVyZSBpdCBpcy4KClJpZ2h0IDotKS4gIFNlcGFyYXRpbmcg
dGhlIHBhdGNoZXMgbGlrZSB0aGlzIG1hZGUgdGhlIGZpcnN0IGhhbGYgYSBsb3QKY2xlYXJlciwg
SSBmb3VuZC4KCj4gRmVlbCBmcmVlIHRvIGFkZCBteSBhY2sgdG8geW91ciBwcmV2aW91cyBwYXRj
aC4KClRoYW5rcy4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
