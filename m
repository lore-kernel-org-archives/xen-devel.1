From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 22/25] xen/evtchn: expose
 send_guest_global_virq for use within Xen
Date: Thu, 13 Dec 2018 07:12:51 -0700
Message-ID: <5C1268E30200007800205DC6@prv1-mh.provo.novell.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-23-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXRjV-0002Rf-3W
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 14:12:57 +0000
In-Reply-To: <1543627984-21394-23-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEyLjE4IGF0IDAyOjMzLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IFRvIGJlIHVzZWQgYnkgQXJnbyBmb3IgZGVsaXZlcnkgb2Ygbm90aWZpY2F0aW9u
cyB0byBzb21lIGd1ZXN0cy4KCkJldHRlciBub3QgdG8gbWFrZSB0aGlzIGEgc2VwYXJhdGUgcGF0
Y2g6IEJ5IGZvbGRpbmcgaXQgaW50byB3aGVyZSBpdCdzCm5lZWRlZCBpdCBpcyBlYXNpZXIgZm9y
IGV2ZXJ5b25lIHRvIGp1ZGdlIHdoZXRoZXIgdGhlIGV4cG9zdXJlIGlzCmluZGVlZCBuZWNlc3Nh
cnksIGFuZCBpdCBhbHNvIGVsaW1pbmF0ZXMgdGhlIHJpc2sgb2YgdGhlIHNlcmllcyBnZXR0aW5n
CmNvbW1pdHRlZCB1cCB0byBoZXJlLCBhbmQgdGhlIGZ1bmN0aW9uIHRoZW4gYmVpbmcgcG9pbnRs
ZXNzbHkgbm9uLQpzdGF0aWMgZm9yIGFuIGV4dGVuZGVkIHBlcmlvZCBvZiB0aW1lLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
