From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/4] x86/shim: only mark special pages as
 RAM in pvshim mode
Date: Thu, 27 Dec 2018 21:03:43 +0000
Message-ID: <3a1874e5-4e3a-980f-364f-5bfabc660fca@citrix.com>
References: <20181227155614.42292-1-roger.pau@citrix.com>
 <20181227155614.42292-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8dHC=PE=citrix.com=prvs=89228f4dd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gccok-0004Wz-St
 for xen-devel@lists.xenproject.org; Thu, 27 Dec 2018 21:03:46 +0000
In-Reply-To: <20181227155614.42292-5-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMTIvMjAxOCAxNTo1NiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFdoZW4gcnVubmlu
ZyBYZW4gYXMgYSBndWVzdCBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gbWFyayBzdWNoIHBhZ2VzIGFz
Cj4gUkFNIGJlY2F1c2UgdGhleSB3b24ndCBiZSBhc3NpZ25lZCB0byB0aGUgaW5pdGlhbCBkb21h
aW4gbWVtb3J5IG1hcC4KPgo+IFdoaWxlIHRoZXJlIG1vdmUgdGhlIGZ1bmN0aW9ucyB0byB0aGUg
UFYgc2hpbSBzcGVjaWZpYyBmaWxlIGFuZCByZW5hbWUKPiB0aGVtIGFjY29yZGluZ2x5Lgo+Cj4g
Tm8gZnVuY3Rpb25hbCBjaGFuZ2UgZXhwZWN0ZWQuCj4KPiBSZXBvcnRlZC1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
