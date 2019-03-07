From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 0/6] iomem cacheability
Date: Thu, 7 Mar 2019 13:24:25 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1903071323050.17248@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <CABHD4K-UAuyv0Cwmk1d-SBUgGvUarWq-fsAsJATbg3r+ovGLrg@mail.gmail.com>
 <alpine.DEB.2.10.1903051321390.17552@sstabellini-ThinkPad-X260>
 <CAF3u54Di61CufwzwJ35sqPrBRVt2ewrmR=siDHPWA8ur29db7Q@mail.gmail.com>
 <CABHD4K8JQdhi8P4ZbYndUFs90w0eH9QqMAa_XDPJM-QA_yr=QA@mail.gmail.com>
 <alpine.DEB.2.10.1903061429230.17248@sstabellini-ThinkPad-X260>
 <7b7c45ee-745f-1ede-1063-7fd66449194b@arm.com>
 <CABHD4K-Pxq2ZSRpa-Fpiis1gKe8=sVKaxzFcyvcC_awCR9vmrQ@mail.gmail.com>
 <af846001-3098-120b-ed31-d4b4b19709c9@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OI77=RK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1h20V9-0001El-SY
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 21:24:27 +0000
In-Reply-To: <af846001-3098-120b-ed31-d4b4b19709c9@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Amit Tomer <amittomer25@gmail.com>, Julien Grall <julien.grall@gmail.com>, Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "ian.jackson@citrix.com" <ian.jackson@citrix.com>, nd <nd@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCA3IE1hciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gMDcvMDMvMjAxOSAw
ODo0MiwgQW1pdCBUb21lciB3cm90ZToKPiA+IEhpLAo+ID4gCj4gPiA+IE5vdCByZWFsbHksIHRo
ZSBEVCBwcm92aWRlZCBieSBBbWl0IGlzIGZvciB0aGUgaG9zdC4gVGhlIG1lbW9yeSBub2RlCj4g
PiA+IHdpbGwgYmUgcmV3cml0dGVuIGJ5IFhlbiBmb3IgRG9tMCAgYW5kIGRvZXMgbm90IGluY2x1
ZGUgdGhlCj4gPiA+IHJlc2VydmVkLW1lbW9yeSByZWdpb25zIHNvIGZhci4KPiA+ID4gCj4gPiBU
aGFua3MgZm9yIHBvaW50aW5nIHRoYXQgb3V0Lgo+ID4gCj4gPiBJcyBpdCBsaWtlIHdlIG5lZWQg
dG8gY3JlYXRlICJzZXBhcmF0ZSIgcmVzZXJ2ZS1tZW1vcnkKPiA+IG5vZGUobWFrZV9yZXNlcnZl
ZC1tZW1vcnlfbm9kZSkgd2hlbgo+ID4gbWVtb3J5IG5vZGUgaXMgZW5jb3VudGVyZWQ/Cj4gCj4g
U29ycnkgSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4uCj4gCj4gV2hhdCBJIG1lYW50
IGlzIHJlc2VydmVkLXJlZ2lvbnMgaXMgc29tZSBtZW1vcnkgdGhhdCBoYXZlIGJlZW4gY2FydmVk
IG91dCBmcm9tCj4gdGhlIFJBTS4gU28gdGhlIHJlc2VydmVkLXJlZ2lvbnMgbmVlZHMgdG8gYmUg
ZGVzY3JpYmVkIGluIHRoZSBtZW1vcnkgbm9kZQo+IChtZW1vcnlAPGFkZHI+KS4gV2UgY2FuIGVp
dGhlciBhcHBlbmQgdGhlbSB0byB0aGUgbWVtb3J5IG5vZGUgY3JlYXRlZCBieQo+IG1ha2VfbWVt
b3J5X25vZGUuIE9yIGludHJvZHVjZSBuZXcgb25lcy4KPiAKPiBJIGhhdmVuJ3QgeWV0IHRob3Vn
aHQgd2hpY2ggb25lIGlzIG1vcmUgc3VpdGFibGUuCgpZZXMsIHlvdSBhcmUgcmlnaHQuIEkgbWFk
ZSBhIGNvdXBsZSBvZiBxdWljayBmaXhlcyBmb3IgdGhpcyBpc3N1ZSBhbmQKYW5vdGhlciBpc3N1
ZSByYWlzZWQgYnkgSnVsaWVuIGR1cmluZyByZXZpZXcgKHRoZSB1c2FnZSBvZiBwMm1fcmFtX3Qp
LgpBbWl0LCBpZiB5b3Ugd291bGQgbGlrZSB0byBnaXZlIGl0IGEgdHJ5IEkgaGF2ZSBhIHdvcmst
aW4tcHJvZ3Jlc3MKYnJhbmNoIHdpdGggdGhlIGZpeGVzIGhlcmU6CgpodHRwOi8veGVuYml0cy54
ZW5wcm9qZWN0Lm9yZy9naXQtaHR0cC9wZW9wbGUvc3N0YWJlbGxpbmkveGVuLXVuc3RhYmxlLmdp
dCBpb21lbV9jYWNoZS13aXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
