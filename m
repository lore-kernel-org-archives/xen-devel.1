From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen-blkback: Switch to closed state after
 releasing the backing device
Date: Fri, 7 Sep 2018 09:54:55 +0200
Message-ID: <20180907075455.szxahgevvlmfjvwy__29000.7621901625$1536306835$gmane$org@mac.bytemobile.com>
References: <20180829065214.23546-1-Valentin.Vidic@CARNet.hr>
 <20180905103649.edugijsjx4v2fbxd@mac.bytemobile.com>
 <20180905113515.GU26705@gavran.carpriv.carnet.hr>
 <20180905162801.GB26705@gavran.carpriv.carnet.hr>
 <20180906162932.7qge5dmrgyqbmbbj@mac.bytemobile.com>
 <20180906221929.GZ26705@gavran.carpriv.carnet.hr>
 <20180907071530.te5dxdvg4zqgqscj@mac.bytemobile.com>
 <20180907072319.GA26705@gavran.carpriv.carnet.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mbmt=lv=citrix.com=prvs=781eb9476=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fyBbe-0007cf-67
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 07:55:06 +0000
Content-Disposition: inline
In-Reply-To: <20180907072319.GA26705@gavran.carpriv.carnet.hr>
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

T24gRnJpLCBTZXAgMDcsIDIwMTggYXQgMDk6MjM6MTlBTSArMDIwMCwgVmFsZW50aW4gVmlkaWMg
d3JvdGU6Cj4gT24gRnJpLCBTZXAgMDcsIDIwMTggYXQgMDk6MTU6MzBBTSArMDIwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IEknbSBub3Qgc3VyZSB0aGF0J3MgYSBnb29kIGlkZWEsIHRo
ZXJlIGFyZSBhIGxvdCBvZiBiYWNrZW5kcyAoYXBhcnQKPiA+IGZyb20gYmxrYmFjayksIGFuZCB0
aGUgdG9vbHMgd29uJ3Qga25vdyB3aGV0aGVyIGEgc3BlY2lmaWMgYmFja2VuZAo+ID4gc3VwcG9y
dHMgc3VjaCBzdGF0ZSBvciBub3QuIEFsc28gdGhlIGN1cnJlbnQgcHJvdG9jb2wgYW5kIHN0YXRl
cyBhcmUKPiA+IHNoYXJlZCBiZXR3ZWVuIGFsbCB0aGUgWGVuIFBWIGRldmljZXMsIHNvIG5ldyBh
ZGRpdGlvbnMgc2hvdWxkIGJlCj4gPiBjb25zaWRlcmVkIHZlcnkgY2FyZWZ1bGx5Lgo+IAo+IFN1
cmUsIEkgdW5kZXJzdGFuZC4KPiAKPiA+IElNTyB0aGUgYmVzdCBvcHRpb25zIGFyZSBlaXRoZXIg
Y2FsbGluZyB2YmRfZnJlZS92YmRfY3JlYXRlIGF0IHByb3Blcgo+ID4gc3RhZ2VzIGluIGJsa2Jh
Y2sgb3IgY2hhbmdpbmcgdGhlIGhvdHBsdWcgc2NyaXB0IHNvIGl0IHdhaXRzIGZvciB0aGUKPiA+
IGRldmljZSB0byBoYXZlIG5vIG9wZW4gY2xpZW50cy4KPiAKPiBDaGFuZ2luZyB0aGUgYmxvY2st
ZHJiZCBzY3JpcHQgd291bGQgYmUgaWRlYWwgZm9yIG1lIHRvbywgYnV0IEkgZG9uJ3QKPiB0aGlu
ayB0aGF0IHBpZWNlIG9mIERSQkQgc3RhdGUgaXMgZXhwb3NlZCBhdCB0aGUgbW9tZW50LgoKVGhl
biBJJ20gYWZyYWlkIHlvdSB3aWxsIGhhdmUgdG8gbG9vayBpbnRvIHRoZSB2YmRfZnJlZS9jcmVh
dGUgZml4LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
