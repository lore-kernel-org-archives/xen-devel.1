From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 02/16] VMX: don't unconditionally set the
 tsc_scaling.setup hook
Date: Thu, 19 Jul 2018 01:52:43 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19126FCC0@SHSMSX101.ccr.corp.intel.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B4604E402000078001D3247@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vdwy=kd=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1ffy7d-0002hg-RF
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 01:52:49 +0000
In-Reply-To: <5B4604E402000078001D3247@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFdl
ZG5lc2RheSwgSnVseSAxMSwgMjAxOCA5OjI0IFBNCj4gCj4gSW5zdGVhZCBvZiBjaGVja2luZyBo
dm1fdHNjX3NjYWxpbmdfc3VwcG9ydGVkIGluc2lkZSB0aGUgaG9vayBmdW5jdGlvbiwKPiBpbnN0
YWxsIHRoZSBob29rIG9ubHkgd2hlbiBzZXR0aW5nIHN0YXRlIHN1Y2ggdGhhdCBzYWlkIHByZWRp
Y2F0ZQo+IGJlY29tZXMgdHJ1ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
