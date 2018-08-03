From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] drop {,acpi_}reserve_bootmem()
Date: Fri, 3 Aug 2018 16:24:39 +0100
Message-ID: <20180803152439.kpfmf3dpj3ltg5o4@citrix.com>
References: <5B64735A02000078001DAAD4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6cjh=ks=citrix.com=prvs=74619aeb1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1flbwa-0005DZ-68
 for xen-devel@lists.xenproject.org; Fri, 03 Aug 2018 15:24:44 +0000
Content-Disposition: inline
In-Reply-To: <5B64735A02000078001DAAD4@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMDMsIDIwMTggYXQgMDk6MjM6MDZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQm90aCBhcmUgZW50aXJlbHkgdW51c2VkICh0byBiZSBmYWlyLCByZXNlcnZlX2Jvb3Rt
ZW0oKSBoYXMgYSB1c2UgaW5zaWRlCj4gYW4gIiNpZiAwIiBzZWN0aW9uIGluIHg4NidzIG1wcGFy
c2UuYywgYnV0IGlmIHdlIHdlcmUgdG8gcmUtZW5hYmxlIHRoYXQKPiBjb2RlLCBpdCB3b3VsZCBu
ZWVkIGRvaW5nIGRpZmZlcmVudGx5IGFueXdheSkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
