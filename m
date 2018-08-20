From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 07/32] libxl_qmp: Move struct sockaddr_un
 variable to qmp_open()
Date: Mon, 20 Aug 2018 15:52:36 +0100
Message-ID: <20180820145236.noufnhahspgi6tpa@citrix.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-8-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qa+b=ld=citrix.com=prvs=763aa43e8=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1frlXt-0003v7-5W
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 14:52:41 +0000
Content-Disposition: inline
In-Reply-To: <20180727140614.13256-8-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdWwgMjcsIDIwMTggYXQgMDM6MDU6NDlQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhpcyB2YXJpYWJsZSBpcyBvbmx5IHVzZWQgb25jZSwgbm8gbmVlZCB0byBrZWVw
IGl0IGluIHRoZSBoYW5kbGVyLgo+IAo+IEFsc28gZml4IGNvZGluZyBzdHlsZSAocmVtb3ZlIHNw
YWNlIGFmdGVyIHNpemVvZikuCj4gQW5kIGFsbG93IHN0cm5jcHkgdG8gdXNlIGFsbCB0aGUgc3Bh
Y2UgaW4gc3VuX3BhdGguCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
