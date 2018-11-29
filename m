From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 8/9] libxl: Kill QEMU by uid when possible
Date: Thu, 29 Nov 2018 12:26:19 +0000
Message-ID: <23551.56043.674081.561342@mariner.uk.xensource.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-8-george.dunlap@citrix.com>
 <8b086fb2-e018-a669-b90d-42ce2179eaa7@citrix.com>
 <20181128155758.GA14786@perard.uk.xensource.com>
 <20181129115524.4yjt2ff2hwwqjsgi@zion.uk.xensource.com>
 <C5994DCA-A993-4BBD-9433-CD6DA9C47C32@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mb5d=oi=citrix.com=prvs=8641bc5b5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gSLOi-0005iZ-1T
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 12:26:24 +0000
In-Reply-To: <C5994DCA-A993-4BBD-9433-CD6DA9C47C32@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIIDgvOV0gbGlieGw6IEtpbGwgUUVNVSBi
eSB1aWQgd2hlbiBwb3NzaWJsZSIpOgo+IEl0IHdvdWxkbuKAmXQgYmUgdGVycmlibHkgaGFyZCB0
byBoYXZlIGEgY29tbW9uIOKAnGV4aXTigJ0gdG8gYm90aCB0aGUKPiBraWxsLWJ5LXBpZCBhbmQg
a2lsbC1ieS11aWQgcGF0aHMgdGhhdCBkaWQgaXQgb25jZSwgYnV0IGl0IHdvdWxkCj4gaW52b2x2
ZSBhZGRpbmcgWWV0IEFub3RoZXIgRnVuY3Rpb247IGFuZCBlYWNoIGFkZGl0aW9uYWwgZnVuY3Rp
b24KPiBtYWtlcyB0aGUgY29kZSBhIGxpdHRsZSBiaXQgbW9yZSBkaWZmaWN1bHQgdG8gZm9sbG93
LgoKSSdtIGFmcmFpZCBJIGRpc2FncmVlIG9uIHRoaXMgcG9pbnQuCgpJIGFncmVlIHRoYXQgYWRk
aXRpb25hbCBmdW5jdGlvbnMgc2hvdWxkIGJlIGF2b2lkZWQgd2hlcmUgdGhleSBhcmUKbmVlZGxl
c3MuICBCdXQgYSBzaW5nbGUgZXhpdCBwYXRoIGlzIG1vcmUgaW1wb3J0YW50LgoKV2l0aG91dCBh
IHNpbmdsZSBleGl0IHBhdGgsIHNvbWVvbmUgd2hvIG1vZGlmaWVzIHRoaXMgY29kZSBpbiB0aGUK
ZnV0dXR1cmUgKHRvIGFkZCBuZXcgc3RhdGUsIHNheSkgd2lsbCByaXNrIGFsdGVyaW5nIG9ubHkg
b25lIG9mIHRoZQpleGl0IHBhdGhzLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
