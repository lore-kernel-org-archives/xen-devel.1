From: Julien Grall <julien.grall@arm.com>
Subject: Re: [OSSTEST PATCH] ts-kernel-build: Disable
 CONFIG_ARCH_QCOM in Xen Project CI
Date: Fri, 31 May 2019 16:52:32 +0100
Message-ID: <ffd5f689-085a-34f4-d150-5221783c0083__11037.679405284$1559318012$gmane$org@arm.com>
References: <c78c372a-4cf4-9721-38f2-d173eecee27e@arm.com>
 <20190530165123.22593-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWjpd-0005MV-NU
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 15:52:37 +0000
In-Reply-To: <20190530165123.22593-1-ian.jackson@eu.citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSWFuLAoKT24gMzAvMDUvMjAxOSAxNzo1MSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gICAgZHJp
dmVycy9maXJtd2FyZS9xY29tX3NjbS5jOjQ2OTo0NzogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQg
MyBvZiBgZG1hX2FsbG9jX2NvaGVyZW50JyBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUg
Wy1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCj4gCj4gVGhpcyBpcyBmaXhlZCBi
eQo+IAo+ICAgIGZpcm13YXJlOiBxY29tX3NjbTogVXNlIHByb3BlciB0eXBlcyBmb3IgZG1hIG1h
cHBpbmdzCj4gCj4gYnV0IHRoaXMgaXMgbm90IHByZXNlbnQgaW4gYWxsIHJlbGV2YW50IHN0YWJs
ZSBicmFuY2hlcy4KPiAKPiBXZSBjdXJyZW50bHkgaGF2ZSBubyBRdWFsY29tbSBoYXJkd2FyZSBp
biB0aGUgWGVuIFByb2plY3QgdGVzdCBsYWIgc28KPiB3ZSBkbyBub3QgbmVlZCB0aGlzIGVuYWJs
ZWQuCj4gCj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20KPiBDQzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENDOiBsaW51eC1hcm0t
bXNtQHZnZXIua2VybmVsLm9yZwo+IENDOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4g
Q0M6IFN0ZXBoZW4gQm95ZCA8c3dib3lkQGNocm9taXVtLm9yZz4KPiBDQzogQW5keSBHcm9zcyA8
YWdyb3NzQGtlcm5lbC5vcmc+Cj4gQ0M6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29u
QGxpbmFyby5vcmc+Cj4gQ0M6IEF2YW5lZXNoIEt1bWFyIER3aXZlZGkgPGFrZHdpdmVkQGNvZGVh
dXJvcmEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgoKRldJVzoKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgoKPiAtLS0KPiAgIHRzLWtlcm5lbC1idWlsZCB8IDQgKysrKwo+ICAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS90cy1rZXJuZWwtYnVpbGQg
Yi90cy1rZXJuZWwtYnVpbGQKPiBpbmRleCBmN2QwNTliMC4uNTUzNjU4NmYgMTAwNzU1Cj4gLS0t
IGEvdHMta2VybmVsLWJ1aWxkCj4gKysrIGIvdHMta2VybmVsLWJ1aWxkCj4gQEAgLTI3NCw2ICsy
NzQsMTAgQEAgc2V0b3B0IENPTkZJR19NRElPX1RIVU5ERVI9bQo+ICAgc2V0b3B0IENPTkZJR19J
MkNfVEhVTkRFUlg9bQo+ICAgc2V0b3B0IENPTkZJR19TUElfVEhVTkRFUlg9bQo+ICAgCj4gKyMg
U29tZSBMaW51eCBicmFuY2hlcyB3ZSBjYXJlIGFib3V0LCBpbmNsdWRpbmcgNC4xOSwgc3RpbGwg
bGFjawo+ICsjIGZpcm13YXJlOiBxY29tX3NjbTogVXNlIHByb3BlciB0eXBlcyBmb3IgZG1hIG1h
cHBpbmdzCj4gK0NPTkZJR19BUkNIX1FDT009bgo+ICsKPiAgICMjIyMKPiAgIAo+ICAgRU5ECj4g
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
