From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH 4/4] x86/vvmx: Don't handle unknown nested
 vmexit reasons at L0
Date: Fri, 26 Oct 2018 10:13:09 +0100
Message-ID: <dd055507-dbbc-c6f5-1b33-1d399e62bb18@citrix.com>
References: <1540481802-20037-1-git-send-email-andrew.cooper3@citrix.com>
 <1540481946-20712-1-git-send-email-andrew.cooper3@citrix.com>
 <bbe923eb-8b5a-3a4b-7f64-8435de76e88c@citrix.com>
 <0a6695ce-4a22-0df2-d6c0-0aec0987fc48@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0a6695ce-4a22-0df2-d6c0-0aec0987fc48@citrix.com>
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
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMTAvMjAxOCAxMDoxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNi8xMC8yMDE4
IDEwOjA1LCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+Pgo+PiBPbiAyNS8xMC8yMDE4IDE2OjM5LCBB
bmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gVGhpcyBpcyB2ZXJ5IGRhbmdlcm91cyBmcm9tIGEgc2Vj
dXJpdHkgcG9pbnQgb2YgdmlldywgYmVjYXVzZSBhIG1pc3NpbmcgZW50cnkKPj4+IHdpbGwgY2F1
c2UgTDIncyBhY3Rpb24gdG8gYmUgaW50ZXJwcmV0ZWQgYXMgTDEncyBhY3Rpb24uCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
Pj4+IC0tLQo+Pj4gQ0M6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4K
Pj4+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4+PiBDQzogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4+IENDOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBp
bnRlbC5jb20+Cj4+PiBDQzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4+PiAt
LS0KPj4+ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgfCAzICsrLQo+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZt
eC5jCj4+PiBpbmRleCBkMWM4YTQxLi44MTdkODVmIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS92bXgvdnZteC5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMK
Pj4+IEBAIC0yNjA5LDggKzI2MDksOSBAQCBpbnQgbnZteF9uMl92bWV4aXRfaGFuZGxlcihzdHJ1
Y3QgY3B1X3VzZXJfcmVncyAqcmVncywKPj4+ICAgICAgICAgICAgICBudmNwdS0+bnZfdm1leGl0
X3BlbmRpbmcgPSAxOwo+Pj4gICAgICAgICAgYnJlYWs7Cj4+PiAgICAgIGRlZmF1bHQ6Cj4+PiAt
ICAgICAgICBncHJpbnRrKFhFTkxPR19FUlIsICJVbmV4cGVjdGVkIG5lc3RlZCB2bWV4aXQ6IHJl
YXNvbiAldVxuIiwKPj4+ICsgICAgICAgIGdwcmludGsoWEVOTE9HX0VSUiwgIlVuaGFuZGxlZCBu
ZXN0ZWQgdm1leGl0OiByZWFzb24gJXVcbiIsCj4+PiAgICAgICAgICAgICAgICAgIGV4aXRfcmVh
c29uKTsKPj4+ICsgICAgICAgIGRvbWFpbl9jcmFzaCh2LT5kb21haW4pOwo+Pj4gICAgICB9Cj4+
PiAgCj4+PiAgICAgIHJldHVybiAoIG52Y3B1LT5udl92bWV4aXRfcGVuZGluZyA9PSAxICk7Cj4+
IENhbiB5b3UgY29uc2lkZXIgYWRkaW5nIGhhbmRsaW5nIGZvciB0aGUgZm9sbG93aW5nPwo+Pgo+
PiAJRVhJVF9SRUFTT05fSU5WRAo+PiAJRVhJVF9SRUFTT05fUkRUU0NQCj4+IAlFWElUX1JFQVNP
Tl9WTUZVTkMKPiAKPiBMb29rcyBsaWtlIHRoZXNlIHNob3VsZCBiZSBtZXJnZWQgaW4gd2l0aCB0
aGUgSU5WVlBJRCBjaGFuZ2UsIGlmIHlvdXIKPiBoYXBweSB3aXRoIHRoYXQ/CgpZZXMsIHRoYXQg
d291bGQgYmUgYSBjbGVhbmVyIHdheSwgdGhhbmtzLgoKLS0KU2VyZ2V5CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
