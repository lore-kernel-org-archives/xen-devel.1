From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 03/18] argo: define argo_dprintk for
 subsystem debugging
Date: Thu, 20 Dec 2018 08:20:34 -0700
Message-ID: <5C1BB3420200007800208200@prv1-mh.provo.novell.com>
References: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
 <1545287955-27684-4-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ga07s-0007th-F2
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 15:20:40 +0000
In-Reply-To: <1545287955-27684-4-git-send-email-christopher.w.clark@gmail.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEyLjE4IGF0IDA3OjM5LCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IC0tLSBhL3hlbi9jb21tb24vYXJnby5jCj4gKysrIGIveGVuL2NvbW1vbi9hcmdv
LmMKPiBAQCAtMTksNiArMTksMTkgQEAKPiAgI2luY2x1ZGUgPHhlbi9lcnJuby5oPgo+ICAjaW5j
bHVkZSA8eGVuL2d1ZXN0X2FjY2Vzcy5oPgo+ICAKPiArLyoKPiArICogRGVidWcKPiArICovCj4g
Kwo+ICsvKiBTZXQgQVJHT19ERUJVRyB0byAxIGhlcmUgdG8gZW5hYmxlIG1vcmUgZGVidWcgbWVz
c2FnZXMgKi8KPiArI2RlZmluZSBBUkdPX0RFQlVHIDAKPiArCj4gKyNpZmRlZiBBUkdPX0RFQlVH
CgpXZWxsLCBlaXRoZXIgdGhlIHdheSB0byBzd2l0Y2ggYmV0d2VlbiBtb2RlcyBpcyByZXBsYWNp
bmcgdGhlCjAgYnkgYSAxIGFib3ZlIChpbiB3aGljaCBjYXNlIHlvdSBtZWFuICNpZiBoZXJlKSBv
ciB5b3UgbWVhbgojaWZkZWYgaGVyZSBhbmQgd2FudCB0byBzd2l0Y2ggYnkgdG9nZ2xpbmcgYmV0
d2VlbiAjZGVmaW5lCmFuZCAjdW5kZWYuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
