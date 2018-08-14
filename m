From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 09/12] xen/domain: Call
 arch_domain_create() as early as possible in domain_create()
Date: Tue, 14 Aug 2018 16:37:52 +0200
Message-ID: <20180814143752.zheoya42tt32jvzp@mac>
References: <1534154469-6076-1-git-send-email-andrew.cooper3@citrix.com>
 <1534154469-6076-10-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1534154469-6076-10-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMTMsIDIwMTggYXQgMTE6MDE6MDZBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGlzIGlzIGluIHByZXBhcmF0aW9uIHRvIHNldCB1cCBkLT5tYXhfY3B1cyBhbmQg
ZC0+dmNwdVtdIGluIGRvbWFpbl9jcmVhdGUoKSwKPiBhbmQgYWxsb3cgbGF0ZXIgcGFydHMgb2Yg
ZG9tYWluIGNvbnN0cnVjdGlvbiB0byBoYXZlIGFjY2VzcyB0byB0aGUgdmFsdWVzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4g
LS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBDQzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENDOiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgo+IENDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+
IC0tLQo+ICB4ZW4vY29tbW9uL2RvbWFpbi5jIHwgMzQgKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9u
L2RvbWFpbi5jCj4gaW5kZXggYmU1MTQyNi4uMGM0NGYyNyAxMDA2NDQKPiAtLS0gYS94ZW4vY29t
bW9uL2RvbWFpbi5jCj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYwo+IEBAIC0zMjIsNiArMzIy
LDIzIEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUoZG9taWRfdCBkb21pZCwKPiAgICAg
ICAgICBlbHNlCj4gICAgICAgICAgICAgIGQtPmd1ZXN0X3R5cGUgPSBndWVzdF90eXBlX3B2Owo+
ICAKPiArICAgICAgICBpZiAoICFpc19oYXJkd2FyZV9kb21haW4oZCkgKQo+ICsgICAgICAgICAg
ICBkLT5ucl9waXJxcyA9IG5yX3N0YXRpY19pcnFzICsgZXh0cmFfZG9tVV9pcnFzOwo+ICsgICAg
ICAgIGVsc2UKPiArICAgICAgICAgICAgZC0+bnJfcGlycXMgPSBleHRyYV9od2RvbV9pcnFzID8g
bnJfc3RhdGljX2lycXMgKyBleHRyYV9od2RvbV9pcnFzCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA6IGFyY2hfaHdkb21faXJxcyhkb21pZCk7Cj4gKyAgICAg
ICAgaWYgKCBkLT5ucl9waXJxcyA+IG5yX2lycXMgKQo+ICsgICAgICAgICAgICBkLT5ucl9waXJx
cyA9IG5yX2lycXM7CgpkLT5ucl9waXJxcyA9IG1pbihkLT5ucl9waXJxcywgbnJfaXJxcyk7CgpM
R1RNOgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
