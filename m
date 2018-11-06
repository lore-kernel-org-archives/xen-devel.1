From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 3/3] tools: ipxe: Correct download error
 handling
Date: Tue, 6 Nov 2018 08:44:02 +0000
Message-ID: <0173f7a0d3414cfbb1034c8477c4437e@AMSPEX02CL03.citrite.net>
References: <20181105184234.31603-1-ian.jackson@eu.citrix.com>
 <20181105184234.31603-3-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9pgl=nr=citrix.com=prvs=84117823e=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gJwxy-0002Uf-0q
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 08:44:06 +0000
In-Reply-To: <20181105184234.31603-3-ian.jackson@eu.citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIFttYWlsdG86
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbV0KPiBTZW50OiAwNSBOb3ZlbWJlciAyMDE4IDE4OjQz
Cj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBJYW4gSmFja3NvbiA8
SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFBhdWwgRHVycmFudAo+IDxQYXVsLkR1cnJhbnRAY2l0
cml4LmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gU3ViamVjdDogW1BBVENI
IDMvM10gdG9vbHM6IGlweGU6IENvcnJlY3QgZG93bmxvYWQgZXJyb3IgaGFuZGxpbmcKPiAKPiBU
aGlzIHNoZWxsIGZyYWdtZW50IGxhY2tlZCBzZXQgLWUuICBTbywgZWcgaWYgdGhlIGRvd25sb2Fk
IGZhaWxlZCBhCj4gYnJva2VuIGlweGUudGFyLmd6IHdvdWxkIGJlIGxlZnQgYmVoaW5kLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+
IENDOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IENDOiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5k
dXJyYW50QGNpdHJpeC5jb20+Cgo+IC0tLQo+ICB0b29scy9maXJtd2FyZS9ldGhlcmJvb3QvTWFr
ZWZpbGUgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9maXJtd2FyZS9ldGhlcmJvb3QvTWFrZWZpbGUK
PiBiL3Rvb2xzL2Zpcm13YXJlL2V0aGVyYm9vdC9NYWtlZmlsZQo+IGluZGV4IDM4NjhmODc2ZWEu
LmZkOGRmZGY1YTcgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvZmlybXdhcmUvZXRoZXJib290L01ha2Vm
aWxlCj4gKysrIGIvdG9vbHMvZmlybXdhcmUvZXRoZXJib290L01ha2VmaWxlCj4gQEAgLTMzLDcg
KzMzLDcgQEAgJChST00pOiAkKFJPTVMpCj4gIAkkKE1BS0UpIC1DICREL3NyYyBiaW4vJCgqRiku
cm9tCj4gCj4gICRUOgo+IC0JaWYgISAkKEZFVENIRVIpIF8kVCAkKElQWEVfVEFSQkFMTF9VUkwp
OyB0aGVuIFwKPiArCXNldCAtZTsgaWYgISAkKEZFVENIRVIpIF8kVCAkKElQWEVfVEFSQkFMTF9V
UkwpOyB0aGVuIFwKPiAgCQkkKEdJVCkgY2xvbmUgJChJUFhFX0dJVF9VUkwpICRELmdpdDsgXAo+
ICAJCShjZCAkRC5naXQgJiYgJChHSVQpIGFyY2hpdmUgLS1mb3JtYXQ9dGFyIC0tcHJlZml4PSRE
LyBcCj4gIAkJJChJUFhFX0dJVF9UQUcpIHwgZ3ppcCAtbiA+Li4vXyRUKTsgXAo+IC0tCj4gMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
