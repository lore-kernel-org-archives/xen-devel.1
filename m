From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] arch/arm/xen: Remove duplicate header
Date: Mon, 28 Jan 2019 10:29:00 +0200
Message-ID: <cd855c41-dca0-14dc-6703-886feccd34ea__12262.6761718251$1548664194$gmane$org@gmail.com>
References: <20190107173719.GA30197@jordon-HP-15-Notebook-PC>
 <eab5c59d-cfb4-bd2a-de07-7db827830472@gmail.com>
 <CAFqt6zb0cU3TjAs0LO-DL3Ut98-7=b7cP9+hZ+bUxDLD2EN2vA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jnXa=QE=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1go2Hx-0000sa-IC
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 08:29:05 +0000
Received: by mail-lj1-x241.google.com with SMTP id k15-v6so13399873ljc.8
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jan 2019 00:29:04 -0800 (PST)
In-Reply-To: <CAFqt6zb0cU3TjAs0LO-DL3Ut98-7=b7cP9+hZ+bUxDLD2EN2vA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, Sabyasachi Gupta <sabyasachi.linux@gmail.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Brajeswar Ghosh <brajeswar.linux@gmail.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

K0JvcmlzIGFuZCBKdWVyZ2VuIHdobyBjYW4gYWxzbyBoZWxwIGdldHRpbmcgaXQgaW4KCk9uIDEv
MjgvMTkgODozNCBBTSwgU291cHRpY2sgSm9hcmRlciB3cm90ZToKPiBPbiBNb24sIEphbiAxNCwg
MjAxOSBhdCA0OjA4IFBNIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvCj4gPGFuZHIyMDAwQGdtYWls
LmNvbT4gd3JvdGU6Cj4+IE9uIDEvNy8xOSA3OjM3IFBNLCBTb3VwdGljayBKb2FyZGVyIHdyb3Rl
Ogo+Pj4gUmVtb3ZlIGR1cGxpY2F0ZSBoZWFkZXIgd2hpY2ggaXMgaW5jbHVkZWQgdHdpY2UuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5j
b20+Cj4+IFJldmlld2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2Fu
ZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4gQ2FuIHdlIGdldCB0aGlzIHBhdGNoIGluIHF1ZXVlIGZv
ciA1LjEgPwo+Pj4gLS0tCj4+PiAgICBhcmNoL2FybS94ZW4vbW0uYyB8IDEgLQo+Pj4gICAgMSBm
aWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
eGVuL21tLmMgYi9hcmNoL2FybS94ZW4vbW0uYwo+Pj4gaW5kZXggY2I0NGFhMi4uZTFkNDRiOSAx
MDA2NDQKPj4+IC0tLSBhL2FyY2gvYXJtL3hlbi9tbS5jCj4+PiArKysgYi9hcmNoL2FybS94ZW4v
bW0uYwo+Pj4gQEAgLTcsNyArNyw2IEBACj4+PiAgICAjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVz
cy5oPgo+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPj4+ICAgICNpbmNsdWRlIDxsaW51
eC90eXBlcy5oPgo+Pj4gLSNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgo+Pj4gICAgI2lu
Y2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KPj4+ICAgICNpbmNsdWRlIDxsaW51eC9zd2lvdGxiLmg+
Cj4+PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
