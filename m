From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH 6/6] firmware/shim: fix build process to use
 POSIX find options
Date: Wed, 17 Jan 2018 16:55:01 +0000
Message-ID: <23135.32741.685675.991384@mariner.uk.xensource.com>
References: <20180117094814.32772-1-roger.pau@citrix.com>
 <20180117094814.32772-7-roger.pau@citrix.com>
 <23135.30907.66445.273053@mariner.uk.xensource.com>
 <20180117162855.itzoanq67fn442er@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rlig=em=citrix.com=prvs=548fb5411=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ebqzW-0001sk-KK
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 16:55:10 +0000
In-Reply-To: <20180117162855.itzoanq67fn442er@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIDYvNl0gZmlybXdhcmUvc2hpbTogZml4IGJ1aWxk
IHByb2Nlc3MgdG8gdXNlIFBPU0lYIGZpbmQgb3B0aW9ucyIpOgo+IE9uIFdlZCwgSmFuIDE3LCAy
MDE4IGF0IDA0OjI0OjI3UE0gKzAwMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gQW5kIGZpbmFs
bHksIEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgd2h5IGl0IGlzIG5lY2Vzc2FyeSB0byBzdHJp
cAo+ID4gJChYRU5fUk9PVCkvJChkKS8gb3V0IGF0IGFsbC4KPiAKPiBXZSB3YW50IHRoZSBwYXRo
IHdpdGhvdXQgJChYRU5fUk9PVCkvJChkKSBzbyB3ZSBjYW4gY29uc3RydWN0IHRoZSBzYW1lCj4g
dHJlZSB1bmRlciAkKGQpLiBJdCBpcyBiZXR0ZXIgdG8ganVzdCBsb29rIGF0IHRoZSB0cmVlIHN0
cnVjdHVyZSBhZnRlcgo+IHJ1bm5pbmcgdGhlIGxpbmtmYXJtIHJ1bmUuCgpGYWlyIGVub3VnaC4g
IEJ1dCBJIHRoaW5rIG15IG90aGVyIHBvaW50cyBzdGlsbCBzdGFuZC4KCkZZSSBJIGFtIGdvaW5n
IHRvIHNoaXAgdGhlIHBhdGNoIGFzIGlzIHRvICJjb21ldCIgdXNlcnMgdmlhIGFuIFhTQS0yNTQK
dXBkYXRlLiAgSSdtIGp1c3QgcXVpYmJsaW5nIGFib3V0IHRoaXMgZm9yICNzdGFnaW5nLgoKSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
