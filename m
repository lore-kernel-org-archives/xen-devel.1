From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl_create: Re-order callbacks of
 initiate_domain_create
Date: Wed, 2 Jan 2019 14:15:05 +0000
Message-ID: <20190102141505.5slk7iiknkhbnrhp@zion.uk.xensource.com>
References: <20181212145346.10331-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KZoQ=PK=citrix.com=prvs=89816f56d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gehIk-000131-JL
 for xen-devel@lists.xenproject.org; Wed, 02 Jan 2019 14:15:18 +0000
Content-Disposition: inline
In-Reply-To: <20181212145346.10331-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMTIsIDIwMTggYXQgMDI6NTM6NDZQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gQ2FsbGJhY2tzIHNob3VsZCBiZSBpbiB0aGUgb3JkZXIgdGhhdCB0aGVyZSBhcmUg
Z29pbmcgdG8gYmUgZXhlY3V0ZWQuCj4gVGhpcyBwYXRjaCBmaXggdGhlIGluaXRpYXRlX2RvbWFp
bl9jcmVhdGUgY2FsbGJhY2tzLCBhbmQgYWxzbyByZW9yZGVyCj4gdGhlIGNhbGxiYWNrcyBwcm90
b3R5dGVzLiBUaGF0IHdheSwgaXQncyBlYXNpZXIgdG8gZm9sbG93IHRoZSBmbG93LgoKVHdvIHR5
cG9zIGhlcmUuIEkgd2lsbCBmaXggdGhlbSB3aGlsZSBjb21taXR0aW5nLgoKPiAKPiBUaGlzIHBh
dGNoOgo+IC0gbW92ZSBsaWJ4bF9fY29sb19yZXN0b3JlX3NldHVwX2RvbmUgYWZ0ZXIgZG9tY3Jl
YXRlX2Jvb3Rsb2FkZXJfZG9uZS4KPiAtIG1vdmUgZG9tY3JlYXRlX2F0dGFjaF9kZXZpY2VzIGFm
dGVyIGRvbWNyZWF0ZV9kZXZtb2RlbF9zdGFydGVkLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
