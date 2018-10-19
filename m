From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 16/16] x86: update help string for
 CONFIG_HVM
Date: Fri, 19 Oct 2018 16:55:43 +0100
Message-ID: <a5552bcf-b430-ef93-5de9-dd3dde615a98@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <eef811a9adaa6ef2a21dfeef32f1fc6431b81778.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wxwm=m7=citrix.com=prvs=8238c2210=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gDX7q-0005Wr-4k
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 15:55:46 +0000
In-Reply-To: <eef811a9adaa6ef2a21dfeef32f1fc6431b81778.1539959287.git-series.wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTAvMTggMTU6MjgsIFdlaSBMaXUgd3JvdGU6Cj4gQ2hhbmdlICJndWVzdCIgdG8gImRv
bWFpbiIgd2hlcmUgYXBwcm9wcmlhdGUgYmVjYXVzZSAiZ3Vlc3QiIGRvZXNuJ3QKPiBpbmNsdWRl
IERvbWFpbiAwLgo+Cj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KPiAtLS0KPiB2MjogbmV3Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9LY29uZmlnIHwgOCArKysr
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnIGIveGVuL2FyY2gveDg2L0tjb25m
aWcKPiBpbmRleCBjN2U5N2UyLi5iNGJkODNlIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9L
Y29uZmlnCj4gKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcKPiBAQCAtNzAsMTIgKzcwLDEyIEBA
IGNvbmZpZyBIVk0KPiAgCWRlZl9ib29sICFQVl9TSElNX0VYQ0xVU0lWRQo+ICAJcHJvbXB0ICJI
Vk0gc3VwcG9ydCIKPiAgCS0tLWhlbHAtLS0KPiAtCSAgSW50ZXJmYWNlcyB0byBzdXBwb3J0IEhW
TSBndWVzdHMgd2hpY2ggcmVxdWlyZSBoYXJkd2FyZQo+ICsJICBJbnRlcmZhY2VzIHRvIHN1cHBv
cnQgSFZNIGRvbWFpbnMgd2hpY2ggcmVxdWlyZSBoYXJkd2FyZQo+ICAJICBzdXBwb3J0IGxpa2Ug
SW50ZWwncyBWVC14IG9yIEFNRCdzIFNWTS4gTm90ZSB0aGUgaHlwZXJ2aXNvcgo+IC0JICBkb2Vz
bid0IGRpc3Rpbmd1aXNoIEhWTSBvciBQVkggZ3Vlc3QgdHlwZXMuIFBWSCBndWVzdCB0eXBlCj4g
LQkgIGlzIG9ubHkgYSBjb25jZXB0IGZvciBlbmQgdXNlcnMuCj4gKwkgIGRvZXNuJ3QgZGlzdGlu
Z3Vpc2ggSFZNIG9yIFBWSC4gUFZIIGlzIG9ubHkgYSBjb25jZXB0IGZvcgo+ICsJICBlbmQgdXNl
cnMuCgpNYXRjaGluZyB0aGUgUFYgc3VnZ2VzdGlvbiwgaG93IGFib3V0OgoKSW50ZXJmYWNlcyB0
byBzdXBwb3J0IEhWTSBkb21haW5zLsKgIEhWTSBkb21haW5zIHJlcXVpcmVzIGhhcmR3YXJlCnZp
cnR1YWxpc2F0aW9uIGV4dGVuc2lvbnMgKGUuZy4gSW50ZWwgVlQteCwgQU1EIFNWTSksIGJ1dCBj
YW4gYm9vdApndWVzdHMgd2hpY2ggaGF2ZSBubyBzcGVjaWZpYyBYZW4ga25vd2xlZGdlLgoKPwoK
fkFuZHJldwoKPiAgCj4gLQkgIFRoaXMgb3B0aW9uIGlzIG5lZWRlZCBpZiB5b3Ugd2FudCB0byBy
dW4gSFZNIG9yIFBWSCBndWVzdHMuCj4gKwkgIFRoaXMgb3B0aW9uIGlzIG5lZWRlZCBpZiB5b3Ug
d2FudCB0byBydW4gSFZNIG9yIFBWSCBkb21haW5zLgo+ICAKPiAgCSAgSWYgdW5zdXJlLCBzYXkg
WS4KPiAgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
