From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] build: remove shim related targets
Date: Tue, 20 Feb 2018 11:17:47 +0000
Message-ID: <20180220111747.kjxvxiuqipjdbfcu@citrix.com>
References: <5A8ADDCD02000078001A908E@prv-mh.provo.novell.com>
 <20180220082351.24967-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/hv3=fo=citrix.com=prvs=582e2aa9c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eo5vo-0000vQ-7l
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 11:17:56 +0000
Content-Disposition: inline
In-Reply-To: <20180220082351.24967-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMDg6MjM6NTFBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoZXJlJ3Mgbm8gbmVlZCB0byBoYXZlIHNoaW0gc3BlY2lmaWMgdGFyZ2V0cywg
c28ganVzdCB1c2UgdGhlIHJlZ3VsYXIKPiB4ZW4gbWFrZWZpbGUgdGFyZ2V0cyBpbiBvcmRlciB0
byBidWlsZCB0aGUgc2hpbSBiaW5hcnkuCj4gCj4gV2hlbiB0aGUgc2hpbSBpcyBidWlsZCBhcyBw
YXJ0IG9mIHRoZSBmaXJtd2FyZSBkaXJlY3RvcnkgdXNlIHRoZQo+IHhlbi1zeW1zIGFzIHRoZSBz
aGltIGJpbmFyeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L01ha2VmaWxlIGIveGVu
L2FyY2gveDg2L01ha2VmaWxlCj4gaW5kZXggMzg5MDk2MTM5Yy4uNTU2M2M4MTNkZCAxMDA2NDQK
PiAtLS0gYS94ZW4vYXJjaC94ODYvTWFrZWZpbGUKPiArKysgYi94ZW4vYXJjaC94ODYvTWFrZWZp
bGUKPiBAQCAtNzgsMTIgKzc4LDEyIEBAIGVmaS15IDo9ICQoc2hlbGwgaWYgWyAhIC1yICQoQkFT
RURJUikvaW5jbHVkZS94ZW4vY29tcGlsZS5oIC1vIFwKPiAgICAgICAgICAgICAgICAgICAgICAg
IC1PICQoQkFTRURJUikvaW5jbHVkZS94ZW4vY29tcGlsZS5oIF07IHRoZW4gXAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZWNobyAnJChUQVJHRVQpLmVmaSc7IGZpKQo+ICAKPiAtc2hpbS0k
KENPTkZJR19QVkhfR1VFU1QpIDo9ICQoVEFSR0VUKS1zaGltCj4gLQo+ICBpZm5lcSAoJChidWls
ZF9pZF9saW5rZXIpLCkKPiAgbm90ZXNfcGhkcnMgPSAtLW5vdGVzCj4gIGVsc2UKPiAtbm90ZXNf
cGhkcnMgPQo+ICtpZmVxICgkKENPTkZJR19QVkhfR1VFU1QpLHkpCj4gK25vdGVzX3BoZHJzID0g
LS1ub3Rlcwo+ICtlbmRpZgo+ICBlbmRpZgo+ICAKClRoZSBtYW51YWwgc3VnZ2VzdHMgZm9sbG93
aW5nIHN5bnRheCBpcyBzdXBwb3J0ZWQ6CgoKICBjb25kaXRpb25hbC1kaXJlY3RpdmUtb25lCiAg
dGV4dC1pZi1vbmUtaXMtdHJ1ZQogIGVsc2UgY29uZGl0aW9uYWwtZGlyZWN0aXZlLXR3bwogIHRl
eHQtaWYtdHdvLWlzLXRydWUKICBlbHNlCiAgdGV4dC1pZi1vbmUtYW5kLXR3by1hcmUtZmFsc2UK
ICBlbmRpZgoKSSBzbGlnaHRseSBwcmVmZXIKCiAgIGlmbmVxIGJ1aWxkX2lkX2xpbmtlcgogICBu
b3Rlc19waGRycyA9IC4uLgogICBlbHNlIGlmIENPTkZJR19QVkhfR1VFU1QKICAgbm90ZXNfcGhk
cnMgPSAuLi4KICAgZWxzZQogICBub3Rlc19waGRycyA9CiAgIGVuZGlmCgpXZWkuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
