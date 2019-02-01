From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 v2] xen/iommu: fix iommu_ops
 initialization
Date: Fri, 01 Feb 2019 09:48:17 -0700
Message-ID: <5C54785102000078002133B6@prv1-mh.provo.novell.com>
References: <20190201162945.26461-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gpbzJ-0006sH-Ub
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 16:48:21 +0000
In-Reply-To: <20190201162945.26461-1-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjAyLjE5IGF0IDE3OjI5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBDb21t
aXQgMzJhNWVhMDBlYzc1ZWY1M2UgKCJJT01NVS94ODY6IHJlbW92ZSBpbmRpcmVjdGlvbiBmcm9t
IGNlcnRhaW4KPiBJT01NVSBob29rIGFjY2Vzc2VzIikgaW50cm9kdWNlZCBpb21tdV9vcHMgaW5p
dGlhbGl6ZWQgYXQgYm9vdCB0aW1lCj4gd2l0aCBkYXRhIGRlY2xhcmVkIGFzIF9faW5pdGNvbnN0
cmVsLgo+IAo+IE9uIEludGVsIHN5c3RlbXMgdGhlcmUgaXMgYW5vdGhlciBwYXRoIHdoZXJlIGlv
bW11X29wcyBpcyBpbml0aWFsaXplZAo+IGFuZCB0aGlzIHBhdGggaXMgcmVsZXZhbnQgb24gcmVz
dW1lIGFmdGVyIHJldHVybmluZyBmcm9tIHN5c3RlbSBzdXNwZW5kLgo+IEFzIHRoZSBpbml0aWFs
aXphdGlvbiBkYXRhIGlzIG5vIGxvbmdlciBhY2Nlc3NpYmxlIGluIHRoaXMgY2FzZSB0aGF0Cj4g
c2Vjb25kIGluaXRpYWxpemF0aW9uIG11c3QgYmUgZHJvcHBlZCBpbiBjYXNlIHRoZSBzeXN0ZW0g
aXNuJ3QganVzdAo+IGJvb3RpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
