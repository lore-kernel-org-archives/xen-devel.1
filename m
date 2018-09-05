From: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Subject: Re: [PATCH] xen-blkback: Switch to closed state after
 releasing the backing device
Date: Wed, 5 Sep 2018 18:28:01 +0200
Message-ID: <20180905162801.GB26705__13101.6643987552$1536164822$gmane$org@gavran.carpriv.carnet.hr>
References: <20180829065214.23546-1-Valentin.Vidic@CARNet.hr>
 <20180905103649.edugijsjx4v2fbxd@mac.bytemobile.com>
 <20180905113515.GU26705@gavran.carpriv.carnet.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+agy=lt=carnet.hr=valentin.vidic@srs-us1.protection.inumbo.net>)
 id 1fxaf0-0002eb-4j
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 16:28:06 +0000
Content-Disposition: inline
In-Reply-To: <20180905113515.GU26705@gavran.carpriv.carnet.hr>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, drbd-user@lists.linbit.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMDUsIDIwMTggYXQgMDE6MzU6MTVQTSArMDIwMCwgVmFsZW50aW4gVmlkaWMg
d3JvdGU6Cj4gPiBBRkFJQ1QsIHRoaXMgd2lsbCBjYXVzZSB0aGUgYmFja2VuZCB0byBuZXZlciBz
d2l0Y2ggdG8gJ0Nsb3NlZCcgc3RhdGUKPiA+IHVudGlsIHRoZSB0b29sc3RhY2sgc2V0cyBvbmxp
bmUgdG8gMCwgd2hpY2ggaXMgbm90IGdvb2QgSU1PLgo+ID4gCj4gPiBJZiBmb3IgZXhhbXBsZSBh
IGZyb250ZW5kIGRlY2lkZXMgdG8gY2xvc2UgYSBkZXZpY2UsIHRoZSBiYWNrZW5kIHdpbGwKPiA+
IHN0YXkgaW4gc3RhdGUgJ0Nsb3NpbmcnIHVudGlsIHRoZSB0b29sc3RhY2sgYWN0dWFsbHkgcmVt
b3ZlcyB0aGUgZGlzawo+ID4gYnkgc2V0dGluZyBvbmxpbmUgdG8gMC4KPiA+IAo+ID4gVGhpcyB3
aWxsIHByZXZlbnQgcmVzZXR0aW5nIGJsayBjb25uZWN0aW9ucywgYXMgYmxrYmFjayB3aWxsIHJl
ZnVzZSB0bwo+ID4gc3dpdGNoIHRvIHN0YXRlIFhlbmJ1c1N0YXRlSW5pdFdhaXQgdW5sZXNzIGl0
J3MgYXQgWGVuYnVzU3RhdGVDbG9zZWQKPiA+IChzZWUgdGhlIFhlbmJ1c1N0YXRlSW5pdGlhbGlz
aW5nIGNhc2UgaW4gZnJvbnRlbmRfY2hhbmdlZCksIHdoaWNoIHdpbGwKPiA+IG5ldmVyIGJlIHJl
YWNoZWQgd2l0aCB5b3VyIHBhdGNoLgoKV291bGQgaXQgYmUgcG9zc2libGUgdG8gY2FsbCB4ZW5f
dmJkX2ZyZWUgYmVmb3JlIHRoZSBzdGF0ZSBjaGFuZ2U/CgogICAgICAgIGNhc2UgWGVuYnVzU3Rh
dGVDbG9zZWQ6CiAgICAgICAgICAgICAgICB4ZW5fYmxraWZfZGlzY29ubmVjdChiZS0+YmxraWYp
OwogICAgICAgICAgICAgICAgeGVuX3ZiZF9mcmVlKCZiZS0+YmxraWYtPnZiZCk7CiAgICAgICAg
ICAgICAgICB4ZW5idXNfc3dpdGNoX3N0YXRlKGRldiwgWGVuYnVzU3RhdGVDbG9zZWQpOwoKLS0g
ClZhbGVudGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
