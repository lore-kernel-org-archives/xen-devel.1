From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/pv: Rename pv/ro-page-fault.c to
 pv/emul-ro-page-fault.c
Date: Mon, 5 Feb 2018 12:22:50 +0000
Message-ID: <0be9a2ad-0dbf-6868-3629-5daaf5d42511@citrix.com>
References: <1517590727-13443-1-git-send-email-andrew.cooper3@citrix.com>
 <5A782A9602000078001A5180@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A782A9602000078001A5180@prv-mh.provo.novell.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDIvMTggMDg6NTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjAyLjE4IGF0
IDE3OjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IFRvIG1hdGNoIGFs
bCBvdXIgb3RoZXIgZW11bGF0aW9uIGhhbmRsaW5nLgo+Pgo+PiBObyBmdW5jdGlvbmFsIGNoYW5n
ZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KPj4gLS0tCj4+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4+
IC0tLQo+PiAgeGVuL2FyY2gveDg2L3B2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMiArLQo+PiAgeGVuL2FyY2gveDg2L3B2L3tyby1wYWdlLWZhdWx0LmMgPT4g
ZW11bC1yby1wYWdlLWZhdWx0LmN9IHwgMiArLQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+ICByZW5hbWUgeGVuL2FyY2gveDg2L3B2L3tyby1w
YWdlLWZhdWx0LmMgPT4gZW11bC1yby1wYWdlLWZhdWx0LmN9ICg5OSUpCj4gV2hlbiB0aGlzIGZp
bGUgd2FzIGludHJvZHVjZWQsIGlpcmMgSSBoYWQgc3BlY2lmaWNhbGx5IGFza2VkIHRvIGRyb3AK
PiB0aGUgcG9pbnRsZXNzIGVtdWwtIHByZWZpeC4gSWYgeW91IHdhbnQgdG8gbWFrZSB0aGluZ3Mg
Y29uc2lzdGVudAo+IGFnYWluLCBwbGVhc2UgaW5zdGVhZCBkcm9wIHRoZSBlbXVsLSBwcmVmaXhl
cyBvZiB0aGUgb3RoZXIgZmlsZXMuCgpOby4KCkZpcnN0IG9mIGFsbCwgdGhpcyBmaWxlIGlzIHRo
ZSBtb3N0IHJlY2VudCB0byBjb21lIGludG8gZXhpc3RlbmNlLAphcm91bmQgMyBtb250aHMgYWZ0
ZXIgdGhlIG90aGVycy4KClRoZSBwb2ludCBvZiBuYW1pbmcgdGhpbmdzIGluIGEgY29uc2lzdGVu
dCBmYXNoaW9uIGlzIGZvciB0aGUgYmVuZWZpdCBvZgpodW1hbnMsIGFuZCBoYXZpbmcgdGhlIGVt
dWxhdGlvbiByZWxhdGVkIGZ1bmN0aW9uYWxpdHkgbG9naWNhbGx5IGdyb3VwZWQKaXMgYSBiZW5l
Zml0LCBub3QgYSBkZXRyaW1lbnQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
