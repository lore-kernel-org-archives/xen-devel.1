From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 1/6] xen/sched: call
 cpu_disable_scheduler() via cpu notifier
Date: Tue, 2 Apr 2019 10:54:11 +0100
Message-ID: <efba3e84-acca-1107-1318-bda1268afc0e@arm.com>
References: <20190402053457.24912-1-jgross@suse.com>
 <20190402053457.24912-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j360=SE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hBG7U-0005Uu-8k
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 09:54:16 +0000
In-Reply-To: <20190402053457.24912-2-jgross@suse.com>
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

SGksCgpPbiAwMi8wNC8yMDE5IDA2OjM0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IGNwdV9kaXNh
YmxlX3NjaGVkdWxlcigpIGlzIGJlaW5nIGNhbGxlZCBmcm9tIF9fY3B1X2Rpc2FibGUoKSB0b2Rh
eS4KPiBUaGVyZSBpcyBubyBuZWVkIHRvIGV4ZWN1dGUgaXQgb24gdGhlIGNwdSBqdXN0IGJlaW5n
IGRpc2FibGVkLCBzbyB1c2UKPiB0aGUgQ1BVX0RFQUQgY2FzZSBvZiB0aGUgY3B1IG5vdGlmaWVy
IGNoYWluLiBNb3ZpbmcgdGhlIGNhbGwgb3V0IG9mCj4gc3RvcF9tYWNoaW5lKCkgY29udGV4dCBp
cyBmaW5lLCBhcyB3ZSBqdXN0IG5lZWQgdG8gaG9sZCB0aGUgZG9tYWluIFJDVQo+IGxvY2sgYW5k
IG5lZWQgdGhlIHNjaGVkdWxlciBwZXJjcHUgZGF0YSB0byBiZSBzdGlsbCBhbGxvY2F0ZWQuCj4g
Cj4gQWRkIGFub3RoZXIgaG9vayBmb3IgQ1BVX0RPV05fUFJFUEFSRSB0byBiYWlsIG91dCBlYXJs
eSBpbiBjYXNlCj4gY3B1X2Rpc2FibGVfc2NoZWR1bGVyKCkgd291bGQgZmFpbC4gVGhpcyB3aWxs
IGF2b2lkIGNyYXNoZXMgaW4gcmFyZQo+IGNhc2VzIGZvciBjcHUgaG90cGx1ZyBvciBzdXNwZW5k
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBS
ZXZpZXdlZC1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KCkZvciB0aGUg
QXJtIGJpdHM6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
