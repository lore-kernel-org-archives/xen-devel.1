From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 5/8] tools/libvchan: init_xs_srv: Turn xs
 retry from goto into for (; ; )
Date: Tue, 6 Nov 2018 09:48:32 +0000
Message-ID: <20181106094832.lx3q6bnceuoq3v7w@zion.uk.xensource.com>
References: <23516.33005.649128.145551@mariner.uk.xensource.com>
 <20181102170113.11646-1-ian.jackson@eu.citrix.com>
 <20181102170113.11646-6-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ji3p=nr=citrix.com=prvs=84126674e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gJxyZ-0000bB-BT
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 09:48:47 +0000
Content-Disposition: inline
In-Reply-To: <20181102170113.11646-6-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMDIsIDIwMTggYXQgMDU6MDE6MTBQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxp
dTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
