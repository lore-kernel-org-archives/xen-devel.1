From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/2] xen/link: Link proc_info_list in .data
 instead of .init.data
Date: Tue, 4 Dec 2018 17:13:30 +0000
Message-ID: <5d6df477-e159-85c6-781e-f3af73f345cd@arm.com>
References: <1543923745-29877-1-git-send-email-olekstysh@gmail.com>
 <1543923745-29877-2-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ad1q=on=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gUEGN-0001Jl-71
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 17:13:35 +0000
In-Reply-To: <1543923745-29877-2-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org, mirela.simonovic@aggios.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpUaXRsZTogeGVuL2FybTogbGluazogLi4uCgpPbiAxMi80LzE4IDExOjQyIEFNLCBPbGVr
c2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xl
a3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4gCj4gVG8gYmUgYWJsZSB0byB1c2UgaXQgZm9y
IHRoZSBob3QgcGx1Z2VkIENQVXMgYXMgd2VsbC4KCnMvaG90IHBsdWdlZC9ob3QtcGx1Z2dlZC8K
Cj4gCj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNo
Y2hlbmtvQGVwYW0uY29tPgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL3hlbi5sZHMuUyB8IDEwICsr
KysrKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMgYi94ZW4vYXJjaC9h
cm0veGVuLmxkcy5TCj4gaW5kZXggMjQ1YTBlMC4uMDAzMzAxYSAxMDA2NDQKPiAtLS0gYS94ZW4v
YXJjaC9hcm0veGVuLmxkcy5TCj4gKysrIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwo+IEBAIC04
OCw2ICs4OCwxMiBAQCBTRUNUSU9OUwo+ICAgICAgICAgIC4gPSBBTElHTihQQUdFX1NJWkUpOwo+
ICAgICAgICAgICooLmRhdGEucGFnZV9hbGlnbmVkKQo+ICAgICAgICAgICooLmRhdGEpCj4gKwo+
ICsgICAgICAgLiA9IEFMSUdOKFBPSU5URVJfQUxJR04pOwo+ICsgICAgICAgX19wcm9jX2luZm9f
c3RhcnQgPSAuOwo+ICsgICAgICAgKiguaW5pdC5wcm9jLmluZm8pCgpUaGlzIGlzIGEgYml0IG9k
ZCB0byBzZWUgLmluaXQuKiBzZWN0aW9uIGluIC5kYXRhLiBTbyBJIHRoaW5rIHdlIHdhbnQgdG8g
CnJlbmFtZSBpdC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
