From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 5/5] x86/domctl: Implement
 XEN_DOMCTL_get_cpu_policy
Date: Mon, 5 Nov 2018 18:52:08 +0100
Message-ID: <20181105175208.2653ixmmqsg2smgm@mac.citrite.net>
References: <1541416600-30056-1-git-send-email-andrew.cooper3@citrix.com>
 <1541416600-30056-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1541416600-30056-6-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMTE6MTY6NDBBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBGcm9tOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Cj4g
Cj4gVGhpcyBmaW5hbGx5IChhZnRlciBsaXRlcmFsbHkgeWVhcnMgb2Ygd29yayEpIG1hcmtzIHRo
ZSBwb2ludCB3aGVyZSB0aGUKPiB0b29sc3RhY2sgY2FuIGFzayB0aGUgaHlwZXJ2aXNvciBmb3Ig
dGhlIGN1cnJlbnQgQ1BVSUQgY29uZmlndXJhdGlvbiBvZiBhCj4gc3BlY2lmaWMgZG9tYWluLgo+
IAo+IEludHJvZHVjZSBhIG5ldyBmbGFzayBhY2Nlc3MgdmVjdG9yIGFuZCB1cGRhdGUgdGhlIGRl
ZmF1bHQgcG9saWNpZXMuCj4gCj4gQWxzbyBleHRlbmQgeGVuLWNwdWlkJ3MgLS1wb2xpY3kgbW9k
ZSB0byBiZSBhYmxlIHRvIHRha2UgYSBkb21pZCBhbmQgZHVtcCBhCj4gc3BlY2lmaWMgZG9tYWlu
cyBDUFVJRCBhbmQgTVNSIHBvbGljeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFz
bGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL21pc2MveGVu
LWNwdWlkLmMgYi90b29scy9taXNjL3hlbi1jcHVpZC5jCj4gaW5kZXggOTVlZDg1My4uMmM0MTAz
MSAxMDA2NDQKPiAtLS0gYS90b29scy9taXNjL3hlbi1jcHVpZC5jCj4gKysrIGIvdG9vbHMvbWlz
Yy94ZW4tY3B1aWQuYwo+IEBAIC0zLDYgKzMsOCBAQAo+ICAjaW5jbHVkZSA8ZXJyLmg+Cj4gICNp
bmNsdWRlIDxnZXRvcHQuaD4KPiAgI2luY2x1ZGUgPHN0cmluZy5oPgo+ICsjaW5jbHVkZSA8ZXJy
bm8uaD4KPiArI2luY2x1ZGUgPGxpbWl0cy5oPgo+ICAKPiAgI2luY2x1ZGUgPHhlbmN0cmwuaD4K
PiAgCj4gQEAgLTMwOSwxMSArMzExLDEzIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJn
dikKPiAgewo+ICAgICAgZW51bSB7IE1PREVfVU5LTk9XTiwgTU9ERV9JTkZPLCBNT0RFX0RFVEFJ
TCwgTU9ERV9JTlRFUlBSRVQsIE1PREVfUE9MSUNZIH0KPiAgICAgIG1vZGUgPSBNT0RFX1VOS05P
V047Cj4gKyAgICBpbnQgZG9taWQgPSAtMTsKCldvdWxkIGl0IGJlIGJldHRlciB0byB1c2UgRE9N
SURfSU5WQUxJRCBpbnN0ZWFkIG9mIC0xPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
