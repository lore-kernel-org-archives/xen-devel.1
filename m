From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2] xen: Introduce an xmemdup() helper
Date: Tue, 10 Jul 2018 10:32:16 +0200
Message-ID: <20180710083216.isy642byvnaixxzl@mac.bytemobile.com>
References: <1531132188-20564-1-git-send-email-andrew.cooper3@citrix.com>
 <1531132188-20564-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1531132188-20564-2-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMDksIDIwMTggYXQgMTE6Mjk6NDdBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiAuLi4gYW5kIHVzZSBpdCBpbiBwbGFjZSBvZiB0aGUgb3BlbmNvZGVkIGluc3RhbmNl
cy4KPiAKPiBGb3IgY29uc2lzdGVuY3ksIHJlc3RydWN0dXJlIGluaXRfZG9tYWluX2NwdWlkX3Bv
bGljeSgpIHRvIGJlIGxpa2UKPiBpbml0X3tkb21haW4sdmNwdX1fbXNyX3BvbGljeSgpIGJ5IG9w
ZXJhdGluZyBvbiB0aGUgbG9jYWwgcG9pbnRlciB3aGVyZQo+IHBvc3NpYmxlLgo+IAo+IE5vIGNo
YW5nZSBpbiBiZWhhdmlvdXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi94bWFs
bG9jLmggYi94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oCj4gaW5kZXggY2MyNjczZC4uMzRjNjU4
OCAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oCj4gKysrIGIveGVuL2lu
Y2x1ZGUveGVuL3htYWxsb2MuaAo+IEBAIC0xMyw2ICsxMywxNiBAQAo+ICAjZGVmaW5lIHhtYWxs
b2MoX3R5cGUpICgoX3R5cGUgKilfeG1hbGxvYyhzaXplb2YoX3R5cGUpLCBfX2FsaWdub2ZfXyhf
dHlwZSkpKQo+ICAjZGVmaW5lIHh6YWxsb2MoX3R5cGUpICgoX3R5cGUgKilfeHphbGxvYyhzaXpl
b2YoX3R5cGUpLCBfX2FsaWdub2ZfXyhfdHlwZSkpKQo+ICAKPiArLyogQWxsb2NhdGUgc3BhY2Ug
Zm9yIGEgdHlwZWQgb2JqZWN0IGFuZCBjb3B5IGFuIGV4aXN0aW5nIGluc3RhbmNlLiAqLwo+ICsj
ZGVmaW5lIHhtZW1kdXAocHRyKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ICsoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ICsgICAgdHlwZW9mKCoocHRyKSkgKnBfID0gKHB0ciksICpuXyA9IHht
YWxsb2ModHlwZW9mKCpwXykpOyAgXAoKQ291bGQgeW91IGRvPwoKY29uc3QgdHlwZW9mKCoocHRy
KSkgKnBfID0gKHB0cik7CnR5cGVvZigqKHB0cikpICpuXyA9IHhtYWxsb2ModHlwZW9mKCpwXykp
OwoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
