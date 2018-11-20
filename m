From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/4] automation: introduce CONTAINER_NO_PULL
 for containerize
Date: Tue, 20 Nov 2018 10:35:56 -0600
Message-ID: <20181120163556.ncmusrwvnmns42v2@doug-macbook.localdomain>
References: <20181119213102.8939-1-wei.liu2@citrix.com>
 <20181119213102.8939-2-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nzhi=n7=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1gP90J-000210-Ph
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 16:35:59 +0000
Received: by mail-yw1-xc42.google.com with SMTP id t13so995164ywe.13
 for <xen-devel@lists.xenproject.org>; Tue, 20 Nov 2018 08:35:58 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20181119213102.8939-2-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMTksIDIwMTggYXQgMDk6MzA6NTlQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IC0tLQo+ICBh
dXRvbWF0aW9uL2J1aWxkL1JFQURNRS5tZCAgICAgIHwgMyArKysKPiAgYXV0b21hdGlvbi9zY3Jp
cHRzL2NvbnRhaW5lcml6ZSB8IDggKysrKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vYnVp
bGQvUkVBRE1FLm1kIGIvYXV0b21hdGlvbi9idWlsZC9SRUFETUUubWQKPiBpbmRleCBmNmNmZDQ2
ZjFlLi5kOGM4YTE4ZTMzIDEwMDY0NAo+IC0tLSBhL2F1dG9tYXRpb24vYnVpbGQvUkVBRE1FLm1k
Cj4gKysrIGIvYXV0b21hdGlvbi9idWlsZC9SRUFETUUubWQKPiBAQCAtNTIsNiArNTIsOSBAQCB1
bmRlcnN0YW5kcy4KPiAgCj4gIC0gQ09OVEFJTkVSX1VJRDA6IFRoaXMgc3BlY2lmaWVzIHdoZXRo
ZXIgcm9vdCBpcyB1c2VkIGluc2lkZSB0aGUgY29udGFpbmVyLgo+ICAKPiArLSBDT05UQUlORVJf
Tk9fUFVMTDogSWYgc2V0IHRvIDEsIHRoZSBzY3JpcHQgd2lsbCBub3QgcHVsbCBmcm9tIGRvY2tl
ciBodWIuCj4gKyAgVGhpcyBpcyB1c2VmdWwgd2hlbiB0ZXN0aW5nIGNvbnRhaW5lciBsb2NhbGx5
Lgo+ICsKCkdvb2QgYWRkaXRpb24uCgpBY2tlZC1ieTogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBj
YXJkb2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
