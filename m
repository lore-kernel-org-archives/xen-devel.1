From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] build: remove shim related targets
Date: Tue, 20 Feb 2018 11:29:58 +0000
Message-ID: <20180220112958.2wdpaamckm7dl5sr@citrix.com>
References: <5A8ADDCD02000078001A908E@prv-mh.provo.novell.com>
 <20180220082351.24967-1-roger.pau@citrix.com>
 <20180220111747.kjxvxiuqipjdbfcu@citrix.com>
 <20180220112644.ckwhclrdb2vokfv4@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/hv3=fo=citrix.com=prvs=582e2aa9c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eo67a-00020O-Mz
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 11:30:06 +0000
Content-Disposition: inline
In-Reply-To: <20180220112644.ckwhclrdb2vokfv4@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMTE6MjY6NDRBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIEZlYiAyMCwgMjAxOCBhdCAxMToxNzo0N0FNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMDg6MjM6NTFBTSArMDAwMCwg
Um9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gPiBUaGVyZSdzIG5vIG5lZWQgdG8gaGF2ZSBzaGlt
IHNwZWNpZmljIHRhcmdldHMsIHNvIGp1c3QgdXNlIHRoZSByZWd1bGFyCj4gPiA+IHhlbiBtYWtl
ZmlsZSB0YXJnZXRzIGluIG9yZGVyIHRvIGJ1aWxkIHRoZSBzaGltIGJpbmFyeS4KPiA+ID4gCj4g
PiA+IFdoZW4gdGhlIHNoaW0gaXMgYnVpbGQgYXMgcGFydCBvZiB0aGUgZmlybXdhcmUgZGlyZWN0
b3J5IHVzZSB0aGUKPiA+ID4geGVuLXN5bXMgYXMgdGhlIHNoaW0gYmluYXJ5Lgo+ID4gPiAKPiA+
ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cj4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYv
TWFrZWZpbGUKPiA+ID4gaW5kZXggMzg5MDk2MTM5Yy4uNTU2M2M4MTNkZCAxMDA2NDQKPiA+ID4g
LS0tIGEveGVuL2FyY2gveDg2L01ha2VmaWxlCj4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9NYWtl
ZmlsZQo+ID4gPiBAQCAtNzgsMTIgKzc4LDEyIEBAIGVmaS15IDo9ICQoc2hlbGwgaWYgWyAhIC1y
ICQoQkFTRURJUikvaW5jbHVkZS94ZW4vY29tcGlsZS5oIC1vIFwKPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAtTyAkKEJBU0VESVIpL2luY2x1ZGUveGVuL2NvbXBpbGUuaCBdOyB0aGVuIFwK
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBlY2hvICckKFRBUkdFVCkuZWZpJzsgZmkp
Cj4gPiA+ICAKPiA+ID4gLXNoaW0tJChDT05GSUdfUFZIX0dVRVNUKSA6PSAkKFRBUkdFVCktc2hp
bQo+ID4gPiAtCj4gPiA+ICBpZm5lcSAoJChidWlsZF9pZF9saW5rZXIpLCkKPiA+ID4gIG5vdGVz
X3BoZHJzID0gLS1ub3Rlcwo+ID4gPiAgZWxzZQo+ID4gPiAtbm90ZXNfcGhkcnMgPQo+ID4gPiAr
aWZlcSAoJChDT05GSUdfUFZIX0dVRVNUKSx5KQo+ID4gPiArbm90ZXNfcGhkcnMgPSAtLW5vdGVz
Cj4gPiA+ICtlbmRpZgo+ID4gPiAgZW5kaWYKPiA+ID4gIAo+ID4gCj4gPiBUaGUgbWFudWFsIHN1
Z2dlc3RzIGZvbGxvd2luZyBzeW50YXggaXMgc3VwcG9ydGVkOgo+ID4gCj4gPiAKPiA+ICAgY29u
ZGl0aW9uYWwtZGlyZWN0aXZlLW9uZQo+ID4gICB0ZXh0LWlmLW9uZS1pcy10cnVlCj4gPiAgIGVs
c2UgY29uZGl0aW9uYWwtZGlyZWN0aXZlLXR3bwo+ID4gICB0ZXh0LWlmLXR3by1pcy10cnVlCj4g
PiAgIGVsc2UKPiA+ICAgdGV4dC1pZi1vbmUtYW5kLXR3by1hcmUtZmFsc2UKPiA+ICAgZW5kaWYK
PiA+IAo+ID4gSSBzbGlnaHRseSBwcmVmZXIKPiA+IAo+ID4gICAgaWZuZXEgYnVpbGRfaWRfbGlu
a2VyCj4gPiAgICBub3Rlc19waGRycyA9IC4uLgo+ID4gICAgZWxzZSBpZiBDT05GSUdfUFZIX0dV
RVNUCj4gPiAgICBub3Rlc19waGRycyA9IC4uLgo+ID4gICAgZWxzZQo+ID4gICAgbm90ZXNfcGhk
cnMgPQo+ID4gICAgZW5kaWYKPiAKPiBJcyB0aGlzIHN1cHBvcnRlZCBieSBtYWtlIDMuODA/Cj4g
Cj4gSmFuIHBvaW50ZWQgb3V0IGluIGFub3RoZXIgdGhyZWFkIHRoYXQgdXNpbmcgImVsc2UgaWYi
IG9uIGEgc2luZ2xlCj4gbGluZSBpcyBub3Qgc3VwcG9ydGVkIGJ5IDMuODA6Cj4gCj4gaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTAyL21z
ZzAxNjU5Lmh0bWwKPiAKCk9oIGlmIHRoZXJlIGlzIGEgc3VjaCByZWFzb24gdGhlbiBpdCBpcyBm
aW5lIHRvIGtlZXAgdGhlIGNvZGUgYXMtaXMuCkkgZG9uJ3QgaGF2ZSBtYWtlIDMuOCBhcm91bmQg
dG8gdHJ5IGl0IG91dC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
