From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 24/25] argo: unmap rings on suspend and send
 signal to ring-owners on resume
Date: Thu, 13 Dec 2018 07:26:14 -0700
Message-ID: <5C126C060200007800205E28@prv1-mh.provo.novell.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-25-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXRwR-00044a-EH
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 14:26:19 +0000
In-Reply-To: <1543627984-21394-25-git-send-email-christopher.w.clark@gmail.com>
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
IHdyb3RlOgo+IHNvIHRoYXQgdGhlIGd1ZXN0IG1heSByZS1yZWdpc3RlciB0aGUgcmluZ3Mgb24g
cmVzdW1lIHdpdGggY3VycmVudCBtYXBwaW5ncy4KCklzIHRoaXMgc29tZXRoaW5nIGd1ZXN0cyBy
ZWFsbHkgbmVlZCBoZWxwIHdpdGgsIHJhdGhlciB0aGFuIG1hbmFnaW5nCml0IG9uIHRoZWlyIG93
bj8gV2hhdCBkb2VzICJjdXJyZW50IG1hcHBpbmdzIiBoZXJlIG1lYW4sIGkuZS4gd2h5CmRvIHJp
bmdzIG5lZWQgcmUtcmVnaXN0cmF0aW9uIGluIHRoZSBmaXJzdCBwbGFjZT8KCj4gK3ZvaWQKPiAr
YXJnb19yZXN1bWUoc3RydWN0IGRvbWFpbiAqZCkKPiArewo+ICsgICAgYm9vbCBzZW5kX3dha2V1
cDsKPiArCj4gKyAgICBpZiAoICFkICkKPiArICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAgaWYg
KCAhZ2V0X2RvbWFpbihkKSApCj4gKyAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgIHJlYWRfbG9j
aygmYXJnb19sb2NrKTsKPiArCj4gKyAgICByZWFkX2xvY2soJmQtPmFyZ28tPmxvY2spOwo+ICsg
ICAgc2VuZF93YWtldXAgPSAoIGQtPmFyZ28tPnJpbmdfY291bnQgPiAwICk7Cj4gKyAgICByZWFk
X3VubG9jaygmZC0+YXJnby0+bG9jayk7Cj4gKwo+ICsgICAgaWYgKCBzZW5kX3dha2V1cCApCj4g
KyAgICAgICAgYXJnb19zaWduYWxfZG9tYWluKGQpOwo+ICsKPiArICAgIHJlYWRfdW5sb2NrKCZh
cmdvX2xvY2spOwo+ICsKPiArICAgIHB1dF9kb21haW4oZCk7Cj4gK30KCmRvbWFpbl9yZXN1bWUo
KSBhbHNvIGdldHMgY2FsbGVkIGZyb20gZG9tYWluX3NvZnRfcmVzZXQoKS4gRG8KeW91IHJlYWxs
eSB3YW50IHN1Y2ggaGFuZGxpbmcgaW4gdGhhdCBjYXNlIGFzIHdlbGwsIHdoZW4gYWZ0ZXIgYQpz
b2Z0LXJlc2V0IHRoZSBkb21haW4gaXMgc3VwcG9zZWQgdG8gYmUgImJsYW5rIj8KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
