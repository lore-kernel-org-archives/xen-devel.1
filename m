From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12] xen/arm: gic-v2: deactivate
 interrupts during initialization
Date: Thu, 7 Feb 2019 10:36:39 +0100
Message-ID: <3ff69d30-e909-5010-ad97-4cf499e5fa36@suse.com>
References: <1549402733-20441-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tb4s=QO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1grg6t-0007R8-KS
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 09:36:43 +0000
In-Reply-To: <1549402733-20441-1-git-send-email-sstabellini@kernel.org>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com, peng.fan@nxp.com
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDIvMjAxOSAyMjozOCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IEludGVycnVw
dHMgY291bGQgYmUgQUNUSVZFIGF0IGJvb3QuIE1ha2Ugc3VyZSB0byBkZWFjdGl2YXRlIHRoZW0g
ZHVyaW5nCj4gaW5pdGlhbGl6YXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
