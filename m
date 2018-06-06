From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/6] x86/pat: Simplify host PAT handling
Date: Wed, 6 Jun 2018 11:39:46 +0200
Message-ID: <20180606093946.5pa6w5dvgo4bcpz6@MacBook-Pro-de-Roger.local>
References: <1527517678-1779-1-git-send-email-andrew.cooper3@citrix.com>
 <1527517678-1779-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1527517678-1779-4-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMjgsIDIwMTggYXQgMDM6Mjc6NTVQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBXaXRoIHRoZSByZW1vdmFsIG9mIHRoZSAzMmJpdCBoeXBlcnZpc29yIGJ1aWxkLCBo
b3N0X3BhdCBpcyBhIGNvbnN0YW50IHZhbHVlLgo+IERyb3AgdGhlIHZhcmlhYmxlIGFuZCB0aGUg
cmVkdW5kYW50IGNwdV9oYXNfcGF0IHByZWRpY2F0ZSwgYW5kIHVzZSBhIGRlZmluZQo+IGluc3Rl
YWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmggYi94
ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oCj4gaW5kZXggOTkyNGNkZi4uYWMxNTc3YyAx
MDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oCj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaAo+IEBAIC05Nyw2ICs5NywxMiBAQAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFg4Nl9FRkxBR1NfTlR8WDg2X0VGTEFHU19ERnxYODZfRUZM
QUdTX0lGfCAgICBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgWDg2X0VGTEFHU19URikK
PiAgCj4gKy8qCj4gKyAqIEhvc3QgSUEzMl9DUl9QQVQgdmFsdWUgdG8gY292ZXIgYWxsIG1lbW9y
eSB0eXBlcy4gIFRoaXMgaXMgbm90IHRoZSBkZWZhdWx0Cj4gKyAqIE1TUl9QQVQgdmFsdWUsIGFu
ZCBpcyBhbiBBQkkgd2l0aCBQViBndWVzdHMuCj4gKyAqLwo+ICsjZGVmaW5lIFhFTl9NU1JfUEFU
IDB4MDUwMTAwMDcwNDA2dWwKCk5vdCBzdXJlIHdoZXRoZXIgaXQgd291bGQgbWFrZSBzZW5zZSB0
byB1c2UgTUFTS19JTlNSIGFuZCBkZWZpbmUgZWFjaApwYWdlIGF0dHJpYnV0ZSBmaWVsZCBpbiBv
cmRlciB0byBjcmVhdGUgdGhpcyB2YWx1ZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
