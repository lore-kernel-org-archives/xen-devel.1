From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/6] xen/sched: call cpu_disable_scheduler()
 via cpu notifier
Date: Wed, 27 Mar 2019 17:31:34 +0100
Message-ID: <7090ec7b-e37b-35d2-67d9-97c32369fe8c@suse.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-2-jgross@suse.com>
 <42e0d691a0e00149ba585382e26494159dbb71f9.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BLRb=R6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9BSl-0006Iy-ET
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 16:31:39 +0000
In-Reply-To: <42e0d691a0e00149ba585382e26494159dbb71f9.camel@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDMvMjAxOSAxNzoyNCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gTW9uLCAyMDE5
LTAzLTE4IGF0IDE0OjExICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBjcHVfZGlzYWJs
ZV9zY2hlZHVsZXIoKSBpcyBiZWluZyBjYWxsZWQgZnJvbSBfX2NwdV9kaXNhYmxlKCkgdG9kYXku
Cj4+IFRoZXJlIGlzIG5vIG5lZWQgdG8gY2FsbCBpdCBvbiB0aGUgY3B1IGp1c3QgYmVpbmcgZGlz
YWJsZWQsIHNvIHVzZQo+PiB0aGUgQ1BVX0RFQUQgY2FzZSBvZiB0aGUgY3B1IG5vdGlmaWVyIGNo
YWluLgo+Pgo+IFNvLCB3aGF0IGRvIHlvdSBtZWFuIHdpdGggIlRoZXJlIGlzIG5vIG5lZWQgdG8g
Y2FsbCBpdCBvbiB0aGUgY3B1IGp1c3QKPiBiZWluZyBkaXNhYmxlZCI/Cj4gCj4gQmVjYXVzZSB3
ZSBzdGlsbCAoZXZlbiBhZnRlciB0aGlzIHBhdGNoLCBJIG1lYW4pIGNhbGwKPiBjcHVfZGlzYWJs
ZV9zY2hlZHVsZXIoKSBvbiBhbGwgbm9uLWJvb3QgQ1BVcywgYXJlbid0IHdlPyBJdCdzIGp1c3Qg
dGhhdAo+IHJpZ2h0IG5vdyB3ZSBjYWxsIGl0IGZyb20gX19jcHVfZGlzYWJsZSgpLCB3aXRoIHRo
ZSBwYXRjaCB3ZSBjYWxsIGl0Cj4gc2xpZ2h0bHkgbGF0ZXIuCgpUaGUgQ1BVX0RFQUQgbm90aWZp
ZXIgY2hhaW4gaXMgY2FsbGVkIG9uIHRoZSBDUFUgcmVxdWVzdGluZyB0aGUgb3RoZXIKb25lIHRv
IGdvIGRvd24gKHNvIG9uIHRoZSBib290IENQVSBpbiBzdXNwZW5kIGNhc2UpLiBTbyB3ZSBjYWxs
IGl0IF9mb3JfCmFsbCBub24tYm9vdCBDUFVzIGluIHRoZSBib290IENQVS4KCj4gQW5kIGFub3Ro
ZXIgZGlmZmVyZW5jZSBsb29rcyB0byBtZSB0byBiZSB0aGF0IHJpZ2h0IG5vdyB3ZSBjYWxsCj4g
Y3B1X2Rpc2FibGVfc2NoZWR1bGVyKCkgZnJvbSBzdG9wLW1hY2hpbmUgY29udGV4dCwgd2hpY2gg
SSB0aGluayBpcyBubwo+IGxvbmdlciB0cnVlIHdpdGggdGhpcyBwYXRjaC4gUGVyaGFwcyB0aGUg
Y2hhbmdlbG9nIGNvdWxkIHRlbGwgd2h5IHRoYXQKPiBpcyBvaz8KCk9rYXksIEknbGwgYWRkIHNv
bWV0aGluZy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
