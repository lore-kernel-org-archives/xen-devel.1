From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 1/5] xen: sched/credit: convert
 scheduling parameter to s_time_t when set
Date: Tue, 27 Feb 2018 17:55:24 +0000
Message-ID: <d387f750-d626-25f3-0e4e-f5fb67352a83@citrix.com>
References: <151940399656.10991.13321858263862527366.stgit@Palanthas.fritz.box>
 <151940409293.10991.5596628432362212866.stgit@Palanthas.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7dn/=fv=citrix.com=prvs=589f73368=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eqjTQ-0003CR-KF
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 17:55:32 +0000
In-Reply-To: <151940409293.10991.5596628432362212866.stgit@Palanthas.fritz.box>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjMvMjAxOCAwNDo0MSBQTSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gQmFzaWNhbGx5
LCBpbnN0ZWFkIG9mIGNvbnZlcnRpbmcgaW50ZWdlcnMgdG8gc190aW1lX3QKPiBhdCB1c2FnZSB0
aW1lIChob3QgcGF0aHMpLCBkbyB0aGUgY29udmVydGlvbiB3aGVuIHRoZQo+IHZhbHVlcyBhcmUg
c2V0IChjb2xkIHBhdGhzKS4KPiAKPiBUaGlzIGFwcGxpZXMgdG8gdGhlIHRpbWVzbGljZSBhbmQg
dGhlIHJhdGVsaW1pdAo+IHBhcmFtZXRlcnMgb2YgQ3JlZGl0MS4KPiAKPiBOb3RlIHRoYXQsIHdo
ZW4gY2hhbmdpbmcgdGhlIHR5cGUgb2YgdGhlIGZpZWxkcyBvZgo+IHN0cnVjdCBjc2NoZWRfcHJp
dmF0ZSAoZnJvbSB1bnNpZ25lZCB0byBzX3RpbWVfdCksCj4gbmNwdXMgaXMgbW92ZWQgdXAgYSBi
aXQsIGZvciBiZXR0ZXIgcGFja2luZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBGYWdnaW9s
aSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgoKQWNrZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
