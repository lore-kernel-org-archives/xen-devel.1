From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/4] xen/public: Document
 HYPERCALL_console_io()
Date: Thu, 25 Apr 2019 04:09:40 -0600
Message-ID: <5CC187640200007800228F4C@prv1-mh.provo.novell.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-4-julien.grall@arm.com>
 <5CA4AF5E0200007800224462@prv1-mh.provo.novell.com>
 <dc5849f6-4659-49b7-9ebf-8ea27860f28b@arm.com>
 <5CAC85300200007800225C72@prv1-mh.provo.novell.com>
 <726f5f58-bdae-8379-34c5-f31879fd1edd@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJbM5-0006Yz-OB
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 10:11:49 +0000
In-Reply-To: <726f5f58-bdae-8379-34c5-f31879fd1edd@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA0LjE5IGF0IDExOjU0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDQvOS8xOSAxMjo0MiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA5LjA0LjE5
IGF0IDEzOjI2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4gT24gMDMvMDQvMjAx
OSAxNDowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gQWxzbyBwbGVhc2Ugbm90ZSB0aGUgcXVv
dGF0aW9uIHVzZWQgYnkgdGhlIG1lbnRpb25lZAo+Pj4+IGV4aXN0aW5nIGRvYyBjb21tZW50cywg
YXMgd2VsbCBhcyBhIGZldyBvdGhlciBmb3JtYWwgYXNwZWN0cwo+Pj4+IChsaWtlIHRoZW0gYWxz
byBtYWtpbmcgY2xlYXIgd2hhdCB0aGUgcmV0dXJuIHR5cGUgaXMpLiBJIHRoaW5rCj4+Pj4gdGhh
dCdzIGEgbW9kZWwgdXNlZCBlbHNld2hlcmUgYXMgd2VsbCwgc28gSSB0aGluayB5b3Ugc2hvdWxk
Cj4+Pj4gZm9sbG93IGl0IGhlcmUuCj4+Pgo+Pj4gSSBoYXZlbid0IHJlcGxpY2F0ZWQgdGhlIGAg
YmVjYXVzZSBJIGhhdmUgbm8gaWRlYSB3aGF0IHRoZXkgYXJlIHVzZWQgZm9yLiBJCj4+PiB3b3Vs
ZCBhcHByZWNpYXRlIGlmIHlvdSBwcm92aWRlIHBvaW50ZXIgaG93IHRvIHVzZSB0aGVtLgo+PiAK
Pj4gV2VsbCwgSSBjYW4gb25seSBwb2ludCB5b3UgYXQgdGhlIGhpc3Rvcnkgb2YgdGhpbmdzLCBl
LmcuCj4+IDI2MmUxMThhMzcgImRvY3MvaHRtbC86IEFubm90YXRpb25zIGZvciB0d28gaHlwZXJj
YWxscyIuCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcG9pbnRlci4gSG93ZXZlciwgd2UgZG9uJ3Qg
c2VlbSB0byB1c2UgdGhpcyBmb3JtYXR0aW5nIAo+IGV2ZXJ5d2hlcmUuIEZvciBpbnN0YW5jZSwg
dGhlIGZvcm1hdHRpbmcgdXNlZCBpbiBteSBwYXRjaCBzZWVtcyB0byBiZSAKPiBjb25zaXN0ZW50
IHdpdGggeGVuL2luY2x1ZGUvcHVibGljL3ZjcHUuaC4KPiAKPiBGdXJ0aGVybW9yZSwgdGhlIGRl
c2NyaXB0aW9uIG9mIHRoZSBoeXBlcmNhbGwgaXMgZG9uZSBvbiB0b3Agb2YgdGhlIAo+IGRlZmlu
aXRpb24gb2YgdGhlIGh5cGVyY2FsbCBudW1iZXIuIEJlZm9yZSBJIHJld29yayB0aGlzIHBhdGNo
LCBjb3VsZCB3ZSAKPiBhZ3JlZSBvbiB3aGF0IGZvcm1hdHRpbmcgd2Ugd2FudD8KCldlbGwsIEZB
T0QgKHNlZSBJYW4ncyBlYXJsaWVyIHJlcGx5KSB0aGUgc3R5bGUgdG8gYmUgdXNlZCBpcyBhcyBz
dWdnZXN0ZWQsCmFuZCBldmVudHVhbGx5IHZjcHUuaCBzaG91bGQgYmUgc3dpdGNoZWQgdG9vLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
