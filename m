From: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Subject: Re: [DRBD-user] [PATCH] xen-blkback: Switch to closed
 state after releasing the backing device
Date: Mon, 10 Sep 2018 18:18:31 +0200
Message-ID: <20180910161831.GG26705__5020.74272740192$1536596247$gmane$org@gavran.carpriv.carnet.hr>
References: <20180905162756.GA26705@gavran.carpriv.carnet.hr>
 <20180907120337.GB11834@soda.linbit>
 <20180907121348.GM26705@gavran.carpriv.carnet.hr>
 <20180907132828.GC11834@soda.linbit>
 <20180907164500.GN26705@gavran.carpriv.carnet.hr>
 <20180907171459.GO26705@gavran.carpriv.carnet.hr>
 <20180908073432.GP26705@gavran.carpriv.carnet.hr>
 <20180910124531.GA31737@soda.linbit>
 <20180910132252.GE26705@gavran.carpriv.carnet.hr>
 <20180910150058.suxehc3uheyho4qx@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=txga=ly=carnet.hr=valentin.vidic@srs-us1.protection.inumbo.net>)
 id 1fzOtb-00010v-Qd
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 16:18:39 +0000
Content-Disposition: inline
In-Reply-To: <20180910150058.suxehc3uheyho4qx@mac.bytemobile.com>
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

T24gTW9uLCBTZXAgMTAsIDIwMTggYXQgMDU6MDA6NThQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBJIGNhbiB0cnkgdG8gdGFrZSBhIGxvb2sgYXQgdGhpcyBhbmQgYXR0ZW1wdCB0
byBtYWtlIHN1cmUgdGhlIHN0YXRlIGlzCj4gb25seSBjaGFuZ2VkIHRvIGNsb3NlZCBpbiBibGti
YWNrIF9hZnRlcl8gdGhlIGRldmljZSBoYXMgYmVlbgo+IHJlbGVhc2VkLCBidXQgaXQgbWlnaHQg
dGFrZSBtZSBhIGNvdXBsZSBvZiBkYXlzIHRvIGdldCB5b3UgYSBwYXRjaC4KClRoYW5rcywgSSBo
YXZlIHR3byB0ZXN0IG5vZGVzIG5vdyB3aGVyZSBJIGNhbiB0cnkgZGlmZmVyZW50IGFwcHJvYWNo
ZXMuCgo+IEknbSBhZnJhaWQgdGhhdCBvdGhlciBob3RwbHVnIHNjcmlwdHMgd2lsbCBhbHNvIGhh
dmUgaXNzdWVzIHdpdGggc3VjaAo+IGJlaGF2aW9yLCBhbmQgd2Ugc2hvdWxkbid0IGZvcmNlIGFs
bCB1c2VycyBvZiBob3RwbHVnIHNjcmlwdHMgdG8gYWRkCj4gc3VjaCB3b3JrYXJvdW5kcy4KClRy
dWUsIGlTQ1NJIGFuZCBvdGhlciAibmV0d29yayIgZGlza3MgbWlnaHQgaGF2ZSBzaW1pbGFyIHBy
b2JsZW1zLgoKLS0gClZhbGVudGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
