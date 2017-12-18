From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] x86: improve NOP use for AMD CPUs
Date: Mon, 18 Dec 2017 16:51:32 +0000
Message-ID: <da523d62-3ec1-58ee-1242-c7b5ba5634c1@citrix.com>
References: <5A37982B0200007800198055@prv-mh.provo.novell.com>
 <5A37A2D00200007800198090@prv-mh.provo.novell.com>
 <31dcfde4-744e-e54a-2064-875e63f6e4e8@citrix.com>
 <5A37FFF10200007800198378@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mkns=do=citrix.com=prvs=5189c08a0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eQydh-0001jb-CO
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2017 16:51:41 +0000
In-Reply-To: <5A37FFF10200007800198378@prv-mh.provo.novell.com>
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
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMTIvMTcgMTY6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEZvciBGYW0xMCBhbmQgbGF0
ZXIgQU1EIHJlY29tbWVuZHMgdXNpbmcgdGhlICJsb25nIiBOT1AgZm9ybXMuIFJlLXdyaXRlCj4g
dGhlIHByZXNlbnQgSW50ZWwgY29kZSBpbnRvIHN3aXRjaCgpIHN0YXRlbWVudHMgYW5kIGFkZCBB
TUQgbG9naWMuCj4KPiBEZWZhdWx0IHRvICJsb25nIiBmb3JtcyAod2hpY2ggYWxsIDY0LWJpdCBD
UFVzIGFyZSBzdXBwb3NlZCB0bwo+IHJlY29nbml6ZSksIG92ZXJyaWRpbmcgdG8gdGhlIEs4IGZs
YXZvciBvbiB0aG9zZSBmZXcgKG9sZGVyKSBDUFVzLgo+Cj4gVGhpcyBhdCB0aGUgc2FtZSB0aW1l
IGJyaW5ncyB1cyBpbiBsaW5lIGFnYWluIGluIHRoaXMgcmVnYXJkIHdpdGgKPiBjdXJyZW50IExp
bnV4Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
UmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
