From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: Split out drm_probe_helper.h
Date: Wed, 16 Jan 2019 19:10:18 +0100
Message-ID: <20190116181018.GA27364__15889.3228894614$1547662185$gmane$org@ravnborg.org>
References: <20190116163442.12622-1-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20190116163442.12622-1-daniel.vetter@ffwll.ch>
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

SGkgRGFuaWVsLgoKPiB2NTogQWN0dWFsbHkgdHJ5IHRvIHNvcnQgdGhlbSwgYW5kIHdoaWxlIGF0
IGl0LCBzb3J0IGFsbCB0aGUgb25lcyBJCj4gdG91Y2guCgpBcHBsaWVkIHRoaXMgdmFyaWFudCBv
biB0b3Agb2YgZHJtLW1pc2MgYW5kIGRpZCBhIGJ1aWxkIHRlc3QuCkxvb2tlZCBnb29kIGZvciBp
YTY0LCB4ODYgYW5kIGFscGhhLgoKVG9vayBhIGNsb3NlciBsb29rIGF0IHRoZSBjaGFuZ2VzIHRv
IGF0bWVsX2hsY2QgLSBhbmQgdGhleSBsb29rZWQgT0suCgpCdXQgSSBub3RpY2VkIHRoYXQgYXRt
ZWxfaGxjZGMgdXNlcyBvbmx5IGRybV9rbXNfaGVscGVyX3BvbGxfaW5pdCgpIGFuZApkcm1fa21z
X2hlbHBlcl9wb2xsX2ZpbmkoKS4KQnV0IHRoZXJlIGFyZSBubyBoaXRzIG9uIERSTV9DT05ORUNU
T1JfUE9MTCAtIHNvIEkgdGhpbmsgd2UgbWF5YmUKaGF2ZSBhIGRyaXZlciBoZXJlIHdoZXJlIHdl
IGhhdmUgcGx1Z2dlZCB0aGUgZHJtX3BvbGwgaW5mcmFzdHJ1Y3R1cmUsCmJ1dCBpdCBpcyBub3Qg
aW4gdXNlLgoKPiAgaW5jbHVkZS9kcm0vZHJtX2NydGNfaGVscGVyLmggICAgICAgICAgICAgICAg
IHwgMTYgLS0tLS0tLS0tLS0KClRoZSBsaXN0IG9mIGluY2x1ZGUgZmlsZXMgaW4gdGhpcyBmaWxl
IGNvdWxkIGJlIGRyb3BwZWQgYW5kIHJlcGxhY2VkIGJ5OgpzdHJ1Y3QgZHJtX2Nvbm5lY3RvcjsK
c3RydWN0IGRybV9kZXZpY2U7CnN0cnVjdCBkcm1fZGlzcGxheV9tb2RlOwpzdHJ1Y3QgZHJtX2Vu
Y29kZXI7CnN0cnVjdCBkcm1fZnJhbWVidWZmZXI7CnN0cnVjdCBkcm1fbW9kZV9zZXQ7CnN0cnVj
dCBkcm1fbW9kZXNldF9hY3F1aXJlX2N0eDsKCkkgdHJpZWQgdG8gZG8gc28gb24gdG9wIG9mIHlv
dXIgcGF0Y2guCkJ1dCB0aGVyZSB3ZXJlIHRvbyBtYW55IGJ1aWxkIGVycnJvcyBhbmQgSSBzb21l
aG93IGxvc3QgdGhlIG1vdGl2YXRpb24uCgoKPiAgaW5jbHVkZS9kcm0vZHJtX3Byb2JlX2hlbHBl
ci5oICAgICAgICAgICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysrKwpUaGlzIG9uIHRoZSBv
dGhlciBoYW5kIGlzIGZpbmUgLSBhcyBleHBlY3RlZCBhcyB0aGlzIGlzIGEgbmV3IGZpbGUuCgpC
dXQgdGhlIGFib3ZlIGlzIGp1c3Qgc29tZSByYW5kb20gY29tbWVudHMgc286CgpBY2tlZC1ieTog
U2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
