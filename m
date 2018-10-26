From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/4] x86/vvmx: Don't handle unknown nested
 vmexit reasons at L0
Date: Fri, 26 Oct 2018 10:10:50 +0100
Message-ID: <0a6695ce-4a22-0df2-d6c0-0aec0987fc48@citrix.com>
References: <1540481802-20037-1-git-send-email-andrew.cooper3@citrix.com>
 <1540481946-20712-1-git-send-email-andrew.cooper3@citrix.com>
 <bbe923eb-8b5a-3a4b-7f64-8435de76e88c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <bbe923eb-8b5a-3a4b-7f64-8435de76e88c@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMTAvMjAxOCAxMDowNSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPgo+IE9uIDI1LzEwLzIw
MTggMTY6MzksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IFRoaXMgaXMgdmVyeSBkYW5nZXJvdXMg
ZnJvbSBhIHNlY3VyaXR5IHBvaW50IG9mIHZpZXcsIGJlY2F1c2UgYSBtaXNzaW5nIGVudHJ5Cj4+
IHdpbGwgY2F1c2UgTDIncyBhY3Rpb24gdG8gYmUgaW50ZXJwcmV0ZWQgYXMgTDEncyBhY3Rpb24u
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4+IC0tLQo+PiBDQzogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXgu
Y29tPgo+PiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+PiBDQzogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4gQ0M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1h
QGludGVsLmNvbT4KPj4gQ0M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgo+PiAt
LS0KPj4gIHhlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyB8IDMgKystCj4+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMK
Pj4gaW5kZXggZDFjOGE0MS4uODE3ZDg1ZiAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS92bXgvdnZteC5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwo+PiBAQCAt
MjYwOSw4ICsyNjA5LDkgQEAgaW50IG52bXhfbjJfdm1leGl0X2hhbmRsZXIoc3RydWN0IGNwdV91
c2VyX3JlZ3MgKnJlZ3MsCj4+ICAgICAgICAgICAgICBudmNwdS0+bnZfdm1leGl0X3BlbmRpbmcg
PSAxOwo+PiAgICAgICAgICBicmVhazsKPj4gICAgICBkZWZhdWx0Ogo+PiAtICAgICAgICBncHJp
bnRrKFhFTkxPR19FUlIsICJVbmV4cGVjdGVkIG5lc3RlZCB2bWV4aXQ6IHJlYXNvbiAldVxuIiwK
Pj4gKyAgICAgICAgZ3ByaW50ayhYRU5MT0dfRVJSLCAiVW5oYW5kbGVkIG5lc3RlZCB2bWV4aXQ6
IHJlYXNvbiAldVxuIiwKPj4gICAgICAgICAgICAgICAgICBleGl0X3JlYXNvbik7Cj4+ICsgICAg
ICAgIGRvbWFpbl9jcmFzaCh2LT5kb21haW4pOwo+PiAgICAgIH0KPj4gIAo+PiAgICAgIHJldHVy
biAoIG52Y3B1LT5udl92bWV4aXRfcGVuZGluZyA9PSAxICk7Cj4gQ2FuIHlvdSBjb25zaWRlciBh
ZGRpbmcgaGFuZGxpbmcgZm9yIHRoZSBmb2xsb3dpbmc/Cj4KPiAJRVhJVF9SRUFTT05fSU5WRAo+
IAlFWElUX1JFQVNPTl9SRFRTQ1AKPiAJRVhJVF9SRUFTT05fVk1GVU5DCgpMb29rcyBsaWtlIHRo
ZXNlIHNob3VsZCBiZSBtZXJnZWQgaW4gd2l0aCB0aGUgSU5WVlBJRCBjaGFuZ2UsIGlmIHlvdXIK
aGFwcHkgd2l0aCB0aGF0PwoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
