From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/6] xen/sched: call
 cpu_disable_scheduler() via cpu notifier
Date: Tue, 02 Apr 2019 05:54:17 -0600
Message-ID: <5CA34D690200007800223DF4@prv1-mh.provo.novell.com>
References: <20190402053457.24912-1-jgross@suse.com>
 <20190402053457.24912-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hBHzj-0000RY-S7
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 11:54:23 +0000
In-Reply-To: <20190402053457.24912-2-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA0LjE5IGF0IDA3OjM0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBjcHVf
ZGlzYWJsZV9zY2hlZHVsZXIoKSBpcyBiZWluZyBjYWxsZWQgZnJvbSBfX2NwdV9kaXNhYmxlKCkg
dG9kYXkuCj4gVGhlcmUgaXMgbm8gbmVlZCB0byBleGVjdXRlIGl0IG9uIHRoZSBjcHUganVzdCBi
ZWluZyBkaXNhYmxlZCwgc28gdXNlCj4gdGhlIENQVV9ERUFEIGNhc2Ugb2YgdGhlIGNwdSBub3Rp
ZmllciBjaGFpbi4gTW92aW5nIHRoZSBjYWxsIG91dCBvZgo+IHN0b3BfbWFjaGluZSgpIGNvbnRl
eHQgaXMgZmluZSwgYXMgd2UganVzdCBuZWVkIHRvIGhvbGQgdGhlIGRvbWFpbiBSQ1UKPiBsb2Nr
IGFuZCBuZWVkIHRoZSBzY2hlZHVsZXIgcGVyY3B1IGRhdGEgdG8gYmUgc3RpbGwgYWxsb2NhdGVk
Lgo+IAo+IEFkZCBhbm90aGVyIGhvb2sgZm9yIENQVV9ET1dOX1BSRVBBUkUgdG8gYmFpbCBvdXQg
ZWFybHkgaW4gY2FzZQo+IGNwdV9kaXNhYmxlX3NjaGVkdWxlcigpIHdvdWxkIGZhaWwuIFRoaXMg
d2lsbCBhdm9pZCBjcmFzaGVzIGluIHJhcmUKPiBjYXNlcyBmb3IgY3B1IGhvdHBsdWcgb3Igc3Vz
cGVuZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Cj4gUmV2aWV3ZWQtYnk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+CgpBY2tl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
