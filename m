From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: reduce IRQs disabled section in
 flush_area_local()
Date: Fri, 6 Jul 2018 14:28:37 +0100
Message-ID: <931c4977-ab16-7dab-f180-c200411a97e9@citrix.com>
References: <5B36305C02000078001CF276@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=khol=jw=citrix.com=prvs=7188636b3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fbQmu-0002VC-DR
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 13:28:40 +0000
In-Reply-To: <5B36305C02000078001CF276@prv1-mh.provo.novell.com>
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

T24gMjkvMDYvMTggMTQ6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9ubHkgdGhlIHByZV9mbHVz
aCgpIC8gcG9zdF9mbHVzaCgpIHNlY3Rpb24gYWN0dWFsbHkgbmVlZHMgdG8gcnVuIHdpdGgKPiBp
bnRlcnJ1cHRzIGRpc2FibGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
