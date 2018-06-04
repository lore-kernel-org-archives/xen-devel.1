From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 2/9] xen/grant-table: Make set/clear page
 private code shared
Date: Mon, 4 Jun 2018 11:43:16 -0400
Message-ID: <835e8070-39d4-67b4-689a-aab2979b0c70__10858.7291943424$1528126710$gmane$org@oracle.com>
References: <20180601114132.22596-1-andr2000@gmail.com>
 <20180601114132.22596-3-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=egk0=iw=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fPraF-0004wZ-CP
 for xen-devel@lists.xenproject.org; Mon, 04 Jun 2018 15:39:47 +0000
In-Reply-To: <20180601114132.22596-3-andr2000@gmail.com>
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

T24gMDYvMDEvMjAxOCAwNzo0MSBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgo+Cj4gTWFrZSBzZXQvY2xlYXIgcGFnZSBwcml2YXRlIGNvZGUgc2hhcmVkIGFuZCBh
Y2Nlc3NpYmxlIHRvCj4gb3RoZXIga2VybmVsIG1vZHVsZXMgd2hpY2ggY2FuIHJlLXVzZSB0aGVz
ZSBpbnN0ZWFkIG9mIG9wZW4tY29kaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgoKUmV2aWV3ZWQt
Ynk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
