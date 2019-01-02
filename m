From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 3/4] x86/e820: assume memmap provided
 when booted virtualized is correct
Date: Wed, 2 Jan 2019 12:44:36 +0000
Message-ID: <20190102124436.b4zgzdbyv5i3q35r@zion.uk.xensource.com>
References: <20181228120404.50346-1-roger.pau@citrix.com>
 <20181228120404.50346-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KZoQ=PK=citrix.com=prvs=89816f56d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1geftF-0000dm-HS
 for xen-devel@lists.xenproject.org; Wed, 02 Jan 2019 12:44:53 +0000
Content-Disposition: inline
In-Reply-To: <20181228120404.50346-4-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@cirix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMjgsIDIwMTggYXQgMDE6MDQ6MDNQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoaXMgaW1wbGllcyB0aGVyZSdzIG5vIG5lZWQgdG8gZm9yY2VmdWxseSByZXNl
cnZlIHRoZSBWR0EgTU1JTwo+IHJlZ2lvbiwgc2luY2UgdGhlIG1lbW9yeSBtYXAgcHJvdmlkZWQg
d2lsbCBiZSBjb3JyZWN0Lgo+IAo+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXJpeC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
