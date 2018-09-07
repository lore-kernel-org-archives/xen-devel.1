From: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Subject: Re: [DRBD-user] [PATCH] xen-blkback: Switch to closed
 state after releasing the backing device
Date: Fri, 7 Sep 2018 14:13:48 +0200
Message-ID: <20180907121348.GM26705__7293.19051974944$1536322362$gmane$org@gavran.carpriv.carnet.hr>
References: <20180829065214.23546-1-Valentin.Vidic@CARNet.hr>
 <20180905103649.edugijsjx4v2fbxd@mac.bytemobile.com>
 <20180905162756.GA26705@gavran.carpriv.carnet.hr>
 <20180907120337.GB11834@soda.linbit>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hzco=lv=carnet.hr=valentin.vidic@srs-us1.protection.inumbo.net>)
 id 1fyFe8-0005la-HV
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 12:13:56 +0000
Content-Disposition: inline
In-Reply-To: <20180907120337.GB11834@soda.linbit>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: drbd-user@lists.linbit.com
Cc: Jens Axboe <axboe@kernel.dk>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMDcsIDIwMTggYXQgMDI6MDM6MzdQTSArMDIwMCwgTGFycyBFbGxlbmJlcmcg
d3JvdGU6Cj4gVmVyeSBmcmVxdWVudGx5IGl0IGlzICpOT1QqIHRoZSAib3JpZ2luYWwgdXNlciIs
IHRoYXQgInN0aWxsIiBob2xkcyBpdAo+IG9wZW4sIGJ1dCB1ZGV2LCBvciBzb21ldGhpbmcgdHJp
Z2dlcmVkLWJ5LXVkZXYuCj4gCj4gU28gZG91YmxlLWNoZWNraW5nIHRoZSB1ZGV2IHJ1bGVzLAo+
IG9yIHRoZSAibHZtIGdsb2JhbF9maWx0ZXIiIHNldHRpbmdzIG1heSBoZWxwLgo+IFlvdSBjb3Vs
ZCBpbnN0cnVtZW50IERSQkQgdG8gbG9nIGN1cnJlbnQtPntwaWQsY29tbX0gb24gb3BlbiBhbmQg
Y2xvc2UsCj4gc28geW91IGNhbiBiZXR0ZXIgZGV0ZWN0IHdobyB0aGUgInNvbWVvbmUiIGlzIGlu
IHRoZSBtZXNzYWdlIGFib3ZlLgoKRG9uJ3QgdGhpbmsgdGhlcmUgaXMgYW55dGhpbmcgZWxzZSBo
b2xkaW5nIHRoZSBkZXZpY2Ugb3BlbiwgYmVjYXVzZSBpdAppcyBwb3NzaWJsZSB0byBjaGFuZ2Ug
c3RhdGUgdG8gU2Vjb25kYXJ5IGEgZmV3IHNlY29uZHMgbGF0ZXIuIEJ1dCBJIHdpbGwKdHJ5IHRv
IHByaW50IHRob3NlIHZhbHVlcyBpbiBjYXNlIGFueXRoaW5nIGludGVyZXN0aW5nIGNvbWVzIHVw
LgoKPiBBZGRpbmcgYSBzbWFsbCByZXRyeSBsb29wIGluIHRoZSBzY3JpcHQgbWF5IGhlbHAgYXMg
d2VsbC4KClllcywgdGhhdCBpcyBhbiBvcHRpb24sIGJ1dCBpdCB3b3VsZCBzdGlsbCBsZWF2ZSB0
aG9zZSBuYXN0eSAiU3RhdGUKY2hhbmdlIGZhaWxlZCIgbWVzc2FnZXMgaW4gdGhlIGxvZy4gSSBn
dWVzcyB0aGVyZSBpcyBubyB3YXkgdG8gY2hlY2sKdGhlIHZhbHVlIG9mIERSQkQgZGV2aWNlLT5v
cGVuX2NudCBmcm9tIHVzZXJzcGFjZT8KCi0tIApWYWxlbnRpbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
