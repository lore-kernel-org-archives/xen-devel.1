From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 3/3] x86/HVM: honor p2m_ioreq_server type
Date: Thu, 15 Nov 2018 05:43:36 -0700
Message-ID: <5BED69F802000078001FC60B@prv1-mh.provo.novell.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wsre=n2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gNGzk-0008K9-Lv
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 12:43:40 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

MTogX19odm1fY29weSgpIHNob3VsZCBub3Qgd3JpdGUgdG8gcDJtX2lvcmVxX3NlcnZlciBwYWdl
cwoyOiBodm1fbWFwX2d1ZXN0X2ZyYW1lX3J3KCkgc2hvdWxkIHJlc3BlY3QgcDJtX2lvcmVxX3Nl
cnZlcgozOiBlbXVsYXRlX2d2YV90b19tZm4oKSBzaG91bGQgcmVzcGVjdCBwMm1faW9yZXFfc2Vy
dmVyCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
