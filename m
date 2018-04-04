From: Amit Tomer <amittomer25@gmail.com>
Subject: Re: [PATCH v2 1/2] xen/arm: Add MVEBU UART driver for
 Marvell Armada 3700 SoC
Date: Thu, 5 Apr 2018 04:47:33 +0530
Message-ID: <CABHD4K8B0w__smCYJciybt3iJOxj7EGxknNEv-gQtV0Lt1w9fw@mail.gmail.com>
References: <1522763375-13177-1-git-send-email-amittomer25@gmail.com>
 <1522763375-13177-2-git-send-email-amittomer25@gmail.com>
 <4a16edf6-5c9f-ec2d-7954-10259e1b53fd@arm.com>
 <CABHD4K8-0PUm5kKq8pA8aFGKeyGVD7zjEX+e5Uaq2VU8=MBP2g@mail.gmail.com>
 <ca46d0d2-793d-aba5-b59b-6566b7e21d39@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sj0y=gz=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1f3rep-0004bG-5o
 for xen-devel@lists.xenproject.org; Wed, 04 Apr 2018 23:17:35 +0000
Received: by mail-oi0-x242.google.com with SMTP id t16-v6so20845944oih.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Apr 2018 16:17:34 -0700 (PDT)
In-Reply-To: <ca46d0d2-793d-aba5-b59b-6566b7e21d39@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, George Dunlap <George.Dunlap@eu.citrix.com>, tim@xen.org, ian.jackson@eu.citrix.com, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgo+IEFoIHllcywgaWYgdGhhdCB3b3Jrcywgd2Ugc2hvdWxkLiBUaGF0IGJpdCBpcyBmcm9t
IHRoZSBMaW51eCBCU1AsIGlzbid0IGl0PwoKWWVzLCBpdCdzIGZyb20gTGludXggQlNQIGNvZGUg
b25seS4gSG9wZSBmb2xsb3dpbmcgaXMgZmluZS4KCiAgICBpZiAoIHJlZyAmIFNUQVRVU19UWEZJ
Rk9fRU1QICkKICAgICAgICByZXR1cm4gVFhfRklGT19TSVpFOwogICAgZWxzZSBpZiAoIHJlZyAm
IFNUQVRfVFhfRklGT19IRkwgKQogICAgICAgIHJldHVybiBUWF9GSUZPX1NJWkUgLyAyOwogICAg
ZWxzZSBpZiAoICEocmVnICYgU1RBVF9UWF9GSUZPX0ZVTCkgKQogICAgICAgIHJldHVybiAxOwoK
ICAgcmV0dXJuIDA7CgpUaGFua3MKLUFtaXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
