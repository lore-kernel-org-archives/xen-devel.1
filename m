From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 21/25] argo: add array_index_nospec to guard
 the result of the hash func
Date: Thu, 13 Dec 2018 07:10:45 -0700
Message-ID: <5C1268650200007800205DC3@prv1-mh.provo.novell.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-22-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXRhT-0002J5-7A
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 14:10:51 +0000
In-Reply-To: <1543627984-21394-22-git-send-email-christopher.w.clark@gmail.com>
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
IHdyb3RlOgo+IFRoaXMgaXMgb3V0IG9mIGFuIGFidW5kYW5jZSBvZiBjYXV0aW9uLCBzaW5jZSB0
aGlzIGlzIGEgdmVyeSBiYXNpYyBoYXNoCj4gZnVuY3Rpb24sIGNob3NlbiBtb3JlIGZvciBpdHMg
YnVja2V0IGRpc3RyaWJ1dGlvbiBwcm9wZXJ0aWVzIHRvIGNsdXN0ZXIgcmVsYXRlZAo+IHJpbmdz
IHJhdGhlciB0aGFuIGZvciBjcnlwdG9ncmFwaGljIHN0cmVuZ3RoIG9yIGFueSB1bmlmb3JtbmVz
cyBvZiBvdXRwdXQsCj4gYW5kIGl0IG9wZXJhdGVzIHVwb24gdmFsdWVzIHN1cHBsaWVkIGJ5IHRo
ZSBndWVzdCBqdXN0IGJlZm9yZSBiZWluZyB1c2VkIGFzIGFuCj4gYXJyYXkgaW5kZXguCgpTYW1l
IGhlcmU6IEJldHRlciB0byBwdXQgdGhpcyBpbiBwbGFjZSByaWdodCBhd2F5IGZvciBuZXcgY29k
ZQp0aGFuIHRvIGluY3JlbWVudGFsbHkgYWRkIGl0IGxhdGVyLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
