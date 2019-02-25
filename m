From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Mon, 25 Feb 2019 13:37:21 +0200
Message-ID: <636feb43-c3e6-d489-01b3-2a6353c7a8e5@gmail.com>
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
 <2d08e3ad-868b-7482-8843-debf62f069e9@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jrRo=RA=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gyEZa-00033M-C9
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 11:37:26 +0000
Received: by mail-lj1-x241.google.com with SMTP id t13so2724240lji.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Feb 2019 03:37:25 -0800 (PST)
In-Reply-To: <2d08e3ad-868b-7482-8843-debf62f069e9@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yNS8xOSAxOjA4IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAo+
Cj4gT24gMjUvMDIvMjAxOSAxMDowMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+
IE9uIDIvMjMvMTkgMTozNCBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gwqAgV2hhdCBhcmUg
dGhlIGNvbnNlcXVlbmNlcyBvZiBub3QgZm9sbG93aW5nIHRoZW0gaW4gWGVuIFByb2plY3Q/IEkK
Pj4+IGtub3cgdGhhdCBzb21lIHVwc3RyZWFtIHByb2plY3QgY2hvc2UgdG8gbm90IGFwcGx5IHRv
IGFsbCB0aGUgcnVsZXMuCj4+IE5vdCBhbGwgb2YgdGhlIHVwc3RyZWFtIHByb2plY3RzIHdhbnQg
dG8gYmUgY2VydGlmaWVkLi4uCj4KPiBZb3UgbWlzc2VkIG15IHBvaW50Li4uIEkgd2FzIHRhbGtp
bmcgYWJvdXQgdXBzdHJlYW0gcHJvamVjdCBhaW1pbmcgdG8gCj4gYmUgTUlTUkEgQyBjb21wbGlh
bnQuCj4KTm90IHN1cmUgaWYgSSByZWFsbHkgbWlzc2VkIGl0Cj4gVGhlIHRoaW5nIGlzIHVwc3Ry
ZWFtIHByb2plY3QgaXMgdW5saWtlbHkgdG8gYmUgdXNlZCBhcyBpcyBieSBjb21wYW55IAo+IHRh
cmdldGluZyBjZXJ0aWZpY2F0aW9uLiBUaGV5IHdpbGwgaGF2ZSB0byBtb2RpZnkgdGhlIGNvZGUg
dG8gbWVldCAKPiB0aGVpciByZXF1aXJlbWVudHMuCj4KPiBXaGVyZSB1cHN0cmVhbSBjYW4gaGVs
cCBpcyBhZG9wdGluZyBzb21lIG9mIHRoZSBydWxlcyBzbyB0aGUgY29tcGFueSAKPiBkb2VzIG5v
dCBoYXZlIHRvIGNhcnJ5IGEgbG90IHBhdGNoZXMgb24gdG9wLiBBcyBtYWludGFpbmVyLCBJIGhh
dmUgdG8gCj4gd2VpZ2h0IHRoZSBwcm9zL2NvbnMgb2YgYWNjZXB0aW5nIHRob3NlIHBhdGNoZXMg
aW4gWGVuLgo+CkkgZG8gdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm5zCj4gQ2hlZXJzLAo+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
