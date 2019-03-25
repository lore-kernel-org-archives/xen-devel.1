From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 1/1] treewide: Switch printk users from
 %pf and %pF to %ps and %pS, respectively
Date: Mon, 25 Mar 2019 16:19:06 -0500
Message-ID: <20190325211906.GA24180__23341.0557311558$1553548813$gmane$org@google.com>
References: <20190325193229.23390-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cndn=R4=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1h8Wzu-0003YL-8N
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 21:19:10 +0000
Content-Disposition: inline
In-Reply-To: <20190325193229.23390-1-sakari.ailus@linux.intel.com>
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

T24gTW9uLCBNYXIgMjUsIDIwMTkgYXQgMDk6MzI6MjhQTSArMDIwMCwgU2FrYXJpIEFpbHVzIHdy
b3RlOgo+ICVwRiBhbmQgJXBmIGFyZSBmdW5jdGlvbmFsbHkgZXF1aXZhbGVudCB0byAlcFMgYW5k
ICVwcyBjb252ZXJzaW9uCj4gc3BlY2lmaWVycy4gVGhlIGZvcm1lciBhcmUgZGVwcmVjYXRlZCwg
dGhlcmVmb3JlIHN3aXRjaCB0aGUgY3VycmVudCB1c2Vycwo+IHRvIHVzZSB0aGUgcHJlZmVycmVk
IHZhcmlhbnQuCj4gCj4gVGhlIGNoYW5nZXMgaGF2ZSBiZWVuIHByb2R1Y2VkIGJ5IHRoZSBmb2xs
b3dpbmcgY29tbWFuZDoKPiAKPiAJZ2l0IGdyZXAgLWwgJyVwW2ZGXScgfCBncmVwIC12ICdeXCh0
b29sc1x8RG9jdW1lbnRhdGlvblwpLycgfCBcCj4gCXdoaWxlIHJlYWQgaTsgZG8gcGVybCAtaSAt
cGUgJ3MvJXBmLyVwcy9nOyBzLyVwRi8lcFMvZzsnICRpOyBkb25lCj4gCj4gQW5kIHZlcmlmeWlu
ZyB0aGUgcmVzdWx0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFp
bHVzQGxpbnV4LmludGVsLmNvbT4KPiBBY2tlZC1ieTogRGF2aWQgU3RlcmJhIDxkc3RlcmJhQHN1
c2UuY29tPiAoZm9yIGJ0cmZzKQo+IEFja2VkLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4
LmlibS5jb20+IChmb3IgbW0vbWVtYmxvY2suYykKPiBBY2tlZC1ieTogUmFmYWVsIEouIFd5c29j
a2kgPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgoKQWNrZWQtYnk6IEJqb3JuIEhlbGdhYXMg
PGJoZWxnYWFzQGdvb2dsZS5jb20+IChmb3IgZHJpdmVycy9wY2kpCgpUaGFua3MgYSBsb3QgZm9y
IGNsZWFuaW5nIHRoaXMgdXAuICBUaGlzIGhhcyBiZWVuIGFubm95aW5nIGZvciBhIGxvbmcgdGlt
ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
