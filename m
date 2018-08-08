From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/5] xen/blkback: don't keep persistent
 grants too long
Date: Wed, 8 Aug 2018 17:19:41 +0200
Message-ID: <20180808151941.cse6louxgeyguz45__38917.7370969721$1533741639$gmane$org@mac>
References: <20180808142528.31029-1-jgross@suse.com>
 <20180808142528.31029-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xhyf=kx=citrix.com=prvs=751fb83b8=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fnQHO-0005Ea-RB
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 15:21:42 +0000
Content-Disposition: inline
In-Reply-To: <20180808142528.31029-2-jgross@suse.com>
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

T24gV2VkLCBBdWcgMDgsIDIwMTggYXQgMDQ6MjU6MjRQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBQZXJzaXN0ZW50IGdyYW50cyBhcmUgYWxsb2NhdGVkIHVudGlsIGEgdGhyZXNob2xk
IHBlciByaW5nIGlzIGJlaW5nCj4gcmVhY2hlZC4gVGhvc2UgZ3JhbnRzIHdvbid0IGJlIGZyZWVk
IHVudGlsIHRoZSByaW5nIGlzIGJlaW5nIGRlc3Ryb3llZAo+IG1lYW5pbmcgdGhlcmUgd2lsbCBi
ZSByZXNvdXJjZXMga2VwdCBidXN5IHdoaWNoIG1pZ2h0IG5vIGxvbmdlciBiZQo+IHVzZWQuCj4g
Cj4gSW5zdGVhZCBvZiBmcmVlaW5nIG9ubHkgcGVyc2lzdGVudCBncmFudHMgdW50aWwgdGhlIHRo
cmVzaG9sZCBpcwo+IHJlYWNoZWQgYWRkIGEgdGltZXN0YW1wIGFuZCByZW1vdmUgYWxsIHBlcnNp
c3RlbnQgZ3JhbnRzIG5vdCBoYXZpbmcKPiBiZWVuIGluIHVzZSBmb3IgYSBtaW51dGUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
