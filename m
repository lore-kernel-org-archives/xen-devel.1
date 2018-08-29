From: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Subject: Re: [PATCH] xen-blkback: Switch to closed state after
 releasing the backing device
Date: Wed, 29 Aug 2018 10:27:31 +0200
Message-ID: <20180829082731.GX26705__18791.7732437656$1535531179$gmane$org@gavran.carpriv.carnet.hr>
References: <20180829065214.23546-1-Valentin.Vidic@CARNet.hr>
 <1701ccef-3ebb-973b-de32-059a8816d31c@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kjfd=lm=carnet.hr=valentin.vidic@srs-us1.protection.inumbo.net>)
 id 1fuvpB-00048D-Gv
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 08:27:37 +0000
Content-Disposition: inline
In-Reply-To: <1701ccef-3ebb-973b-de32-059a8816d31c@suse.com>
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

T24gV2VkLCBBdWcgMjksIDIwMTggYXQgMTA6MTY6MDlBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBEaWQgeW91IHRlc3Qgd2hldGhlciBpdCBpcyBva2F5IHRvIG5vdCBjaGFuZ2Ugc3Rh
dGUgaW4gY2FzZSB0aGUgZGV2aWNlCj4gaXMgc3RpbGwgb25saW5lPwoKTm90IHN1cmUgaG93IHRv
IHNpbXVsYXRlIHRoYXQuIE1heWJlIHVzaW5nIHhsIGJsb2NrLWRldGFjaCBvciBzb21ldGhpbmcg
ZWxzZT8KCi0tIApWYWxlbnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
