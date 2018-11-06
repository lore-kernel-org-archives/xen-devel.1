From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 4/8] tools/libvchan: init_xs_srv: Simplify
 error handling (2)
Date: Tue, 6 Nov 2018 09:48:11 +0000
Message-ID: <20181106094811.gcsqvjkhliis7a7l@zion.uk.xensource.com>
References: <23516.33005.649128.145551@mariner.uk.xensource.com>
 <20181102170113.11646-1-ian.jackson@eu.citrix.com>
 <20181102170113.11646-5-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ji3p=nr=citrix.com=prvs=84126674e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gJxyX-0000at-2K
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 09:48:45 +0000
Content-Disposition: inline
In-Reply-To: <20181102170113.11646-5-ian.jackson@eu.citrix.com>
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

T24gRnJpLCBOb3YgMDIsIDIwMTggYXQgMDU6MDE6MDlQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gKiBBYm9saXNoIGZhaWxfeHNfb3BlbiB3aGljaCBpcyBub3cgZXhhY3RseSB0aGUgc2Ft
ZSBhcyBmYWlsLgo+IAo+ICogQ2hhbmdlIGFsbCBnb3RvcyB0byByZWZlciB0byBmYWlsIGluc3Rl
YWQuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCgpPaCAgaGVyZSBpdCBpcy4KCj4gU2ln
bmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpBY2tl
ZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkZlZWwgZnJlZSB0byBhZGQgbXkg
YWNrIHRvIHlvdXIgcHJldmlvdXMgcGF0Y2guCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
