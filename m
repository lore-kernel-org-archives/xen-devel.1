From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/8] xen/grant-table: Make set/clear page
 private code shared
Date: Tue, 29 May 2018 13:39:35 -0400
Message-ID: <19b1ba80-b2e2-d292-ab55-6186e9da5fe3__16904.9253142022$1527615809$gmane$org@oracle.com>
References: <20180525153331.31188-1-andr2000@gmail.com>
 <20180525153331.31188-2-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4xbq=iq=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fNife-0003i5-H5
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 17:44:30 +0000
In-Reply-To: <20180525153331.31188-2-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMjUvMjAxOCAxMTozMyBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgo+Cj4gTWFrZSBzZXQvY2xlYXIgcGFnZSBwcml2YXRlIGNvZGUgc2hhcmVkIGFuZCBh
Y2Nlc3NpYmxlIHRvCj4gb3RoZXIga2VybmVsIG1vZHVsZXMgd2hpY2ggY2FuIHJlLXVzZSB0aGVz
ZSBpbnN0ZWFkIG9mIG9wZW4tY29kaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgoKUmV2aWV3ZWQt
Ynk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
