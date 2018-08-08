From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 4/5] xen/blkback: move persistent grants
 flags to bool
Date: Wed, 8 Aug 2018 17:35:28 +0200
Message-ID: <20180808153528.kbpauyeq6qgey5vh__2247.04404031417$1533742479$gmane$org@mac>
References: <20180808142528.31029-1-jgross@suse.com>
 <20180808142528.31029-5-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xhyf=kx=citrix.com=prvs=751fb83b8=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fnQV0-0006CG-Na
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 15:35:46 +0000
Content-Disposition: inline
In-Reply-To: <20180808142528.31029-5-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, axboe@kernel.dk, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMDgsIDIwMTggYXQgMDQ6MjU6MjdQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBUaGUgc3RydWN0IHBlcnNpc3RlbnRfZ250IGZsYWdzIG1lbWJlciBpcyBtZWFudCB0
byBiZSBhIGJpdGZpZWxkIG9mCj4gZGlmZmVyZW50IGZsYWdzLiBUaGVyZSBpcyBvbmx5IFBFUlNJ
U1RFTlRfR05UX0FDVElWRSBmbGFnIGxlZnQsIHNvCj4gY29udmVydCBpdCB0byBhIGJvb2wgbmFt
ZWQgImFjdGl2ZSIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXJyaXgu
Y29tPgoKVGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
