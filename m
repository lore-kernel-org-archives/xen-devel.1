From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/domain: Drop the only-written
 smap_check_policy infrastructure
Date: Tue, 8 May 2018 17:10:56 +0100
Message-ID: <20180508161056.qfqdfrf75ajlwobg@MacBook-Pro-de-Roger.local>
References: <1525784584-6812-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1525784584-6812-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Jason Andryuk <jandryuk@gmail.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXkgMDgsIDIwMTggYXQgMDI6MDM6MDRQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBjL3MgNGM1ZDc4YTEwZCAieDg2L3BhZ2V3YWxrOiBSZS1pbXBsZW1lbnQgdGhlIHBh
Z2V0YWJsZSB3YWxrZXIiIGRyb3BwZWQgdGhlCj4gY29uc3VtZXIgb2Ygc21hcF9wb2xpY3kuICBM
b29raW5nIGF0IGMvcyAzMWFlNTg3ZTZmIHdoaWNoIGludHJvZHVjZWQgdGhlCj4gc21hcF9jaGVj
ayBsb2dpYywgaXQgZXhpc3RzIG9ubHkgdG8gd29yayBhcm91bmQgYSBidWcgaW4gZ3Vlc3Rfd2Fs
a190YWJsZXMoKQo+IHdhcyByZXNvbHZlZCBieSB0aGUgYWZvcm1lbnRpb25lZCBjb21taXQuCj4g
Cj4gUmVtb3ZlIHRoZSB1bnVzZWQgdmFyaWFibGVzIGFuZCBhc3NvY2lhdGVkIGluZnJhc3RydWN0
dXJlLgo+IAo+IFJlcG9ydGVkLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmggYi94ZW4vaW5jbHVk
ZS9hc20teDg2L2RvbWFpbi5oCj4gaW5kZXggOGI2NjA5Ni4uMTk3ZjhkNiAxMDA2NDQKPiAtLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9kb21haW4uaAo+IEBAIC01OTUsNyArNTgzLDYgQEAgc3RydWN0IGFyY2hfdmNwdQo+ICAKPiAg
c3RydWN0IGd1ZXN0X21lbW9yeV9wb2xpY3kKPiAgewo+IC0gICAgc21hcF9jaGVja19wb2xpY3lf
dCBzbWFwX3BvbGljeTsKPiAgICAgIGJvb2wgbmVzdGVkX2d1ZXN0X21vZGU7CgpNYXliZSBndWVz
dF9tZW1vcnlfcG9saWN5IGNvdWxkIGJlIGRyb3BwZWQgYW5kCnVwZGF0ZV9ndWVzdF9tZW1vcnlf
cG9saWN5IHVwZGF0ZWQgdG8gdGFrZSBhIGJvb2wgbmVzdGVkX21vZGUKcGFyYW1ldGVyPyBPciB0
aGUgZnVuY3Rpb24gY2FuIGJlIGRyb3BwZWQgYWx0b2dldGhlciBsaWtlbHkuCgpJbiBhbnkgY2Fz
ZSwgdGhpcyBjYW4gYmUgZG9uZSBpbiBhIGZvbGxvd3VwIGNsZWFudXAgcGF0Y2guCgpUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
