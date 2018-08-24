From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 29/34] x86/mm: put paging_update_nestedmode
 under CONFIG_HVM
Date: Fri, 24 Aug 2018 17:28:10 +0100
Message-ID: <20180824162809.4znyv7xzsegd7zfm@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <86e8d3436de41c2c2ac544b19fef496aa2dbb070.1534518694.git-series.wei.liu2@citrix.com>
 <5B7BFA7D02000078001E071F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8yf=lh=citrix.com=prvs=76773b150=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftEwY-00050c-8m
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 16:28:14 +0000
Content-Disposition: inline
In-Reply-To: <5B7BFA7D02000078001E071F@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMDU6NDE6NDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBOZXN0ZWQgSFZNIGlzIG5vdCBlbmFibGVkIHdoZW4gIUNPTkZJR19IVk0uCj4gCj4g
QWxsIGNhbGxlcnMgb2YgdGhlIGZ1bmN0aW9uIHNpdCB1bmRlciBodm0vLCBzbyBvbmNlIGFnYWlu
IEkgZG9uJ3Qgc2VlCj4gd2h5IHRoZSBmdW5jdGlvbiBuZWVkcyB0byByZW1haW4gYXZhaWxhYmxl
IHdpdGggYW4gZW1wdHkgYm9keS4KClllcyB0aGUgd2hvbGUgZnVuY3Rpb24gY2FuIGJlIHB1dCB1
bmRlciBDT05GSUdfSFZNLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
