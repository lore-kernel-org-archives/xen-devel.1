From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 8/9] xen/consoled: discard NUL from guest
Date: Fri, 19 Jan 2018 15:25:28 +0000
Message-ID: <20180119152528.iehyehmjoffvcjqg@citrix.com>
References: <20180118181652.26397-1-wei.liu2@citrix.com>
 <20180118181652.26397-9-wei.liu2@citrix.com>
 <20180119110302.x7fm2txqjqqamfyi@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pswu=eo=citrix.com=prvs=5505d9d7e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ecYXx-00012K-0L
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 15:25:37 +0000
Content-Disposition: inline
In-Reply-To: <20180119110302.x7fm2txqjqqamfyi@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Sarah Newman <srn@prgmr.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTksIDIwMTggYXQgMTE6MDM6MDJBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEphbiAxOCwgMjAxOCBhdCAwNjoxNjo1MVBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gQWNjb3JkaW5nIHRvIFswXSwgc29tZSBwcm9ncmFtIHNlbmRzIE5VTCBm
b3IgcGFkZGluZyBwdXJwb3NlLiBXZSBjYW4KPiA+IGRpc2NhcmQgdGhlbS4KPiA+IAo+ID4gaHR0
cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS90ZXJtdXRpbHMvbWFudWFsL3Rlcm1jYXAtMS4zL2h0
bWxfbW9uby90ZXJtY2FwLmh0bWwjU0VDNwo+ID4gCj4gPiBSZXBvcnRlZC1ieTogU2FyYWggTmV3
bWFuIDxzcm5AcHJnbXIuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Cj4gCj4gQWx0aG91Z2ggSSBoYXZlIGEgc3VnZ2VzdGlvbiBiZWxvdy4KPiAK
PiA+IC0tLQo+ID4gQ2M6IFNhcmFoIE5ld21hbiA8c3JuQHByZ21yLmNvbT4KPiA+IENjOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KPiA+IAo+ID4gQSBiaXQgUkZDLiBBd2FpdGluZyB0ZXN0IHJlc3VsdHMuCj4g
PiAtLS0KPiA+ICB4ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGVkLmMgfCA0ICsrKy0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGVkLmMgYi94ZW4vZHJpdmVycy9jaGFyL2Nv
bnNvbGVkLmMKPiA+IGluZGV4IDU1MmFiZjU3NjYuLjZmY2IyYWExMTUgMTAwNjQ0Cj4gPiAtLS0g
YS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGVkLmMKPiA+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIv
Y29uc29sZWQuYwo+ID4gQEAgLTcyLDcgKzcyLDkgQEAgc2l6ZV90IGNvbnNvbGVkX2d1ZXN0X3J4
KHZvaWQpCj4gPiAgICAgIHsKPiA+ICAgICAgICAgIGNoYXIgYyA9IGNvbnNfcmluZy0+b3V0W01B
U0tfWEVOQ09OU19JRFgoY29ucysrLCBjb25zX3JpbmctPm91dCldOwo+IAo+IFlvdSBjb3VsZCBh
bHNvIGRvOgo+IAo+IGlmICggYyA9PSAnXDAnICkKPiAgICAgY29udGludWU7Cj4gCj4gcmVjdiBB
RkFJQ1QgaXQncyBqdXN0IGEgY29zbWV0aWMgcmV0dXJuIHZhbHVlIHRoYXQncyBub3QgY29uc3Vt
ZWQgYnkKPiB0aGUgY2FsbGVyLiBUaGlzIGF2b2lkcyBjaGVja2luZyB0aGUgImlkeCA+PSBCVUZf
U1oiIGNvbmRpdGlvbiB3aXRoCj4gdGhlIHNhbWUgaWR4IHZhbHVlLgo+IAoKSSB3b3VsZCBsaWtl
IHRvIGtlZXAgdGhlIGluY3JlbWVudCBvZiByZWN2IGJ1dCBJIGxpa2UgdGhlIGlkZWEgb2Ygbm90
CnJlcGVhdGVkbHkgY2hlY2tpbmcgaWR4LiBJIHdpbGwgcmVhcnJhbmdlIHRoZSBjb2RlIGEgYml0
LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
