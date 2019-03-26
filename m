From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/4] libx86: Recalculate synthesised
 cpuid_policy fields when appropriate
Date: Tue, 26 Mar 2019 06:20:36 -0600
Message-ID: <5C9A19140200007800221E4A@prv1-mh.provo.novell.com>
References: <1553170866-23812-1-git-send-email-andrew.cooper3@citrix.com>
 <1553170866-23812-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1553170866-23812-5-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAzLjE5IGF0IDEzOjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gV2hlbiBmaWxsaW5nIGEgcG9saWN5LCBlaXRoZXIgZnJvbSBDUFVJRCBvciBhbiBpbmNv
bW1pbmcgbGVhZiBzdHJlYW0sCj4gcmVjYWxjdWxhdGUgdGhlIHN5bnRoZXNpc2VkIHZlbmRvciB2
YWx1ZS4gIEFsbCBjYWxsZXJzIGFyZSBleHBlY3RlZCB0byB3YW50Cj4gdGhpcyBiZWhhdmlvdXIu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CndpdGgg
b25lIHF1ZXN0aW9uOgoKPiBAQCAtMTQxLDYgKzE0OCw4IEBAIHZvaWQgeDg2X2NwdWlkX3BvbGlj
eV9maWxsX25hdGl2ZShzdHJ1Y3QgY3B1aWRfcG9saWN5ICpwKQo+ICAgICAgZm9yICggaSA9IDE7
IGkgPCBtaW5fdCh1bnNpZ25lZCBpbnQsIEFSUkFZX1NJWkUocC0+ZXh0ZC5yYXcpLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwLT5leHRkLm1heF9sZWFmICsgMSAtIDB4ODAwMDAwMDAp
OyArK2kgKQo+ICAgICAgICAgIGNwdWlkX2xlYWYoMHg4MDAwMDAwMCArIGksICZwLT5leHRkLnJh
d1tpXSk7Cj4gKwo+ICsgICAgcmVjYWxjdWxhdGVfc3ludGgocCk7Cj4gIH0KPiAgCj4gIGNvbnN0
IHVpbnQzMl90ICp4ODZfY3B1aWRfbG9va3VwX2RlZXBfZGVwcyh1aW50MzJfdCBmZWF0dXJlKQo+
IEBAIC0zNjMsNiArMzcyLDggQEAgaW50IHg4Nl9jcHVpZF9jb3B5X2Zyb21fYnVmZmVyKHN0cnVj
dCBjcHVpZF9wb2xpY3kgKnAsCj4gICAgICAgICAgfQo+ICAgICAgfQo+ICAKPiArICAgIHJlY2Fs
Y3VsYXRlX3N5bnRoKHApOwo+ICsKPiAgICAgIHJldHVybiAwOwo+ICAKPiAgIG91dF9vZl9yYW5n
ZToKCldoaWxlIHRoaXMgdGFrZXMgY2FyZSBvZiBsaWJ4ODYsIHdvdWxkbid0IGl0IGJlIGRlc2ly
YWJsZSB0byBtaXJyb3IgdGhpcwpiZWhhdmlvciBpbnRvIHVwZGF0ZV9kb21haW5fY3B1aWRfaW5m
bygpIHJpZ2h0IGF3YXk/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
