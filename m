From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libgnttab: Add support for Linux dma-buf
Date: Wed, 25 Jul 2018 10:39:22 +0100
Message-ID: <20180725093921.22ncfttvjfiu4bkl@citrix.com>
References: <20180723122725.5476-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m8ai=kj=citrix.com=prvs=737e41906=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiGGU-0003QJ-3b
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 09:39:26 +0000
Content-Disposition: inline
In-Reply-To: <20180723122725.5476-1-andr2000@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: jgross@suse.com, wei.liu2@citrix.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, ian.jackson@eu.citrix.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMjMsIDIwMTggYXQgMDM6Mjc6MjVQTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+IAo+IEFkZCBzdXBwb3J0IGZvciBMaW51eCBncmFu
dCBkZXZpY2UgZHJpdmVyIGV4dGVuc2lvbiB3aGljaCBhbGxvd3MKPiBjb252ZXJ0aW5nIGV4aXN0
aW5nIGRtYS1idWYncyBpbnRvIGFuIGFycmF5IG9mIGdyYW50IHJlZmVyZW5jZXMKPiBhbmQgdmlz
ZSB2ZXJzYS4gVGhpcyBpcyBvbmx5IGltcGxlbWVudGVkIGZvciBMaW51eCBhcyBvdGhlciBPU2Vz
Cj4gaGF2ZSBubyBMaW51eCBkbWEtYnVmIHN1cHBvcnQuCj4gCj4gQnVtcCBnbnR0YWIgbGlicmFy
eSBtaW5vciB2ZXJzaW9uIHRvIDMuCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgoKSGFzIHRoZSBMaW51
eCBzaWRlIGJlZW4gbWVyZ2VkIHlldD8KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
