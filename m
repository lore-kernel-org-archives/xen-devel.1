From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V2] x86/altp2m: clean up
 p2m_{get/set}_suppress_ve()
Date: Tue, 25 Sep 2018 13:41:02 +0300
Message-ID: <303a8112-3b17-e810-c860-2ad7e7405c8b@bitdefender.com>
References: <1537864588-18733-1-git-send-email-rcojocaru@bitdefender.com>
 <a73531b9-2c42-bfca-2b06-092f35d245f6@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tuow=mh=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g4kmQ-0007O7-5S
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 10:41:22 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 4A5E9305FFAD
 for <xen-devel@lists.xenproject.org>; Tue, 25 Sep 2018 13:41:20 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 3B6B97FC62
 for <xen-devel@lists.xenproject.org>; Tue, 25 Sep 2018 13:41:20 +0300 (EEST)
In-Reply-To: <a73531b9-2c42-bfca-2b06-092f35d245f6@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: kevin.tian@intel.com, tamas@tklengyel.com, wei.liu2@citrix.com, jun.nakajima@intel.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gOS8yNS8xOCAxOjA5IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDA5LzI1LzIwMTgg
MDk6MzYgQU0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gTW92ZSBwMm1fe2dldC9zZXR9X3N1
cHByZXNzX3ZlKCkgdG8gcDJtLmMsIHJlcGxhY2UgaW5jb3JyZWN0Cj4+IEFTU0VSVCgpIGluIHAy
bS1wdC5jIChzaW5jZSBhIGd1ZXN0IGNhbiBydW4gaW4gc2hhZG93IG1vZGUgZXZlbiBvbgo+PiBh
IHN5c3RlbSB3aXRoIHZpcnQgZXhjZXB0aW9ucywgd2hpY2ggd291bGQgdHJpZ2dlciB0aGUgQVNT
RVJUKCkpLAo+PiBtb3ZlIHRoZSBWTVgtaXNtcyAoY3B1X2hhc192bXhfdmlydF9leGNlcHRpb25z
IGNoZWNrcykgdG8KPj4gcDJtX2VwdF97Z2V0L3NldH1fZW50cnkoKSwgYW5kIGZpeCBsb2NraW5n
IGNvZGUgaW4KPj4gcDJtX2dldF9zdXBwcmVzc192ZSgpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBS
YXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4gCj4gVGhpcyBsb29r
cyBnb29kLCB0aGFua3M7IGJ1dCBpdCBkb2Vzbid0IGFwcGx5IGNsZWFubHkgdG8gc3RhZ2luZwo+
IGFueW1vcmUuICBDYW4geW91IGRvdWJsZS1jaGVjayB0byBtYWtlIHN1cmUgbm90aGluZyBpbXBv
cnRhbnQgaGFzCj4gY2hhbmdlZCBpbiB0aGUgbW92ZWQgZnVuY3Rpb25zIHdpdGhpbiBtZW1fYWNj
ZXNzLmMsIGFuZCB0aGVuIHJlc2VuZCBhCj4gcmViYXNlZCBwYXRjaD8KCk9mIGNvdXJzZSwgc29y
cnkgYWJvdXQgdGhhdC4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
