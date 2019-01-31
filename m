From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 02/15] argo: introduce the argo_op
 hypercall boilerplate
Date: Thu, 31 Jan 2019 03:22:57 -0700
Message-ID: <5C52CC81020000780021298F@prv1-mh.provo.novell.com>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-3-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gp9Ut-0005Xo-65
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 10:23:03 +0000
In-Reply-To: <1548908900-1128-3-git-send-email-christopher.w.clark@gmail.com>
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjAxLjE5IGF0IDA1OjI4LCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IFByZXNlbmNlIGlzIGdhdGVkIHVwb24gQ09ORklHX0FSR08uCj4gCj4gUmVnaXN0
ZXJzIHRoZSBoeXBlcmNhbGwgcHJldmlvdXNseSByZXNlcnZlZCBmb3IgdGhpcy4KPiBUYWtlcyA1
IGFyZ3VtZW50cywgZG9lcyBub3RoaW5nIGFuZCByZXR1cm5zIC1FTk9TWVMuCj4gCj4gSW1wbGVt
ZW50YXRpb24gd2lsbCBwcm92aWRlIGEgY29tcGF0IEFCSSBzbyBDT01QQVRfQ0FMTCBpcyB0aGUK
PiBtYWNybyB1c2VkIGluIHRoZSBoeXBlcmNhbGwgdGFibGVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+Cj4g
LS0tCj4gdjYgZHJvcHBlZCBKYW4gQWNrZWQtYnkgZHVlIHRvIGNoYW5nZSBvZiBpbXBsZW1lbnRh
dGlvbiBhbmQgY29tbWl0IG1zZwoKRmVlbCBmcmVlIHRvIHJlLWluc3RhdGUuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
