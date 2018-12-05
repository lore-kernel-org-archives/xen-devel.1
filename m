From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/4] amd-iommu: add flush iommu_ops
Date: Wed, 05 Dec 2018 06:47:14 -0700
Message-ID: <5C07D6E20200007800203222@prv1-mh.provo.novell.com>
References: <20181205112924.36470-1-paul.durrant@citrix.com>
 <20181205112924.36470-2-paul.durrant@citrix.com>
 <5C07BA8A0200007800203169@prv1-mh.provo.novell.com>
 <06f4edfeb8824993bc0cc59e56eebc12@AMSPEX02CL03.citrite.net>
 <f9c9a57e24794d2da1fd4ca58087279f@AMSPEX02CL03.citrite.net>
 <5C07CEF702000078002031F1@prv1-mh.provo.novell.com>
 <3f4eb471513c4a0cb2547b8d63417706@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=winm=oo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUXWJ-0007EX-LX
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 13:47:19 +0000
In-Reply-To: <3f4eb471513c4a0cb2547b8d63417706@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEyLjE4IGF0IDE0OjE1LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEFoIG9rLi4uIG5vLCBJIGdvdCB3aGF0IHlvdSBtZWFudCBhbmQganVzdCBjb21wbGV0ZWx5
IHR5cG8tZWQgaXQuIEknbGwgc2VuZCAKPiB2NCB1bmxlc3MgeW91J3JlIGhhcHB5IHRvIGZpeCBv
biBjb21taXQuCgpJJ20gZmluZSBhZGp1c3RpbmcgdGhpcyB3aGlsZSBjb21taXR0aW5nOyBJIGhv
cGUgSSB3b24ndCBvdmVybG9vayB0aGUgbm90ZQpJJ3ZlIHRha2VuIG9uY2UgSSBnZXQgdGhlcmUu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
