From: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Subject: Re: [Xen-users] Xen shutdown fails to release DRBD
 device
Date: Fri, 24 Aug 2018 18:41:33 +0200
Message-ID: <20180824164133.GC3534@gavran.carpriv.carnet.hr>
References: <20180822132424.GB3534@gavran.carpriv.carnet.hr>
 <20180822133420.osvdkjonaxwtd3pq@mac>
 <20180822134251.GC3534@gavran.carpriv.carnet.hr>
 <20180822135546.GD3534@gavran.carpriv.carnet.hr>
 <20180822153928.GE3534@gavran.carpriv.carnet.hr>
 <20180822155154.pkpcvchspm3itwq5@mac>
 <20180822162301.GF3534@gavran.carpriv.carnet.hr>
 <20180824162232.GB3534@gavran.carpriv.carnet.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g6n1=lh=carnet.hr=valentin.vidic@srs-us1.protection.inumbo.net>)
 id 1ftF9W-00072k-2y
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 16:41:38 +0000
Content-Disposition: inline
In-Reply-To: <20180824162232.GB3534@gavran.carpriv.carnet.hr>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMjQsIDIwMTggYXQgMDY6MjI6MzJQTSArMDIwMCwgVmFsZW50aW4gVmlkaWMg
d3JvdGU6Cj4gTWFuYWdlZCB0byByZXByb2R1Y2UgdGhpcyBhbmQgeGVuX2Jsa2lmX2Rpc2Nvbm5l
Y3QgaXMgYWx3YXlzIHJldHVybmluZyAwCj4gbGlrZSB5b3UgZXhwZWN0ZWQuICBTbyB0aGlzIGlz
IHNvbWUgb3RoZXIgaXNzdWUsIGFuZCBmcm9tIHdoYXQgSSBjYW4gdGVsbAo+IGJsa2Rldl9wdXQg
b2YgdGhlIHVuZGVybHlpbmcgZHJiZCBkZXZpY2UgZ2V0cyBjYWxsZWQgc29tZSB0aW1lIGFmdGVy
Cj4geGVuYnVzX3N3aXRjaF9zdGF0ZShkZXYsIFhlbmJ1c1N0YXRlQ2xvc2VkKS4gIEFueSBpZGVh
IGhvdyB0byBtYWtlIHN1cmUKPiBpdCBoYXBwZW5zIGluIHRoZSBvcHBvc2l0ZSBvcmRlcjogYmxr
ZGV2X3B1dCBiZWZvcmUgWGVuYnVzU3RhdGVDbG9zZWQ/CgpNb3ZpbmcgdGhlIFhlbmJ1c1N0YXRl
Q2xvc2VkIGNhbGwgdG8geGVuX2Jsa2lmX2ZyZWUgc2VlbXMgdG8gaGVscCwKbGV0IG1lIGtub3cg
aWYgeW91IHRoaW5rIHRoZXJlIGlzIGJldHRlciBzb2x1dGlvbiBmb3IgdGhpcz8KCnN0YXRpYyB2
b2lkIHhlbl9ibGtpZl9mcmVlKHN0cnVjdCB4ZW5fYmxraWYgKmJsa2lmKQp7CgogICAgICAgIFdB
Uk5fT04oeGVuX2Jsa2lmX2Rpc2Nvbm5lY3QoYmxraWYpKTsKICAgICAgICB4ZW5fdmJkX2ZyZWUo
JmJsa2lmLT52YmQpOwogICAgICAgIHhlbmJ1c19zd2l0Y2hfc3RhdGUoYmxraWYtPmJlLT5kZXYs
IFhlbmJ1c1N0YXRlQ2xvc2VkKTsKICAgICAgICBrZnJlZShibGtpZi0+YmUtPm1vZGUpOwogICAg
ICAgIGtmcmVlKGJsa2lmLT5iZSk7CgogICAgICAgIC8qIE1ha2Ugc3VyZSBldmVyeXRoaW5nIGlz
IGRyYWluZWQgYmVmb3JlIHNodXR0aW5nIGRvd24gKi8KICAgICAgICBrbWVtX2NhY2hlX2ZyZWUo
eGVuX2Jsa2lmX2NhY2hlcCwgYmxraWYpOwp9CgotLSAKVmFsZW50aW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
