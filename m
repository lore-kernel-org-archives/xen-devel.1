From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/6] x86/hvm: Handle viridian MSRs via the
 new guest_{rd, wr}msr() infrastructure
Date: Mon, 26 Feb 2018 14:17:31 -0500
Message-ID: <11caec5f-e9a5-9d90-ba83-ccb932e7bb23@oracle.com>
References: <1519666519-16311-1-git-send-email-andrew.cooper3@citrix.com>
 <1519666519-16311-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519666519-16311-3-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjYvMjAxOCAxMjozNSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBEaXNwYXRjaCBm
cm9tIHRoZSBndWVzdF97cmQsd3J9bXNyKCkgZnVuY3Rpb25zLCBhZnRlciBjb25maXJtaW5nIHRo
YXQgdGhlCj4gZG9tYWluIGlzIGNvbmZpZ3VyZWQgdG8gdXNlIHZpcmlkaWFuLiAgVGhpcyBhbGxv
d3MgZm9yIHNpbXBsaWZpY3Rpb24gb2YgdGhlCj4gdmlyaWRpYW4gaGVscGVycyBhcyB0aGV5IGRv
bid0IG5lZWQgdG8gY29wZSB3aXRoIHRoZSAibm90IGEgdmlyaWRpYW4gTVNSIgo+IGNhc2UuICBJ
dCBhbHNvIG1lYW5zIHRoYXQgdmlyaWRpYW4gTVNScyB3aGljaCBhcmUgdW5pbXBsZW1lbnRlZCwg
b3IgZXhjbHVkZWQKPiBiZWNhdXNlIG9mIGZlYXR1cmVzLCBkb24ndCBmYWxsIGJhY2sgaW50byBk
ZWZhdWx0IGhhbmRsaW5nIHBhdGguCj4KPiBSZW5hbWUge3JkLHdyfW1zcl92aXJpZGlhbl9yZWdz
KCkgdG8gZ3Vlc3Rfe3JkLHdyfW1zcl92aXJpZGlhbigpIGZvcgo+IGNvbnNpc3RlbmN5LCBhbmQg
YmVjYXVzZSB0aGUgX3JlZ3Mgc3VmZml4IGlzbid0IHZlcnkgYXBwcm9wcmlhdGUuCj4KPiBVcGRh
dGUgdGhlbSB0byB0YWtlIGEgdmNwdSBwb2ludGVyIHJhdGhlciB0aGFuIHByZXN1bWluZyB0aGF0
IHRoZXkgYWN0IG9uCj4gY3VycmVudCwgd2hpY2ggaXMgc2FmZSBmb3IgYWxsIGltcGxlbWVudGVk
IG9wZXJhdGlvbnMuICBBbHNvIHVwZGF0ZSB0aGVtIHRvCj4gdXNlIFg4NkVNVUxfKiByZXR1cm4g
dmFsdWVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+
IENDOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+Cj4gQ0M6IFBhdWwgRHVy
cmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gQ0M6IEtldmluIFRpYW4gPGtldmluLnRp
YW5AaW50ZWwuY29tPgo+IENDOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFj
bGUuY29tPgo+IENDOiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5p
dEBhbWQuY29tPgo+IENDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IENDOiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBDQzogU2VyZ2V5IER5YXNsaSA8
c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8
Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
