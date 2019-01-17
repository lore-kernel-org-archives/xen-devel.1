From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: Split out drm_probe_helper.h
Date: Thu, 17 Jan 2019 17:45:41 +0100
Message-ID: <20190117164541.GE3271__9469.18548220328$1547743471$gmane$org@phenom.ffwll.local>
References: <20190116163442.12622-1-daniel.vetter@ffwll.ch>
 <20190116181018.GA27364@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20190116181018.GA27364@ravnborg.org>
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

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDc6MTA6MThQTSArMDEwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIERhbmllbC4KPiAKPiA+IHY1OiBBY3R1YWxseSB0cnkgdG8gc29ydCB0aGVtLCBh
bmQgd2hpbGUgYXQgaXQsIHNvcnQgYWxsIHRoZSBvbmVzIEkKPiA+IHRvdWNoLgo+IAo+IEFwcGxp
ZWQgdGhpcyB2YXJpYW50IG9uIHRvcCBvZiBkcm0tbWlzYyBhbmQgZGlkIGEgYnVpbGQgdGVzdC4K
PiBMb29rZWQgZ29vZCBmb3IgaWE2NCwgeDg2IGFuZCBhbHBoYS4KPiAKPiBUb29rIGEgY2xvc2Vy
IGxvb2sgYXQgdGhlIGNoYW5nZXMgdG8gYXRtZWxfaGxjZCAtIGFuZCB0aGV5IGxvb2tlZCBPSy4K
PiAKPiBCdXQgSSBub3RpY2VkIHRoYXQgYXRtZWxfaGxjZGMgdXNlcyBvbmx5IGRybV9rbXNfaGVs
cGVyX3BvbGxfaW5pdCgpIGFuZAo+IGRybV9rbXNfaGVscGVyX3BvbGxfZmluaSgpLgo+IEJ1dCB0
aGVyZSBhcmUgbm8gaGl0cyBvbiBEUk1fQ09OTkVDVE9SX1BPTEwgLSBzbyBJIHRoaW5rIHdlIG1h
eWJlCj4gaGF2ZSBhIGRyaXZlciBoZXJlIHdoZXJlIHdlIGhhdmUgcGx1Z2dlZCB0aGUgZHJtX3Bv
bGwgaW5mcmFzdHJ1Y3R1cmUsCj4gYnV0IGl0IGlzIG5vdCBpbiB1c2UuCj4gCj4gPiAgaW5jbHVk
ZS9kcm0vZHJtX2NydGNfaGVscGVyLmggICAgICAgICAgICAgICAgIHwgMTYgLS0tLS0tLS0tLS0K
PiAKPiBUaGUgbGlzdCBvZiBpbmNsdWRlIGZpbGVzIGluIHRoaXMgZmlsZSBjb3VsZCBiZSBkcm9w
cGVkIGFuZCByZXBsYWNlZCBieToKPiBzdHJ1Y3QgZHJtX2Nvbm5lY3RvcjsKPiBzdHJ1Y3QgZHJt
X2RldmljZTsKPiBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZTsKPiBzdHJ1Y3QgZHJtX2VuY29kZXI7
Cj4gc3RydWN0IGRybV9mcmFtZWJ1ZmZlcjsKPiBzdHJ1Y3QgZHJtX21vZGVfc2V0Owo+IHN0cnVj
dCBkcm1fbW9kZXNldF9hY3F1aXJlX2N0eDsKPiAKPiBJIHRyaWVkIHRvIGRvIHNvIG9uIHRvcCBv
ZiB5b3VyIHBhdGNoLgo+IEJ1dCB0aGVyZSB3ZXJlIHRvbyBtYW55IGJ1aWxkIGVycnJvcyBhbmQg
SSBzb21laG93IGxvc3QgdGhlIG1vdGl2YXRpb24uCgpZZWFoIHRoZSBkcm1fY3J0Y19oZWxwZXIu
aCBoZWFkZXIgaXMgYSBiaXQgdGhlIG1pbmlhdHVyZSBkcm1QLmggZm9yIGxlZ2FjeQprbXMgZHJp
dmVycy4gSnVzdCByZW1vdmluZyBpdCBmcm9tIGFsbCB0aGUgYXRvbWljIGRyaXZlcnMgY2F1c2Vk
IGxvdHMgb2YKZmFsbG91dCwgSSBleHBlY3QgZXZlbiBtb3JlIGlmIHlvdSBlbnRpcmVseSByZW1v
dmUgdGhlIGluY2x1ZGVzIGl0IGhhcy4KTWF5YmUgYSB0b2RvLCBjYXJlIHRvIHBscyBjcmVhdGUg
dGhhdCBwYXRjaCBzaW5jZSBpdCdzIHlvdXIgaWRlYT8KLURhbmllbAoKPiAKPiAKPiA+ICBpbmNs
dWRlL2RybS9kcm1fcHJvYmVfaGVscGVyLmggICAgICAgICAgICAgICAgfCAyNyArKysrKysrKysr
KysrKysrKysrCj4gVGhpcyBvbiB0aGUgb3RoZXIgaGFuZCBpcyBmaW5lIC0gYXMgZXhwZWN0ZWQg
YXMgdGhpcyBpcyBhIG5ldyBmaWxlLgo+IAo+IEJ1dCB0aGUgYWJvdmUgaXMganVzdCBzb21lIHJh
bmRvbSBjb21tZW50cyBzbzoKPiAKPiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
