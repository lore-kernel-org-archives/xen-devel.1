From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/6] x86/HVM: prefill cache with PDPTEs when
 possible
Date: Thu, 19 Jul 2018 12:55:45 +0100
Message-ID: <65e2cc63-e956-86ca-2c46-55dd0157ae9e@citrix.com>
References: <5B506A6E02000078001D5D17@prv1-mh.provo.novell.com>
 <5B506CE302000078001D5D8A@prv1-mh.provo.novell.com>
 <2fa046b9-9d6f-caa0-d400-804f92332d2e@citrix.com>
 <5B507A6102000078001D5DDD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zjjl=kd=citrix.com=prvs=7313ab634=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fg7XF-00069m-5s
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 11:55:53 +0000
In-Reply-To: <5B507A6102000078001D5DDD@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDcvMTggMTI6NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE5LjA3LjE4IGF0
IDEzOjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDE5LzA3LzE4
IDExOjUwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFNpbmNlIHN0cmljdGx5IHNwZWFraW5nIGl0
IGlzIGluY29ycmVjdCBmb3IgZ3Vlc3Rfd2Fsa190YWJsZXMoKSB0byByZWFkCj4+PiBMMyBlbnRy
aWVzIGR1cmluZyBQQUUgcGFnZSB3YWxrcywgdHJ5IHRvIG92ZXJjb21lIHRoaXMgd2hlcmUgcG9z
c2libGUgYnkKPj4+IHByZS1sb2FkaW5nIHRoZSB2YWx1ZXMgZnJvbSBoYXJkd2FyZSBpbnRvIHRo
ZSBjYWNoZS4gU2FkbHkgdGhlCj4+PiBpbmZvcm1hdGlvbiBpcyBhdmFpbGFibGUgaW4gdGhlIEVQ
VCBjYXNlIG9ubHkuIE9uIHRoZSBwb3NpdGl2ZSBzaWRlIGZvcgo+Pj4gTlBUIHRoZSBzcGVjIHNw
ZWxscyBvdXQgdGhhdCBMMyBlbnRyaWVzIGFyZSBhY3R1YWxseSByZWFkIG9uIHdhbGtzLCBzbwo+
Pj4gdXMgcmVhZGluZyB0aGVtIGlzIGNvbnNpc3RlbnQgd2l0aCBoYXJkd2FyZSBiZWhhdmlvciBp
biB0aGF0IGNhc2UuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+PiBJJ20gYWZyYWlkIHRoYXQgdGhpcyBpc24ndCBhcmNoaXRlY3R1cmFsbHkg
Y29ycmVjdC4gIEl0IG1lYW5zIHRoYXQgYW4KPj4gZW11bGF0ZWQgbWVtb3J5IGFjY2VzcyB3aWxs
IHJlYWQgdGhlIFBEUFRFIHJlZ2lzdGVyIHZhbHVlcywgcmF0aGVyIHRoYW4KPj4gd2hhdCBpcyBh
Y3R1YWxseSBpbiBSQU0uCj4gSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQ6IEEgQ1IzIGxv
YWQgbG9hZHMgdGhlIFBEUFRFcyBpbnRvCj4gcmVnaXN0ZXJzLCBhbmQgd2Fsa3MgdXNlIHRob3Nl
IHJlZ2lzdGVycywgbm90IG1lbW9yeS4gVGhhdCdzIHRoZSB2ZXJ5Cj4gZGlmZmVyZW5jZSBiZXR3
ZWVuIFBBRSBhbmQgYWxsIG90aGVyIHdhbGtzLgoKUGF0Y2ggMyBjYXVzZXMgbWVtb3J5IHJlYWRz
IHRvIGNvbWUgZnJvbSB0aGUgY2FjaGUuCgpUaGlzIHBhdGNoIGZlZWRzIHRoZSBQRFBURSByZWdp
c3RlcnMgaW50byB0aGUgY2FjaGUsIHdoaWNoIGJyZWFrcyB0aGUKYXJjaGl0ZWN0dXJhbCBjb3Jy
ZWN0bmVzcyBvZiBwYXRjaCAzLCBiZWNhdXNlIHRoZSBQRFBURSByZWdpc3RlcnMgbWF5CmxlZ2l0
aW1hdGVseSBiZSBzdGFsZSBXUlQgdGhlIGNvbnRlbnQgaW4gbWVtb3J5LgoKVGhlIHBhZ2V3YWxr
IHJlYWRpbmcgb2YgdG9wX21hcCBkb2Vzbid0IHJlcXVpcmUgdGhhdCB0b3BfbWFwIHBvaW50cyBp
bnRvCmd1ZXN0IHNwYWNlLsKgIElmIHlvdSByZWFkIHRoZSBQRFBURSByZWdpc3RlcnMgb250byB0
aGUgc3RhY2ssIGFuZCBwYXNzIGEKcG9pbnRlciB0byB0aGUgc3RhY2sgaW50byB0aGUgcGFnZXdh
bGsgaW4gdGhlIDMtbGV2ZWwgY2FzZSwgdGhlbiB5b3UgZml4CnRoZSBpc3N1ZSBkZXNjcmliZWQg
aGVyZSB3aXRob3V0IGJyZWFraW5nIHBhdGNoIDMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
