From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 11/44] x86emul: support AVX512F "normal"
 FP compare insns
Date: Wed, 14 Nov 2018 14:45:10 +0000
Message-ID: <fac5ad2c-5ff3-8705-b5a2-0099939ba1b9@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BAA34B502000078001EB9B6@prv1-mh.provo.novell.com>
 <5BAA38EE02000078001EBA42@prv1-mh.provo.novell.com>
 <b2122d5c-802b-fb36-7578-97aff666d2c4@citrix.com>
 <5BEC341A02000078001FC0A0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xswa=nz=citrix.com=prvs=8491ce0b8=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gMwPp-0007cp-Rc
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 14:45:13 +0000
In-Reply-To: <5BEC341A02000078001FC0A0@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMTEvMjAxOCAxNDo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTMuMTEuMTgg
YXQgMjA6MDQsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gV2hhdCBkbyB5
b3UgY29uc2lkZXIgIm5vcm1hbCIgaGVyZT8KPiBXb3VsZCAib3JkaW5hcnkiIGJlIGJldHRlciAo
SSd2ZSB1c2VkIHF1b3RlcyBleGFjdGx5IGJlY2F1c2UgSQo+IGNvdWxkbid0IHRoaW5rIG9mIGFu
eXRoaW5nIGJldHRlcik/IFZ7LFV9Q09NSVN7UyxEfSBhcmUgdGhlIG9uZXMKPiBub3QgZGVhbHQg
d2l0aCBoZXJlLgo+Cj4+IE9uIDI1LzA5LzIwMTggMTQ6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+
Pj4gQWxzbyBjb3JyZWN0IHRoZSBBVlggY291bnRlcnBhcnQncyBjb21tZW50Lgo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gVGhlIGNvbnRl
bnQgaXRzZWxmIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPiwKPj4gYnV0IHByZWZlcmFibHkgd2l0aCBhIGJldHRlciBkZXNjcmlwdGlvbi4KPiBUaGFu
a3MgLSBsZXQgbWUga25vdyB3aGV0aGVyICJub3JtYWwiIG9yICJvcmRpbmFyeSIgb3Igb2theSB3
aXRoCj4geW91LCBvciB3aGF0IGJldHRlciBzdWdnZXN0aW9ucyB5b3UgaGF2ZS4KCkhvdyBhYm91
dCBqdXN0ICJTdXBwb3J0IG1vc3QgQVZYNTEyRiBGUCBjb21wYXJlIGluc25zIiwgYW5kIG5vdGUg
dGhhdApWeyxVfUNPTUlTe1MsRH0gaXMgZG9uZSBsYXRlciBpbiB0aGUgY29tbWl0IG1lc3NhZ2U/
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
