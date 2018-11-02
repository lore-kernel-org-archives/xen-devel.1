From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2] libxl/arm: fix guest type conversion
Date: Fri, 2 Nov 2018 11:01:07 +0000
Message-ID: <23516.11891.204976.787950@mariner.uk.xensource.com>
References: <20181101133316.20788-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vtjf=nn=citrix.com=prvs=837fd0aa5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gIXCq-0000bs-4l
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 11:01:36 +0000
In-Reply-To: <20181101133316.20788-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJbUEFUQ0ggdjJdIGxpYnhsL2FybTogZml4IGd1ZXN0IHR5cGUgY29u
dmVyc2lvbiIpOgo+IENvbW1pdCAzNTk5NzBmZDhiICgidG9vbHMvbGlieGw6IFN3aXRjaCBBcm0g
Z3Vlc3QgdHlwZSB0byBQVkgiKSBtaXNzZWQKPiBjaGFuZ2luZyB0aGUgdHlwZSBmaWVsZCBpbiBj
X2luZm8uIFRoaXMgaXNzdWUgZGlkbid0IHN1cmZhY2UgdW50aWwKPiBlZjcyYzkzZGY5IHdoaWNo
IG1hZGUgY3JlYXRpbmcgUFYgZ3Vlc3Qgb24gQXJtIHVudXNhYmxlLgouLi4KPiArI2lmIGRlZmlu
ZWQoX19hcm1fXykgfHwgZGVmaW5lZChfX2FhcmNoNjRfXykKPiArICAgIGlmIChjX2luZm8tPnR5
cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfUFYpIHsKPiArICAgICAgICBMT0coV0FSTiwgIkNvbnZl
cnRpbmcgUFYgZ3Vlc3QgdG8gUFZILiIpOwo+ICsgICAgICAgIExPRyhXQVJOLCAiQXJtIGd1ZXN0
IGFyZSBub3cgUFZILiIpOwo+ICsgICAgICAgIExPRyhXQVJOLCAiUGxlYXNlIGZpeCB5b3VyIGNv
bmZpZ3VyYXRpb24gZmlsZS90b29sc3RhY2suIik7Cj4gKwo+ICsgICAgICAgIGNfaW5mby0+dHlw
ZSA9IExJQlhMX0RPTUFJTl9UWVBFX1BWSDsKPiArICAgIH0KPiArI2VuZGlmCgpQbGVhc2UsIG5v
ICNpZmRlZnMgaW4gdGhlIG1haW4gcGFydCBvZiB0aGUgY29kZS4KTWF5YmUgSSBzaG91bGQgaGF2
ZSB0aGUgTWFrZWZpbGUgdGhyb3cgYSBmaXQgYWJvdXQgdGhpcy4KCkkgdGhpbmsgeW91IG1heSBu
ZWVkIHRvIGNoYW5nZQogIGxpYnhsX19hcmNoX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQK
dG8KICBsaWJ4bF9fYXJjaF9kb21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVsdAoKU29ycnksCklh
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
