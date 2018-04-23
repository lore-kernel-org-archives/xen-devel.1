From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 0/1] drm/xen-zcopy: Add Xen zero-copy helper
 DRM driver
Date: Mon, 23 Apr 2018 12:52:43 +0100
Message-ID: <20180423115242.ywdwqblj2aseu3fr__21796.6602104299$1524484308$gmane$org@citrix.com>
References: <5d8fec7f-956c-378f-be90-f45029385740@gmail.com>
 <20180416192905.GA18096@downor-Z87X-UD5H>
 <20180417075928.GT31310@phenom.ffwll.local>
 <20180417205744.GA15930@downor-Z87X-UD5H>
 <41487acb-a67a-8933-d0c3-702c19b0938e@gmail.com>
 <20180418073508.ptvntwedczpvl7bx@MacBook-Pro-de-Roger.local>
 <ebcbf6ce-1d7a-5f3e-cff8-546d1c010e59@gmail.com>
 <20180418101058.hyqk3gr3b2ibxswu@MacBook-Pro-de-Roger.local>
 <20180420071914.GG31310@phenom.ffwll.local>
 <76cdc65a-7bb1-9377-7bc5-6164e32f7b5d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=flmh=hm=citrix.com=prvs=6441587ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fAa1j-0001bD-N0
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 11:52:59 +0000
Content-Disposition: inline
In-Reply-To: <76cdc65a-7bb1-9377-7bc5-6164e32f7b5d@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: jgross@suse.com, Artem Mygaiev <Artem_Mygaiev@epam.com>, Wei Liu <wei.liu2@citrix.com>, Dongwon Kim <dongwon.kim@intel.com>, airlied@linux.ie, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Potrola,
 MateuszX" <mateuszx.potrola@intel.com>, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMjAsIDIwMTggYXQgMDI6MjU6MjBQTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gPiA+ICAgICB0aGUgZ250ZGV2Lgo+ID4gPiAKPiA+ID4gSSB0aGlu
ayB0aGlzIGlzIGdlbmVyaWMgZW5vdWdoIHRoYXQgaXQgY291bGQgYmUgaW1wbGVtZW50ZWQgYnkg
YQo+ID4gPiBkZXZpY2Ugbm90IHRpZWQgdG8gWGVuLiBBRkFJQ1QgdGhlIGh5cGVyX2RtYSBndXlz
IGFsc28gd2FudGVkCj4gPiA+IHNvbWV0aGluZyBzaW1pbGFyIHRvIHRoaXMuCj4gPiBZb3UgY2Fu
J3QganVzdCB3cmFwIHJhbmRvbSB1c2Vyc3BhY2UgbWVtb3J5IGludG8gYSBkbWEtYnVmLiBXZSd2
ZSBqdXN0IGhhZAo+ID4gdGhpcyBkaXNjdXNzaW9uIHdpdGgga3ZtL3FlbXUgZm9sa3MsIHdobyBw
cm9wb3NlZCBqdXN0IHRoYXQsIGFuZCBhZnRlciBhCj4gPiBiaXQgb2YgZGlzY3Vzc2lvbiB0aGV5
J2xsIG5vdyB0cnkgdG8gaGF2ZSBhIGRyaXZlciB3aGljaCBqdXN0IHdyYXBzIGEKPiA+IG1lbWZk
IGludG8gYSBkbWEtYnVmLgo+IFNvLCB3ZSBoYXZlIHRvIGRlY2lkZSBlaXRoZXIgd2UgaW50cm9k
dWNlIGEgbmV3IGRyaXZlcgo+IChzYXksIHVuZGVyIGRyaXZlcnMveGVuL3hlbi1kbWEtYnVmKSBv
ciBleHRlbmQgdGhlIGV4aXN0aW5nCj4gZ250ZGV2L2JhbGxvb24gdG8gc3VwcG9ydCBkbWEtYnVm
IHVzZS1jYXNlcy4KPiAKPiBDYW4gYW55Ym9keSBmcm9tIFhlbiBjb21tdW5pdHkgZXhwcmVzcyB0
aGVpciBwcmVmZXJlbmNlIGhlcmU/Cj4gCgpPbGVrc2FuZHIgdGFsa2VkIHRvIG1lIG9uIElSQyBh
Ym91dCB0aGlzLCBoZSBzYWlkIGEgZmV3IElPQ1RMcyBuZWVkIHRvCmJlIGFkZGVkIHRvIGVpdGhl
ciBleGlzdGluZyBkcml2ZXJzIG9yIGEgbmV3IGRyaXZlci4KCkkgd2VudCB0aHJvdWdoIHRoaXMg
dGhyZWFkIHR3aWNlIGFuZCBza2ltbWVkIHRocm91Z2ggdGhlIHJlbGV2YW50CmRvY3VtZW50cywg
YnV0IEkgY291bGRuJ3Qgc2VlIGFueSBvYnZpb3VzIHByb3MgYW5kIGNvbnMgZm9yIGVpdGhlcgph
cHByb2FjaC4gU28gSSBkb24ndCByZWFsbHkgaGF2ZSBhbiBvcGluaW9uIG9uIHRoaXMuCgpCdXQs
IGFzc3VtaW5nIGlmIGltcGxlbWVudGVkIGluIGV4aXN0aW5nIGRyaXZlcnMsIHRob3NlIElPQ1RM
cyBuZWVkIHRvCmJlIGFkZGVkIHRvIGRpZmZlcmVudCBkcml2ZXJzLCB3aGljaCBtZWFucyB1c2Vy
c3BhY2UgcHJvZ3JhbSBuZWVkcyB0bwp3cml0ZSBtb3JlIGNvZGUgYW5kIGdldCBtb3JlIGhhbmRs
ZXMsIGl0IHdvdWxkIGJlIHNsaWdodGx5IGJldHRlciB0bwppbXBsZW1lbnQgYSBuZXcgZHJpdmVy
IGZyb20gdGhhdCBwZXJzcGVjdGl2ZS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
