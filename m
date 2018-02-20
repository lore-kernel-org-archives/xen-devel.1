From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] build: remove shim related targets
Date: Tue, 20 Feb 2018 11:34:38 +0000
Message-ID: <20180220113438.5a35fzb3welw2ck2@citrix.com>
References: <5A8ADDCD02000078001A908E@prv-mh.provo.novell.com>
 <20180220082351.24967-1-roger.pau@citrix.com>
 <20180220111747.kjxvxiuqipjdbfcu@citrix.com>
 <20180220112644.ckwhclrdb2vokfv4@MacBook-Pro-de-Roger.local>
 <20180220112958.2wdpaamckm7dl5sr@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/hv3=fo=citrix.com=prvs=582e2aa9c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eo6C0-0002hR-MM
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 11:34:40 +0000
Content-Disposition: inline
In-Reply-To: <20180220112958.2wdpaamckm7dl5sr@citrix.com>
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

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMTE6Mjk6NThBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIEZlYiAyMCwgMjAxOCBhdCAxMToyNjo0NEFNICswMDAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMTE6MTc6NDdBTSArMDAwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gT24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMDg6MjM6NTFBTSAr
MDAwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gPiA+IFRoZXJlJ3Mgbm8gbmVlZCB0byBo
YXZlIHNoaW0gc3BlY2lmaWMgdGFyZ2V0cywgc28ganVzdCB1c2UgdGhlIHJlZ3VsYXIKPiA+ID4g
PiB4ZW4gbWFrZWZpbGUgdGFyZ2V0cyBpbiBvcmRlciB0byBidWlsZCB0aGUgc2hpbSBiaW5hcnku
Cj4gPiA+ID4gCj4gPiA+ID4gV2hlbiB0aGUgc2hpbSBpcyBidWlsZCBhcyBwYXJ0IG9mIHRoZSBm
aXJtd2FyZSBkaXJlY3RvcnkgdXNlIHRoZQo+ID4gPiA+IHhlbi1zeW1zIGFzIHRoZSBzaGltIGJp
bmFyeS4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L01h
a2VmaWxlIGIveGVuL2FyY2gveDg2L01ha2VmaWxlCj4gPiA+ID4gaW5kZXggMzg5MDk2MTM5Yy4u
NTU2M2M4MTNkZCAxMDA2NDQKPiA+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvTWFrZWZpbGUKPiA+
ID4gPiArKysgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKPiA+ID4gPiBAQCAtNzgsMTIgKzc4LDEy
IEBAIGVmaS15IDo9ICQoc2hlbGwgaWYgWyAhIC1yICQoQkFTRURJUikvaW5jbHVkZS94ZW4vY29t
cGlsZS5oIC1vIFwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgIC1PICQoQkFTRURJUikv
aW5jbHVkZS94ZW4vY29tcGlsZS5oIF07IHRoZW4gXAo+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZWNobyAnJChUQVJHRVQpLmVmaSc7IGZpKQo+ID4gPiA+ICAKPiA+ID4gPiAtc2hp
bS0kKENPTkZJR19QVkhfR1VFU1QpIDo9ICQoVEFSR0VUKS1zaGltCj4gPiA+ID4gLQo+ID4gPiA+
ICBpZm5lcSAoJChidWlsZF9pZF9saW5rZXIpLCkKPiA+ID4gPiAgbm90ZXNfcGhkcnMgPSAtLW5v
dGVzCj4gPiA+ID4gIGVsc2UKPiA+ID4gPiAtbm90ZXNfcGhkcnMgPQo+ID4gPiA+ICtpZmVxICgk
KENPTkZJR19QVkhfR1VFU1QpLHkpCj4gPiA+ID4gK25vdGVzX3BoZHJzID0gLS1ub3Rlcwo+ID4g
PiA+ICtlbmRpZgo+ID4gPiA+ICBlbmRpZgo+ID4gPiA+ICAKPiA+ID4gCj4gPiA+IFRoZSBtYW51
YWwgc3VnZ2VzdHMgZm9sbG93aW5nIHN5bnRheCBpcyBzdXBwb3J0ZWQ6Cj4gPiA+IAo+ID4gPiAK
PiA+ID4gICBjb25kaXRpb25hbC1kaXJlY3RpdmUtb25lCj4gPiA+ICAgdGV4dC1pZi1vbmUtaXMt
dHJ1ZQo+ID4gPiAgIGVsc2UgY29uZGl0aW9uYWwtZGlyZWN0aXZlLXR3bwo+ID4gPiAgIHRleHQt
aWYtdHdvLWlzLXRydWUKPiA+ID4gICBlbHNlCj4gPiA+ICAgdGV4dC1pZi1vbmUtYW5kLXR3by1h
cmUtZmFsc2UKPiA+ID4gICBlbmRpZgo+ID4gPiAKPiA+ID4gSSBzbGlnaHRseSBwcmVmZXIKPiA+
ID4gCj4gPiA+ICAgIGlmbmVxIGJ1aWxkX2lkX2xpbmtlcgo+ID4gPiAgICBub3Rlc19waGRycyA9
IC4uLgo+ID4gPiAgICBlbHNlIGlmIENPTkZJR19QVkhfR1VFU1QKPiA+ID4gICAgbm90ZXNfcGhk
cnMgPSAuLi4KPiA+ID4gICAgZWxzZQo+ID4gPiAgICBub3Rlc19waGRycyA9Cj4gPiA+ICAgIGVu
ZGlmCj4gPiAKPiA+IElzIHRoaXMgc3VwcG9ydGVkIGJ5IG1ha2UgMy44MD8KPiA+IAo+ID4gSmFu
IHBvaW50ZWQgb3V0IGluIGFub3RoZXIgdGhyZWFkIHRoYXQgdXNpbmcgImVsc2UgaWYiIG9uIGEg
c2luZ2xlCj4gPiBsaW5lIGlzIG5vdCBzdXBwb3J0ZWQgYnkgMy44MDoKPiA+IAo+ID4gaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTAyL21z
ZzAxNjU5Lmh0bWwKPiA+IAoKQWN0dWFsbHksIHNlZQoKaHR0cHM6Ly93d3cuY2wuY2FtLmFjLnVr
L3RlYWNoaW5nLzEwMTEvVW5peFRvb2xzL21ha2UucGRmCgoKaHR0cDovL3d3dy5kZWxvcmllLmNv
bS9nbnUvZG9jcy9tYWtlL21ha2VfNzcuaHRtbAoKTWFrZSAzLjgyIG1hbnVhbCBzdXBwb3J0cyB0
aGF0IHN5bnRheC4gQnV0IDMuODAgZG9lc24ndC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
