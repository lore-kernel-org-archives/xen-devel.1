From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: Split out drm_probe_helper.h
Date: Wed, 23 Jan 2019 18:00:15 +0100
Message-ID: <20190123170015.GA23138__28653.8168716774$1548262912$gmane$org@ravnborg.org>
References: <20190116181018.GA27364@ravnborg.org>
 <20190117210334.13234-1-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20190117210334.13234-1-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>, DRI Development <dri-devel@lists.freedesktop.org>, virtualization@lists.linux-foundation.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org, CK Hu <ck.hu@mediatek.com>, spice-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.k
List-Id: xen-devel@lists.xenproject.org

SGkgRGFuaWVsLgoKT24gVGh1LCBKYW4gMTcsIDIwMTkgYXQgMTA6MDM6MzRQTSArMDEwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBIYXZpbmcgdGhlIHByb2JlIGhlbHBlciBzdHVmZiAod2hpY2gg
cHJldHR5IG11Y2ggZXZlcnlvbmUgbmVlZHMpIGluCj4gdGhlIGRybV9jcnRjX2hlbHBlci5oIGZp
bGUgKHdoaWNoIGF0b21pYyBkcml2ZXJzIHNob3VsZCBuZXZlciBuZWVkKSBpcwo+IGNvbmZ1c2lu
Zy4gU3BsaXQgdGhlbSBvdXQuCj4gCj4gVG8gbWFrZSBzdXJlIEkgYWN0dWFsbHkgYWNoaWV2ZWQg
dGhlIGdvYWwgaGVyZSBJIHdlbnQgdGhyb3VnaCBhbGwKPiBkcml2ZXJzLiBBbmQgaW5kZWVkLCBh
bGwgYXRvbWljIGRyaXZlcnMgYXJlIG5vdyBmcmVlIG9mCj4gZHJtX2NydGNfaGVscGVyLmggaW5j
bHVkZXMuCgpIb3cgYXJlIHRoZSBwbGFucyB0byBnZXQgdGhpcyBwYXRjaHNldCBtZXJnZWQ/ClRo
ZXJlIHdlcmUgZGVwZW5kZW5jaWVzIG9uIG9uZ2luZyBkcm1QLmggcmVtb3ZhbCBpbiBpOTE1IElJ
UkM/CkkgZ3Vlc3MgbXkgIk1pbmltaXplIGRybVAuaCBkZXBlbmRlbmNpZXMiIHBhdGNoLXNldCBh
bHNvIGhhdmUgYSByb2xlIGluIHRoaXMuCgpUaGlzIGRvZXMgbm90IGhvbGQgdXAgYW55IHdvcmsg
b2YgbWluZSwgbWFpbmx5IHdhbnRlZCB0byBtYWtlCnN1cmUgdGhpcyB3YXMgbm90IGxvc3QgYmV0
d2VlbiBhbGwgdGhlIG90aGVyIHBhdGNoZXMuCgoJU2FtCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
