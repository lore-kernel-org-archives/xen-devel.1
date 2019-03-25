From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 2/2] vsprintf: Remove support for %pF and
 %pf in favour of %pS and %ps
Date: Mon, 25 Mar 2019 10:30:01 +0100
Message-ID: <CAJZ5v0i8JiQGk25yZKQqTzCCY+nrfoKXOH8nM6eNPhkN-i+y9w__10748.1888307788$1553506275$gmane$org@mail.gmail.com>
References: <20190322132108.25501-1-sakari.ailus@linux.intel.com>
 <20190322132108.25501-3-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gBpz=R4=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1h8Lvp-0007Nc-Rk
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 09:30:13 +0000
Received: by mail-ot1-f66.google.com with SMTP id k21so6004272otf.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2019 02:30:12 -0700 (PDT)
In-Reply-To: <20190322132108.25501-3-sakari.ailus@linux.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>, linux-um@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, netdev <netdev@vger.kernel.org>, linux-btrfs@vger.kernel.org, Linux PCI <linux-pci@vger.kernel.org>, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux Memory Management List <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, drbd-dev@lists.linbit.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMjIsIDIwMTkgYXQgMjoyMSBQTSBTYWthcmkgQWlsdXMKPHNha2FyaS5haWx1
c0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gJXBTIGFuZCAlcHMgYXJlIG5vdyB0aGUgcHJl
ZmVycmVkIGNvbnZlcnNpb24gc3BlY2lmaWVycyB0byBwcmludCBmdW5jdGlvbgo+ICVuYW1lcy4g
VGhlIGZ1bmN0aW9uYWxpdHkgaXMgZXF1aXZhbGVudDsgcmVtb3ZlIHRoZSBvbGQsIGRlcHJlY2F0
ZWQgJXBGCj4gJWFuZCAlcGYgc3VwcG9ydC4KCkFyZSAlcEYgYW5kICVwZiByZWFsbHkgbm90IHVz
ZWQgYW55IG1vcmUgaW4gdGhlIGtlcm5lbD8KCklmIHRoYXQgaXMgbm90IHRoZSBjYXNlLCB5b3Ug
bmVlZCB0byBjb252ZXJ0IHRoZSByZW1haW5pbmcgdXNlcnMgb2YKdGhlbSB0byB1c2luZyAlcHMg
b3IgJXBTIGJlZm9yZSBtYWtpbmcgc3VwcG9ydCBmb3IgdGhlbSBnbyBhd2F5CmNvbXBsZXRlbHku
CgpUaGF0IHNhaWQsIGNoZWNrcGF0Y2ggY2FuIGJlIG1hZGUgdHJlYXQgJXBmL0YgYXMgaW52YWxp
ZCBmb3JtYXQgcmlnaHQgYXdheSBJTU8uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
