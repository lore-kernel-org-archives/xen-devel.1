From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: Xen optimization
Date: Tue, 20 Nov 2018 13:33:31 +0200
Message-ID: <35b44b61-9d2d-60d0-97ee-5b8c00e8be6d@gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <alpine.DEB.2.10.1810191336090.31582@sstabellini-ThinkPad-X260>
 <d3a589c5d95d70ef1c13b4fe6856b7ed387b4ee3.camel@suse.com>
 <CADJ6SV2891kOd_Ga8jjXdtKdjPAoWtADhizuS+kjSZNNOPMK+w@mail.gmail.com>
 <alpine.DEB.2.10.1810221037270.31582@sstabellini-ThinkPad-X260>
 <CADJ6SV0gUvRv_4Kp=Vz5n4WSQ3kgQrC=+gPz1QjrBzdFOoJwPA@mail.gmail.com>
 <alpine.DEB.2.10.1810231005040.31582@sstabellini-ThinkPad-X260>
 <d5769cb9-9d87-3db4-e23d-414242692a89@arm.com>
 <alpine.DEB.2.10.1810250915030.25937@sstabellini-ThinkPad-X260>
 <94c08d07-b028-8eb1-7e94-21a416cd8007@arm.com>
 <alpine.DEB.2.10.1810261340530.32521@sstabellini-ThinkPad-X260>
 <CADJ6SV174NdceJ4kWCWYJ-UaNp1AAisb28V5tgKz14N+-pBVEg@mail.gmail.com>
 <67f6ece7-0a26-e29c-b20b-acf83a01f6eb@arm.com>
 <CADJ6SV22eAxR0s0ocpGNRRefo+FmsMz9KsEeXw+cME1sSM-ssg@mail.gmail.com>
 <a5eab71a-f301-67ae-cc22-8cf10715fdcd@arm.com>
 <alpine.DEB.2.10.1811011320050.7220@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n0tg=n7=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gP4Hf-0003vN-VQ
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 11:33:36 +0000
Received: by mail-ed1-x529.google.com with SMTP id d3so1605182edx.7
 for <xen-devel@lists.xenproject.org>; Tue, 20 Nov 2018 03:33:34 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1811011320050.7220@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
Cc: sstabellini@kernel.org, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gU3RlZmFubywKCk9uIDAxLjExLjE4IDIyOjIwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6Cj4gTm8sIEkgaGF2ZW4ndCBoYWQgYW55IHRpbWUuIEFzaWRlIGZyb20gdGhlIFhlbiB2ZXJz
aW9uLCBhbm90aGVyCj4gZGlmZmVyZW5jZSBpcyB0aGUgaW50ZXJydXB0IHNvdXJjZS4gSSB1c2Vk
IHRoZSBwaHlzaWNhbCB0aW1lciBmb3IKPiB0ZXN0aW5nLgoKQ291bGQgeW91IHNoYXJlIHlvdXIg
YXBwcm9hY2ggZm9yIGludGVycnVwdHMgbGF0ZW5jeSBtZWFzdXJlbWVudD8gQXJlIAp5b3UgdXNp
bmcgYW55IEhXIHNwZWNpZmljcyBvciBpdCBpcyBTb0MgaW5kZXBlbmRlbnQ/CgpJIHdvdWxkIGxp
a2UgdG8gZ2V0IG1vcmUgZXZpZGVuY2VzIGZvciBvcHRpbWl6YXRpb25zIG9mIGdpYy92Z2ljL2dp
Yy12MiAKY29kZSBJIGRpZCBmb3Igb3VyIGN1c3RvbWVyIChpdHMgYWJvdXQgb2xkIHZnaWMsIHdl
IGFyZSBzdGlsbCBvbiB4ZW4gNC4xMCkuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
