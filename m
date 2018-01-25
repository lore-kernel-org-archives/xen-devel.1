From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH] xen: fix xsm build
Date: Thu, 25 Jan 2018 15:10:05 +0000
Message-ID: <23145.62285.716677.164748@mariner.uk.xensource.com>
References: <20180125131424.8779-1-wei.liu2@citrix.com>
 <20180125135021.pa6lmcnud2tnkqjp@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lbwo=eu=citrix.com=prvs=556d2b7b5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1eejAe-0001IF-3W
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2018 15:10:32 +0000
In-Reply-To: <20180125135021.pa6lmcnud2tnkqjp@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

Um9nZXIgUGF1IE1vbm7DqSB3cml0ZXMgKCJSZTogW1BBVENIXSB4ZW46IGZpeCB4c20gYnVpbGQi
KToKPiBPbiBUaHUsIEphbiAyNSwgMjAxOCBhdCAwMToxNDoyNFBNICswMDAwLCBXZWkgTGl1IHdy
b3RlOgo+ID4gQ29tbWl0IGU4ZDQ2MTQ5N2Q5IHJlbmFtZWQgZ2Nvdl9vcCB0byBjb3ZlcmFnZV9v
cCBidXQgZm9yZ290IHRvIGNoYW5nZQo+ID4gWFNNIGhhbmRsZXMuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKQWNrZWQtYnk6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKKGluIGNhc2UgeW91IGZlZWwgaXQncyBu
ZWVkZWQpCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
