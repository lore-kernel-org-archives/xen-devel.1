From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [DRBD-user] [PATCH] xen-blkback: Switch to closed
 state after releasing the backing device
Date: Fri, 14 Sep 2018 18:18:41 +0200
Message-ID: <20180914161841.zqenjczqgfkycdmm__6978.66987106881$1536941896$gmane$org@mac.bytemobile.com>
References: <20180907132828.GC11834@soda.linbit>
 <20180907164500.GN26705@gavran.carpriv.carnet.hr>
 <20180907171459.GO26705@gavran.carpriv.carnet.hr>
 <20180908073432.GP26705@gavran.carpriv.carnet.hr>
 <20180910124531.GA31737@soda.linbit>
 <20180910132252.GE26705@gavran.carpriv.carnet.hr>
 <20180910150058.suxehc3uheyho4qx@mac.bytemobile.com>
 <20180910161831.GG26705@gavran.carpriv.carnet.hr>
 <20180913150800.haswzd7t2xccbgvl@mac.bytemobile.com>
 <20180914114951.GH2153@gavran.carpriv.carnet.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mf26=l4=citrix.com=prvs=7880d46e1=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g0qoK-0007GK-AP
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 16:19:12 +0000
Content-Disposition: inline
In-Reply-To: <20180914114951.GH2153@gavran.carpriv.carnet.hr>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Cc: Jens Axboe <axboe@kernel.dk>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, drbd-user@lists.linbit.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMTQsIDIwMTggYXQgMDE6NDk6NTFQTSArMDIwMCwgVmFsZW50aW4gVmlkaWMg
d3JvdGU6Cj4gT24gVGh1LCBTZXAgMTMsIDIwMTggYXQgMDU6MDg6MDBQTSArMDIwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IFNvIEkgaGF2ZSB0aGUgZm9sbG93aW5nIHBhdGNoIHdoaWNo
IEkgdGhpbmsgbWlnaHQgc29sdmUgeW91ciBpc3N1ZXMKPiA+IHdoaWxlIGtlZXBpbmcgdGhlIHJl
c2V0IGxvZ2ljIHdvcmtpbmcuIFdvdWxkIHlvdSBtaW5kIGdpdmluZyBpdCBhIHRyeQo+ID4gd2l0
aCB5b3VyIHVzZSBjYXNlIGFuZCBwdmdydWI/Cj4gCj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guICBJ
dCBzZWVtcyB0byBiZSBoYXZpbmcgc29tZSBwcm9ibGVtcyB3aXRoIHB2Z3J1YjoKPiBtYWNoaW5l
cyBkb24ndCBib290IHBhc3QgcHZncnViIGFuZCB0aGV5IGFyZSB1c2luZyAxMDAlIENQVS4gIEFs
c28gaW4KPiBkb20wIHhlbnN0b3JlZCBpcyB1c2luZCAxMDAlIENQVSAtIHN0cmFjZSByZXBvcnRz
IGl0IGlzIGxvb3BpbmcgaW4gdGhpczoKPiAKPiByZWFkKDI2LCAiXFxcMjQwXDBcMCIsIDQpICAg
ICAgICAgICAgICAgPSA0Cj4gcmVhZCgyNiwgIlwwXDBcMFwwTFwwXDBcMClcMFwwXDBcMzVcMFww
XDArXFxcMjMyYFwyMzFcMzFcMSYiLCAyNCkgPSAyNAo+IHJlYWQoMjYsICIvbG9jYWwvZG9tYWlu
LzAvYmFja2VuZC92YmQvMS81MTcxMi9zdGF0ZSIsIDQxKSA9IDQxCj4gcmVhZCgyNiwgIlwyXDBc
MFwwXDFcMFwwXDBcMFwwXDBcMFwwXDBcMFwwXDBcMFwwXDBcMVwwXDBcMFwxXDBcMFwwMDA0Iiwg
MjkpID0gMjkKPiByZWFkKDI2LCAiXDBcMzMwXDBcMCIsIDQpICAgICAgICAgICAgICAgPSA0Cj4g
cmVhZCgyNiwgIlwwXDBcMFwwTFwwXDBcMClcMFwwXDBcMzVcMFwwXDArXFxKR1wyMzFcMzFcMSYi
LCAyNCkgPSAyNAo+IHJlYWQoMjYsICIvbG9jYWwvZG9tYWluLzAvYmFja2VuZC92YmQvMi81MTcx
Mi9zdGF0ZSIsIDQxKSA9IDQxCj4gcmVhZCgyNiwgIlwyXDBcMFwwXDFcMFwwXDBcMFwwXDBcMFww
XDBcMFwwXDBcMFwwXDBcMlwwXDBcMFwxXDBcMFwwMDA0IiwgMjkpID0gMjkKPiByZWFkKDI2LCAi
XDBcMjAwXDFcMCIsIDQpICAgICAgICAgICAgICAgPSA0Cj4gcmVhZCgyNiwgIlwwXDBcMFwwTFww
XDBcMClcMFwwXDBcMzVcMFwwXDArXFxaXDM3M1wyMzFcMzFcMSYiLCAyNCkgPSAyNAo+IHJlYWQo
MjYsICIvbG9jYWwvZG9tYWluLzAvYmFja2VuZC92YmQvNS81MTcxMi9zdGF0ZSIsIDQxKSA9IDQx
Cj4gcmVhZCgyNiwgIlwyXDBcMFwwXDFcMFwwXDBcMFwwXDBcMFwwXDBcMFwwXDBcMFwwXDBcNVww
XDBcMFwxXDBcMFwwMDA0IiwgMjkpID0gMjkKPiByZWFkKDEyLCAiXDMyMVwxXDBcMCIsIDQpICAg
ICAgICAgICAgICAgPSA0Cj4gd3JpdGUoMTIsICJcMzIxXDFcMFwwIiwgNCkgICAgICAgICAgICAg
ID0gNAoKSSBzZWUgdGhlIGlzc3VlLCBibGtmcm9udCBpbiBwdmdydWIgaXMgd2FpdGluZyBmb3Ig
dGhlIGJhY2tlbmQgdG8Kc3dpdGNoIHRvIENsb3NlZCBzdGF0ZSBiZWZvcmUgYm9vdGluZyB0aGUg
T1Mga2VybmVsLCBzbyBteSBmaXggaXMgbm90CmdvaW5nIHRvIHdvcmsuIEkgZ3Vlc3MgSSB3aWxs
IGhhdmUgdG8gZmluZCBhIHByb3BlciB3YXkgdG8gc3dpdGNoIHRvCkNsb3NlZCBzdGF0ZS4KClRo
YW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
