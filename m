From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: make arch_set_info_guest() match
 comments in load_segments()
Date: Thu, 16 Aug 2018 10:45:05 +0100
Message-ID: <5df81cda-52bd-588c-3a59-561f0a894f4d@citrix.com>
References: <5B4486CA02000078001D2907@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rytq=k7=citrix.com=prvs=759b2abc3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fqEqC-0000k5-J1
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 09:45:16 +0000
In-Reply-To: <5B4486CA02000078001D2907@prv1-mh.provo.novell.com>
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

T24gMTAvMDcvMTggMTE6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEZvciBib3RoIGZzX2Jhc2Ug
YW5kIGdzX2Jhc2VfdXNlciwgdGhlcmUgYXJlIGNvbW1lbnRzIHNheWluZyAiVGhpcyBjYW4KPiBv
bmx5IGJlIG5vbi16ZXJvIGlmIHNlbGVjdG9yIGlzIE5VTEwuIiBXaGlsZSBzYXZlX3NlZ21lbnRz
KCkgZW5zdXJlcwo+IHRoaXMsIHNvIGZhciBhcmNoX3NldF9pbmZvX2d1ZXN0KCkgZGlkbid0LiBN
YWtlIGJlaGF2aW9yIGNvbnNpc3RlbnQKPiAoYXR0YWNoaW5nIGNvbW1lbnRzIGlkZW50aWNhbCB0
byB0aG9zZSBpbiBzYXZlX3NlZ21lbnRzKCkpLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
