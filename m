From: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Subject: Re: [PATCH] xen-blkback: Switch to closed state after
 releasing the backing device
Date: Wed, 29 Aug 2018 11:23:29 +0200
Message-ID: <20180829092329.GY26705__23013.2105680697$1535534554$gmane$org@gavran.carpriv.carnet.hr>
References: <20180829065214.23546-1-Valentin.Vidic@CARNet.hr>
 <1701ccef-3ebb-973b-de32-059a8816d31c@suse.com>
 <20180829082731.GX26705@gavran.carpriv.carnet.hr>
 <b67866fc-13b7-ef88-c8db-2745127e5f6a@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kjfd=lm=carnet.hr=valentin.vidic@srs-us1.protection.inumbo.net>)
 id 1fuwhL-0000gx-UE
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 09:23:35 +0000
Content-Disposition: inline
In-Reply-To: <b67866fc-13b7-ef88-c8db-2745127e5f6a@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjksIDIwMTggYXQgMTA6NDM6NDhBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlIGFuIGFjdGlvbiB0cmlnZ2VyZWQgYnkgdGhl
IGZyb250ZW5kLCBub3QgYnkgZG9tMAo+ICh4ZW4gdG9vbHMgd2lsbCBhbHdheXMgc2V0ICJvbmxp
bmUiIHRvIDAgd2hlbiByZW1vdmluZyBhIGRldmljZSwgQUZBSUspLgo+IAo+IEknbSBub3Qgc3Vy
ZSB0aGlzIGlzIHJlbGV2YW50LCBidXQgSSByZWFsaXplZCB0aGlzIGJlaGF2aW9yIGlzIGNoYW5n
ZWQKPiBieSB5b3VyIHBhdGNoLgoKQ2FuJ3QgZmluZCBhbnkgcGxhY2UgaW4geGVuLWJsa2Zyb250
LmMgKG9yIHRoZSByZXN0IG9mIHRoZSBrZXJuZWwpIHdoZXJlCnRoZSAib25saW5lIiB2YWx1ZSBn
ZXRzIHNldCwgc28gaXQgc2VlbXMgeGVuIHRvb2xzIGluIGRvbTAgaXMgdGhlIG9ubHkKdGhpbmcg
dGhhdCBtb2RpZmllcyB0aGlzIFhlbmJ1cyBub2RlPwoKLS0gClZhbGVudGluCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
