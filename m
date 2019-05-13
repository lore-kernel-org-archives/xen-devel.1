From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/4] xen/watchdog: Fold exit paths to have a
 single unlock
Date: Mon, 13 May 2019 14:14:14 +0100
Message-ID: <20190513131414.GD2798@zion.uk.xensource.com>
References: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
 <1557512884-32395-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQAma-0001U2-9k
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:14:20 +0000
Content-Disposition: inline
In-Reply-To: <1557512884-32395-2-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Christian Lindig <christian.lindig@citrix.com>, Pau Ruiz Safont <pau.safont@citrix.com>, Julien Grall <julien.grall@arm.com>, Edwin =?iso-8859-1?B?VPZy9ms=?= <edvin.torok@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDc6Mjg6MDFQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGlzIGlzIG1vc3RseSB0byBzaW1wbGlmeSBmdXR1cmUgbG9naWNhbCBjaGFuZ2Vz
LCBidXQgaXQgZG9lcyBjb21lIHdpdGggYQo+IG1vZGVzdCByZWR1bmN0aW9uIGluIGNvbXBpbGVk
IGNvZGUgc2l6ZSAoLTU1LCAzNDUgPT4gMjkwKS4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
