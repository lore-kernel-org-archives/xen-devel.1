From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 6/7] xen/libfdt: Put all libfdt in init
Date: Tue, 12 Jun 2018 12:37:26 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1806121237200.14695@sstabellini-ThinkPad-X260>
References: <20180605171237.30601-1-julien.grall@arm.com>
 <20180605171237.30601-7-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ywjr=i6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fSp6e-0002xv-ES
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 19:37:28 +0000
In-Reply-To: <20180605171237.30601-7-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCA1IEp1biAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gTGliZmR0IGlzIHVzZWQg
Zm9yOgo+ICAgICAtIFVuZmxhdHRlbiB0aGUgRmxhdHRlbiBEZXZpY2UtVHJlZSAoRkRUKSBibG9i
Cj4gICAgIC0gQ3JlYXRlIERldmljZS1UcmVlIGZvciB0aGUgSGFyZHdhcmUtRG9tYWluCj4gCj4g
Qm90aCB1c2UgYXJlIGRvbmUgZHVyaW5nIHRoZSBpbml0aWFsaXphdGlvbiBvZiBYZW4uIFNvIG1v
dmUgYWxsIHRoZQo+IGxpYmZkdCB0byBpbml0Lgo+IAo+IE5vdGUgdGhhdCB0aGUgcnVuZXMgd2Fz
IGJvcnJvd2VkIGZyb20gbGliZWxmIE1ha2VmaWxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKPiAtLS0KPiAgeGVuL2NvbW1vbi9saWJm
ZHQvTWFrZWZpbGUgfCAxMCArKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9saWJmZHQv
TWFrZWZpbGUgYi94ZW4vY29tbW9uL2xpYmZkdC9NYWtlZmlsZQo+IGluZGV4IDc1NzhmZTljNTAu
LmQ4MWY1NGI2YjggMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUKPiAr
KysgYi94ZW4vY29tbW9uL2xpYmZkdC9NYWtlZmlsZQo+IEBAIC0xLDUgKzEsMTMgQEAKPiAgaW5j
bHVkZSBNYWtlZmlsZS5saWJmZHQKPiAgCj4gLW9iai15ICs9ICQoTElCRkRUX09CSlMpCj4gK1NF
Q1RJT05TIDo9IHRleHQgZGF0YSAkKFNQRUNJQUxfREFUQV9TRUNUSU9OUykKPiArCj4gK29iai15
ICs9IGxpYmZkdC5vCj4gIAo+ICBDRkxBR1MgKz0gLUkkKEJBU0VESVIpL2luY2x1ZGUveGVuL2xp
YmZkdC8KPiArCj4gK2xpYmZkdC5vOiBsaWJmZHQtdGVtcC5vIE1ha2VmaWxlCj4gKwkkKE9CSkNP
UFkpICQoZm9yZWFjaCBzLCQoU0VDVElPTlMpLC0tcmVuYW1lLXNlY3Rpb24gLiQocyk9LmluaXQu
JChzKSkgJDwgJEAKPiArCj4gK2xpYmZkdC10ZW1wLm86ICQoTElCRkRUX09CSlMpCj4gKwkkKExE
KSAkKExERkxBR1MpIC1yIC1vICRAICReCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
