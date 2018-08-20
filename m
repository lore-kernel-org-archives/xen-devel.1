From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 18/34] x86/amd: skip OSVW function calls if
 !CONFIG_HVM
Date: Mon, 20 Aug 2018 07:06:42 -0600
Message-ID: <5B7ABCE202000078001E0106@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <803c213fc809d8d7b648a4e174a08275ca3f1864.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jmcq=ld=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1frjtQ-0001WM-BF
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 13:06:48 +0000
In-Reply-To: <803c213fc809d8d7b648a4e174a08275ca3f1864.1534518694.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhlIHR3byBmdW5jdGlvbnMgYXJlIG5vdCBuZWVkZWQgd2hlbiBIVk0gaXMgbm90IHN1cHBvcnRl
ZCBpbgo+IGh5cGVydmlzb3IuCj4gCj4gTm90ZSB0aGF0IHVzaW5nIGh2bV9lbmFibGVkIHdvbid0
IHdvcmsgYmVjYXVzZSBlYXJseV9taWNyb2NvZGVfaW5pdAo+IGdldHMgdG8gY3B1X3JlcXVlc3Rf
bWljcm9jb2RlIGJlZm9yZSBodm1fZW5hYmxlZCBpcyBzZXQgaW4gcHJlc21wIGluaXQKPiBjYWxs
IHN0YWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWxzbyBhcHBsaWNh
YmxlIGluIGNhc2UgeW91IGRlY2lkZSB0byBzd2l0Y2ggdG8gc3RhdGljIGlubGluZSBzdHVicwpp
bnN0ZWFkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
