From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 1/2] xen/blkback: add stack variable
 'blkif' in connect_ring()
Date: Mon, 7 Jan 2019 12:53:25 +0100
Message-ID: <20190107115325.nlw6irg4jgcjx6t2__28557.5672089637$1546861948$gmane$org@mac>
References: <1546839359-5478-1-git-send-email-dongli.zhang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D5so=PP=citrix.com=prvs=9034de270=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ggTTO-0003aJ-Vk
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 11:53:39 +0000
Content-Disposition: inline
In-Reply-To: <1546839359-5478-1-git-send-email-dongli.zhang@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: axboe@kernel.dk, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, Paul.Durrant@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMDcsIDIwMTkgYXQgMDE6MzU6NThQTSArMDgwMCwgRG9uZ2xpIFpoYW5nIHdy
b3RlOgo+IEFzICdiZS0+YmxraWYnIGlzIHVzZWQgZm9yIG1hbnkgdGltZXMgaW4gY29ubmVjdF9y
aW5nKCksIHRoZSBzdGFjayB2YXJpYWJsZQo+ICdibGtpZicgaXMgYWRkZWQgdG8gc3Vic3RpdHV0
ZSAnYmUtYmxraWYnLgo+IAo+IFN1Z2dlc3RlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEb25nbGkgWmhhbmcgPGRvbmdsaS56aGFu
Z0BvcmFjbGUuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
