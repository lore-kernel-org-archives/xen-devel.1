From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC v2 1/2] x86/emulate: Move
 hvmemul_linear_to_phys
Date: Thu, 17 Jan 2019 10:49:12 +0000
Message-ID: <20190117104912.xvzoil7kiz2zhz34@zion.uk.xensource.com>
References: <20190111153657.13532-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bbbE=PZ=citrix.com=prvs=9134cd51d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gk5Eb-0002hy-6x
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 10:49:17 +0000
Content-Disposition: inline
In-Reply-To: <20190111153657.13532-1-aisaila@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgMDM6Mzc6NDFQTSArMDAwMCwgQWxleGFuZHJ1IFN0ZWZh
biBJU0FJTEEgd3JvdGU6Cj4gVGhpcyBpcyBkb25lIHNvIGh2bWVtdWxfbGluZWFyX3RvX3BoeXMo
KSBjYW4gYmUgY2FsbGVkIGZyb20KPiBodm1lbXVsX21hcF9saW5lYXJfYWRkcigpCgpUaGlzIGNh
biBhbHNvIGJlIGRvbmUgd2l0aCBhIGZvcndhcmQgZGVjbGFyYXRpb24gdG8gcmVkdWNlIGNvZGUg
Y2h1cm4uCkJ1dCB0aGF0J3MgbXkgcGVyc29uYWwgdGFzdGUgYW55d2F5LgoKQXNzdW1pbmcgdGhp
cyBpcyBwdXJlIGNvZGUgbW92ZW1lbnQsIHBsZWFzZSBhZGQgIk5vIGZ1bmN0aW9uYWwgY2hhbmdl
Igp0byB0aGUgY29tbWl0IG1lc3NhZ2UuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
