From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v3 07/16] x86/p2m/pod: make it build with
 !CONFIG_HVM
Date: Tue, 4 Sep 2018 20:10:00 +0300
Message-ID: <cf53ad61-ea36-6ef4-e815-f2038d7bb28e@bitdefender.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-8-wei.liu2@citrix.com>
 <8fb4fa98-b965-c59f-231c-562989695b9c@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i5qz=ls=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fxEq6-0001Xg-8R
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 17:10:06 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 28D7F305FFB0
 for <xen-devel@lists.xenproject.org>; Tue,  4 Sep 2018 20:10:04 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 21D1D7FE6B
 for <xen-devel@lists.xenproject.org>; Tue,  4 Sep 2018 20:10:04 +0300 (EEST)
In-Reply-To: <8fb4fa98-b965-c59f-231c-562989695b9c@bitdefender.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gOS80LzE4IDg6MDggUE0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPiBPbiA5LzQvMTggNzox
NSBQTSwgV2VpIExpdSB3cm90ZToKPj4gUG9wdWxhdGUtb24tZGVtYW5kIGlzIEhWTSBvbmx5Lgo+
Pgo+PiBQcm92aWRlIGEgYnVuY2ggb2Ygc3R1YnMgZm9yIGNvbW1vbiBwMm0gY29kZSBhbmQgZ3Vh
cmQgb25lIGludm9jYXRpb24KPj4gb2YgZ3Vlc3RfcGh5c21hcF9tYXJrX3BvcHVsYXRlX29uX2Rl
bWFuZCB3aXRoIGlzX2h2bV9kb21haW4uCj4+Cj4+IFB1dCByZWxldmFudCBmaWVsZHMgaW4gcDJt
X2RvbWFpbiBhbmQgY29kZSB3aGljaCB0b3VjaGVzIHRob3NlIGZpZWxkcwo+PiB1bmRlciBDT05G
SUdfSFZNLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
Pgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVu
ZGVyLmNvbT4KClNvcnJ5LCBvYnZpb3VzbHkgbWVhbnQgQWNrZWQtYnkuCgoKVGhhbmtzLApSYXp2
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
