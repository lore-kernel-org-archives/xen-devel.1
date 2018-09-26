From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] fuzz,
 test x86_emulator: disable sse before including always_inline fns
Date: Wed, 26 Sep 2018 09:36:39 +0100
Message-ID: <20180926083639.ylv7ptaviq4vzrfm@zion.uk.xensource.com>
References: <CACMJ4Gb8qRQYN_P9471mtHNfsocOUC1sqE3PVgospq+6tWVNWA@mail.gmail.com>
 <1537831358-22655-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=avo5=mi=citrix.com=prvs=80087d113=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g55JQ-00065C-SV
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 08:36:48 +0000
Content-Disposition: inline
In-Reply-To: <1537831358-22655-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, wei.liu2@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCBpcyBjYXVzaW5nIGJ1aWxkIGZhaWx1cmUuCgpTZWU6CgpodHRwOi8vbG9ncy50
ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTI4MDg3L2J1aWxkLWFtZDY0LzYu
dHMteGVuLWJ1aWxkLmxvZwoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
