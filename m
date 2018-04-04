From: Amit Tomer <amittomer25@gmail.com>
Subject: Re: [PATCH v2 1/2] xen/arm: Add MVEBU UART driver for
 Marvell Armada 3700 SoC
Date: Thu, 5 Apr 2018 03:55:40 +0530
Message-ID: <CABHD4K8-0PUm5kKq8pA8aFGKeyGVD7zjEX+e5Uaq2VU8=MBP2g@mail.gmail.com>
References: <1522763375-13177-1-git-send-email-amittomer25@gmail.com>
 <1522763375-13177-2-git-send-email-amittomer25@gmail.com>
 <4a16edf6-5c9f-ec2d-7954-10259e1b53fd@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sj0y=gz=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1f3qqc-00019H-SG
 for xen-devel@lists.xenproject.org; Wed, 04 Apr 2018 22:25:42 +0000
Received: by mail-oi0-x243.google.com with SMTP id u141-v6so20766426oif.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Apr 2018 15:25:41 -0700 (PDT)
In-Reply-To: <4a16edf6-5c9f-ec2d-7954-10259e1b53fd@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, George Dunlap <George.Dunlap@eu.citrix.com>, tim@xen.org, ian.jackson@eu.citrix.com, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgo+IEp1c3QgYSBuaXQsIGJ1dCBpdCBtaWdodCBiZSBzbWFydGVyIHRvIGZpcnN0IGNoZWNr
IGZvciB0aGUgcmVjZWl2ZSBJUlEsCj4gYmVjYXVzZSBub3QgaGFuZGxpbmcgdGhpcyBtaWdodCBs
b29zZSBpbmZvcm1hdGlvbi4gVFggaXMgbGVzcyBjcml0aWNhbC4KCk9rLCBhY3R1YWxseSB0cmll
ZCBpdCBlYWxpZXIgd2hlbiAgSSB3YXMgZGVidWdnaW5nIHRoZSBSeCBwYXRoIGlzc3VlIGFuZAp0
aGF0IHRpbWUgaXQgZGlkbid0IHdvcmsuIE1heSBiZSBJIHNob3VsZCB0cnkgaXQgYWdhaW4uCgoK
PiBTaW1pbGFyIHRvIHRoZSBlYXJseXByaW50ayBiZWhhdmlvdXIgd2UgYXJlIGEgYml0IHBlc3Np
bWlzdGljIGhlcmUuIEkKPiBkb24ndCBrbm93IGlmIHRoZXJlIGlzIGEgd2F5IHRvIGRldGVybWlu
ZSB0aGUgbnVtYmVyIG9mIGZyZWUgY2hhcmFjdGVycwo+IGluIHRoZSBGSUZPLCBidXQgd2UgY291
bGQgYXQgbGVhc3QgcmV0dXJuIDEgaWYgdGhlIEZJRk8gaXMgbm90IGZ1bGw6Cj4KPiAgICAgICAg
IGlmIChmaWZvX2VtcHR5KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gRklGT19TSVpFOwo+ICAg
ICAgICAgaWYgKCFmaWZvX2Z1bGwpCj4gICAgICAgICAgICAgICAgIHJldHVybiAxOwo+ICAgICAg
ICAgcmV0dXJuIDA7CgpZZWFoLCBJIHRob3VnaHQgb2YgaXQgaW5pdGlhbGx5IGxpa2Ugc2hvdWxk
IHdlIGFsc28gcmV0dXJuIGhhbGYgdGhlCnNpemUgb2YgRklGTygxNikgd2hlbiBTVEFUX1RYX0ZJ
Rk9fSEZMIGJpdCBpcyBzZXQgPwoKClRoYW5rcwotQW1pdC4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
