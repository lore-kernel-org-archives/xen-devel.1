From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: correct assertion in
 destroy_perdomain_mapping()
Date: Mon, 23 Apr 2018 14:39:20 +0100
Message-ID: <ac79f3ac-6269-5384-f087-fa6090d92651@citrix.com>
References: <5ADA014A02000078001BD11B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=suz6=hm=citrix.com=prvs=644318916=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fAbgm-0000wi-Dh
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 13:39:28 +0000
In-Reply-To: <5ADA014A02000078001BD11B@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDQvMTggMTY6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IGh2bV9kb21haW5faW5pdGlh
bGlzZSgpIG1heSBjYWxsIHRoaXMgd2l0aCBuciBiZWluZyB6ZXJvLCB3aGljaCB0cmlnZ2Vycwo+
IHRoZSAiZG9lcyBub3QgY3Jvc3MgTDMgYm91bmRhcnkiIGNoZWNrLgo+Cj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
