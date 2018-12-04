From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 08/25] xen: define XEN_GUEST_HANDLE_NULL as
 null XEN_GUEST_HANDLE
Date: Tue, 04 Dec 2018 04:39:20 -0700
Message-ID: <5C0667680200007800202A63@prv1-mh.provo.novell.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-9-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gU932-00051s-5j
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 11:39:28 +0000
In-Reply-To: <1543627984-21394-9-git-send-email-christopher.w.clark@gmail.com>
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

Pj4+IE9uIDAxLjEyLjE4IGF0IDAyOjMyLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci5j
bGFyazZAYmFlc3lzdGVtcy5jb20+CgpIZXJlIGFuZCBlbHNld2hlcmU6IFN1Y2ggYWRkaXRpb25z
LCB3aGljaCB3ZSd2ZSBmb3VuZCBubyBuZWVkIGZvcgp0aWxsIG5vdywgc2hvdWxkIG5vdCBiZSBz
dWJtaXR0ZWQgd2l0aG91dCBnaXZpbmcgYSByZWFzb24gZm9yIHdoeQp0aGV5IGJlY29tZSBuZWNl
c3Nhcnkgb3IgYXQgbGVhc3QgZGVzaXJhYmxlLgoKPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMv
eGVuLmgKPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgKPiBAQCAtOTgyLDYgKzk4Miw4
IEBAIHR5cGVkZWYgc3RydWN0IHsKPiAgI2RlZmluZSBYRU5fR1VFU1RfSEFORExFXzY0KG5hbWUp
IFhFTl9HVUVTVF9IQU5ETEUobmFtZSkKPiAgI2VuZGlmCj4gIAo+ICsjZGVmaW5lIFhFTl9HVUVT
VF9IQU5ETEVfTlVMTChuYW1lKSAoWEVOX0dVRVNUX0hBTkRMRShuYW1lKSl7KG5hbWUgKikwfQoK
UHVibGljIGhlYWRlcnMgYXJlIGludGVuZGVkIHRvIGJlIHVzYWJsZSBpbiBDODkgbW9kZS4gV2hp
bGUgdGhpcwp3b24ndCBjYXVzZSBjb21waWxhdGlvbiB0byBmYWlsIHdoZW4gbm90IHVzZWQsIGl0
IHN0aWxsIGlzIGEgdmlvbGF0aW9uCm9mIHRoaXMgcHJpbmNpcGxlLiBGdXJ0aGVybW9yZSB0aGUg
Y29uc3RydWN0IGlzIGluY29tcGxldGVseQpwYXJlbnRoZXNpemVkLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
