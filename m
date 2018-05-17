From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libxc/x86: don't hand through CPUID leaf
 0x80000008 as is
Date: Thu, 17 May 2018 14:26:25 +0100
Message-ID: <0b9549fd-d943-d98f-0c08-e07ad8167e6d@citrix.com>
References: <5AFD818C02000078001C39E7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ai8g=ie=citrix.com=prvs=668b0e4c2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fJIx3-0005oL-LB
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 13:28:13 +0000
In-Reply-To: <5AFD818C02000078001C39E7@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDUvMTggMTQ6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEp1c3QgbGlrZSBmb3IgSFZN
IHRoZSBmZWF0dXJlIHNldCBzaG91bGQgYmUgdXNlZCBmb3IgRUJYIG91dHB1dCwgd2hpbGUKPiBF
QVggc2hvdWxkIGJlIHJlc3RyaWN0ZWQgdG8gdGhlIGxvdyAxNiBiaXRzIGFuZCBFQ1gvRURYIHNo
b3VsZCBiZSB6ZXJvLgo+Cj4gU2hvcnQgb2YgdGhlcmUgYmVpbmcgd2hpdGUgbGlzdGluZyBpbiBw
bGFjZSBqdXN0IGxpa2Ugb24gdGhlIEhWTSBzaWRlLAo+IGFsc28gemFwIGxlYXZlcyA2LCA5LCBh
bmQgMHg4MDAwMDAwNyBhcyB3ZWxsIGFzIHVua25vd24gLyByZXNlcnZlZCBvbmVzLgo+Cj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKRG8geW91IHdhbnQg
dGhpcyBmb3IgYmFja3BvcnRpbmc/CgpUaGUgY2hhbmdlcyBiZWxvdyBhcmUgZW5mb3JjZWQgYnkg
cmVjYWxjdWxhdGVfY3B1aWRfcG9saWN5KCkgKGFuZCBpbgpwYXJ0aWN1bGFyLCByZWNhbHVjbGF0
ZV9taXNjKCkpIGluIHRoZSBoeXBlcnZpc29yIGZvciB0aGUgcGFzdCBmZXcKcmVsZWFzZXMsIGFu
ZCBTZXJnZXkgaXMgY3VycmVudGx5IGluIHRoZSBwcm9jZXNzIG9mIG1ha2luZyBhbGwgb2YgdGhp
cwpsaWJ4YyBsb2dpYyBkaXNhcHBlYXIuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
