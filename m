From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH 4/4] x86/vvmx: Don't handle unknown nested
 vmexit reasons at L0
Date: Fri, 26 Oct 2018 10:05:37 +0100
Message-ID: <bbe923eb-8b5a-3a4b-7f64-8435de76e88c@citrix.com>
References: <1540481802-20037-1-git-send-email-andrew.cooper3@citrix.com>
 <1540481946-20712-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1540481946-20712-1-git-send-email-andrew.cooper3@citrix.com>
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

CgpPbiAyNS8xMC8yMDE4IDE2OjM5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFRoaXMgaXMgdmVy
eSBkYW5nZXJvdXMgZnJvbSBhIHNlY3VyaXR5IHBvaW50IG9mIHZpZXcsIGJlY2F1c2UgYSBtaXNz
aW5nIGVudHJ5Cj4gd2lsbCBjYXVzZSBMMidzIGFjdGlvbiB0byBiZSBpbnRlcnByZXRlZCBhcyBM
MSdzIGFjdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xp
QGNpdHJpeC5jb20+Cj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBDQzog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDQzogSnVuIE5ha2FqaW1hIDxqdW4ubmFr
YWppbWFAaW50ZWwuY29tPgo+IENDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4K
PiAtLS0KPiAgeGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIHwgMyArKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMK
PiBpbmRleCBkMWM4YTQxLi44MTdkODVmIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
dm14L3Z2bXguYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwo+IEBAIC0yNjA5
LDggKzI2MDksOSBAQCBpbnQgbnZteF9uMl92bWV4aXRfaGFuZGxlcihzdHJ1Y3QgY3B1X3VzZXJf
cmVncyAqcmVncywKPiAgICAgICAgICAgICAgbnZjcHUtPm52X3ZtZXhpdF9wZW5kaW5nID0gMTsK
PiAgICAgICAgICBicmVhazsKPiAgICAgIGRlZmF1bHQ6Cj4gLSAgICAgICAgZ3ByaW50ayhYRU5M
T0dfRVJSLCAiVW5leHBlY3RlZCBuZXN0ZWQgdm1leGl0OiByZWFzb24gJXVcbiIsCj4gKyAgICAg
ICAgZ3ByaW50ayhYRU5MT0dfRVJSLCAiVW5oYW5kbGVkIG5lc3RlZCB2bWV4aXQ6IHJlYXNvbiAl
dVxuIiwKPiAgICAgICAgICAgICAgICAgIGV4aXRfcmVhc29uKTsKPiArICAgICAgICBkb21haW5f
Y3Jhc2godi0+ZG9tYWluKTsKPiAgICAgIH0KPiAgCj4gICAgICByZXR1cm4gKCBudmNwdS0+bnZf
dm1leGl0X3BlbmRpbmcgPT0gMSApOwoKQ2FuIHlvdSBjb25zaWRlciBhZGRpbmcgaGFuZGxpbmcg
Zm9yIHRoZSBmb2xsb3dpbmc/CgoJRVhJVF9SRUFTT05fSU5WRAoJRVhJVF9SRUFTT05fUkRUU0NQ
CglFWElUX1JFQVNPTl9WTUZVTkMKCkJ1dCBpbiBhbnkgY2FzZToKClJldmlld2VkLWJ5OiBTZXJn
ZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+CgotLQpUaGFua3MsClNlcmdleQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
