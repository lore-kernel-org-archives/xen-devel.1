From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 01/20] x86emul: extend vbroadcasts{s,
	d} to AVX2
Date: Fri, 2 Mar 2018 19:08:06 +0000
Message-ID: <0b0e9084-d3d7-f5c0-bf27-467914e5150b@citrix.com>
References: <5A96B3B902000078001ACB6D@prv-mh.provo.novell.com>
 <5A96B53D02000078001ACB84@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=prhv=fy=citrix.com=prvs=592350325=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1erq2R-0008S8-Ai
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 19:08:15 +0000
In-Reply-To: <5A96B53D02000078001ACB84@prv-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMTggMTI6NTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZXNlIGdhaW4gcmVnaXN0
ZXIgZm9ybXMgbm93Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
