From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2] xen/vm_event: fix rc check for
 uninitialized ring
Date: Mon, 27 May 2019 17:32:45 +0100
Message-ID: <178ba47e-a29a-5174-902b-68043dede440@citrix.com>
References: <20190524152318.19735-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E92+=T3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hVIYM-0004ao-UL
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 16:32:50 +0000
In-Reply-To: <20190524152318.19735-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8yNC8xOSA0OjIzIFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IHZtX2V2ZW50X2NsYWlt
X3Nsb3QoKSByZXR1cm5zIC1FT1BOT1RTVVBQIGZvciBhbiB1bmluaXRpYWxpemVkIHJpbmcKPiBz
aW5jZSBjb21taXQgMTVlNGRkNWU4NjZiNDNiYmMgKCJjb21tb24vdm1fZXZlbnQ6IEluaXRpYWxp
emUgdm1fZXZlbnQKPiBsaXN0cyBvbiBkb21haW4gY3JlYXRpb24iKSwgYnV0IHRoZSBjYWxsZXJz
IHRlc3QgZm9yIC1FTk9TWVMuCj4gCj4gQ29ycmVjdCB0aGUgY2FsbGVycy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpBY2tlZC1ieTogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
