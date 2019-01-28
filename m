From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] arch/arm/xen: Remove duplicate header
Date: Mon, 28 Jan 2019 16:17:15 -0500
Message-ID: <d386f867-715f-0667-93bf-b42d728f546a__34917.1603958652$1548710322$gmane$org@oracle.com>
References: <20190107173719.GA30197@jordon-HP-15-Notebook-PC>
 <eab5c59d-cfb4-bd2a-de07-7db827830472@gmail.com>
 <CAFqt6zb0cU3TjAs0LO-DL3Ut98-7=b7cP9+hZ+bUxDLD2EN2vA@mail.gmail.com>
 <cd855c41-dca0-14dc-6703-886feccd34ea@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qgGu=QE=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1goEHp-0008Nj-UL
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 21:17:45 +0000
In-Reply-To: <cd855c41-dca0-14dc-6703-886feccd34ea@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, Souptick Joarder <jrdr.linux@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, Sabyasachi Gupta <sabyasachi.linux@gmail.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Brajeswar Ghosh <brajeswar.linux@gmail.com>, xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gMS8yOC8xOSAzOjI5IEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPiArQm9y
aXMgYW5kIEp1ZXJnZW4gd2hvIGNhbiBhbHNvIGhlbHAgZ2V0dGluZyBpdCBpbgoKSSBjYW4gcHV0
IHRoaXMgaW4gYnV0IEknZCBsaWtlIHRvIGhhdmUgU3RlZmFubydzIGFjaywgdGhpcyBiZWluZyBB
Uk0uCgotYm9yaXMKCgo+Cj4gT24gMS8yOC8xOSA4OjM0IEFNLCBTb3VwdGljayBKb2FyZGVyIHdy
b3RlOgo+PiBPbiBNb24sIEphbiAxNCwgMjAxOSBhdCA0OjA4IFBNIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvCj4+IDxhbmRyMjAwMEBnbWFpbC5jb20+IHdyb3RlOgo+Pj4gT24gMS83LzE5IDc6Mzcg
UE0sIFNvdXB0aWNrIEpvYXJkZXIgd3JvdGU6Cj4+Pj4gUmVtb3ZlIGR1cGxpY2F0ZSBoZWFkZXIg
d2hpY2ggaXMgaW5jbHVkZWQgdHdpY2UuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBTb3VwdGlj
ayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+IENh
biB3ZSBnZXQgdGhpcyBwYXRjaCBpbiBxdWV1ZSBmb3IgNS4xID8KPj4+PiAtLS0KPj4+PiDCoMKg
IGFyY2gvYXJtL3hlbi9tbS5jIHwgMSAtCj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMSBkZWxl
dGlvbigtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL3hlbi9tbS5jIGIvYXJjaC9h
cm0veGVuL21tLmMKPj4+PiBpbmRleCBjYjQ0YWEyLi5lMWQ0NGI5IDEwMDY0NAo+Pj4+IC0tLSBh
L2FyY2gvYXJtL3hlbi9tbS5jCj4+Pj4gKysrIGIvYXJjaC9hcm0veGVuL21tLmMKPj4+PiBAQCAt
Nyw3ICs3LDYgQEAKPj4+PiDCoMKgICNpbmNsdWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+Cj4+Pj4g
wqDCoCAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+Pj4+IMKgwqAgI2luY2x1ZGUgPGxpbnV4L3R5
cGVzLmg+Cj4+Pj4gLSNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgo+Pj4+IMKgwqAgI2lu
Y2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KPj4+PiDCoMKgICNpbmNsdWRlIDxsaW51eC9zd2lvdGxi
Lmg+Cj4+Pj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
