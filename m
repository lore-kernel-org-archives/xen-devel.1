From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Subject: Re: [PATCH v2 1/2] xen/arm: Add MVEBU UART driver for
 Marvell Armada 3700 SoC
Date: Thu, 5 Apr 2018 00:22:55 +0100
Message-ID: <a617ff13-8076-cb1f-e473-5c96af26fd01@arm.com>
References: <1522763375-13177-1-git-send-email-amittomer25@gmail.com>
 <1522763375-13177-2-git-send-email-amittomer25@gmail.com>
 <4a16edf6-5c9f-ec2d-7954-10259e1b53fd@arm.com>
 <CABHD4K8-0PUm5kKq8pA8aFGKeyGVD7zjEX+e5Uaq2VU8=MBP2g@mail.gmail.com>
 <ca46d0d2-793d-aba5-b59b-6566b7e21d39@arm.com>
 <CABHD4K8B0w__smCYJciybt3iJOxj7EGxknNEv-gQtV0Lt1w9fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dcal=gz=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1f3rk7-0005GM-AF
 for xen-devel@lists.xenproject.org; Wed, 04 Apr 2018 23:23:03 +0000
In-Reply-To: <CABHD4K8B0w__smCYJciybt3iJOxj7EGxknNEv-gQtV0Lt1w9fw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, George Dunlap <George.Dunlap@eu.citrix.com>, tim@xen.org, ian.jackson@eu.citrix.com, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDQvMTggMDA6MTcsIEFtaXQgVG9tZXIgd3JvdGU6Cj4gSGksCj4gCj4+IEFoIHllcywg
aWYgdGhhdCB3b3Jrcywgd2Ugc2hvdWxkLiBUaGF0IGJpdCBpcyBmcm9tIHRoZSBMaW51eCBCU1As
IGlzbid0IGl0Pwo+IAo+IFllcywgaXQncyBmcm9tIExpbnV4IEJTUCBjb2RlIG9ubHkuIEhvcGUg
Zm9sbG93aW5nIGlzIGZpbmUuCj4gCj4gICAgIGlmICggcmVnICYgU1RBVFVTX1RYRklGT19FTVAg
KQo+ICAgICAgICAgcmV0dXJuIFRYX0ZJRk9fU0laRTsKPiAgICAgZWxzZSBpZiAoIHJlZyAmIFNU
QVRfVFhfRklGT19IRkwgKQoKbm8gZWxzZSBuZWVkZWQuCkknZCB3cml0ZSBpdCBsaWtlOgoJaWYg
KGVtcHR5KQoJCXJldHVybiBGSUZPX1NJWkU7CgoJaWYgKGZ1bGwpCgkJcmV0dXJuIDA7CgoJaWYg
KGhhbGYpCgkJcmV0dXJuIEZJRk9fU0laRSAvIDI7CgoJLyogY29tbWVudCAuLi4gKi8KCXJldHVy
biAxOwoKQ2hlZXJzLApBbmRyZS4KCj4gICAgICAgICByZXR1cm4gVFhfRklGT19TSVpFIC8gMjsK
PiAgICAgZWxzZSBpZiAoICEocmVnICYgU1RBVF9UWF9GSUZPX0ZVTCkgKQo+ICAgICAgICAgcmV0
dXJuIDE7Cj4gCj4gICAgcmV0dXJuIDA7Cj4gCj4gVGhhbmtzCj4gLUFtaXQKPiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
