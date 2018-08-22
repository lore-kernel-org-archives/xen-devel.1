From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 1/2] xen/arm: Add Amlogic S905 SoC early
 printk support
Date: Wed, 22 Aug 2018 10:52:19 +0100
Message-ID: <122b7b82-af4e-66f7-d210-2b9e0842fbc7@arm.com>
References: <1533661673-14607-1-git-send-email-amittomer25@gmail.com>
 <1533661673-14607-2-git-send-email-amittomer25@gmail.com>
 <683b761d-ccf8-b46e-284f-1713ef856b8f@arm.com>
 <CABHD4K-K+XNYPZ4e2_kKa-PcAwKd-5OD5V72dTvb9qbr8qQeWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cicq=lf=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fsPoP-0004dk-B2
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 09:52:25 +0000
In-Reply-To: <CABHD4K-K+XNYPZ4e2_kKa-PcAwKd-5OD5V72dTvb9qbr8qQeWA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, George Dunlap <George.Dunlap@eu.citrix.com>, ian.jackson@eu.citrix.com, tim@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andre Przywara <andre.przywara@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMC8wOC8xOCAxMDoxNiwgQW1pdCBUb21lciB3cm90ZToKPiBIZWxsbywKCkhpIEFtaXQs
Cgo+PiBJIHdvdWxkIHByZWZlciBpZiBubyBuZXcgYWxpYXMgYXJlIGFkZGVkLiBUaGUgc2FtZSBj
b3VsZCBiZSBhY2hpZXZlZCB3aXRoCj4+IENPTkZJR19FQVJMWV9QUklOVEs9bWVzb24sMHhjODEw
MDRjMC4KPj4KPj4gVGhpcyBjb3VsZCBiZSBkb2N1bWVudGVkIG9uIHRoZSB3aWtpLgo+IAo+IE9r
Lgo+IAo+PiBJIHdvdWxkIHByZWZlciBpZiB3ZSBzdGljayB3aXRoIHRoZSBzcGVjIG5hbWUuIFNv
IFVBUlRfVFhfUkVHIHNob3VsZCBiZQo+PiByZW5hbWVkIFVBUlRfV0ZJRk9fUkVHLgo+IAo+IFll
YWggcmlnaHQsIGdvdCB5b3VyIHBvaW50Lgo+Pgo+PiBBbHNvLCBpdCBtaWdodCBiZSB3b3J0aCBj
b25zaWRlcmluZyB0byBwcmVmaXggdGhlbSB3aXRoIEFNTF8gc28gaXQgaXMgZWFzeQo+PiB0byBm
aW5kIHRoZW0gb24gbG9va3VwLgo+IAo+IEluaXRpYWxseSB1c2VkIEFNTF8gYXMgcHJlZml4IGJ1
dCB0aGVuIEkganVzdCB3YW50ZWQgdG8gYmUgY29uc2lzdGVudCBpdCB3aXRoCj4gb3RoZXIgdWFy
dCBkcml2ZXJzIGluIFhFTi4KCkkgdGhpbmsgSSB3b3VsZCBwcmVmZXIgdG8gYmUgcHJlZml4ZWQg
d2l0aCBBTUxfLiBUaGUgbm9uLXByZWZpeGVkIAp2ZXJzaW9uIGlzIG5vdCB0aGF0IGNvbnZlbmll
bnQgZm9yIGxvb2t1cCBhbmQgYWRkaW5nIGFuIGV4dHJhIG9uZSBpcyBub3QgCmdvaW5nIHRvIG1h
a2UgYmV0dGVyLgoKPiAKPj4gTG9va2luZyBhdCB0aGUgZWFybHljb25zb2xlIGltcGxlbWVudGF0
aW9uIGluIExpbnV4LCBpdCBzZWVtcyB0aGF0IFRYIG5lZWRzCj4+IHRvIGJlIGVuYWJsZWQgZmly
c3QgKHNlZSBtZXNvbl91YXJ0X2VuYWJsZV90eF9lbmdpbmUpLgo+Pgo+PiBJcyBpdCBub3cgZG9u
ZSBpbiB0aGUgZmlybXdhcmU/Cj4gCj4gWWVzLCB0aGlzIGhhcyBiZWVuIGRvbmUgaW4gdS1ib290
Lgo+IHNob3VsZG4ndCB3ZSB0cnVzdCBpdD8KCkkgYW0gdHJ5aW5nIHRvIHVuZGVyc3RhbmQgd2h5
IExpbnV4IGlzIGRvaW5nIGl0LiBEbyB5b3UgZXhwZWN0IGFsbCAKVS1Cb290IHZlcnNpb24gdG8g
ZG8gaXQ/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
