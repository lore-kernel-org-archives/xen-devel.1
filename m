From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 08/12] cpufreq: convert to a single
 post-init driver (hooks) instance
Date: Thu, 4 Oct 2018 11:36:16 +0100
Message-ID: <99212580-98ad-9731-fd58-9df9da7505fa@citrix.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB3456C02000078001EDA54@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mrpc=mq=citrix.com=prvs=80816b5da=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g80ze-0001J0-Ci
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 10:36:30 +0000
In-Reply-To: <5BB3456C02000078001EDA54@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTAvMTggMTE6MTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoaXMgcmVkdWNlcyB0aGUg
cG9zdC1pbml0IG1lbW9yeSBmb290cHJpbnQsIGVsaW1pbmF0ZXMgYSBwb2ludGxlc3MKPiBsZXZl
bCBvZiBpbmRpcmVjdGlvbiBhdCB0aGUgdXNlIHNpdGVzLCBhbmQgYWxsb3dzIGZvciBzdWJzZXF1
ZW50Cj4gYWx0ZXJuYXRpdmVzIGNhbGwgcGF0Y2hpbmcuCj4KPiBUYWtlIHRoZSBvcHBvcnR1bml0
eSBhbmQgYWxzbyBhZGQgYSBuYW1lIHRvIHRoZSBQb3dlck5vdyEgaW5zdGFuY2UuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gUmV2aWV3ZWQtYnk6
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
