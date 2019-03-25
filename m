From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 2/2] vsprintf: Remove support for %pF and
 %pf in favour of %pS and %ps
Date: Mon, 25 Mar 2019 10:49:01 +0100
Message-ID: <CAJZ5v0ixukjWzSUqNCOpYuQci=7+ctdEhdZwOh=afz1b2zFVaw__213.511350897022$1553507414$gmane$org@mail.gmail.com>
References: <20190322132108.25501-1-sakari.ailus@linux.intel.com>
 <20190322132108.25501-3-sakari.ailus@linux.intel.com>
 <CAJZ5v0i8JiQGk25yZKQqTzCCY+nrfoKXOH8nM6eNPhkN-i+y9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gBpz=R4=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1h8MEG-0000CX-4s
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 09:49:16 +0000
Received: by mail-oi1-f196.google.com with SMTP id v7so6413899oie.8
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2019 02:49:12 -0700 (PDT)
In-Reply-To: <CAJZ5v0i8JiQGk25yZKQqTzCCY+nrfoKXOH8nM6eNPhkN-i+y9w@mail.gmail.com>
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

T24gTW9uLCBNYXIgMjUsIDIwMTkgYXQgMTA6MzAgQU0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgTWFyIDIyLCAyMDE5IGF0IDI6MjEgUE0g
U2FrYXJpIEFpbHVzCj4gPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4K
PiA+ICVwUyBhbmQgJXBzIGFyZSBub3cgdGhlIHByZWZlcnJlZCBjb252ZXJzaW9uIHNwZWNpZmll
cnMgdG8gcHJpbnQgZnVuY3Rpb24KPiA+ICVuYW1lcy4gVGhlIGZ1bmN0aW9uYWxpdHkgaXMgZXF1
aXZhbGVudDsgcmVtb3ZlIHRoZSBvbGQsIGRlcHJlY2F0ZWQgJXBGCj4gPiAlYW5kICVwZiBzdXBw
b3J0Lgo+Cj4gQXJlICVwRiBhbmQgJXBmIHJlYWxseSBub3QgdXNlZCBhbnkgbW9yZSBpbiB0aGUg
a2VybmVsPwo+Cj4gSWYgdGhhdCBpcyBub3QgdGhlIGNhc2UsIHlvdSBuZWVkIHRvIGNvbnZlcnQg
dGhlIHJlbWFpbmluZyB1c2VycyBvZgo+IHRoZW0gdG8gdXNpbmcgJXBzIG9yICVwUyBiZWZvcmUg
bWFraW5nIHN1cHBvcnQgZm9yIHRoZW0gZ28gYXdheQo+IGNvbXBsZXRlbHkuCgpXZWxsLCB0aGlz
IGlzIGEgWzIvMl0gaW4gYSBzZXJpZXMsIHNvcnJ5IGZvciB0aGUgbm9pc2UgKC9tZSBibGFtZXMK
Z21haWwgZm9yIHRoZSBjb25mdXNpb24pLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
