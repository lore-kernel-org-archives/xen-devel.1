From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
Date: Tue, 23 Apr 2019 13:33:30 +0300
Message-ID: <2f325cd5-22bc-c4b5-4a10-5e1189631384@gmail.com>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
 <e877f9f5-ea44-47cd-a974-971768a17735@gmail.com>
 <4e237119-9b7b-6f96-a50b-f8c996ba0c2c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dq19=SZ=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hIsk3-00067P-U2
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 10:33:36 +0000
Received: by mail-lf1-x143.google.com with SMTP id j20so11333585lfh.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2019 03:33:34 -0700 (PDT)
In-Reply-To: <4e237119-9b7b-6f96-a50b-f8c996ba0c2c@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gQW5kcmV3LAoKT24gMjMuMDQuMTkgMTI6NDcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4g
c2NoZWR1bGVfdGFpbCgpIGlzIGNhbGxlZCB3aXRoIGN1cnJlbnQgZnJvbSB0aGUgY29udGludWVf
cnVubmluZygpIHBhdGguCk5vdCBvbiBBUk0uIE9uIEFSTSBjb250aW51ZV9ydW5uaW5nKCkgaXMg
ZW1wdHkuCkZvciB0aGUgcXVpY2sgY2hlY2sgSSd2ZSBwdXQgYSBCVUcoKSBpbnRvIHRoZSBgZWxz
ZWAgYnJhbmNoLCBhbmQgZGlkIG5vdCBoaXQgaXQgZHVyaW5nIHN5c3RlbSB1cCwgZG9tYWluIGNy
ZWF0ZS9kZXN0cm95LCBldGMuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
