From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] gitlab-ci: use git clean -ffdx in build
 each commit test
Date: Mon, 8 Apr 2019 07:24:46 -0500
Message-ID: <79329C0D-1F0B-4318-AB69-D4A035F8E597@cardoe.com>
References: <20190408115031.27127-1-wei.liu2@citrix.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9Tza=SK=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1hDTKT-0008D3-TV
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 12:24:49 +0000
Received: by mail-yw1-xc44.google.com with SMTP id w66so4834247ywd.4
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2019 05:24:48 -0700 (PDT)
In-Reply-To: <20190408115031.27127-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Cj4gT24gQXByIDgsIDIwMTksIGF0IDY6NTAgQU0sIFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+IHdyb3RlOgo+IAo+IFRoZSBidWlsZCBzY3JpcHQgaW52b2tlZCBpcyBkZXNpZ25lZCB0byBy
dW4gaW4gYSBwcmlzdGluZSBjaGVja291dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgoKQWNrZWQtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2Fy
ZG9lLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
