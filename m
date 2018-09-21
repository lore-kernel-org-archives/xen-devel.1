From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl: keep assigned pci devices across
 domain reboots
Date: Fri, 21 Sep 2018 17:13:33 +0100
Message-ID: <20180921161333.45g267m263pon3o7@zion.uk.xensource.com>
References: <20180920104025.88948-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3O3l-0008Tn-5Z
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 16:13:37 +0000
Content-Disposition: inline
In-Reply-To: <20180920104025.88948-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andreas Kinzler <hfp@posteo.de>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMjAsIDIwMTggYXQgMTI6NDA6MjVQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEZpbGwgdGhlIGZyb21feGVuc3RvcmUgbGlieGxfZGV2aWNlX3R5cGUgaG9vayBm
b3IgUENJIGRldmljZXMgc28gdGhhdAo+IGxpYnhsX3JldHJpZXZlX2RvbWFpbl9jb25maWd1cmF0
aW9uIGNhbiBwcm9wZXJseSByZXRyaWV2ZSBQQ0kgZGV2aWNlcwo+IGZyb20geGVuc3RvcmUuCj4g
Cj4gVGhpcyBmaXhlcyBkaXNhcHBlYXJpbmcgcGNpIGRldmljZXMgYWNyb3NzIGRvbWFpbiByZWJv
b3RzLgo+IAo+IFJlcG9ydGVkLWJ5OiBBbmRyZWFzIEtpbnpsZXIgPGhmcEBwb3N0ZW8uZGU+Cj4g
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpB
Y2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
