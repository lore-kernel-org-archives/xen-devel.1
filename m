From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] xen: Fix event channel interface for
 XenDevice-s
Date: Fri, 11 Jan 2019 18:11:27 +0000
Message-ID: <20190111181127.GN1508@perard.uk.xensource.com>
References: <20190111180941.6198-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KriI=PT=citrix.com=prvs=907059760=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gi1HN-0007qe-Gy
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 18:11:37 +0000
Content-Disposition: inline
In-Reply-To: <20190111180941.6198-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgMDY6MDk6NDFQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gUGF0Y2ggInhlbjogYWRkIGV2ZW50IGNoYW5uZWwgaW50ZXJmYWNlIGZvciBYZW5E
ZXZpY2UtcyIgbWFrZXMgdXNlIG9mCj4gdGhlIHR5cGUgeGVuZXZ0Y2huX3BvcnRfb3JfZXJyb3Jf
dCwgYnV0IHRoaXMgaXNuJ3QgYXZhaWFibGUgYmVmb3JlIFhlbgo+IDQuNy4gQWxzbyB0aGUgZnVu
Y3Rpb24geGVuX2RldmljZV9iaW5kX2V2ZW50X2NoYW5uZWwgYXNzaWduIHRoZSByZXR1cm4KPiB2
YWx1ZSBvZiB4ZW5ldnRjaG5fYmluZF9pbnRlcmRvbWFpbiB0byBjaGFubmVsLT5sb2NhbF9wb3J0
IGJ1dCBjaGVjayB0aGUKPiByZXN1bHQgZm9yIGVycm9yIHdpdGggeGVuZGV2LT5sb2NhbF9wb3J0
Lgo+IAo+IEZpeCBieToKPiAtIHJlbW92aW5nIGxvY2FsX3BvcnQgZnJvbSBzdHJ1Y3QgWGVuRGV2
aWNlIGFzIGl0IGlzbid0IHVzZSBhbnl3ZXJlLgo+IC0gYWRkaW5nIGEgY29tcGF0aWJpbGl0eSB0
eXBlZGVmIGZvciB4ZW5ldnRjaG5fcG9ydF9vcl9lcnJvcl90IGZvciBYZW4KPiAgIDQuNiBhbmQg
ZWFybGllci4KPiAKPiBBcyBleHRyYSwgcmVwbGFjZSB0aGUgdHlwZSBvZiBYZW5FdmVudENoYW5u
ZWwtPmxvY2FsX3BvcnQgYnkKPiBldnRjaG5fcG9ydF90Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFu
dGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKTm90ZXM6ClRoaXMgcGF0
Y2ggZml4ICJ4ZW46IGFkZCBldmVudCBjaGFubmVsIGludGVyZmFjZSBmb3IgWGVuRGV2aWNlLXMi
IHRoYXQKaXNuJ3QgY29tbWl0ZWQgeWV0LCBvZiB0aGUgcGF0Y2ggc2VyaWVzICJYZW4gUFYgYmFj
a2VuZCAncWRldmlmaWNhdGlvbiciLgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
