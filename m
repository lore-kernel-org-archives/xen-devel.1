From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/3] xen: drop preempt_count() for non-debug
 builds
Date: Wed, 22 May 2019 04:12:10 -0600
Message-ID: <5CE5207A0200007800231481@prv1-mh.provo.novell.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTOEJ-0001CI-8n
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 10:12:15 +0000
In-Reply-To: <20190522094549.28397-3-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE5IGF0IDExOjQ1LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
MjYsOSArMjgsMTEgQEAgREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgX19wcmVlbXB0X2Nv
dW50KTsKPiAgICAgIHByZWVtcHRfY291bnQoKS0tOyAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ICB9IHdoaWxlICgwKQo+ICAKPiAtI2lmbmRlZiBOREVCVUcKPiAgdm9pZCBBU1NFUlRfTk9U
X0lOX0FUT01JQyh2b2lkKTsKPiArCj4gICNlbHNlCj4gKyNkZWZpbmUgcHJlZW1wdF9kaXNhYmxl
KCkgICAgYmFycmllcigpOwo+ICsjZGVmaW5lIHByZWVtcHRfZW5hYmxlKCkgICAgIGJhcnJpZXIo
KTsKClN0cmF5IHNlbWljb2xvbnMgKGNvdWxkIGJlIGRyb3BwZWQgd2hpbGUgY29tbWl0dGluZyBp
ZiB3ZSByZWFsbHkKd2FudCB0byBnbyB0aGlzIHJvdXRlKS4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
