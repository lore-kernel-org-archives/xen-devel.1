From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 0/1] drm/xen-zcopy: Add Xen zero-copy helper
 DRM driver
Date: Tue, 24 Apr 2018 14:59:39 +0300
Message-ID: <18ab5f76-00b0-42a0-fcb8-e0cbf4cdd527__18305.3560708233$1524571114$gmane$org@gmail.com>
References: <20180417075928.GT31310@phenom.ffwll.local>
 <20180417205744.GA15930@downor-Z87X-UD5H>
 <41487acb-a67a-8933-d0c3-702c19b0938e@gmail.com>
 <20180418073508.ptvntwedczpvl7bx@MacBook-Pro-de-Roger.local>
 <ebcbf6ce-1d7a-5f3e-cff8-546d1c010e59@gmail.com>
 <20180418101058.hyqk3gr3b2ibxswu@MacBook-Pro-de-Roger.local>
 <20180420071914.GG31310@phenom.ffwll.local>
 <76cdc65a-7bb1-9377-7bc5-6164e32f7b5d@gmail.com>
 <20180423115242.ywdwqblj2aseu3fr@citrix.com>
 <61105351-8896-072b-abf0-757c7f6c0edf@gmail.com>
 <20180424115437.GT31310@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yktx=hn=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fAwbn-0000fL-WE
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 11:59:44 +0000
Received: by mail-lf0-x242.google.com with SMTP id u21-v6so18261677lfu.9
 for <xen-devel@lists.xenproject.org>; Tue, 24 Apr 2018 04:59:42 -0700 (PDT)
