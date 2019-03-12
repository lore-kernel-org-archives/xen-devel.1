From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] SVM: fix build after "make nested
 page-fault tracing and logging consistent"
Date: Tue, 12 Mar 2019 15:43:19 +0000
Message-ID: <20190312154319.f2tyv67maar23qv4@zion.uk.xensource.com>
References: <5C87CF3D020000780021DD02@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7hwM=RP=citrix.com=prvs=967af9503=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h3jYp-0006cf-H8
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 15:43:23 +0000
Content-Disposition: inline
In-Reply-To: <5C87CF3D020000780021DD02@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTIsIDIwMTkgYXQgMDk6MjQ6NDVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gU29tZSBjb21waWxlciB2ZXJzaW9ucyBkb24ndCByZWNvZ25pemUgdGhhdCAibWZuIiBj
YW4ndCByZWFsbHkgYmUgdXNlZAo+IHVuaW5pdGlhbGl6ZWQgaW4gc3ZtX2RvX25lc3RlZF9wZ2Zh
dWx0KCkuIFRvIGJlIG9uIHRoZSBzYWZlIHNpZGUsIGFkZCBhbgo+IGluaXRpYWxpemVyIGZvciBw
Mm10IGFzIHdlbGwuCj4gCj4gUmVwb3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
