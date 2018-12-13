From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 23/25] argo: signal x86 HVM and ARM via VIRQ
Date: Thu, 13 Dec 2018 07:16:20 -0700
Message-ID: <5C1269B40200007800205DFA@prv1-mh.provo.novell.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-24-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXRms-0002hY-6h
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 14:16:26 +0000
In-Reply-To: <1543627984-21394-24-git-send-email-christopher.w.clark@gmail.com>
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
IHdyb3RlOgo+ICogeDg2IFBWIGRvbWFpbnMgYXJlIG5vdGlmaWVkIHZpYSBldmVudCBjaGFubmVs
Lgo+IAo+IFBWIGd1ZXN0cyBhcmUga25vd24gdG8gaGF2ZSB0aGUgZXZlbnQgY2hhbm5lbCBzb2Z0
d2FyZSBwcmVzZW50IGluIHRoZSBndWVzdAo+IGtlcm5lbCwgc28gaXQgaXMgZmluZSB0byBkZXBl
bmQgb24gYW5kIHVzZSBpdC4KPiAKPiAqIHg4NiBIVk0gZG9tYWlucyBhbmQgYWxsIEFSTSBkb21h
aW5zIGFyZSBub3RpZmllZCB2aWEgVklSUS4KPiAKPiBUaGUgaW50ZW50IGlzIHRvIHJlbW92ZSB0
aGUgcmVxdWlyZW1lbnQgZm9yIGV2ZW50IGNoYW5uZWwgc29mdHdhcmUgdG8gYmUKPiBpbnN0YWxs
ZWQgd2l0aGluIHRoZXNlIGd1ZXN0cyBpbiBvcmRlciB0byB1c2UgQXJnby4gVklSUSBzaWduYWxs
aW5nIGlzIGFsc28KPiB0aGUgbWV0aG9kIHRoYXQgaGFzIGJlZW4gaW4gdXNlIGZvciB0aGUgbG9u
Z2VzdCBwZXJpb2Qgd2l0aCB0aGlzIGh5cGVyY2FsbAo+IGluIGJvdGggWGVuQ2xpZW50IGFuZCBP
cGVuWFQuCgpJJ20gYWZyYWlkIEkgZG9uJ3QgZm9sbG93OiBzZW5kX2d1ZXN0X2dsb2JhbF92aXJx
KCkgdXNlcywgd2VsbCwKZXZ0Y2huX3BvcnRfc2V0X3BlbmRpbmcoKSwganVzdCBsaWtlIGV2dGNo
bl9zZW5kKCkgZG9lcy4KVGhlcmVmb3JlIGhvdyBkb2VzIHNlbmRpbmcgYSB2SVJRIGhlbHAgd2l0
aCBhIGd1ZXN0IHdpdGhvdXQKZXZlbnQgY2hhbm5lbCBhd2FyZW5lc3M/CgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
