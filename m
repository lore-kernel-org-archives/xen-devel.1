From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] drm/xen-front: fix pointer casts
Date: Wed, 23 May 2018 13:46:41 +0200
Message-ID: <b516542b-a0f5-cbce-d351-25b88a7f3288__35799.60111897$1527075939$gmane$org@suse.com>
References: <20180523113630.29811-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xj/t=ik=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fLSE9-0002yu-HE
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 11:46:45 +0000
In-Reply-To: <20180523113630.29811-1-andr2000@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel.vetter@intel.com, boris.ostrovsky@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDUvMTggMTM6MzYsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+IEZyb206
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNv
bT4KPiAKPiBCdWlsZGluZyBmb3IgYSAzMi1iaXQgdGFyZ2V0IHJlc3VsdHMgaW4gd2FybmluZ3Mg
ZnJvbSBjYXN0aW5nCj4gYmV0d2VlbiBhIDMyLWJpdCBwb2ludGVyIGFuZCBhIDY0LWJpdCBpbnRl
Z2VyLiBGaXggdGhlIHdhcm5pbmdzCj4gYnkgY2FzdGluZyB0aG9zZSBwb2ludGVycyB0byB1aW50
cHRyX3QgZmlyc3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
PG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
