From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 3/3] string: fix type use in strstr()
Date: Mon, 7 Jan 2019 10:53:16 +0100
Message-ID: <4b525e88-020a-ac23-0726-19cec94f5ef6@suse.com>
References: <5C331C51020000780020AB3F@prv1-mh.provo.novell.com>
 <5C331E84020000780020AB56@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AFjD=PP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ggRax-0000vf-FW
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 09:53:19 +0000
In-Reply-To: <5C331E84020000780020AB56@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDEvMjAxOSAxMDo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVXNpbmcgcGxhaW4gaW50
IGZvciBzdHJpbmcgbGVuZ3Rocywgd2hpbGUgb2theSBmb3IgYWxsIHByYWN0aWNhbAo+IHB1cnBv
c2VzLCBpcyB1bmRlc2lyYWJsZSBpbiBhIGdlbmVyaWMgbGlicmFyeSBmdW5jdGlvbi4KPiAKPiBU
YWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxzbyBtb3ZlIHRoZSBmdW5jdGlvbiBmcm9tIGJlaW5n
IGluIHRoZSBtaWRkbGUKPiBvZiBtZW0qKCkgb25lcyB0byB0aGUgc2V0IG9mIHN0ciooKSBvbmVz
LCBjb252ZXJ0IGl0cyBsb29wIGZyb20gd2hpbGUoKQo+IHRvIGZvcigpLCBhbmQgY29ycmVjdCBz
dHlsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
