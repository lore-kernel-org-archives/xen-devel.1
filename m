From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] xen/blkfront: correct purging of persistent
 grants
Date: Fri, 28 Sep 2018 09:41:10 -0600
Message-ID: <ccbfcbab-85d5-8ca2-8019-dd24b994f791__16909.2359058142$1538149199$gmane$org@kernel.dk>
References: <20180928072827.14229-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e+pc=mk=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
 id 1g5utK-0002uu-Pl
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 15:41:18 +0000
Received: by mail-pg1-x541.google.com with SMTP id f18-v6so1241807pgv.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Sep 2018 08:41:16 -0700 (PDT)
In-Reply-To: <20180928072827.14229-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, linux-block@vger.kernel.org
Cc: boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gOS8yOC8xOCAxOjI4IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IENvbW1pdCBhNDZiNTM2
NzJiMmMyZTM3NzBiMzhhNGFiZjkwZDE2MzY0ZDI1ODRiICgieGVuL2Jsa2Zyb250OiBjbGVhbnVw
Cj4gc3RhbGUgcGVyc2lzdGVudCBncmFudHMiKSBpbnRyb2R1Y2VkIGEgcmVncmVzc2lvbiBhcyBw
dXJnZWQgcGVyc2lzdGVudAo+IGdyYW50cyB3ZXJlIG5vdCBwdSBpbnRvIHRoZSBsaXN0IG9mIGZy
ZWUgZ3JhbnRzIGFnYWluLiBDb3JyZWN0IHRoYXQuCgpJJ2xsIGFwcGx5IHRoaXMgZm9yIDQuMTks
IGFuZCBpZiB0aGluZ3MgdW5leHBlY3RlZGx5IGRvbid0IHdvcmsgb3V0LAp3ZSBjYW4gYWx3YXlz
IHJldmVydCB0aGUgc2VyaWVzIG5leHQgd2Vlay4KCi0tIApKZW5zIEF4Ym9lCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
