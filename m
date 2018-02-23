From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/5] x86/pv: Avoid leaking other guests'
 MSR_TSC_AUX values into PV context
Date: Fri, 23 Feb 2018 08:09:29 -0700
Message-ID: <5A903CB902000078001AAF7B@prv-mh.provo.novell.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <1519127923-23539-3-git-send-email-andrew.cooper3@citrix.com>
 <5A902D8202000078001AAEDD@prv-mh.provo.novell.com>
 <f373d12c-01f6-9474-3996-9c00788bf4c7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f373d12c-01f6-9474-3996-9c00788bf4c7@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, SuraveeSuthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, BorisOstrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAyLjE4IGF0IDE1OjIyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjMvMDIvMTggMTQ6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMC4w
Mi4xOCBhdCAxMjo1OCwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gLS0t
IGEveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMK
Pj4+IEBAIC0xNTMzLDkgKzE1MzMsOSBAQCB2b2lkIHBhcmF2aXJ0X2N0eHRfc3dpdGNoX3RvKHN0
cnVjdCB2Y3B1ICp2KQo+Pj4gICAgICBpZiAoIHVubGlrZWx5KHYtPmFyY2guZGVidWdyZWdbN10g
JiBEUjdfQUNUSVZFX01BU0spICkKPj4+ICAgICAgICAgIGFjdGl2YXRlX2RlYnVncmVncyh2KTsK
Pj4+ICAKPj4+IC0gICAgaWYgKCAodi0+ZG9tYWluLT5hcmNoLnRzY19tb2RlID09ICBUU0NfTU9E
RV9QVlJEVFNDUCkgJiYKPj4+IC0gICAgICAgICBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfUkRU
U0NQKSApCj4+PiAtICAgICAgICB3cml0ZV9yZHRzY3BfYXV4KHYtPmRvbWFpbi0+YXJjaC5pbmNh
cm5hdGlvbik7Cj4+PiArICAgIGlmICggY3B1X2hhc19yZHRzY3AgKQo+Pj4gKyAgICAgICAgd3Jt
c3JfdHNjX2F1eCh2LT5kb21haW4tPmFyY2gudHNjX21vZGUgPT0gVFNDX01PREVfUFZSRFRTQ1AK
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgPyB2LT5kb21haW4tPmFyY2guaW5jYXJuYXRpb24g
OiAwKTsKPj4gV291bGRuJ3QgdGhlIGNvbmRpdGlvbmFsIGJldHRlciBjaGVjayBjcHVfaGFzX3Jk
dHNjcCB8fCBjcHVfaGFzX3JkcGlkCj4+ICh0aGVuIGFsc28gYmV0dGVyIG1hdGNoaW5nIHRoZSBk
ZXNjcmlwdGlvbik/IEFuZCBpZiBzbywgdGhlbiBwZXJoYXBzCj4+IGFsc28gaW4gb3RoZXIsIHBy
ZS1leGlzdGluZyBjb25kaXRpb25hbHM/Cj4gCj4gY3B1X2hhc19yZHBpZCBhbHJlYWR5IGltcGxp
ZXMgY3B1X2hhc19yZHRzY3AgaW4gcHJhY3RpY2UsIG1ha2luZyB0aGUgfHwKPiByZWR1bmRhbnQu
ICBObyBoYXJkd2FyZSBleGlzdHMgd2l0aCByZHBpZCBidXQgd2l0aG91dCByZHRzY3AuCgpUaGUg
cXVlc3Rpb24gaXNuJ3Qgd2hldGhlciBzdWNoIGhhcmR3YXJlIGFjdHVhbGx5IGV4aXN0cywgYnV0
CndoZXRoZXIgdGhlIGFyY2hpdGVjdHVyZSBhbGxvd3MgZm9yIHN1Y2ggaGFyZHdhcmUgdG8gZXhp
c3QgaW4KdGhlb3J5LiBUaGUgZGVwZW5kZW5jeSB5b3UgYWRkIGluIHBhdGNoIDUgaW1wbGllcyB5
b3UgdGhpbmsgc287CkkgY29udGludWUgdG8gdGhpbmsgdGhhdCB0aGUgbW9yZSBzYW5lIGJlaGF2
aW9yIHdvdWxkIGJlIGlmIHRoZQpNU1Igd2FzIHRpZWQgdG8gZWl0aGVyIGZsYWcuCgpKYW4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
