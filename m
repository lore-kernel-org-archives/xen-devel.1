From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH 1/2] treewide: Switch printk users from %pf
 and %pF to %ps and %pS, respectively
Date: Fri, 22 Mar 2019 23:30:34 +0200
Message-ID: <20190322213034.GA9303__7263.87120537169$1553290339$gmane$org@rapoport-lnx>
References: <20190322132108.25501-1-sakari.ailus@linux.intel.com>
 <20190322132108.25501-2-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fh2q=RZ=linux.ibm.com=rppt@srs-us1.protection.inumbo.net>)
 id 1h7Rkn-0007dE-Ce
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2019 21:31:05 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2MLUvsV024301
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2019 17:31:02 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rd7dsgfqk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2019 17:31:00 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <rppt@linux.ibm.com>;
 Fri, 22 Mar 2019 21:30:35 -0000
Content-Disposition: inline
In-Reply-To: <20190322132108.25501-2-sakari.ailus@linux.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org, linux-mmc@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-pci@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, drbd-dev@lists.linbit.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMjIsIDIwMTkgYXQgMDM6MjE6MDdQTSArMDIwMCwgU2FrYXJpIEFpbHVzIHdy
b3RlOgo+ICVwRiBhbmQgJXBmIGFyZSBmdW5jdGlvbmFsbHkgZXF1aXZhbGVudCB0byAlcFMgYW5k
ICVwcyBjb252ZXJzaW9uCj4gc3BlY2lmaWVycy4gVGhlIGZvcm1lciBhcmUgZGVwcmVjYXRlZCwg
dGhlcmVmb3JlIHN3aXRjaCB0aGUgY3VycmVudCB1c2Vycwo+IHRvIHVzZSB0aGUgcHJlZmVycmVk
IHZhcmlhbnQuCj4gCj4gVGhlIGNoYW5nZXMgaGF2ZSBiZWVuIHByb2R1Y2VkIGJ5IHRoZSBmb2xs
b3dpbmcgY29tbWFuZDoKPiAKPiAJZ2l0IGdyZXAgLWwgJyVwW2ZGXScgfCBncmVwIC12ICdeXCh0
b29sc1x8RG9jdW1lbnRhdGlvblwpLycgfCBcCj4gCXdoaWxlIHJlYWQgaTsgZG8gcGVybCAtaSAt
cGUgJ3MvJXBmLyVwcy9nOyBzLyVwRi8lcFMvZzsnICRpOyBkb25lCj4gCj4gQW5kIHZlcmlmeWlu
ZyB0aGUgcmVzdWx0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFp
bHVzQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KCkZvcgoKPiAgbW0vbWVtYmxvY2suYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMTIgKysrKysrLS0tLS0tCgpBY2tlZC1ieTogTWlrZSBSYXBv
cG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
