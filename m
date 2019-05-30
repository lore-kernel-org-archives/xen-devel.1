From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH] ts-kernel-build: Disable
 CONFIG_ARCH_QCOM in Xen Project CI
Date: Thu, 30 May 2019 17:51:23 +0100
Message-ID: <20190530165123.22593-1-ian.jackson@eu.citrix.com>
References: <c78c372a-4cf4-9721-38f2-d173eecee27e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uW51=T6=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hWOHm-0000ZN-IT
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 16:52:14 +0000
In-Reply-To: <c78c372a-4cf4-9721-38f2-d173eecee27e@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, linux-arm-msm@vger.kernel.org, Ian Jackson <ian.jackson@eu.citrix.com>, linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>, Julien Grall <julien.grall@arm.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-Id: xen-devel@lists.xenproject.org

ICBkcml2ZXJzL2Zpcm13YXJlL3Fjb21fc2NtLmM6NDY5OjQ3OiBlcnJvcjogcGFzc2luZyBhcmd1
bWVudCAzIG9mIGBkbWFfYWxsb2NfY29oZXJlbnQnIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIg
dHlwZSBbLVdlcnJvcj1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KClRoaXMgaXMgZml4ZWQg
YnkKCiAgZmlybXdhcmU6IHFjb21fc2NtOiBVc2UgcHJvcGVyIHR5cGVzIGZvciBkbWEgbWFwcGlu
Z3MKCmJ1dCB0aGlzIGlzIG5vdCBwcmVzZW50IGluIGFsbCByZWxldmFudCBzdGFibGUgYnJhbmNo
ZXMuCgpXZSBjdXJyZW50bHkgaGF2ZSBubyBRdWFsY29tbSBoYXJkd2FyZSBpbiB0aGUgWGVuIFBy
b2plY3QgdGVzdCBsYWIgc28Kd2UgZG8gbm90IG5lZWQgdGhpcyBlbmFibGVkLgoKQ0M6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCkND
OiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNDOiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBj
aHJvbWl1bS5vcmc+CkNDOiBBbmR5IEdyb3NzIDxhZ3Jvc3NAa2VybmVsLm9yZz4KQ0M6IEJqb3Ju
IEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+CkNDOiBBdmFuZWVzaCBLdW1h
ciBEd2l2ZWRpIDxha2R3aXZlZEBjb2RlYXVyb3JhLm9yZz4KU2lnbmVkLW9mZi1ieTogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMta2VybmVsLWJ1aWxkIHwg
NCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdHMt
a2VybmVsLWJ1aWxkIGIvdHMta2VybmVsLWJ1aWxkCmluZGV4IGY3ZDA1OWIwLi41NTM2NTg2ZiAx
MDA3NTUKLS0tIGEvdHMta2VybmVsLWJ1aWxkCisrKyBiL3RzLWtlcm5lbC1idWlsZApAQCAtMjc0
LDYgKzI3NCwxMCBAQCBzZXRvcHQgQ09ORklHX01ESU9fVEhVTkRFUj1tCiBzZXRvcHQgQ09ORklH
X0kyQ19USFVOREVSWD1tCiBzZXRvcHQgQ09ORklHX1NQSV9USFVOREVSWD1tCiAKKyMgU29tZSBM
aW51eCBicmFuY2hlcyB3ZSBjYXJlIGFib3V0LCBpbmNsdWRpbmcgNC4xOSwgc3RpbGwgbGFjawor
IyBmaXJtd2FyZTogcWNvbV9zY206IFVzZSBwcm9wZXIgdHlwZXMgZm9yIGRtYSBtYXBwaW5ncwor
Q09ORklHX0FSQ0hfUUNPTT1uCisKICMjIyMKIAogRU5ECi0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
