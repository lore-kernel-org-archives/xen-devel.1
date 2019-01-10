From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Thu, 10 Jan 2019 05:46:14 -0700
Message-ID: <5C373E96020000780020C378@prv1-mh.provo.novell.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <CAPLaKK6z4eNtJx+X3RdTcO8tKb+PxaeBwA_N3wDmbXc7Qss58A@mail.gmail.com>
 <5C3731E9020000780020C2AD@prv1-mh.provo.novell.com>
 <CAPLaKK5npYqGQzy=P7q8VpuTpz7aLKnS-Mid_sjxPuPYOu2MjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ghZj2-00028L-HM
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 12:46:20 +0000
In-Reply-To: <CAPLaKK5npYqGQzy=P7q8VpuTpz7aLKnS-Mid_sjxPuPYOu2MjQ@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: royger@FreeBSD.org
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjAxLjE5IGF0IDEzOjI2LCA8cm95Z2VyQGZyZWVic2Qub3JnPiB3cm90ZToKPiBP
biBUaHUsIEphbiAxMCwgMjAxOSBhdCAxMjo1MiBQTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pgo+PiAgPj4+IE9uIDEwLjAxLjE5IGF0IDExOjE5LCA8cm95Z2VyQGZy
ZWVic2Qub3JnPiB3cm90ZToKPj4gPiBhT24gTW9uLCBKYW4gNywgMjAxOSBhdCA4OjQ0IEFNIENo
cmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4+
ID4+Cj4+ID4+ICsvKiBYZW4gY29tbWFuZCBsaW5lIG9wdGlvbiB0byBlbmFibGUgYXJnbyAqLwo+
PiA+PiArc3RhdGljIGJvb2wgX19yZWFkX21vc3RseSBvcHRfYXJnb19lbmFibGVkOwo+PiA+PiAr
Ym9vbGVhbl9wYXJhbSgiYXJnbyIsIG9wdF9hcmdvX2VuYWJsZWQpOwo+PiA+Cj4+ID4gSSB3b3Vs
ZCBkcm9wIHRoZSBvcHRfKiBwcmVmaXgsIG5ldyBvcHRpb25zIGFkZGVkIHJlY2VudGx5IGRvbid0
Cj4+ID4gaW5jbHVkZSB0aGUgcHJlZml4IGFscmVhZHkuCj4+Cj4+IFdvdWxkIHlvdSBtaW5kIHBv
aW50aW5nIG91dCBleGFtcGxlcz8gRXNwZWNpYWxseSBmb3IgYm9vbGVhbiBvbmVzIEkKPj4gdGhp
bmsgd2UndmUgdHJpZWQgdG8gY29uc2lzdGVudGx5IG5hbWUgdGhlbSBvcHRfKi4gQnV0IGluIHRo
ZSBjYXNlCj4+IGhlcmUgKGl0IGJlaW5nIHN0YXRpYykgSSdtIG5vdCBvdmVybHkgZnVzc2VkLgo+
IAo+IEkgd2FzIG1vc3RseSB0aGlua2luZyBhYm91dCB0aGUgZG9tMF9wdmggYm9vbGVhbiBvcHRp
b24gdGhhdCBJIGFkZGVkLgo+IEknbSBub3Qgb3Zlcmx5IGZ1enplZCwgSSBqdXN0IHRoaW5rIGl0
J3Mgbm90IGFkZGluZyBhbnkgdmFsdWUgdG8gdGhlCj4gdmFyaWFibGUgbmFtZSwgYnV0IGlmIHlv
dSBwcmVmZXIgdG8ga2VlcCB0aGUgb3B0XyBwcmVmaXggdGhhdCdzIGZpbmUuCgpXZWxsLCBvbmUg
dmFsdWUgaXMgdGhhdCBhdCB1c2Ugc2l0ZXMgb2Ygc3VjaCB2YXJpYWJsZXMgeW91IGltbWVkaWF0
ZWx5Cm5vdGljZSB0aGF0IHRoZSB2YWx1ZSBpcyAocG90ZW50aWFsbHkpIGFkbWluIGNvbnRyb2xs
ZWQuIEF0IGxlYXN0IGluIHNvbWUKY2FzZXMgdGhpcyBpcyBoZWxwZnVsIHRvIGJlIG9idmlvdXMu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
