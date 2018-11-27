From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] amd-iommu: remove page merging code
Date: Tue, 27 Nov 2018 06:01:31 -0700
Message-ID: <5BFD402B02000078002005C5@prv1-mh.provo.novell.com>
References: <20181126173045.1274-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=2mkr=og=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRczh-0003RK-Ts
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 13:01:37 +0000
In-Reply-To: <20181126173045.1274-1-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjExLjE4IGF0IDE4OjMwLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFRoZSBwYWdlIG1lcmdpbmcgbG9naWMgbWFrZXMgdXNlIG9mIGJpdHMgMS04IGFuZCBiaXQg
NjMgb2YgYSBQVEUsIHdoaWNoIHVzZWQKPiB0byBiZSBzcGVjaWZpZWQgYXMgaWdub3JlZC4gSG93
ZXZlciwgYml0cyA1IGFuZCA2IGFyZSBub3cgc3BlY2lmaWVkIGFzCj4gJ2FjY2Vzc2VkJyBhbmQg
J2RpcnR5JyBiaXRzIGFuZCB0aGVpciB1c2Ugb25seSByZW1haW5zIHNhZmUgYXMgbG9uZyBhcwo+
IHRoZSBEVEUgJ0hvc3QgQWNjZXNzIERpcnR5JyBiaXRzIHJlbWFpbiBjbGVhci4gVGhlIGNvZGUg
aXMgYWxzbyBvZiBkdWJpb3VzCj4gYmVuZWZpdCBhbmQgd2FzIHRoZSBzdWJqZWN0IFhTQS0yNzUu
Cj4gCj4gVGhpcyBwYXRjaCByZW1vdmVzIHRoZSBjb2RlLCBmcmVlaW5nIHVwIHRoZSByZW1haW5p
bmcgUFRFICdpZ25vcmVkJyBiaXRzCj4gZm9yIG90aGVyIHBvdGVudGlhbCB1c2UgYW5kIHNob3J0
ZW5pbmcgdGhlIHNvdXJjZSBieSAxNzAgbGluZXMuCgpObyB3b3JkIGF0IGFsbCBhYm91dCB0aGUg
cGVyZm9ybWFuY2UgaW1wbGljYXRpb25zPyBEbyB5b3UgaGF2ZQphbnkgcGxhbnMgdG8gcmUtaW50
cm9kdWNlIHByb3Blcmx5IHdvcmtpbmcgcGFnZSByZWNvbWJpbmluZwpjb2RlPyBJIHJlYWxpemUg
VlQtZCBkb2Vzbid0IGhhdmUgYW55IGVpdGhlciAodGhlIG1haW50YWluZXJzIGF0CnNvbWUgcG9p
bnQgaW4gdGhlIGRpc3RhbnQgcGFzdCBoYWQgcHJvbWlzZWQgdG8gaW1wbGVtZW50IGl0LCBidXQK
SSBndWVzcyB0aGF0J3MgbG9uZyBiZWVuIGZvcmdvdHRlbiksIGJ1dCBhbnl3YXkuLi4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
