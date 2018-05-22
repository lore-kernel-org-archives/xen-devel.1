From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxc/x86/PV: don't hand through CPUID leaf
 0x80000008 as is
Date: Tue, 22 May 2018 12:41:50 +0100
Message-ID: <20180522114150.74ba5djwfaawfmi2@citrix.com>
References: <5B04019202000078001C4A53@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fj/e=ij=citrix.com=prvs=6735f0edb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fL5fu-0003TV-Mg
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 11:41:54 +0000
Content-Disposition: inline
In-Reply-To: <5B04019202000078001C4A53@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXkgMjIsIDIwMTggYXQgMDU6NDA6MDJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSnVzdCBsaWtlIGZvciBIVk0gdGhlIGZlYXR1cmUgc2V0IHNob3VsZCBiZSB1c2VkIGZv
ciBFQlggb3V0cHV0LCB3aGlsZQo+IEVBWCBzaG91bGQgYmUgcmVzdHJpY3RlZCB0byB0aGUgbG93
IDE2IGJpdHMgYW5kIEVDWC9FRFggc2hvdWxkIGJlIHplcm8uCj4gCj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSSB3aWxsIGxlYXZlIHRoaXMgdG8gQW5k
cmV3IGFuZCB5b3UuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
