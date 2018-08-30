From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 17/23] x86/mm: put
 paging_update_nestedmode under CONFIG_HVM
Date: Thu, 30 Aug 2018 08:42:26 +0100
Message-ID: <20180830074226.qfcxcwllii4cyanz@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <4f2a5de72552edce4bafe5d049ee89a18531ed1f.1535285866.git-series.wei.liu2@citrix.com>
 <5B8528ED02000078001E2870@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9rit=ln=citrix.com=prvs=773fe5341=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fvHb5-0002l3-Am
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 07:42:31 +0000
Content-Disposition: inline
In-Reply-To: <5B8528ED02000078001E2870@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMDQ6NTA6MjFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI2LjA4LjE4IGF0IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMKPiA+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9wYWdpbmcuYwo+ID4gQEAgLTkxOSw2ICs5MTksNyBAQCBjb25zdCBzdHJ1Y3QgcGFn
aW5nX21vZGUgKnBhZ2luZ19nZXRfbW9kZShzdHJ1Y3QgdmNwdSAqdikKPiA+ICAgICAgcmV0dXJu
IHBhZ2luZ19nZXRfbmVzdGVkbW9kZSh2KTsKPiA+ICB9Cj4gPiAgCj4gPiArI2lmZGVmIENPTkZJ
R19IVk0KPiA+ICB2b2lkIHBhZ2luZ191cGRhdGVfbmVzdGVkbW9kZShzdHJ1Y3QgdmNwdSAqdikK
PiA+ICB7Cj4gPiAgICAgIEFTU0VSVChuZXN0ZWRodm1fZW5hYmxlZCh2LT5kb21haW4pKTsKPiA+
IEBAIC05MzAsNiArOTMxLDcgQEAgdm9pZCBwYWdpbmdfdXBkYXRlX25lc3RlZG1vZGUoc3RydWN0
IHZjcHUgKnYpCj4gPiAgICAgICAgICB2LT5hcmNoLnBhZ2luZy5uZXN0ZWRtb2RlID0gTlVMTDsK
PiA+ICAgICAgaHZtX2FzaWRfZmx1c2hfdmNwdSh2KTsKPiA+ICB9Cj4gPiArI2VuZGlmCj4gCj4g
SnVzdCBhIGNvbnNpZGVyYXRpb24gKG5vIG9iamVjdGlvbik6IFdvdWxkIGl0IGJlIHdvcnRod2hp
bGUgdG8KPiBpbnRyb2R1Y2UgQ09ORklHX05FU1RFRF9IVk0gYXQgdGhlIHNhbWUgdGltZSAoZm9y
IG5vdyBoYXJkCj4gY29kZWQgdG8gWSwgYW5kIG9mIGNvdXJzZSBkZXBlbmRpbmcgb24gSFZNKSB0
byBhdm9pZCBoYXZpbmcgdG8KPiB0b3VjaCBhbGwgc3VjaCBwbGFjZXMgYSBzZWNvbmQgdGltZSBs
YXRlciBvbj8KCklmIHdlIHBsYW4gdG8gbWFrZSBuZXN0ZWQgaHZtIGNvbmZpZ3VyYWJsZSBpbiB0
aGUgZnV0dXJlLCB0aGF0IHdvdWxkIGJlCmEgd29ydGh3aGlsZSB0aGluZyB0byBkbzsgb3RoZXJ3
aXNlIGl0IGlzIGp1c3QgYW5vdGhlciBjb25jZXB0IHRoYXQKdXNlcnMgbmVlZCB0byBjYXJlIGFi
b3V0LCB3aGljaCBjcmVhdGVzIHNvbWUgbWVudGFsIGJ1cmRlbi4KCldlaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
