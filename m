From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] xen: Introduce an xmemdup() helper
Date: Tue, 10 Jul 2018 09:44:20 +0100
Message-ID: <4ce3780b-e619-01a1-5187-04254a310bd4@citrix.com>
References: <1531132188-20564-1-git-send-email-andrew.cooper3@citrix.com>
 <1531132188-20564-2-git-send-email-andrew.cooper3@citrix.com>
 <20180710083216.isy642byvnaixxzl@mac.bytemobile.com>
 <5B44708402000078001D2827@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B44708402000078001D2827@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDcvMjAxOCAwOTozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTAuMDcuMTgg
YXQgMTA6MzIsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIE1vbiwgSnVsIDA5
LCAyMDE4IGF0IDExOjI5OjQ3QU0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiAtLS0g
YS94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oCj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4veG1h
bGxvYy5oCj4+PiBAQCAtMTMsNiArMTMsMTYgQEAKPj4+ICAjZGVmaW5lIHhtYWxsb2MoX3R5cGUp
ICgoX3R5cGUgKilfeG1hbGxvYyhzaXplb2YoX3R5cGUpLCAKPj4gX19hbGlnbm9mX18oX3R5cGUp
KSkKPj4+ICAjZGVmaW5lIHh6YWxsb2MoX3R5cGUpICgoX3R5cGUgKilfeHphbGxvYyhzaXplb2Yo
X3R5cGUpLCAKPj4gX19hbGlnbm9mX18oX3R5cGUpKSkKPj4+ICAKPj4+ICsvKiBBbGxvY2F0ZSBz
cGFjZSBmb3IgYSB0eXBlZCBvYmplY3QgYW5kIGNvcHkgYW4gZXhpc3RpbmcgaW5zdGFuY2UuICov
Cj4+PiArI2RlZmluZSB4bWVtZHVwKHB0cikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPj4+ICsoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+Pj4gKyAgICB0eXBlb2YoKihwdHIpKSAqcF8gPSAocHRy
KSwgKm5fID0geG1hbGxvYyh0eXBlb2YoKnBfKSk7ICBcCj4+IENvdWxkIHlvdSBkbz8KPj4KPj4g
Y29uc3QgdHlwZW9mKCoocHRyKSkgKnBfID0gKHB0cik7Cj4+IHR5cGVvZigqKHB0cikpICpuXyA9
IHhtYWxsb2ModHlwZW9mKCpwXykpOwo+IFdvdWxkbid0IHRoaXMgc2Vjb25kIGxpbmUgYWdhaW4g
ZGlzY2FyZCBjb25zdCB0aGVuPyBJZiBhbnl0aGluZyBJCj4gd2FzIHdvbmRlcmluZyB3aGV0aGVy
IHBfIGlzIG5lZWRlZCBpbiB0aGUgZmlyc3QgcGxhY2UuCgpJdCBpcyB2ZXJ5IGVhc3kgdG8gdHVy
biBhIHBvc3NpYmx5LWNvbnN0IHBvaW50ZXIgY29uc3QgaW4gdGhlIHdheQpkZXNjcmliZWQgYWJv
dmUuwqAgSXQgZG9lc24ndCB3b3JrIHRoZSBvdGhlciB3YXkgYXJvdW5kIGJlY2F1c2UgdGhlCmNv
bnN0bmVzcyBvZiB0aGUgcG9pbnRlciBnZXRzIHByb3BhZ2F0ZWQgdGhyb3VnaCB0aGUgdHlwZW9m
LCBhbmQgdGhlcmUKaXMgbm8gbm9uY29uc3QgKG9yIGVxdWl2YWxlbnQpIGtleXdvcmQuCgp+QW5k
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
