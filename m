From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen-blkfront: switch kcalloc to kvcalloc
 for large array allocation
Date: Fri, 31 May 2019 16:41:16 +0200
Message-ID: <ba37b50c-c0ac-5af4-441b-a2d4eda81255__34826.5765280061$1559313739$gmane$org@suse.com>
References: <20190503150401.15904-1-roger.pau@citrix.com>
 <f4b944e8-6678-a921-e2b2-aaeb00c0d5e1@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hWiie-000843-UC
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 14:41:20 +0000
In-Reply-To: <f4b944e8-6678-a921-e2b2-aaeb00c0d5e1@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, stable@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDUvMjAxOSAxMDoxMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwMy8wNS8yMDE5
IDE3OjA0LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+IFRoZXJlJ3Mgbm8gcmVhc29uIHRvIHJl
cXVlc3QgcGh5c2ljYWxseSBjb250aWd1b3VzIG1lbW9yeSBmb3IgdGhvc2UKPj4gYWxsb2NhdGlv
bnMuCj4+Cj4+IFJlcG9ydGVkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNv
bT4KPj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCkpl
bnMsIGFyZSB5b3UgZ29pbmcgdG8gdGthZSB0aGlzIHBhdGNoIG9yIHNob3VsZCBJIGNhcnJ5IGl0
IHRocm91Z2ggdGhlClhlbiB0cmVlPwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
