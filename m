From: Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [PATCH 0/1] drm/xen-zcopy: Add Xen zero-copy helper
 DRM driver
Date: Mon, 30 Apr 2018 11:43:47 -0700
Message-ID: <20180430184347.GA20292__17325.3626948737$1525113824$gmane$org@downor-Z87X-UD5H>
References: <ebcbf6ce-1d7a-5f3e-cff8-546d1c010e59@gmail.com>
 <20180418101058.hyqk3gr3b2ibxswu@MacBook-Pro-de-Roger.local>
 <20180420071914.GG31310@phenom.ffwll.local>
 <76cdc65a-7bb1-9377-7bc5-6164e32f7b5d@gmail.com>
 <20180423115242.ywdwqblj2aseu3fr@citrix.com>
 <61105351-8896-072b-abf0-757c7f6c0edf@gmail.com>
 <20180424115437.GT31310@phenom.ffwll.local>
 <18ab5f76-00b0-42a0-fcb8-e0cbf4cdd527@gmail.com>
 <20180424203514.GA26787@downor-Z87X-UD5H>
 <bdeeb76f-ea65-083b-dde4-450584edb068@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m3ch=ht=intel.com=dongwon.kim@srs-us1.protection.inumbo.net>)
 id 1fDDn7-0006BI-01
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 18:44:49 +0000
Content-Disposition: inline
In-Reply-To: <bdeeb76f-ea65-083b-dde4-450584edb068@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Wei Liu <wei.liu2@citrix.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@linux.ie, "Potrola, MateuszX" <mateuszx.potrola@intel.com>, xen-devel@lists.xenproject.org, daniel.vetter@intel.com, boris.ostrovsky@oracle.com, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMjUsIDIwMTggYXQgMDg6MTI6MDhBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAyNC8wNC8xOCAyMjozNSwgRG9uZ3dvbiBLaW0gd3JvdGU6Cj4gPiBIYWQgYSBt
ZWV0aW5nIHdpdGggRGFuaWVsIGFuZCB0YWxrZWQgYWJvdXQgYnJpbmdpbmcgb3V0IGdlbmVyaWMK
PiA+IHBhcnQgb2YgaHlwZXItZG1hYnVmIHRvIHRoZSB1c2Vyc3BhY2UsIHdoaWNoIG1lYW5zIHdl
IG1vc3QgbGlrZWx5Cj4gPiByZXVzZSBJT0NUTHMgZGVmaW5lZCBpbiB4ZW4temNvcHkgZm9yIG91
ciB1c2UtY2FzZSBpZiB3ZSBmb2xsb3cKPiA+IGhpcyBzdWdnZXN0aW9uLgo+ID4gCj4gPiBTbyBh
c3N1bWluZyB3ZSB1c2UgdGhlc2UgSU9DVExzIGFzIHRoZXkgYXJlLAo+ID4gU2V2ZXJhbCB0aGlu
Z3MgSSB3b3VsZCBsaWtlIHlvdSB0byBkb3VibGUtY2hlY2suLgo+ID4gCj4gPiAxLiByZXR1cm5p
bmcgZ3JlZiBhcyBpcyB0byB0aGUgdXNlciBzcGFjZSBpcyBzdGlsbCB1bnNhZmUgYmVjYXVzZQo+
ID4gaXQgaXMgYSBjb25zdGFudCwgZWFzeSB0byBndWVzcyBhbmQgYW55IHByb2Nlc3MgdGhhdCBo
aWphY2tzIGl0IGNhbiBlYXNpbHkKPiA+IGV4cGxvaXQgdGhlIGJ1ZmZlci4gU28gSSBhbSB3b25k
ZXJpbmcgaWYgaXQncyBwb3NzaWJsZSB0byBrZWVwIGRtYWJ1Zi10bwo+ID4gLWdyZWYgb3IgZ3Jl
Zi10by1kbWFidWYgaW4ga2VybmVsIHNwYWNlIGFuZCBhZGQgb3RoZXIgbGF5ZXJzIG9uIHRvcAo+
ID4gb2YgdGhvc2UgaW4gYWN0dWFsIElPQ1RMcyB0byBhZGQgc29tZSBzYWZldHkuLiBXZSBpbnRy
b2R1Y2VkIGZsaW5rIGxpa2UKPiA+IGh5cGVyX2RtYWJ1Zl9pZCBpbmNsdWRpbmcgcmFuZG9tIG51
bWJlciBidXQgbWFueSBzYXlzIGV2ZW4gdGhhdCBpcyBzdGlsbAo+ID4gbm90IHNhZmUuCj4gCj4g
Z3JlZnMgYXJlIHVzYWJsZSBieSByb290IG9ubHkuIFdoZW4geW91IGhhdmUgcm9vdCBhY2Nlc3Mg
aW4gZG9tMCB5b3UgY2FuCj4gZG8gZXZpbCB0aGluZ3MgdG8gYWxsIFZNcyBldmVuIHdpdGhvdXQg
dXNpbmcgZ3JhbnRzLiBUaGF0IGlzIGluIG5vIHdheQo+IGRpZmZlcmVudCB0byByb290IGJlaW5n
IGFibGUgdG8gY29udHJvbCBhbGwgb3RoZXIgcHJvY2Vzc2VzIG9uIHRoZQo+IHN5c3RlbS4KCkkg
aG9uZXN0bHkgZGlkbid0IGtub3cgYWJvdXQgdGhpcy4gSSBiZWxpZXZlZCBrZXJuZWwgY29kZSBz
aW1wbHkgY2FuIG1hcCB0aG9zZQpwYWdlcy4gSG93ZXZlciwgb3V0IG9mIGN1cmlvc2l0eSwgaG93
IGlzIG5vbi1yb290IHVzYWdlIG9mIGdyZWYgcHJldmVudGVkIGluCmN1cnJlbnQgZGVzaWduPyBJ
cyB0aGVyZSBwcml2aWxlZ2UgY2hlY2sgaW4gZ3JhbnQgdGFibGUgZHJpdmVyIG9yIGh5cGVyY2Fs
bHMKbmVlZGVkIGJ5IHRoaXMgcGFnZSBtYXBwaW5nIGlzIG9ubHkgZW5hYmxlZCBmb3Igcm9vdCBp
biBoeXBlcnZpc29yIGxldmVsPwoKQW5kIHRoaXMgaXMgcHJldHR5IGNyaXRpY2FsIGluZm9ybWF0
aW9uIGZvciBhbnkgdXNlLWNhc2UgdXNpbmcgZ3JhbnQtdGFibGUuCklzIHRoZXJlIGFueSBwbGFj
ZShkb2Mvd2Vic2l0ZSkgdGhpcyBpcyBzcGVjaWZpZWQvZXhwbGFpbmVkPwoKVGhhbmtzLApEVwoK
Cj4gCj4gCj4gSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
