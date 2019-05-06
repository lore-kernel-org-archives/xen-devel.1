From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen-blkfront: switch kcalloc to kvcalloc
 for large array allocation
Date: Mon, 6 May 2019 10:11:20 +0200
Message-ID: <f4b944e8-6678-a921-e2b2-aaeb00c0d5e1__32420.9161962912$1557130355$gmane$org@suse.com>
References: <20190503150401.15904-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNYid-0006md-Qu
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:11:27 +0000
In-Reply-To: <20190503150401.15904-1-roger.pau@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, stable@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDUvMjAxOSAxNzowNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZXJlJ3Mgbm8g
cmVhc29uIHRvIHJlcXVlc3QgcGh5c2ljYWxseSBjb250aWd1b3VzIG1lbW9yeSBmb3IgdGhvc2UK
PiBhbGxvY2F0aW9ucy4KPiAKPiBSZXBvcnRlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
