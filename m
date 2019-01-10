From: Eric Chanudet <eric.chanudet@gmail.com>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Thu, 10 Jan 2019 11:16:23 -0500
Message-ID: <20190110161623.yeydcl4kqvalmemp@legion>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nfDD=PS=gmail.com=eric.chanudet@srs-us1.protection.inumbo.net>)
 id 1ghd0N-0006cE-5S
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 16:16:27 +0000
Received: by mail-qt1-x843.google.com with SMTP id e5so13623258qtr.12
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jan 2019 08:16:25 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, James McKenzie <james@bromium.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDEvMTkgYXQgMTE6NDJwbSwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4rcGFydG5l
cl9yaW5nc19yZW1vdmUoc3RydWN0IGRvbWFpbiAqc3JjX2QpCjxzbmlwPgo+KyAgICAgICAgICAg
ICAgICByaW5nX2luZm8gPSByaW5nX2ZpbmRfaW5mbyhkc3RfZCwgJnNlbmRfaW5mby0+aWQpOwpy
aW5nX2ZpbmRfaW5mbyBpcyBkZWZpbmVkIGxhdGVyIChQQVRDSCAwNy8xNSksIHNob3VsZCBpdCBi
ZSBtb3ZlZCB0bwp0aGlzIHBhdGNoIHNpbmNlIGl0IGlzIG5vdyB1c2VkIGhlcmU/CgotLSAKRXJp
YyBDaGFudWRldAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
