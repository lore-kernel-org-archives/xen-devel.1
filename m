From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 3/9] x86/HVM: patch vINTR indirect calls
 through hvm_funcs to direct ones
Date: Fri, 21 Sep 2018 11:50:23 +0100
Message-ID: <20180921105023.wknfwmzpktpamqgp@zion.uk.xensource.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5B97C43902000078001E7482@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3J1W-0005If-2R
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 10:50:58 +0000
Content-Disposition: inline
In-Reply-To: <5B97C43902000078001E7482@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMDc6MzM6NDVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2hpbGUgbm90IHN0cmljdGx5IG5lY2Vzc2FyeSwgY2hhbmdlIHRoZSBWTVggaW5pdGlh
bGl6YXRpb24gbG9naWMgdG8KPiB1cGRhdGUgdGhlIGZ1bmN0aW9uIHRhYmxlIGluIHN0YXJ0X3Zt
eCgpIGZyb20gTlVMTCByYXRoZXIgdGhhbiB0byBOVUxMLAo+IHRvIG1ha2UgbW9yZSBvYnZpb3Vz
IHRoYXQgd2Ugd29uJ3QgZXZlciBjaGFuZ2UgYW4gYWxyZWFkeSAoZXhwbGljdGx5KQo+IGluaXRp
YWxpemVkIGZ1bmN0aW9uIHBvaW50ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+IEFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
