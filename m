From: "Agarwal, Anchal" <anchalag@amazon.com>
Subject: Re: [PATCH] xen/netfront: Remove unneeded .resume
 callback
Date: Thu, 30 May 2019 12:32:19 +0000
Message-ID: <F76E91F5-0981-4233-A7F9-072B7026D404__11903.9638013177$1559219603$gmane$org@amazon.com>
References: <6205819a-af39-8cd8-db87-f3fe047ff064@gmail.com>
 <ecc825e6-89d3-bbd5-5243-5cc66fa93045@oracle.com>
 <b55d4f90-100c-7a2a-9651-c99c06953465@gmail.com>
 <09afcdca-258f-e5ca-5c31-b7fd079eb213@oracle.com>
 <3e868e7a-4872-e8ab-fd2c-90917ad6d593@arm.com>
 <d709d185-5345-c463-3fd1-e711f954e58a@gmail.com>
 <435369ba-ad3b-1d3a-c2f4-babe8bb6189c@amazon.com>
 <fde362d0-dd48-9c9a-e71a-8fb158909551@epam.com>
 <20190325173011.GA20277@kaos-source-ops-60001.pdx1.amazon.com>
 <f5e824de-da57-9574-3813-2668f2932a6e@gmail.com>
 <20190328231928.GA5172@kaos-source-ops-60001.pdx1.amazon.com>
 <48fedb13-5af2-e7cf-d182-0f2bb385dda2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bSuJ=T6=amazon.com=prvs=0468485c6=anchalag@srs-us1.protection.inumbo.net>)
 id 1hWKEL-0003Rr-0Q
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 12:32:25 +0000
In-Reply-To: <48fedb13-5af2-e7cf-d182-0f2bb385dda2@gmail.com>
Content-Language: en-US
Content-ID: <1AE9E09634A3B34695C563DBA263885A@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, Anchal Agarwal <anchalag@amzn.com>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>
Cc: "jgross@suse.com" <jgross@suse.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Kamata,
 Munehisa" <kamatam@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "davem@davemloft.net" <davem@davemloft.net>
List-Id: xen-devel@lists.xenproject.org

SGkgT2xla3NhbmRyLA0KDQrvu78gICAgSGVsbG8sIEFuY2hhbCENCiAgICANCiAgICBPbiAzLzI5
LzE5IDE6MTkgQU0sIEFuY2hhbCBBZ2Fyd2FsIHdyb3RlOg0KICAgIFtzbmlwXQ0KICAgID4+Pj4g
R3JlYXQsIGNvdWxkIHlvdSBwbGVhc2UgbGV0IHVzIGtub3cgd2hhdCBpcyB0aGUgcHJvZ3Jlc3Mg
YW5kIGZ1cnRoZXIgcGxhbnMNCiAgICA+Pj4+IG9uIHRoYXQsIHNvIHdlIGRvIG5vdCB3b3JrIG9u
IHRoZSBzYW1lIGNvZGUgYW5kIGNhbiBjb29yZGluYXRlIG91cg0KICAgID4+Pj4gZWZmb3J0cyBz
b21laG93PyBBbmNoYWwsIGNvdWxkIHlvdSBwbGVhc2Ugc2hlZCBzb21lIGxpZ2h0IG9uIHRoaXM/
DQogICAgPj4+IExvb2tzIGxpa2UgbXkgcHJldmlvdXMgZW1haWwgZGlkIG5vdCBtYWtlIGl0IHRv
IG1haWxpbmcgbGlzdC4gTWF5IGJlIHNvbWUgaXNzdWVzIHdpdGggbXkNCiAgICA+Pj4gZW1haWwg
c2VydmVyIHNldHRpbmdzLiBHaXZpbmcgaXQgYW5vdGhlciBzaG90Lg0KICAgID4+PiBZZXMsIEkg
YW0gd29ya2luZyBvbiB0aG9zZSBwYXRjaGVzIGFuZCBwbGFuIHRvIHJlLXBvc3QgdGhlbSBpbiBh
biBlZmZvcnQgdG8gdXBzdHJlYW0uDQogICAgPj4gVGhpcyBpcyByZWFsbHkgZ3JlYXQsIGxvb2tp
bmcgZm9yd2FyZCB0byBpdDogYW55IGRhdGUgaW4geW91ciBtaW5kDQogICAgPj4gd2hlbiB0aGlz
IGNhbiBoYXBwZW4/DQogICAgPiBOb3QgYSBzcGVjaWZpYyBkYXRlIGJ1dCBtYXkgYmUgaW4gZmV3
IHdlZWtzLiBJIGFtIGN1cnJlbnRseSBzd2FtcGVkIGF0IHdvcmsuDQogICAgPg0KICAgIEFueSBw
cm9ncmVzcyBvbiB0aGlzPw0KDQpZZXMsIGJ1dCBhdCBhIHNuYWlsJ3MgcGFjZS4NCiAgICANCiAg
ICBUaGFuayB5b3UsDQogICAgT2xla3NhbmRyDQoNClRoYW5rcywNCkFuY2hhbCAgICANCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
