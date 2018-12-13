From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V11 4/5] p2m: Always use hostp2m when
 clipping rangesets
Date: Thu, 13 Dec 2018 03:43:59 -0700
Message-ID: <5C1237EF0200007800205C8F@prv1-mh.provo.novell.com>
References: <1544001488-23763-1-git-send-email-rcojocaru@bitdefender.com>
 <1544001488-23763-5-git-send-email-rcojocaru@bitdefender.com>
 <5C07FD4302000078002033AF@prv1-mh.provo.novell.com>
 <5e22ea77-26f9-be55-c30f-8a598cd35218@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXOTM-00039J-BF
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 10:44:04 +0000
In-Reply-To: <5e22ea77-26f9-be55-c30f-8a598cd35218@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjEyLjE4IGF0IDExOjIyLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gRm9yIG15IG93biBwYXJ0LCBJIHNlZSBubyByZWFzb24gd2h5IG5vdCBjbGlwcGluZyBl
bmQgc2hvdWxkIG5vdCB3b3JrCj4gd2hlbiB1cGRhdGluZyB0aGUgcmFuZ2VzIG9ubHkgKGFzIGxv
bmcgYXMgc3RhcnQgY29udGludWVzIHRvIGJlIDw9Cj4gdW5jbGlwcGVkX2VuZCkuCj4gCj4gV291
bGQgdGhhdCBtb2RpZmljYXRpb24gKyB0ZXN0aW5nIG9mIGl0IGhlbHAgdGhpcyBzZXJpZXMgY29u
dGludWU/CgpJIHRoaW5rIHNvLCBhdCBsZWFzdCBhcyBmYXIgYXMgSSdtIGNvbmNlcm5lZC4gQnV0
IEkgdGhpbmsgd2UgcmVhbGx5IG5lZWQKR2VvcmdlJ3Mgb3BpbmlvbiBhcyB3ZWxsLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
