From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 0/1] drm/xen-zcopy: Add Xen zero-copy helper
 DRM driver
Date: Mon, 23 Apr 2018 15:10:35 +0300
Message-ID: <61105351-8896-072b-abf0-757c7f6c0edf__34680.8942770169$1524485380$gmane$org@gmail.com>
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
 <20180423115242.ywdwqblj2aseu3fr@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yet9=hm=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fAaIr-0003Gr-OT
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 12:10:41 +0000
Received: by mail-lf0-x241.google.com with SMTP id m13-v6so396110lfc.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Apr 2018 05:10:39 -0700 (PDT)
In-Reply-To: <20180423115242.ywdwqblj2aseu3fr@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: jgross@suse.com, Artem Mygaiev <Artem_Mygaiev@epam.com>, Dongwon Kim <dongwon.kim@intel.com>, airlied@linux.ie, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Potrola,
 MateuszX" <mateuszx.potrola@intel.com>, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMjMvMjAxOCAwMjo1MiBQTSwgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIEFwciAyMCwg
MjAxOCBhdCAwMjoyNToyMFBNICswMzAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToK
Pj4+PiAgICAgIHRoZSBnbnRkZXYuCj4+Pj4KPj4+PiBJIHRoaW5rIHRoaXMgaXMgZ2VuZXJpYyBl
bm91Z2ggdGhhdCBpdCBjb3VsZCBiZSBpbXBsZW1lbnRlZCBieSBhCj4+Pj4gZGV2aWNlIG5vdCB0
aWVkIHRvIFhlbi4gQUZBSUNUIHRoZSBoeXBlcl9kbWEgZ3V5cyBhbHNvIHdhbnRlZAo+Pj4+IHNv
bWV0aGluZyBzaW1pbGFyIHRvIHRoaXMuCj4+PiBZb3UgY2FuJ3QganVzdCB3cmFwIHJhbmRvbSB1
c2Vyc3BhY2UgbWVtb3J5IGludG8gYSBkbWEtYnVmLiBXZSd2ZSBqdXN0IGhhZAo+Pj4gdGhpcyBk
aXNjdXNzaW9uIHdpdGgga3ZtL3FlbXUgZm9sa3MsIHdobyBwcm9wb3NlZCBqdXN0IHRoYXQsIGFu
ZCBhZnRlciBhCj4+PiBiaXQgb2YgZGlzY3Vzc2lvbiB0aGV5J2xsIG5vdyB0cnkgdG8gaGF2ZSBh
IGRyaXZlciB3aGljaCBqdXN0IHdyYXBzIGEKPj4+IG1lbWZkIGludG8gYSBkbWEtYnVmLgo+PiBT
bywgd2UgaGF2ZSB0byBkZWNpZGUgZWl0aGVyIHdlIGludHJvZHVjZSBhIG5ldyBkcml2ZXIKPj4g
KHNheSwgdW5kZXIgZHJpdmVycy94ZW4veGVuLWRtYS1idWYpIG9yIGV4dGVuZCB0aGUgZXhpc3Rp
bmcKPj4gZ250ZGV2L2JhbGxvb24gdG8gc3VwcG9ydCBkbWEtYnVmIHVzZS1jYXNlcy4KPj4KPj4g
Q2FuIGFueWJvZHkgZnJvbSBYZW4gY29tbXVuaXR5IGV4cHJlc3MgdGhlaXIgcHJlZmVyZW5jZSBo
ZXJlPwo+Pgo+IE9sZWtzYW5kciB0YWxrZWQgdG8gbWUgb24gSVJDIGFib3V0IHRoaXMsIGhlIHNh
aWQgYSBmZXcgSU9DVExzIG5lZWQgdG8KPiBiZSBhZGRlZCB0byBlaXRoZXIgZXhpc3RpbmcgZHJp
dmVycyBvciBhIG5ldyBkcml2ZXIuCj4KPiBJIHdlbnQgdGhyb3VnaCB0aGlzIHRocmVhZCB0d2lj
ZSBhbmQgc2tpbW1lZCB0aHJvdWdoIHRoZSByZWxldmFudAo+IGRvY3VtZW50cywgYnV0IEkgY291
bGRuJ3Qgc2VlIGFueSBvYnZpb3VzIHByb3MgYW5kIGNvbnMgZm9yIGVpdGhlcgo+IGFwcHJvYWNo
LiBTbyBJIGRvbid0IHJlYWxseSBoYXZlIGFuIG9waW5pb24gb24gdGhpcy4KPgo+IEJ1dCwgYXNz
dW1pbmcgaWYgaW1wbGVtZW50ZWQgaW4gZXhpc3RpbmcgZHJpdmVycywgdGhvc2UgSU9DVExzIG5l
ZWQgdG8KPiBiZSBhZGRlZCB0byBkaWZmZXJlbnQgZHJpdmVycywgd2hpY2ggbWVhbnMgdXNlcnNw
YWNlIHByb2dyYW0gbmVlZHMgdG8KPiB3cml0ZSBtb3JlIGNvZGUgYW5kIGdldCBtb3JlIGhhbmRs
ZXMsIGl0IHdvdWxkIGJlIHNsaWdodGx5IGJldHRlciB0bwo+IGltcGxlbWVudCBhIG5ldyBkcml2
ZXIgZnJvbSB0aGF0IHBlcnNwZWN0aXZlLgpJZiBnbnRkZXYvYmFsbG9vbiBleHRlbnNpb24gaXMg
c3RpbGwgY29uc2lkZXJlZDoKCkFsbCB0aGUgSU9DVExzIHdpbGwgYmUgaW4gZ250ZGV2IGRyaXZl
ciAoaW4gY3VycmVudCB4ZW4temNvcHkgdGVybWlub2xvZ3kpOgogwqAtIERSTV9JQ09UTF9YRU5f
WkNPUFlfRFVNQl9GUk9NX1JFRlMKIMKgLSBEUk1fSU9DVExfWEVOX1pDT1BZX0RVTUJfVE9fUkVG
UwogwqAtIERSTV9JT0NUTF9YRU5fWkNPUFlfRFVNQl9XQUlUX0ZSRUUKCkJhbGxvb24gZHJpdmVy
IGV4dGVuc2lvbiwgd2hpY2ggaXMgbmVlZGVkIGZvciBjb250aWd1b3VzL0RNQQpidWZmZXJzLCB3
aWxsIGJlIHRvIHByb3ZpZGUgbmV3ICprZXJuZWwgQVBJKiwgbm8gVUFQSSBpcyBuZWVkZWQuCgo+
IFdlaS4KVGhhbmsgeW91LApPbGVrc2FuZHIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
