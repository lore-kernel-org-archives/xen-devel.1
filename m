From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] xen-blkfront: switch kcalloc to kvcalloc
 for large array allocation
Date: Fri, 31 May 2019 10:44:39 -0400
Message-ID: <63D28830-5450-41F5-AC6E-3D5FDE1F80B7__41262.6963037596$1559313951$gmane$org@oracle.com>
References: <20190503150401.15904-1-roger.pau@citrix.com>
 <f4b944e8-6678-a921-e2b2-aaeb00c0d5e1@suse.com>
 <ba37b50c-c0ac-5af4-441b-a2d4eda81255@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/r8X=T7=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1hWim6-0008Du-NR
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 14:44:54 +0000
In-Reply-To: <ba37b50c-c0ac-5af4-441b-a2d4eda81255@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gTWF5IDMxLCAyMDE5IDEwOjQxOjE2IEFNIEVEVCwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPiB3cm90ZToKPk9uIDA2LzA1LzIwMTkgMTA6MTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
Cj4+IE9uIDAzLzA1LzIwMTkgMTc6MDQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IFRoZXJl
J3Mgbm8gcmVhc29uIHRvIHJlcXVlc3QgcGh5c2ljYWxseSBjb250aWd1b3VzIG1lbW9yeSBmb3Ig
dGhvc2UKPj4+IGFsbG9jYXRpb25zLgo+Pj4KPj4+IFJlcG9ydGVkLWJ5OiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AY2l0cml4LmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiAKPj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KPgo+SmVucywgYXJlIHlvdSBnb2luZyB0byB0a2FlIHRoaXMg
cGF0Y2ggb3Igc2hvdWxkIEkgY2FycnkgaXQgdGhyb3VnaCB0aGUKPlhlbiB0cmVlPwoKVXN1YWxs
eSBJIGVuZGVkIHVwIHBpY2tpbmcgdGhlbSAoYW5kIHRoZW4gYXNraW5nIEplbnMgdG8gZ2l0IHB1
bGwgaW50byBoaXMgYnJhbmNoKSBidXQgaWYgeW91IHdhbnQgdG8gaGFuZGxlIHRoZW0gdGhhdCB3
b3VsZCBiZSBtdWNoIGVhc2llciEKCihBbmQgaWYgc28sIHBsZWFzZSBhZGQgQWNrZWQtYnkgb24g
dGhlbSBmcm9tIG1lKS4KPgo+Cj5KdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
