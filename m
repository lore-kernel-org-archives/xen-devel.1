From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen-netback: fix occasional leak of grant
 ref mappings under memory pressure
Date: Thu, 28 Feb 2019 12:37:48 +0000
Message-ID: <20190228123748.5nabuvg44sjiecdz__47021.072967776$1551357536$gmane$org@zion.uk.xensource.com>
References: <1551319382-32595-1-git-send-email-igor.druzhinin@citrix.com>
 <8424fba34a1f43908a6dae3a9308863b@AMSPEX02CL02.citrite.net>
 <20190228110136.somjads2f5ivqhju@zion.uk.xensource.com>
 <e5ef3c0291854b67841b6c532f7651b9@AMSPEX02CL02.citrite.net>
 <0aa1850892c94d6ba7543bf322734614@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0So3=RD=citrix.com=prvs=955226cfb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gzKwo-0007Y8-Qm
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 12:37:58 +0000
Content-Disposition: inline
In-Reply-To: <0aa1850892c94d6ba7543bf322734614@AMSPEX02CL02.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "davem@davemloft.net" <davem@davemloft.net>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMjgsIDIwMTkgYXQgMTI6MDc6MDdQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFllcywgSSBtZWFudCBrZnJlZV9za2IobnNrYikuCj4gCgpJbiB0aGF0IGNhc2UgSSB0
aGluayB5b3VyIHBhdGNoIGxvb2tzIGZpbmUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
