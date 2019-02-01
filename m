From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.12] xen/iommu: fix iommu_ops attribute
Date: Fri, 1 Feb 2019 15:21:07 +0000
Message-ID: <1a562d08-ef94-d300-d0eb-bf95e3511c0c@citrix.com>
References: <20190201151349.23532-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rDPL=QI=citrix.com=prvs=92817040b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gpafo-0005fy-LI
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 15:24:08 +0000
In-Reply-To: <20190201151349.23532-1-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Brian Woods <brian.woods@amd.com>, jbeulich@suse.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDIvMjAxOSAxNToxMywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBDb21taXQgMzJhNWVh
MDBlYzc1ZWY1M2UgKCJJT01NVS94ODY6IHJlbW92ZSBpbmRpcmVjdGlvbiBmcm9tIGNlcnRhaW4K
PiBJT01NVSBob29rIGFjY2Vzc2VzIikgZGVjbGFyZWQgdGhlIEFNRCBhbmQgSU5URUwgdmFyaWFu
dHMgb2Ygc3RydWN0Cj4gaW9tbXVfb3BzIGFzIF9faW5pdGNvbnN0cmVsLCBidXQgdGhvc2UgYXJl
IG5lZWRlZCBmb3Igc3lzdGVtIHJlc3VtZSwKPiB0b28uCj4KPiBGaXggdGhhdCBieSBtb2RpZnlp
bmcgdGhlbSB0byBiZSBub3QgbG9jYXRlZCBpbiB0aGUgaW5pdCBkYXRhIHNlZ21lbnQuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpIdWguLi4gVGhh
dCBzdWdnZXN0cyB3ZSBhcmUgcmUtaW5pdGlhbGlzaW5nIHRoZSBJT01NVSBzdWJzeXN0ZW0gZnJv
bSBhCnNjYW4sIHJhdGhlciB0aGFuIGZyb20gdGhlIGRldGFpbHMgd2UgZm91bmQgYXQgYm9vdC4K
CkRpZCB5b3Ugd29yayBvdXQgd2hpY2ggcGF0aCBoaXQgdGhpcyBkdXJpbmcgcmVzdW1lPwoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
