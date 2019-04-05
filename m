From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH 0/7] x86: eliminate Intel-isms from x2APIC
 setup
Date: Fri, 05 Apr 2019 02:05:14 -0600
Message-ID: <5CA70C3A0200007800224C96@prv1-mh.provo.novell.com>
References: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCJqg-0007a8-W6
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 08:05:19 +0000
In-Reply-To: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAzLjE5IGF0IDE1OjQzLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IFRo
aXMgaXMgYSBmaXJzdCBwcmVwYXJhdG9yeSBzdGVwIGZvciBlbmFibGluZyB4MkFQSUMgc3VwcG9y
dCBhbHNvCj4gZm9yIEFNRCAocGx1cyBzb21lIG1pc2MgY2xlYW51cCkuCj4gCj4gMTogZW50cnk6
IGRyb3AgdW51c2VkIGhlYWRlciBpbmNsdXNpb25zCj4gMjogQVBJQzogc3VwcHJlc3MgcmVkdW5k
YW50ICJTd2l0Y2hlZCB0byAuLi4iIG1lc3NhZ2VzCj4gMzogQUNQSTogYWxzbyBwYXJzZSBBTUQg
SU9NTVUgdGFibGVzIGVhcmx5Cj4gNDogSU9NTVU6IGludHJvZHVjZSBpbml0LW9wcyBzdHJ1Y3R1
cmUKPiA1OiBJT01NVTogYWJzdHJhY3QgSW50ZWwtc3BlY2lmaWMgaW9tbXVfc3VwcG9ydHNfZWlt
KCkKPiA2OiBJT01NVTogYWJzdHJhY3QgSW50ZWwtc3BlY2lmaWMgaW9tbXVfe2VuLGRpc31hYmxl
X3gyYXBpY19JUigpCj4gNzogSU9NTVU6IGluaXRpYWxpemUgaW9tbXVfb3BzIGluIHZlbmRvci1p
bmRlcGVuZGVudCBjb2RlCgpXaGVyZSBhcHBsaWNhYmxlLCBtYXkgSSBhc2sgZm9yIGFuIFNWTSAv
IEFNRCBJT01NVSBtYWludGFpbmVyCmFjayAob3Igb3RoZXJ3aXNlKSBwbGVhc2U/CgpUaGFua3Ms
IEphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
