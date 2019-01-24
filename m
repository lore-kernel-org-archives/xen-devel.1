From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: Split out drm_probe_helper.h
Date: Thu, 24 Jan 2019 13:39:41 +0100
Message-ID: <20190124123941.GW3271__18877.9310019285$1548333649$gmane$org@phenom.ffwll.local>
References: <20190116181018.GA27364@ravnborg.org>
 <20190117210334.13234-1-daniel.vetter@ffwll.ch>
 <20190123170015.GA23138@ravnborg.org>
 <20190124094646.GR3271@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20190124094646.GR3271@phenom.ffwll.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>, DRI Development <dri-devel@lists.freedesktop.org>, virtualization@lists.linux-foundation.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org, nouveau@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, spice-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, linux-mediatek@lists.infradead.org, Rodrigo Vivi <rod>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMjQsIDIwMTkgYXQgMTA6NDY6NDdBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEphbiAyMywgMjAxOSBhdCAwNjowMDoxNVBNICswMTAwLCBTYW0gUmF2
bmJvcmcgd3JvdGU6Cj4gPiBIaSBEYW5pZWwuCj4gPiAKPiA+IE9uIFRodSwgSmFuIDE3LCAyMDE5
IGF0IDEwOjAzOjM0UE0gKzAxMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IEhhdmluZyB0
aGUgcHJvYmUgaGVscGVyIHN0dWZmICh3aGljaCBwcmV0dHkgbXVjaCBldmVyeW9uZSBuZWVkcykg
aW4KPiA+ID4gdGhlIGRybV9jcnRjX2hlbHBlci5oIGZpbGUgKHdoaWNoIGF0b21pYyBkcml2ZXJz
IHNob3VsZCBuZXZlciBuZWVkKSBpcwo+ID4gPiBjb25mdXNpbmcuIFNwbGl0IHRoZW0gb3V0Lgo+
ID4gPiAKPiA+ID4gVG8gbWFrZSBzdXJlIEkgYWN0dWFsbHkgYWNoaWV2ZWQgdGhlIGdvYWwgaGVy
ZSBJIHdlbnQgdGhyb3VnaCBhbGwKPiA+ID4gZHJpdmVycy4gQW5kIGluZGVlZCwgYWxsIGF0b21p
YyBkcml2ZXJzIGFyZSBub3cgZnJlZSBvZgo+ID4gPiBkcm1fY3J0Y19oZWxwZXIuaCBpbmNsdWRl
cy4KPiA+IAo+ID4gSG93IGFyZSB0aGUgcGxhbnMgdG8gZ2V0IHRoaXMgcGF0Y2hzZXQgbWVyZ2Vk
Pwo+ID4gVGhlcmUgd2VyZSBkZXBlbmRlbmNpZXMgb24gb25naW5nIGRybVAuaCByZW1vdmFsIGlu
IGk5MTUgSUlSQz8KPiA+IEkgZ3Vlc3MgbXkgIk1pbmltaXplIGRybVAuaCBkZXBlbmRlbmNpZXMi
IHBhdGNoLXNldCBhbHNvIGhhdmUgYSByb2xlIGluIHRoaXMuCj4gCj4gV29ya2luZyBvbiBpdCwg
YSBwdWxsIHJlcXVlc3QgZ290IGxvc3QuIEkgb3JpZ2luYWxseSB3YW50ZWQgdG8gZ2V0IHRoaXMK
PiBhbGwgcmVzb2x2ZWQgdGhpcyB3ZWVrLCBwcm9iYWJseSBnb2luZyB0byBiZSBuZXh0IHdlZWsg
bm93IDotKAoKV2UncmUgbHVja3ksIGFsbCBzb3J0ZWQgbm93ICYgcGF0Y2ggbWVyZ2VkLiBJJ20g
YWxzbyBtZXJnaW5nIHlvdXIgc2VyaWVzLApjb3JyZWN0bHkgaW50ZXJsZWF2ZWQuCi1EYW5pZWwK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
