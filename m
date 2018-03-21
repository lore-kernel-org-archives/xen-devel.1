From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxc/arm: initialise p2m_size to make gcc
 happy
Date: Wed, 21 Mar 2018 16:43:42 +0000
Message-ID: <20180321164342.x2zqe3bgbrlvntzt@citrix.com>
References: <20180314123203.30646-1-wei.liu2@citrix.com>
 <37798a67-72b4-901c-ba17-e76fc1d2da65@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=24tk=gl=citrix.com=prvs=6111f1d8b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eygte-0007mN-Vk
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 16:47:31 +0000
Content-Disposition: inline
In-Reply-To: <37798a67-72b4-901c-ba17-e76fc1d2da65@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMDE6Mjc6MzdQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDAzLzE0LzIwMTggMTI6MzIgUE0sIFdlaSBMaXUgd3JvdGU6Cj4g
PiBHY2Mgd2l0aCAtTzMgZmFpbGVkIHRvIHNwb3QgdGhlIGxvb3AgdG8gaW5pdGlhbGlzZSBwMm1f
c2l6ZSBydW5zIGF0Cj4gPiBsZWFzdCBvbmNlLgo+IAo+IEFzaWRlLCBBbmRyZXcncyBjb21tZW50
IHRoZSBwYXRjaCBsb29rcyBva2F5LiBCdXQgSSBhbSB3b25kZXJpbmcgd2h5IHdlIG5lZWQKPiB0
byBhbGxvY2F0ZSBwMm1faG9zdCBmb3IgQXJtPwo+IAoKTm90IHN1cmUsIHJlYWxseS4gOi0pCgo+
IEZyb20gYSBxdWljayBsb29rIEkgaGF2ZSBzZWVuIG5vIHJlYWwgdXNlciBleGNlcHQgeGNfZG9t
X3VwZGF0ZV9ndWVzdF9wMm0KPiB0aGF0IGNhbiBjb3BlIHdpdGggcDJtX2hvc3QgPSBOVUxMLgo+
IAoKTWF5YmUgaXQgaXMgdG8gd29yayBhcm91bmQgdGhpcyBsaW1pdGF0aW9uIGluIGNvZGUuCgpX
ZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
