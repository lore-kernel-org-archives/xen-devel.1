From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 0/6] iomem cacheability
Date: Wed, 6 Mar 2019 14:42:24 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1903061429230.17248@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <CABHD4K-UAuyv0Cwmk1d-SBUgGvUarWq-fsAsJATbg3r+ovGLrg@mail.gmail.com>
 <alpine.DEB.2.10.1903051321390.17552@sstabellini-ThinkPad-X260>
 <CAF3u54Di61CufwzwJ35sqPrBRVt2ewrmR=siDHPWA8ur29db7Q@mail.gmail.com>
 <CABHD4K8JQdhi8P4ZbYndUFs90w0eH9QqMAa_XDPJM-QA_yr=QA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+lMa=RJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1h1fF5-00044K-Ot
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 22:42:27 +0000
In-Reply-To: <CABHD4K8JQdhi8P4ZbYndUFs90w0eH9QqMAa_XDPJM-QA_yr=QA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@gmail.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org, ian.jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCA2IE1hciAyMDE5LCBBbWl0IFRvbWVyIHdyb3RlOgo+IEhpLAo+ID4gTG9va2luZyBh
dCB0aGUgc3RhY2sgdHJhY2UsIHRoaXMgaXMgdmVyeSBsaWtlbHkgZHVlIHRvIHRoZSBpc3N1ZSBJ
IHBvaW50ZWQgb3V0IGVhcmxpZXIgb24uIEkuZSByZXNlcnZlZC1tZW1vcnkgcmVnaW9uIHNob3Vs
ZCBiZSBkZXNjcmliZWQgaW4gdGhlIG1lbW9yeSBub2Rlcy4KPiAKPiBEbyB5b3UgbWVhbiwgc29t
ZXRoaW5nIGxpa2UgdGhpcyhyZXNlcnZlZC1tZW1vcnkgbm9kZSBpcyB1bmRlciBtZW1vcnkgbm9k
ZSkgPwoKTm8sIEkgdGhpbmsgSnVsaWVuIG1lYW50IHRoYXQgYWxsIHRoZSByZXNlcnZlZC1tZW1v
cnkgcmVnaW9ucyByYW5nZXMKc2hvdWxkIGJlICJjb3ZlcmVkIiBieSB0aGUgcmFuZ2VzIG9mIHRo
ZSBtZW1vcnkgbm9kZS4KCklmIGEgcmVzZXJ2ZWQtbWVtb3J5IG5vZGUgcmFuZ2UgaXMgMHg1NDAw
MDAwMCAtIDB4NTcwMDAwMDAsIHRoZW4gd2UgbmVlZAp0byBtYWtlIHN1cmUgdGhhdCB0aGUgbWVt
b3J5IG5vZGUgaW5jbHVkZXMgdGhhdCByYW5nZS4gSW4geW91ciBjYXNlLCB0aGUKZmlyc3QgbWVt
b3J5IGJhbmsgaXMgMHg0ODAwMDAwMCAtIDB4ODAwMDAwMDAgc28gaXQgd291bGQgY2xlYXJseSBp
bmNsdWRlCnRoZSByYW5nZSAweDU0MDAwMDAwIC0gMHg1NzAwMDAwMC4gU28sIGl0IGxvb2tzIGxp
a2UgaXQgaXMgY29ycmVjdCBmcm9tCnRoYXQgcG9pbnQgb2Ygdmlldy4KCkkgYW0gc3VzcGVjdGlu
ZyB0aGVyZSBpcyBhIGJ1ZyBpbiB0aGUgcGF0Y2ggInhlbi9hcm06IG1hcApyZXNlcnZlZC1tZW1v
cnkgcmVnaW9ucyBhcyBub3JtYWwgbWVtb3J5IGluIGRvbTAiLCBzcGVjaWZpY2FsbHkgaW4gdGhl
CmltcGxlbWVudGF0aW9uIG9mIGNoZWNrX3Jlc2VydmVkX21lbW9yeS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
