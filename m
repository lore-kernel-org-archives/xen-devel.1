From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Mon, 25 Feb 2019 11:08:12 +0000
Message-ID: <2d08e3ad-868b-7482-8843-debf62f069e9@arm.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <b405a7ae-174f-c8d9-41cc-ec511fb69c77@citrix.com>
 <alpine.DEB.2.10.1902221351310.30151@sstabellini-ThinkPad-X260>
 <2e9ced0f-398f-e8c2-d465-195f565c7ff0@arm.com>
 <2ca21664-20ff-4b5f-0fde-5bf20ca50374@citrix.com>
 <alpine.DEB.2.10.1902221436200.30151@sstabellini-ThinkPad-X260>
 <32790a4b-d4c7-a6ca-4836-b54697cafeff@arm.com>
 <016ff758-5355-424d-f1ed-9a884cc493a4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Rhx=RA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gyE7M-0000On-5r
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 11:08:16 +0000
In-Reply-To: <016ff758-5355-424d-f1ed-9a884cc493a4@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGkgT2xla3NhbmRyLAoKT24gMjUvMDIvMjAxOSAxMDowMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gd3JvdGU6Cj4gT24gMi8yMy8xOSAxOjM0IEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IMKg
IFdoYXQgYXJlIHRoZSBjb25zZXF1ZW5jZXMgb2Ygbm90IGZvbGxvd2luZyB0aGVtIGluIFhlbiBQ
cm9qZWN0PyBJCj4+IGtub3cgdGhhdCBzb21lIHVwc3RyZWFtIHByb2plY3QgY2hvc2UgdG8gbm90
IGFwcGx5IHRvIGFsbCB0aGUgcnVsZXMuCj4gTm90IGFsbCBvZiB0aGUgdXBzdHJlYW0gcHJvamVj
dHMgd2FudCB0byBiZSBjZXJ0aWZpZWQuLi4KCllvdSBtaXNzZWQgbXkgcG9pbnQuLi4gSSB3YXMg
dGFsa2luZyBhYm91dCB1cHN0cmVhbSBwcm9qZWN0IGFpbWluZyB0byBiZSBNSVNSQSBDIApjb21w
bGlhbnQuCgpUaGUgdGhpbmcgaXMgdXBzdHJlYW0gcHJvamVjdCBpcyB1bmxpa2VseSB0byBiZSB1
c2VkIGFzIGlzIGJ5IGNvbXBhbnkgdGFyZ2V0aW5nIApjZXJ0aWZpY2F0aW9uLiBUaGV5IHdpbGwg
aGF2ZSB0byBtb2RpZnkgdGhlIGNvZGUgdG8gbWVldCB0aGVpciByZXF1aXJlbWVudHMuCgpXaGVy
ZSB1cHN0cmVhbSBjYW4gaGVscCBpcyBhZG9wdGluZyBzb21lIG9mIHRoZSBydWxlcyBzbyB0aGUg
Y29tcGFueSBkb2VzIG5vdCAKaGF2ZSB0byBjYXJyeSBhIGxvdCBwYXRjaGVzIG9uIHRvcC4gQXMg
bWFpbnRhaW5lciwgSSBoYXZlIHRvIHdlaWdodCB0aGUgCnByb3MvY29ucyBvZiBhY2NlcHRpbmcg
dGhvc2UgcGF0Y2hlcyBpbiBYZW4uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
