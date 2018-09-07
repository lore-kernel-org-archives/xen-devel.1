From: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Subject: Re: [PATCH] xen-blkback: Switch to closed state after
 releasing the backing device
Date: Fri, 7 Sep 2018 09:23:19 +0200
Message-ID: <20180907072319.GA26705__8373.68558063663$1536304928$gmane$org@gavran.carpriv.carnet.hr>
References: <20180829065214.23546-1-Valentin.Vidic@CARNet.hr>
 <20180905103649.edugijsjx4v2fbxd@mac.bytemobile.com>
 <20180905113515.GU26705@gavran.carpriv.carnet.hr>
 <20180905162801.GB26705@gavran.carpriv.carnet.hr>
 <20180906162932.7qge5dmrgyqbmbbj@mac.bytemobile.com>
 <20180906221929.GZ26705@gavran.carpriv.carnet.hr>
 <20180907071530.te5dxdvg4zqgqscj@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hzco=lv=carnet.hr=valentin.vidic@srs-us1.protection.inumbo.net>)
 id 1fyB6z-00056z-HM
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 07:23:25 +0000
Content-Disposition: inline
In-Reply-To: <20180907071530.te5dxdvg4zqgqscj@mac.bytemobile.com>
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

T24gRnJpLCBTZXAgMDcsIDIwMTggYXQgMDk6MTU6MzBBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBJJ20gbm90IHN1cmUgdGhhdCdzIGEgZ29vZCBpZGVhLCB0aGVyZSBhcmUgYSBs
b3Qgb2YgYmFja2VuZHMgKGFwYXJ0Cj4gZnJvbSBibGtiYWNrKSwgYW5kIHRoZSB0b29scyB3b24n
dCBrbm93IHdoZXRoZXIgYSBzcGVjaWZpYyBiYWNrZW5kCj4gc3VwcG9ydHMgc3VjaCBzdGF0ZSBv
ciBub3QuIEFsc28gdGhlIGN1cnJlbnQgcHJvdG9jb2wgYW5kIHN0YXRlcyBhcmUKPiBzaGFyZWQg
YmV0d2VlbiBhbGwgdGhlIFhlbiBQViBkZXZpY2VzLCBzbyBuZXcgYWRkaXRpb25zIHNob3VsZCBi
ZQo+IGNvbnNpZGVyZWQgdmVyeSBjYXJlZnVsbHkuCgpTdXJlLCBJIHVuZGVyc3RhbmQuCgo+IElN
TyB0aGUgYmVzdCBvcHRpb25zIGFyZSBlaXRoZXIgY2FsbGluZyB2YmRfZnJlZS92YmRfY3JlYXRl
IGF0IHByb3Blcgo+IHN0YWdlcyBpbiBibGtiYWNrIG9yIGNoYW5naW5nIHRoZSBob3RwbHVnIHNj
cmlwdCBzbyBpdCB3YWl0cyBmb3IgdGhlCj4gZGV2aWNlIHRvIGhhdmUgbm8gb3BlbiBjbGllbnRz
LgoKQ2hhbmdpbmcgdGhlIGJsb2NrLWRyYmQgc2NyaXB0IHdvdWxkIGJlIGlkZWFsIGZvciBtZSB0
b28sIGJ1dCBJIGRvbid0CnRoaW5rIHRoYXQgcGllY2Ugb2YgRFJCRCBzdGF0ZSBpcyBleHBvc2Vk
IGF0IHRoZSBtb21lbnQuCgotLSAKVmFsZW50aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
