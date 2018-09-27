From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/blkfront: When purging persistent
 grants, keep them in the buffer
Date: Thu, 27 Sep 2018 09:12:56 +0200
Message-ID: <28aa9249-7406-21c6-f509-65411828e2d7__21079.3007900522$1538032300$gmane$org@suse.com>
References: <20180922195549.27953-1-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ndfh=mj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g5QTq-0000qw-R5
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 07:12:58 +0000
In-Reply-To: <20180922195549.27953-1-boris.ostrovsky@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, konrad.wilk@oracle.com, roger.pau@citrix.com, axboe@kernel.dk
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDkvMTggMjE6NTUsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBDb21taXQgYTQ2YjUz
NjcyYjJjICgieGVuL2Jsa2Zyb250OiBjbGVhbnVwIHN0YWxlIHBlcnNpc3RlbnQgZ3JhbnRzIikK
PiBhZGRlZCBzdXBwb3J0IGZvciBwdXJnaW5nIHBlcnNpc3RlbnQgZ3JhbnRzIHdoZW4gdGhleSBh
cmUgbm90IGluIHVzZS4gQXMKPiBwYXJ0IG9mIHRoZSBwdXJnZSwgdGhlIGdyYW50cyB3ZXJlIHJl
bW92ZWQgZnJvbSB0aGUgZ3JhbnQgYnVmZmVyLCBUaGlzCj4gZXZlbnR1YWxseSBjYXVzZXMgdGhl
IGJ1ZmZlciB0byBiZWNvbWUgZW1wdHksIHdpdGggQlVHX09OIHRyaWdnZXJlZCBpbgo+IGdldF9m
cmVlX2dyYW50KCkuIFRoaXMgY2FuIGJlIG9ic2VydmVkIGV2ZW4gb24gYW4gaWRsZSBzeXN0ZW0s
IHdpdGhpbgo+IDIwLTMwIG1pbnV0ZXMuCj4gCj4gV2Ugc2hvdWxkIGtlZXAgdGhlIGdyYW50cyBp
biB0aGUgYnVmZmVyIHdoZW4gcHVyZ2luZywgYW5kIG9ubHkgZnJlZSB0aGUKPiBncmFudCByZWYu
Cj4gCj4gRml4ZXM6IGE0NmI1MzY3MmIyYyAoInhlbi9ibGtmcm9udDogY2xlYW51cCBzdGFsZSBw
ZXJzaXN0ZW50IGdyYW50cyIpCj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jp
cy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
