From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 4/3] x86/HVM: hvm_map_guest_frame_rw()
 should respect p2m_ioreq_server
Date: Tue, 13 Nov 2018 10:54:47 +0000
Message-ID: <b51b339f4e4249e5af6792046f8be8b7@AMSPEX02CL03.citrite.net>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BEAAB8802000078001FB62A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=89dt=ny=citrix.com=prvs=84824ace7=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gMWLJ-0006MG-Ve
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 10:54:50 +0000
In-Reply-To: <5BEAAB8802000078001FB62A@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTMgTm92ZW1iZXIgMjAxOCAxMDo0Nwo+IFRvOiB4
ZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IEphbiBCZXVsaWNoCj4g
PEpCZXVsaWNoQHN1c2UuY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0Bj
aXRyaXguY29tPjsgUGF1bCBEdXJyYW50Cj4gPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggNC8zXSB4ODYvSFZN
OiBodm1fbWFwX2d1ZXN0X2ZyYW1lX3J3KCkgc2hvdWxkIHJlc3BlY3QKPiBwMm1faW9yZXFfc2Vy
dmVyCj4gCj4gV3JpdGVzIHRvIHN1Y2ggcGFnZXMgd291bGQgbmVlZCB0byBiZSBoYW5kZWQgdG8g
dGhlIGVtdWxhdG9yLCB3aGljaCB3ZSdyZQo+IG5vdCBwcmVwYXJlZCB0byBkbyBhdCB0aGlzIHBv
aW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
ClBhdGNoICM0IG91dCBvZiAzPyA6LSkKClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwu
ZHVycmFudEBjaXRyaXguY29tPgoKPiAKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4g
KysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+IEBAIC0yNTU2LDcgKzI1NTYsOCBAQCBzdGF0
aWMgdm9pZCAqX2h2bV9tYXBfZ3Vlc3RfZnJhbWUodW5zaWduCj4gCj4gICAgICBpZiAoIHdyaXRh
YmxlICkKPiAgICAgIHsKPiAtICAgICAgICBpZiAoIHVubGlrZWx5KHAybV9pc19kaXNjYXJkX3dy
aXRlKHAybXQpKSApCj4gKyAgICAgICAgaWYgKCB1bmxpa2VseShwMm1faXNfZGlzY2FyZF93cml0
ZShwMm10KSkgfHwKPiArICAgICAgICAgICAgIHVubGlrZWx5KHAybXQgPT0gcDJtX2lvcmVxX3Nl
cnZlcikgKQo+ICAgICAgICAgICAgICAqd3JpdGFibGUgPSAwOwo+ICAgICAgICAgIGVsc2UgaWYg
KCAhcGVybWFuZW50ICkKPiAgICAgICAgICAgICAgcGFnaW5nX21hcmtfcGZuX2RpcnR5KGQsIF9w
Zm4oZ2ZuKSk7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
