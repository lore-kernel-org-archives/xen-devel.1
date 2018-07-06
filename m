From: Julien Grall <julien.grall@arm.com>
Subject: Re: [OSSTEST PATCH] armhf,
 xsm: Drop XSM tests on 32-bit ARM
Date: Fri, 6 Jul 2018 16:16:00 +0100
Message-ID: <b07909c2-eb35-e1fe-a866-f7f488ad7b07@arm.com>
References: <1530875265-19873-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fdmc=jw=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fbSSp-000438-R3
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 15:16:03 +0000
In-Reply-To: <1530875265-19873-1-git-send-email-ian.jackson@eu.citrix.com>
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
Cc: Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDcvMTggMTI6MDcsIElhbiBKYWNrc29uIHdyb3RlOgo+IFdlIGFyZSBhdCB0aGUgbGlt
aXQgb2YgQVJNIGNhcGFjaXR5LCB3aGljaCBoYXMgbm90IGtlcHQgcGFjZSB3aXRoIFg4Ngo+IGV4
cGFuc2lvbi4gIE5ldyBoYXJkd2FyZSBpcyBvbiB0aGUgd2F5IGJ1dCBpdCBpcyBub3QgaGVyZSB5
ZXQuCj4gCj4gRHJvcHBpbmcgdGhlIFhTTSB0ZXN0cyBkcm9wcyBvbmUgdGVzdCwgYnV0IGFsc28g
b25lIGJ1aWxkLCB3aGljaCBzYXZlcwo+IGNvbnNpZGVyYWJsZSBlZmZvcnQuICBCdWlsZHMgYXJl
IGN1cnJlbnRseSB0aGUgYm90dGxlbmVjaywgYmVjYXVzZSB3ZQo+IGF2b2lkIGJ1aWxkaW5nIG9u
IHRoZSB1bnJlbGlhYmxlIEFybmRhbGUgYm9hcmRzLgo+IAo+IENDOiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBsaW5hcm8ub3JnPgoKSSBkb24ndCB3YXRjaCB0aGlzIGUtbWFpbCBhIGxvdCBh
bnltb3JlLgoKPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0
cml4LmNvbT4KCkZXSVc6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KCkNoZWVycywKCj4gLS0tCj4gICBtZmktY29tbW9uIHwgNyArKysrKystCj4gICAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL21maS1jb21tb24gYi9tZmktY29tbW9uCj4gaW5kZXggYTczYjEzOC4uMDFhYjVkMSAxMDA2
NDQKPiAtLS0gYS9tZmktY29tbW9uCj4gKysrIGIvbWZpLWNvbW1vbgo+IEBAIC02NCw3ICs2NCwx
MiBAQCB4c21fdmFyaWFudHMgKCkgewo+ICAgICAgIHhlbi00LjMtdGVzdGluZykgZWNobyAiZmFs
c2UiOzsKPiAgICAgICB4ZW4tNC40LXRlc3RpbmcpIGVjaG8gImZhbHNlIjs7Cj4gICAgICAgeGVu
LTQuNS10ZXN0aW5nKSBlY2hvICJmYWxzZSI7Owo+IC0gICAgKikgZWNobyAiZmFsc2UgdHJ1ZSI7
Cj4gKyAgICAqKQo+ICsgICAgICBjYXNlICIkYXJjaCIgaW4KPiArICAgICAgICBhcm1oZikgZWNo
byAnZmFsc2UnIDs7Cj4gKyAgICAgICAgKikKPiArICAgICAgICAgIGVjaG8gImZhbHNlIHRydWUi
OzsKPiArICAgICAgZXNhYwo+ICAgICAgIGVzYWMKPiAgIH0KPiAgIAo+IAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
