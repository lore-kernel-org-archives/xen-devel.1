From: chenbaodong <chenbaodong@mxnavi.com>
Subject: Re: [PATCH] xen: make keyhanler configurable
Date: Mon, 3 Jun 2019 13:35:45 +0800
Message-ID: <f5ec0bff-4018-fad9-2cfc-c4bb926bc94f@mxnavi.com>
References: <4574c000e77fae38b87d69cad06a3c74@sslemail.net>
 <a42a8cc4-f5dc-f6f4-d17b-a8b7f673c7f5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXfdS-0005PT-1w
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 05:35:54 +0000
In-Reply-To: <a42a8cc4-f5dc-f6f4-d17b-a8b7f673c7f5@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDYvMS8xOSAwNjozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAzMC8wNS8yMDE5IDE4
OjU4LCBCYW9kb25nIENoZW4gd3JvdGU6Cj4+IGtleWhhbmRsZXIgbWFpbmx5IHVzZWQgZm9yIGRl
YnVnIHVzYWdlIGJ5IGRldmVsb3BlcnMgd2hpY2ggY2FuIGR1bXAKPj4geGVuIG1vZHVsZShlZy4g
dGltZXIsIHNjaGVkdWxlcikgc3RhdHVzIGF0IHJ1bnRpbWUgYnkgaW5wdXQKPj4gY2hhcmFjdGVy
IGZyb20gY29uc29sZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQmFvZG9uZyBDaGVuIDxjaGVuYmFv
ZG9uZ0BteG5hdmkuY29tPgo+IFdoYXQgaXMgdGhlIG1vdGl2YXRpb24gaGVyZT/CoCBJIGRvbid0
IGhhdmUgYSBzcGVjaWZpYyBvYmplY3Rpb24gdG8KPiBtYWtpbmcgdGhpcyBjb25maWd1cmFibGUg
KHNvIGxvbmcgYXMgaXQgZXhjaXNlcyB0aGUgZW50aXJlIGtleWhhbmRsZXIKPiBpbmZyYXN0cnVj
dHVyZSwgd2hpY2ggaXMgcmF0aGVyIG1vcmUgdGhhbiB0aGlzIHBhdGNoIGRvZXMpLCBidXQgSSBh
bHNvCj4gZG9uJ3Qgc2VlIHdoeSB3ZSB3b3VsZCB3YW50IHRvIGRvIHNvIGluIHRoZSBmaXJzdCBw
bGFjZS4KPgo+IEluIHBhcnRpY3VsYXIsIGl0IGRvZXNuJ3QgcmVxdWlyZSBhIHNlcmlhbCBjb25z
b2xlIHRvIGZ1bmN0aW9uIGNvcnJlY3RseQo+IGluIHRoZSBmaXJzdCBwbGFjZS7CoCBUaGlzIGZ1
bmN0aW9uYWxpdHkgY2FuIGJlIHVzZWQgd2l0aCBgeGwgZGVidWcta2V5cwo+ICRjaGFyOyB4bCBk
bWVzZ2AKCklJVUMgdGhlIGNvbmZpZyBjdXQgbmVhcmx5IHRoZSBlbnRpcmUga2V5aGFuZGxlciBp
bmZyYXN0cnVjdHVyZS4KCkknbSBpbnRlcmVzdGVkIGluIGFybTY0IGF1dG9tb3RpdmUgdXNlIGNh
c2UsIHNhZmV0eSBjZXJ0aWZpY2F0aW9uCgppcyBuaWNlIHRvIGhhdmUuCgpzbyB0aGUgc21hbGxl
ciBjb2RlIGJhc2UgaXMgcHJlZmVycmVkLgoKQlRXLCBpIGhlYXJkIHRoZSB3b3JrcyAiZG9tMGxl
c3MiLCBpcyBpdCBwb3NzaWJsZSBydW4gdm1zIG92ZXIgeGVuIAp3aXRob3V0IHhsPwoKPiB+QW5k
cmV3Cj4gLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
