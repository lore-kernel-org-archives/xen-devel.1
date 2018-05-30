From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] xen: fix pv domain on amd in 4.9 stable
 branch
Date: Wed, 30 May 2018 11:46:40 +0200
Message-ID: <20180530094640.GC25193__28797.5488034592$1527673551$gmane$org@kroah.com>
References: <20180529131136.15624-1-jgross@suse.com>
 <20180530083336.GC9685@kroah.com>
 <a0a245e4-8704-c572-d101-c54675c104e1@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cjyj=ir=linuxfoundation.org=gregkh@kernel.org>)
 id 1fNxh7-0001RB-RK
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 09:47:01 +0000
Content-Disposition: inline
In-Reply-To: <a0a245e4-8704-c572-d101-c54675c104e1@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMzAsIDIwMTggYXQgMTE6MzM6MjJBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAzMC8wNS8xOCAxMDozMywgR3JlZyBLSCB3cm90ZToKPiA+IE9uIFR1ZSwgTWF5
IDI5LCAyMDE4IGF0IDAzOjExOjM2UE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPj4g
Q29tbWl0IDk0NGUwZmM1MWE4OWM5ODI3Yjk4ODEzZDY1ZGMwODMyNzQ3NzdjN2YgKCJ4ODYvYW1k
OiBkb24ndCBzZXQKPiA+PiBYODZfQlVHX1NZU1JFVF9TU19BVFRSUyB3aGVuIHJ1bm5pbmcgdW5k
ZXIgWGVuIikgYnJlYWtzIFhlbiBwdi1kb21haW5zCj4gPj4gb24gQU1EIHByb2Nlc3NvcnMsIGFz
IGEgcHJlcmVxdWlzaXRlIHBhdGNoIGZyb20gdXBzdHJlYW0gd2Fzbid0IGFkZGVkCj4gPj4gdG8g
NC45Lgo+ID4gCj4gPiBXaGF0IGlzIHRoZSBwcmVyZXF1c2l0ZSBwYXRjaCdzIGdpdCBpZCBpbiBM
aW51cydzIHRyZWU/Cj4gCj4gQ29tbWl0IDA4MDhlODBjYjc2MGRlMjczM2MwNTI3ZDIwOTBlZDIy
MDVhMWVlZjguIEl0IHdvbid0IGFwcGx5LAo+IGJhY2twb3J0aW5nIGlzIHJhdGhlciBlYXN5LCB0
aG91Z2guCj4gCj4gSSB0aG91Z2h0IHRoaXMgd2FzIGEgcGF0Y2ggaW4gdGhlIG1pZGRsZSBvZiBh
IGxhcmdlciBzZXJpZXMsIGJ1dAo+IG9idmlvdXNseSBJIG1pc3JlbWVtYmVyZWQuIEl0IHdhcyB0
aGUgZmlyc3QgcGF0Y2ggb2YgdGhhdCBzZXJpZXMuCj4gCj4gSSdsbCBzZW5kIGEgc2VyaWVzIGlu
IGNhc2UgeW91IGRvbid0IG9iamVjdDoKPiAKPiAtIHJldmVydCBvZiBzdGFibGUtNC45IDk0NGUw
ZmM1MWE4OWM5ODI3Yjk4ODEzZDY1ZGMwODMyNzQ3NzdjN2YKPiAtIGJhY2twb3J0IG9mIDA4MDhl
ODBjYjc2MGRlMjczM2MwNTI3ZDIwOTBlZDIyMDVhMWVlZjgKPiAtIG5ldyBiYWNrcG9ydCBvZiBk
ZWY5MzMxYTEyOTc3NzcwY2M2MTMyZDc5ZjhlNjU2NTg3MWU4ZTM4CgpUaGF0IHdvdWxkIGJlIGdy
ZWF0LCBJJ2xsIGdsYWRseSB0YWtlIHRoYXQsIHRoYW5rcy4KCmdyZWcgay1oCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
