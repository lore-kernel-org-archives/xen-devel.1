From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 4/4] x86/vvmx: Don't handle unknown nested
 vmexit reasons at L0
Date: Thu, 25 Oct 2018 16:39:06 +0100
Message-ID: <1540481946-20712-1-git-send-email-andrew.cooper3@citrix.com>
References: <1540481802-20037-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1540481802-20037-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyB2ZXJ5IGRhbmdlcm91cyBmcm9tIGEgc2VjdXJpdHkgcG9pbnQgb2YgdmlldywgYmVj
YXVzZSBhIG1pc3NpbmcgZW50cnkKd2lsbCBjYXVzZSBMMidzIGFjdGlvbiB0byBiZSBpbnRlcnBy
ZXRlZCBhcyBMMSdzIGFjdGlvbi4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNs
aUBjaXRyaXguY29tPgpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1h
QGludGVsLmNvbT4KQ0M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgotLS0KIHhl
bi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92
bXgvdnZteC5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCmluZGV4IGQxYzhhNDEuLjgx
N2Q4NWYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYworKysgYi94ZW4v
YXJjaC94ODYvaHZtL3ZteC92dm14LmMKQEAgLTI2MDksOCArMjYwOSw5IEBAIGludCBudm14X24y
X3ZtZXhpdF9oYW5kbGVyKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLAogICAgICAgICAgICAg
bnZjcHUtPm52X3ZtZXhpdF9wZW5kaW5nID0gMTsKICAgICAgICAgYnJlYWs7CiAgICAgZGVmYXVs
dDoKLSAgICAgICAgZ3ByaW50ayhYRU5MT0dfRVJSLCAiVW5leHBlY3RlZCBuZXN0ZWQgdm1leGl0
OiByZWFzb24gJXVcbiIsCisgICAgICAgIGdwcmludGsoWEVOTE9HX0VSUiwgIlVuaGFuZGxlZCBu
ZXN0ZWQgdm1leGl0OiByZWFzb24gJXVcbiIsCiAgICAgICAgICAgICAgICAgZXhpdF9yZWFzb24p
OworICAgICAgICBkb21haW5fY3Jhc2godi0+ZG9tYWluKTsKICAgICB9CiAKICAgICByZXR1cm4g
KCBudmNwdS0+bnZfdm1leGl0X3BlbmRpbmcgPT0gMSApOwotLSAKMi4xLjQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
