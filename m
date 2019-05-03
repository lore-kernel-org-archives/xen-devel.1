From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 05/20] xen/arm: Rework secondary_start
 prototype
Date: Fri, 3 May 2019 17:15:03 +0100
Message-ID: <8fa5ac75-5e8d-4be0-f899-f362a070c27d@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-6-julien.grall@arm.com>
 <41447e74-1dab-72d3-74b7-cf5d5fabf45d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vigr=TD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMaq4-0002VP-0U
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:15:08 +0000
In-Reply-To: <41447e74-1dab-72d3-74b7-cf5d5fabf45d@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8wNS8yMDE5IDE2OjU2LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKPiAKPiBPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBOb25lIG9m
IHRoZSBwYXJhbWV0ZXJzIG9mIHNlY29uZGFyeV9zdGFydCBhcmUgYWN0dWFsbHkgdXNlZC4gU28g
dHVybgo+PiBzZWNvbmRhcnlfc3RhcnQgdG8gYSBmdW5jdGlvbiB3aXRoIG5vIHBhcmFtZXRlcnMu
Cj4+Cj4+IEFsc28gbW9kaWZ5IHRoZSBhc3NlbWJseSBjb2RlIHRvIGF2b2lkIHNldHRpbmctdXAg
dGhlIHJlZ2lzdGVycyBiZWZvcmUKPj4gY2FsbGluZyBzZWNvbmRhcnlfc3RhcnQuCj4gCj4gV2hh
dCBpcyBub3QgcmVhbGx5IG1hbmRhdG9yeS4KClNvLi4uPyBZb3UganVzdCBkb24ndCBzZXR1cCBw
YXJhbWV0ZXIgd2hlbiBpdCBpcyBub3QgbmVjZXNzYXJ5LiBUaGUgbW9yZSBpdCBpcyAKcXVpdGUg
Y29uZnVzaW5nIGZvciBhIHJlYWRlciB0byBzZWUgdGhlIHJlZ2lzdGVycyBhcmUgc2V0dXAgYnV0
IG5vdCB1c2VkIGJ5IHRoZSAKY2FsbGVyLgoKPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiBUaG91Z2g6Cj4gCj4gUmV2aWV3ZWQt
Ynk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgpUaGFuayB5b3UuCgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
