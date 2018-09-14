From: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Subject: Re: [DRBD-user] [PATCH] xen-blkback: Switch to closed
 state after releasing the backing device
Date: Fri, 14 Sep 2018 13:49:51 +0200
Message-ID: <20180914114951.GH2153__6095.97618827156$1536925727$gmane$org@gavran.carpriv.carnet.hr>
References: <20180907121348.GM26705@gavran.carpriv.carnet.hr>
 <20180907132828.GC11834@soda.linbit>
 <20180907164500.GN26705@gavran.carpriv.carnet.hr>
 <20180907171459.GO26705@gavran.carpriv.carnet.hr>
 <20180908073432.GP26705@gavran.carpriv.carnet.hr>
 <20180910124531.GA31737@soda.linbit>
 <20180910132252.GE26705@gavran.carpriv.carnet.hr>
 <20180910150058.suxehc3uheyho4qx@mac.bytemobile.com>
 <20180910161831.GG26705@gavran.carpriv.carnet.hr>
 <20180913150800.haswzd7t2xccbgvl@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oal1=l4=carnet.hr=valentin.vidic@srs-us1.protection.inumbo.net>)
 id 1g0mbn-0000d7-Uj
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 11:49:59 +0000
Content-Disposition: inline
In-Reply-To: <20180913150800.haswzd7t2xccbgvl@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jens Axboe <axboe@kernel.dk>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, drbd-user@lists.linbit.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMTMsIDIwMTggYXQgMDU6MDg6MDBQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBTbyBJIGhhdmUgdGhlIGZvbGxvd2luZyBwYXRjaCB3aGljaCBJIHRoaW5rIG1p
Z2h0IHNvbHZlIHlvdXIgaXNzdWVzCj4gd2hpbGUga2VlcGluZyB0aGUgcmVzZXQgbG9naWMgd29y
a2luZy4gV291bGQgeW91IG1pbmQgZ2l2aW5nIGl0IGEgdHJ5Cj4gd2l0aCB5b3VyIHVzZSBjYXNl
IGFuZCBwdmdydWI/CgpUaGFua3MgZm9yIHRoZSBwYXRjaC4gIEl0IHNlZW1zIHRvIGJlIGhhdmlu
ZyBzb21lIHByb2JsZW1zIHdpdGggcHZncnViOgptYWNoaW5lcyBkb24ndCBib290IHBhc3QgcHZn
cnViIGFuZCB0aGV5IGFyZSB1c2luZyAxMDAlIENQVS4gIEFsc28gaW4KZG9tMCB4ZW5zdG9yZWQg
aXMgdXNpbmQgMTAwJSBDUFUgLSBzdHJhY2UgcmVwb3J0cyBpdCBpcyBsb29waW5nIGluIHRoaXM6
CgpyZWFkKDI2LCAiXFxcMjQwXDBcMCIsIDQpICAgICAgICAgICAgICAgPSA0CnJlYWQoMjYsICJc
MFwwXDBcMExcMFwwXDApXDBcMFwwXDM1XDBcMFwwK1xcXDIzMmBcMjMxXDMxXDEmIiwgMjQpID0g
MjQKcmVhZCgyNiwgIi9sb2NhbC9kb21haW4vMC9iYWNrZW5kL3ZiZC8xLzUxNzEyL3N0YXRlIiwg
NDEpID0gNDEKcmVhZCgyNiwgIlwyXDBcMFwwXDFcMFwwXDBcMFwwXDBcMFwwXDBcMFwwXDBcMFww
XDBcMVwwXDBcMFwxXDBcMFwwMDA0IiwgMjkpID0gMjkKcmVhZCgyNiwgIlwwXDMzMFwwXDAiLCA0
KSAgICAgICAgICAgICAgID0gNApyZWFkKDI2LCAiXDBcMFwwXDBMXDBcMFwwKVwwXDBcMFwzNVww
XDBcMCtcXEpHXDIzMVwzMVwxJiIsIDI0KSA9IDI0CnJlYWQoMjYsICIvbG9jYWwvZG9tYWluLzAv
YmFja2VuZC92YmQvMi81MTcxMi9zdGF0ZSIsIDQxKSA9IDQxCnJlYWQoMjYsICJcMlwwXDBcMFwx
XDBcMFwwXDBcMFwwXDBcMFwwXDBcMFwwXDBcMFwwXDJcMFwwXDBcMVwwXDBcMDAwNCIsIDI5KSA9
IDI5CnJlYWQoMjYsICJcMFwyMDBcMVwwIiwgNCkgICAgICAgICAgICAgICA9IDQKcmVhZCgyNiwg
IlwwXDBcMFwwTFwwXDBcMClcMFwwXDBcMzVcMFwwXDArXFxaXDM3M1wyMzFcMzFcMSYiLCAyNCkg
PSAyNApyZWFkKDI2LCAiL2xvY2FsL2RvbWFpbi8wL2JhY2tlbmQvdmJkLzUvNTE3MTIvc3RhdGUi
LCA0MSkgPSA0MQpyZWFkKDI2LCAiXDJcMFwwXDBcMVwwXDBcMFwwXDBcMFwwXDBcMFwwXDBcMFww
XDBcMFw1XDBcMFwwXDFcMFwwXDAwMDQiLCAyOSkgPSAyOQpyZWFkKDEyLCAiXDMyMVwxXDBcMCIs
IDQpICAgICAgICAgICAgICAgPSA0CndyaXRlKDEyLCAiXDMyMVwxXDBcMCIsIDQpICAgICAgICAg
ICAgICA9IDQKCi0tIApWYWxlbnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
