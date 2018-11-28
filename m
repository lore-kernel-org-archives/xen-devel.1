From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] amd-iommu: remove page merging code
Date: Wed, 28 Nov 2018 10:41:11 +0000
Message-ID: <827a9ca9-80b5-1ab9-3fb0-24e6a94b3918@citrix.com>
References: <20181128095559.5101-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IjsL=OH=citrix.com=prvs=863db4d22=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gRxHQ-0006NU-Pq
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 10:41:16 +0000
In-Reply-To: <20181128095559.5101-1-paul.durrant@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMTEvMjAxOCAwOTo1NSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZSBwYWdlIG1lcmdp
bmcgbG9naWMgbWFrZXMgdXNlIG9mIGJpdHMgMS04IGFuZCBiaXQgNjMgb2YgYSBQVEUsIHdoaWNo
Cj4gdXNlZCB0byBiZSBzcGVjaWZpZWQgYXMgJ2lnbm9yZWQnLiBIb3dldmVyLCBiaXRzIDUgYW5k
IDYgYXJlIG5vdyBzcGVjaWZpZWQKPiBhcyAnYWNjZXNzZWQnIGFuZCAnZGlydHknIGJpdHMgYW5k
IHRoZWlyIHVzZSBvbmx5IHJlbWFpbnMgc2FmZSBhcyBsb25nIGFzCj4gdGhlIERURSAnSG9zdCBB
Y2Nlc3MgRGlydHknIGJpdHMgcmVtYWluIHVudXNlZCBieSBYZW4sIG9yIGJ5IGhhcmR3YXJlCj4g
YmVmb3JlIHRoZSBkb21haW4gc3RhcnRzIHJ1bm5pbmcuIChYU0EtMjc1IGRpc2FibGVkIHRoZSBv
cGVyYXRpb24gb2YgdGhlCj4gY29kZSBhZnRlciBkb21haW4gY3JlYXRpb24gY29tcGxldGVzKS4K
Pgo+IFdpdGggdGhlIHBhZ2UgbWVyZ2luZyBsb2dpYyBwcmVzZW50IGluIGl0cyBjdXJyZW50IGZv
cm0gdGhlcmUgYXJlIG5vIHNwYXJlCj4gaWdub3JlZCBiaXRzIGluIHRoZSBQVEUgYXQgYWxsLCBi
dXQgUFYtSU9NTVUgc3VwcG9ydCB3aWxsIHJlcXVpcmUgYXQgbGVhc3QKPiBvbmUgc3BhcmUgYml0
IHRvIHRyYWNrIHdoaWNoIFBURXMgYXJlIGFkZGVkIGJ5IGh5cGVyY2FsbC4KPgo+IFRoaXMgcGF0
Y2ggcmVtb3ZlcyB0aGUgY29kZSwgZnJlZWluZyB1cCB0aGUgcmVtYWluaW5nIFBURSBpZ25vcmVk
IGJpdHMKPiBmb3Igb3RoZXIgdXNlLCBpbmNsdWRpbmcgUFYtSU9NTVUgc3VwcG9ydCwgYXMgd2Vs
bCBhcyBzaWduaWZpY2FudGx5Cj4gc2ltcGxpZnlpbmcgYW5kIHNob3J0ZW5pbmcgdGhlIHNvdXJj
ZSBieSB+MTcwIGxpbmVzLiBUaGVyZSBtYXkgYmUgc29tZQo+IG1hcmdpbmFsIHBlcmZvcm1hbmNl
IGNvc3QgKGJ1dCBub25lIGhhcyBiZWVuIG9ic2VydmVkIGluIG1hbnVhbCB0ZXN0aW5nCj4gd2l0
aCBhIHBhc3NlZC10aHJvdWdoIE5WSURJQSBHUFUpIHNpbmNlIGhpZ2hlciBvcmRlciBtYXBwaW5n
cyB3aWxsIG5vdyBiZQo+IHJ1bGVkIG91dCB1bnRpbCBhIG1hcHBpbmcgb3JkZXIgcGFyYW1ldGVy
IGlzIHBhc3NlZCB0byBpb21tdV9vcHMuIFRoYXQgd2lsbAo+IGJlIGRlYWx0IHdpdGggYnkgYSBz
dWJzZXF1ZW50IHBhdGNoIHRob3VnaC4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8
cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
