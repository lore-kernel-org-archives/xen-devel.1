From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH RFC 01/49] xen/sched: call
 cpu_disable_scheduler() via cpu notifier
Date: Mon, 1 Apr 2019 10:21:50 +0100
Message-ID: <dd8a9092-f175-b490-3820-d9aa100031fb@arm.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3ypO=SD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hAt8e-0000v2-9N
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 09:21:56 +0000
In-Reply-To: <20190329150934.17694-2-jgross@suse.com>
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

SGksCgpPbiAzLzI5LzE5IDM6MDggUE0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gY3B1X2Rpc2Fi
bGVfc2NoZWR1bGVyKCkgaXMgYmVpbmcgY2FsbGVkIGZyb20gX19jcHVfZGlzYWJsZSgpIHRvZGF5
Lgo+IFRoZXJlIGlzIG5vIG5lZWQgdG8gZXhlY3V0ZSBpdCBvbiB0aGUgY3B1IGp1c3QgYmVpbmcg
ZGlzYWJsZWQsIHNvIHVzZQo+IHRoZSBDUFVfREVBRCBjYXNlIG9mIHRoZSBjcHUgbm90aWZpZXIg
Y2hhaW4uIE1vdmluZyB0aGUgY2FsbCBvdXQgb2YKPiBzdG9wX21hY2hpbmUoKSBjb250ZXh0IGlz
IGZpbmUsIGFzIHdlIGp1c3QgbmVlZCB0byBob2xkIHRoZSBkb21haW4gUkNVCj4gbG9jayBhbmQg
bmVlZCB0aGUgc2NoZWR1bGVyIHBlcmNwdSBkYXRhIHRvIGJlIHN0aWxsIGFsbG9jYXRlZC4KPiAK
PiBBZGQgYW5vdGhlciBob29rIGZvciBDUFVfRE9XTl9QUkVQQVJFIHRvIGJhaWwgb3V0IGVhcmx5
IGluIGNhc2UKPiBjcHVfZGlzYWJsZV9zY2hlZHVsZXIoKSB3b3VsZCBmYWlsLiBUaGlzIHdpbGwg
YXZvaWQgY3Jhc2hlcyBpbiByYXJlCj4gY2FzZXMgZm9yIGNwdSBob3RwbHVnIG9yIHN1c3BlbmQu
Cj4gCj4gV2hpbGUgYXQgaXQgcmVtb3ZlIGEgc3VwZXJmbHVvdXMgc21wX21iKCkgaW4gdGhlIEFS
TSBfX2NwdV9kaXNhYmxlKCkKPiBpbmNhcm5hdGlvbi4KClRoaXMgaXMgbm90IG9idmlvdXMgd2h5
IHRoZSBzbXBfbWIoKSBpcyBzdXBlcmZsdW91cy4gQ2FuIHlvdSBwbGVhc2UgCnByb3ZpZGUgbW9y
ZSBkZXRhaWxzIG9uIHdoeSB0aGlzIGlzIG5vdCBuZWNlc3Nhcnk/CgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
