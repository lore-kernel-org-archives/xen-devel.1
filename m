From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 11/16] x86/HVM: patch vINTR indirect calls
 through hvm_funcs to direct ones
Date: Thu, 19 Jul 2018 02:00:03 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19126FD10@SHSMSX101.ccr.corp.intel.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B46098B02000078001D32B3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vdwy=kd=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1ffyHP-0004A1-GG
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 02:02:55 +0000
In-Reply-To: <5B46098B02000078001D32B3@prv1-mh.provo.novell.com>
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
ZG5lc2RheSwgSnVseSAxMSwgMjAxOCA5OjQ0IFBNCj4gCj4gV2hpbGUgbm90IHN0cmljdGx5IG5l
Y2Vzc2FyeSwgY2hhbmdlIHRoZSBWTVggaW5pdGlhbGl6YXRpb24gbG9naWMgdG8KPiB1cGRhdGUg
dGhlIGZ1bmN0aW9uIHRhYmxlIGluIHN0YXJ0X3ZteCgpIGZyb20gTlVMTCByYXRoZXIgdGhhbiB0
byBOVUxMLAo+IHRvIG1ha2UgbW9yZSBvYnZpb3VzIHRoYXQgd2Ugd29uJ3QgZXZlciBjaGFuZ2Ug
YW4gYWxyZWFkeSAoZXhwbGljdGx5KQo+IGluaXRpYWxpemVkIGZ1bmN0aW9uIHBvaW50ZXIuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQt
Ynk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
