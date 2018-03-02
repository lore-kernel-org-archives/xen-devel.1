From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] fuzz/x86_emulate: fix bounds for input
 size
Date: Fri, 2 Mar 2018 12:30:11 +0000
Message-ID: <20180302123011.iapimbwog7fcznat@citrix.com>
References: <20180223163009.b42xfl3euanth3b7@citrix.com>
 <20180223224857.10212-1-semelpaul@gmail.com>
 <20180226103340.xks2pk5ix5nw3bsq@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lugh=fy=citrix.com=prvs=592fbcc37=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1erjpN-0008Tj-3t
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 12:30:21 +0000
Content-Disposition: inline
In-Reply-To: <20180226103340.xks2pk5ix5nw3bsq@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Semel <semelpaul@gmail.com>
Cc: george.dunlap@eu.citrix.com, xen-devel@lists.xenproject.org, wei.liu2@citrix.com, JBeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMjYsIDIwMTggYXQgMTA6MzM6NDBBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIEZlYiAyMywgMjAxOCBhdCAxMTo0ODo1N1BNICswMTAwLCBQYXVsIFNlbWVsIHdy
b3RlOgo+ID4gVGhlIG1heGltdW0gc2l6ZSBmb3IgdGhlIGlucHV0IHNpemUgd2FzIHNldCB0byBJ
TlBVVF9TSVpFLCB3aGljaCBpcyBhY3R1YWxseQo+ID4gdGhlIHNpemUgb2YgdGhlIGRhdGEgYXJy
YXkgaW5zaWRlIHRoZSBmdXp6X2NvcnB1cyBzdHJ1Y3R1cmUgYW5kIHNvIHdhcyBub3QKPiA+IGFi
bGluZyB1c2VyIChvciBBRkwpIHRvIGZpbGwgaW4gdGhlIHdob2xlIHN0cnVjdHVyZS4gQ2hhbmdp
bmcgdG8KPiA+IHNpemVvZihzdHJ1Y3QgZnV6el9jb3JwdXMpIGNvcnJlY3QgdGhpcyBwcm9ibGVt
Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIFNlbWVsIDxzZW1lbHBhdWxAZ21haWwuY29t
Pgo+IAo+IEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKQXBwbGllZC4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
