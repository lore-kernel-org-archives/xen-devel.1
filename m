From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] libxl/arm: Fix build on arm64 + acpi w/
 gcc 8.2
Date: Fri, 17 Aug 2018 08:36:03 +0100
Message-ID: <20180817073602.25nlho2pv3ktygts@citrix.com>
References: <20180815072155.2zr5kum2odwpc6cj@citrix.com>
 <1534450961-3321-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqZIk-0003iL-Pm
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 07:36:06 +0000
Content-Disposition: inline
In-Reply-To: <1534450961-3321-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com, sstabellini@kernel.org, ian.jackson@eu.citrix.com, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMTYsIDIwMTggYXQgMDE6MjI6NDFQTSAtMDcwMCwgQ2hyaXN0b3BoZXIgQ2xh
cmsgd3JvdGU6Cj4gQWRkIHplcm8tcGFkZGluZyB0byAjZGVmaW5lZCBBQ1BJIHRhYmxlIHN0cmlu
Z3MgdGhhdCBhcmUgY29waWVkLgo+IFByb3ZpZGVzIHN1ZmZpY2llbnQgY2hhcmFjdGVycyB0byBz
YXRpc2Z5IHRoZSBsZW5ndGggcmVxdWlyZWQgdG8KPiBmdWxseSBwb3B1bGF0ZSB0aGUgZGVzdGlu
YXRpb24gYW5kIHByZXZlbnQgYXJyYXktYm91bmRzIHdhcm5pbmdzLgo+IEFkZCBCVUlMRF9CVUdf
T04gc2l6ZW9mIGNoZWNrcyBmb3IgY29tcGlsZS10aW1lIGxlbmd0aCBjaGVja2luZy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJhZXN5
c3RlbXMuY29tPgo+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
