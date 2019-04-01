From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 1/6] xen/sched: call
 cpu_disable_scheduler() via cpu notifier
Date: Mon, 1 Apr 2019 11:34:29 +0100
Message-ID: <8f1ee19f-e160-29f9-a5ff-3e318bebb60b@arm.com>
References: <20190328120658.11083-1-jgross@suse.com>
 <20190328120658.11083-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3ypO=SD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hAuGw-0000QE-GY
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 10:34:34 +0000
In-Reply-To: <20190328120658.11083-2-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSnVlcmdlbiwKCk9uIDMvMjgvMTkgMTI6MDYgUE0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4g
Y3B1X2Rpc2FibGVfc2NoZWR1bGVyKCkgaXMgYmVpbmcgY2FsbGVkIGZyb20gX19jcHVfZGlzYWJs
ZSgpIHRvZGF5Lgo+IFRoZXJlIGlzIG5vIG5lZWQgdG8gZXhlY3V0ZSBpdCBvbiB0aGUgY3B1IGp1
c3QgYmVpbmcgZGlzYWJsZWQsIHNvIHVzZQo+IHRoZSBDUFVfREVBRCBjYXNlIG9mIHRoZSBjcHUg
bm90aWZpZXIgY2hhaW4uIE1vdmluZyB0aGUgY2FsbCBvdXQgb2YKPiBzdG9wX21hY2hpbmUoKSBj
b250ZXh0IGlzIGZpbmUsIGFzIHdlIGp1c3QgbmVlZCB0byBob2xkIHRoZSBkb21haW4gUkNVCj4g
bG9jayBhbmQgbmVlZCB0aGUgc2NoZWR1bGVyIHBlcmNwdSBkYXRhIHRvIGJlIHN0aWxsIGFsbG9j
YXRlZC4KPiAKPiBBZGQgYW5vdGhlciBob29rIGZvciBDUFVfRE9XTl9QUkVQQVJFIHRvIGJhaWwg
b3V0IGVhcmx5IGluIGNhc2UKPiBjcHVfZGlzYWJsZV9zY2hlZHVsZXIoKSB3b3VsZCBmYWlsLiBU
aGlzIHdpbGwgYXZvaWQgY3Jhc2hlcyBpbiByYXJlCj4gY2FzZXMgZm9yIGNwdSBob3RwbHVnIG9y
IHN1c3BlbmQuCj4gCj4gV2hpbGUgYXQgaXQgcmVtb3ZlIGEgc3VwZXJmbHVvdXMgc21wX21iKCkg
aW4gdGhlIEFSTSBfX2NwdV9kaXNhYmxlKCkKPiBpbmNhcm5hdGlvbi4KCkNhbiB3ZSBhdm9pZCBz
ZW5kaW5nIHRoZSBzYW1lIHBhdGNoZXMgaW4gdGhlIGRpZmZlcmVudCBzZXJpZXMgaW4ganVzdCBh
IApkYXkgaW50ZXJ2YWw/IFRoaXMgaXMgbWFraW5nIGRpZmZpY3VsdCB0byBrbm93IHdoaWNoIG9u
ZSB0byByZXZpZXcuLi4KCkl0IHdvdWxkIGJlIGVhc2llciBpZiB5b3UgdGVsbCBpbiB0aGUgY292
ZXIgbGV0dGVyIHRoYXQgeW91IGRlcGVuZCBvbiAKc2VyaWVzIEZvbyBhbmQgcHJvdmlkZSBhIGJy
YW5jaCB3aXRoIHRoZSB0d28gc2VyaWVzIGluIGFwcGxpZWQuCgpBbnl3YXksIEkgaGF2ZSBjb21t
ZW50ZWQgb24gPDIwMTkwMzI5MTUwOTM0LjE3Njk0LTItamdyb3NzQHN1c2UuY29tPi4KCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
