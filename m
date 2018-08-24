From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 26/34] x86/mm/shadow: split out HVM only code
Date: Fri, 24 Aug 2018 07:57:14 +0100
Message-ID: <20180824065714.GB57021@deinos.phlegethon.org>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <21d88360019e3f7c38ebcda4f83c3112781465f6.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=scds=lh=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1ft620-0003jQ-F0
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 06:57:16 +0000
Content-Disposition: inline
In-Reply-To: <21d88360019e3f7c38ebcda4f83c3112781465f6.1534518694.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXQgMTY6MTIgKzAxMDAgb24gMTcgQXVnICgxNTM0NTIyMzY0KSwgV2VpIExpdSB3cm90ZToKPiBN
b3ZlIHRoZSBjb2RlIHByZXZpb3VzbHkgZW5jbG9zZWQgaW4gQ09ORklHX0hWTSBpbnRvIGl0cyBv
d24gZmlsZS4KPiAKPiBOb3RlIHRoYXQgYWx0aG91Z2ggc29tZSBjb2RlIGV4cGxpY2l0bHkgY2hl
Y2sgaXNfaHZtXyosIHdoaWNoIGhpbnRzIGl0Cj4gY2FuIGJlIHVzZWQgZm9yIFBWIHRvbywgSSBj
YW4ndCBmaW5kIGEgY29kZSBwYXRoIHRoYXQgd291bGQgYmUgdGhlCj4gY2FzZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFRp
bSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