In-Reply-To: <20180424115437.GT31310@phenom.ffwll.local>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, jgross@suse.com, Artem Mygaiev <Artem_Mygaiev@epam.com>, Dongwon Kim <dongwon.kim@intel.com>, konrad.wilk@oracle.com, airlied@linux.ie, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Potrola, MateuszX" <mateuszx.potrola@intel.com>, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMjQvMjAxOCAwMjo1NCBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBNb24sIEFw
ciAyMywgMjAxOCBhdCAwMzoxMDozNVBNICswMzAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3
cm90ZToKPj4gT24gMDQvMjMvMjAxOCAwMjo1MiBQTSwgV2VpIExpdSB3cm90ZToKPj4+IE9uIEZy
aSwgQXByIDIwLCAyMDE4IGF0IDAyOjI1OjIwUE0gKzAzMDAsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIHdyb3RlOgo+Pj4+Pj4gICAgICAgdGhlIGdudGRldi4KPj4+Pj4+Cj4+Pj4+PiBJIHRoaW5r
IHRoaXMgaXMgZ2VuZXJpYyBlbm91Z2ggdGhhdCBpdCBjb3VsZCBiZSBpbXBsZW1lbnRlZCBieSBh
Cj4+Pj4+PiBkZXZpY2Ugbm90IHRpZWQgdG8gWGVuLiBBRkFJQ1QgdGhlIGh5cGVyX2RtYSBndXlz
IGFsc28gd2FudGVkCj4+Pj4+PiBzb21ldGhpbmcgc2ltaWxhciB0byB0aGlzLgo+Pj4+PiBZb3Ug
Y2FuJ3QganVzdCB3cmFwIHJhbmRvbSB1c2Vyc3BhY2UgbWVtb3J5IGludG8gYSBkbWEtYnVmLiBX
ZSd2ZSBqdXN0IGhhZAo+Pj4+PiB0aGlzIGRpc2N1c3Npb24gd2l0aCBrdm0vcWVtdSBmb2xrcywg
d2hvIHByb3Bvc2VkIGp1c3QgdGhhdCwgYW5kIGFmdGVyIGEKPj4+Pj4gYml0IG9mIGRpc2N1c3Np
b24gdGhleSdsbCBub3cgdHJ5IHRvIGhhdmUgYSBkcml2ZXIgd2hpY2gganVzdCB3cmFwcyBhCj4+
Pj4+IG1lbWZkIGludG8gYSBkbWEtYnVmLgo+Pj4+IFNvLCB3ZSBoYXZlIHRvIGRlY2lkZSBlaXRo
ZXIgd2UgaW50cm9kdWNlIGEgbmV3IGRyaXZlcgo+Pj4+IChzYXksIHVuZGVyIGRyaXZlcnMveGVu
L3hlbi1kbWEtYnVmKSBvciBleHRlbmQgdGhlIGV4aXN0aW5nCj4+Pj4gZ250ZGV2L2JhbGxvb24g
dG8gc3VwcG9ydCBkbWEtYnVmIHVzZS1jYXNlcy4KPj4+Pgo+Pj4+IENhbiBhbnlib2R5IGZyb20g
WGVuIGNvbW11bml0eSBleHByZXNzIHRoZWlyIHByZWZlcmVuY2UgaGVyZT8KPj4+Pgo+Pj4gT2xl
a3NhbmRyIHRhbGtlZCB0byBtZSBvbiBJUkMgYWJvdXQgdGhpcywgaGUgc2FpZCBhIGZldyBJT0NU
THMgbmVlZCB0bwo+Pj4gYmUgYWRkZWQgdG8gZWl0aGVyIGV4aXN0aW5nIGRyaXZlcnMgb3IgYSBu
ZXcgZHJpdmVyLgo+Pj4KPj4+IEkgd2VudCB0aHJvdWdoIHRoaXMgdGhyZWFkIHR3aWNlIGFuZCBz
a2ltbWVkIHRocm91Z2ggdGhlIHJlbGV2YW50Cj4+PiBkb2N1bWVudHMsIGJ1dCBJIGNvdWxkbid0
IHNlZSBhbnkgb2J2aW91cyBwcm9zIGFuZCBjb25zIGZvciBlaXRoZXIKPj4+IGFwcHJvYWNoLiBT
byBJIGRvbid0IHJlYWxseSBoYXZlIGFuIG9waW5pb24gb24gdGhpcy4KPj4+Cj4+PiBCdXQsIGFz
c3VtaW5nIGlmIGltcGxlbWVudGVkIGluIGV4aXN0aW5nIGRyaXZlcnMsIHRob3NlIElPQ1RMcyBu
ZWVkIHRvCj4+PiBiZSBhZGRlZCB0byBkaWZmZXJlbnQgZHJpdmVycywgd2hpY2ggbWVhbnMgdXNl
cnNwYWNlIHByb2dyYW0gbmVlZHMgdG8KPj4+IHdyaXRlIG1vcmUgY29kZSBhbmQgZ2V0IG1vcmUg
aGFuZGxlcywgaXQgd291bGQgYmUgc2xpZ2h0bHkgYmV0dGVyIHRvCj4+PiBpbXBsZW1lbnQgYSBu
ZXcgZHJpdmVyIGZyb20gdGhhdCBwZXJzcGVjdGl2ZS4KPj4gSWYgZ250ZGV2L2JhbGxvb24gZXh0
ZW5zaW9uIGlzIHN0aWxsIGNvbnNpZGVyZWQ6Cj4+Cj4+IEFsbCB0aGUgSU9DVExzIHdpbGwgYmUg
aW4gZ250ZGV2IGRyaXZlciAoaW4gY3VycmVudCB4ZW4temNvcHkgdGVybWlub2xvZ3kpOgpJIHdh
cyBsYXp5IHRvIGNoYW5nZSBkdW1iIHRvIGRtYS1idWYsIHNvIHB1dCB0aGlzIG5vdGljZSA7KQo+
PiAgwqAtIERSTV9JQ09UTF9YRU5fWkNPUFlfRFVNQl9GUk9NX1JFRlMKPj4gIMKgLSBEUk1fSU9D
VExfWEVOX1pDT1BZX0RVTUJfVE9fUkVGUwo+PiAgwqAtIERSTV9JT0NUTF9YRU5fWkNPUFlfRFVN
Ql9XQUlUX0ZSRUUKPiBzL0RVTUIvRE1BX0JVRi8gcGxlYXNlLiBUaGlzIGlzIGdlbmVyaWMgZG1h
LWJ1ZiwgaXQgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aAo+IHRoZSBkdW1iIHNjYW5vdXQgYnVmZmVy
IHN1cHBvcnQgaW4gdGhlIGRybS9nZnggc3Vic3lzdGVtLiBUaGlzIGhlcmUgY2FuIGJlCj4gdXNl
ZCBmb3IgYW55IHpjb3B5IHNoYXJpbmcgYW1vbmcgZ3Vlc3RzIChhcyBsb25nIGFzIHlvdXIgZW5k
cG9pbnRzCj4gdW5kZXJzdGFuZHMgZG1hLWJ1Ziwgd2hpY2ggbW9zdCByZWxldmFudCBkcml2ZXJz
IGRvKS4KT2YgY291cnNlLCBwbGVhc2Ugc2VlIGFib3ZlCj4gLURhbmllbAo+Cj4+IEJhbGxvb24g
ZHJpdmVyIGV4dGVuc2lvbiwgd2hpY2ggaXMgbmVlZGVkIGZvciBjb250aWd1b3VzL0RNQQo+PiBi
dWZmZXJzLCB3aWxsIGJlIHRvIHByb3ZpZGUgbmV3ICprZXJuZWwgQVBJKiwgbm8gVUFQSSBpcyBu
ZWVkZWQuCj4+Cj4+PiBXZWkuCj4+IFRoYW5rIHlvdSwKPj4gT2xla3NhbmRyCj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
