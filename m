From: Isaila Alexandru <aisaila@bitdefender.com>
Subject: Re: [PATCH] mem_access: Fix npfec.kind propagation
Date: Thu, 27 Sep 2018 14:32:36 +0300
Message-ID: <0376e6bb2f7f2e1bdcf0eae47727e60d0f28ce05.camel@bitdefender.com>
References: <20180927112536.6909-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4jve=mj=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1g5UXJ-0007V4-Ul
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 11:32:50 +0000
In-Reply-To: <20180927112536.6909-1-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE4LTA5LTI3IGF0IDEyOjI1ICswMTAwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+
IFRoZSBuYW1lIG9mIHRoZSAid2l0aF9nbGEiIGZsYWcgaXMgY29uZnVzaW5nOyBpdCBoYXMgbm90
aGluZyB0byBkbwo+IHdpdGggdGhlIGV4aXN0ZW5jZSBvciBsYWNrIHRoZXJlb2Ygb2YgYSBmYXVs
dGluZyBHTEEsIGJ1dCByYXRoZXIKPiB3aGVyZQo+IHRoZSBmYXVsdCBvcmlnaW5hdGVkLiAgVGhl
IG5wZmVjLmtpbmQgdmFsdWUgaXMgYWx3YXlzIHZhbGlkLCBhbmQKPiBzaG91bGQgdGh1cyBiZSBw
cm9wYWdhdGVkLCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgZ2xhX3ZhbGlkIGlzIHNldCBvcgo+IG5v
dC4KPiAKPiBJbiBwYXJ0aWN1bGFyLCBnbGFfdmFsaWQgd2lsbCBuZXZlciBiZSBzZXQgb24gQU1E
IHN5c3RlbXM7IGJ1dAo+IG5wZmVjLmtpbmQgd2lsbCBzdGlsbCBiZSB2YWxpZCBhbmQgc2hvdWxk
IHN0aWxsIGJlIHByb3BhZ2F0ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWls
YSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRydSBJc2Fp
bGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
