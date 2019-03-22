From: David Sterba <dsterba@suse.cz>
Subject: Re: [PATCH 1/2] treewide: Switch printk users from %pf
 and %pF to %ps and %pS, respectively
Date: Fri, 22 Mar 2019 15:30:28 +0100
Message-ID: <20190322143028.GD28481__32035.8560698637$1553265046$gmane$org@twin.jikos.cz>
References: <20190322132108.25501-1-sakari.ailus@linux.intel.com>
 <20190322132108.25501-2-sakari.ailus@linux.intel.com>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rZNa=RZ=suse.cz=dsterba@srs-us1.protection.inumbo.net>)
 id 1h7LAc-0005BF-3z
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2019 14:29:18 +0000
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
bHVzQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KCkZvciAKCj4gIGZzL2J0cmZzL3Rlc3RzL2ZyZWUt
c3BhY2UtdHJlZS10ZXN0cy5jICB8ICA0ICsrLS0KPiAgaW5jbHVkZS90cmFjZS9ldmVudHMvYnRy
ZnMuaCAgICAgICAgICAgIHwgIDIgKy0KCkFja2VkLWJ5OiBEYXZpZCBTdGVyYmEgPGRzdGVyYmFA
c3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
