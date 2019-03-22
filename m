From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 0/2] Remove support for deprecated %pf and
 %pF in vsprintf
Date: Fri, 22 Mar 2019 19:05:50 +0200
Message-ID: <20190322170550.GX9224__13343.9849292458$1553274450$gmane$org@smile.fi.intel.com>
References: <20190322132108.25501-1-sakari.ailus@linux.intel.com>
 <CAMuHMdVmqqjVx7As9AAywYxYXG=grijF5rF77OBn6TUjM9+xKw@mail.gmail.com>
 <20190322135350.2btpno7vspvewxvk@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HOVf=RZ=linux.intel.com=andriy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1h7NcG-0002J5-24
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2019 17:06:00 +0000
Content-Disposition: inline
In-Reply-To: <20190322135350.2btpno7vspvewxvk@paasikivi.fi.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, scsi <linux-scsi@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, linux-um@lists.infradead.org, "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>, Linux MMC List <linux-mmc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, xen-devel@lists.xenproject.org, ceph-devel <ceph-devel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, linux-btrfs <linux-btrfs@vger.kernel.org>, Lars Ellenberg <drbd-dev@lists.linbit.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMjIsIDIwMTkgYXQgMDM6NTM6NTBQTSArMDIwMCwgU2FrYXJpIEFpbHVzIHdy
b3RlOgoKPiBQb3J0aW5nIGEgcGF0Y2gKPiBmb3J3YXJkIHNob3VsZCBoYXZlIG5vIGlzc3VlcyBl
aXRoZXIgYXMgY2hlY2twYXRjaC5wbCBoYXMgYmVlbiBjb21wbGFpbmluZwo+IG9mIHRoZSB1c2Ug
b2YgJXBmIGFuZCAlcEYgZm9yIGEgd2hpbGUgbm93LgoKQW5kIHRoYXQncyBleGFjdGx5IHRoZSBy
ZWFzb24gd2h5IEkgdGhpbmsgaW5zdGVhZCBvZiByZW1vdmluZyB3YXJuaW5nIG9uCmNoZWNrcGF0
Y2gsIGl0IG1ha2VzIHNlbnNlIHRvIGNvbnZlcnQgdG8gYW4gZXJyb3IgZm9yIGEgd2hpbGUuIFBl
b3BsZSBhcmUKdGVuZGluZyByZWFkIGRvY3VtZW50YXRpb24gb24gaW50ZXJuZXQgYW5kIHRodXMg
bWlnaHQgaGF2ZSBvdXRkYXRlZCBvbmUuIEFuZAp5ZXMsIHRoZSBjb21waWxlciBkb2Vzbid0IHRl
bGwgYSB0aGluZyBhYm91dCBpdC4KClAuUy4gVGhvdWdoLCBpZiBtYWpvcml0eSBvZiBwZW9wbGUg
d2lsbCB0ZWxsIHRoYXQgSSdtIHdyb25nLCB0aGVuIGl0J3Mgb2theSB0bwpyZW1vdmUuCgotLSAK
V2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
