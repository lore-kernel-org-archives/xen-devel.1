From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 14/14] xen/mm: Provide dummy M2P-related
 helpers when !CONFIG_HAVE_M2P
Date: Fri, 24 May 2019 17:51:00 +0100
Message-ID: <e1d9b58f-015e-274c-10a8-8c08aef71d26@citrix.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-15-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KQqo=TY=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hUDPS-0000Q8-4e
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 16:51:10 +0000
In-Reply-To: <20190507151458.29350-15-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS83LzE5IDQ6MTQgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBBdCB0aGUgbW9tZW50LCBB
cm0gaXMgcHJvdmlkaW5nIGEgZHVtbXkgaW1wbGVtZW50YXRpb24gZm9yIHRoZSBNMlAKPiBoZWxw
ZXJzIHVzZWQgaW4gY29tbW9uIGNvZGUuIEhvd2V2ZXIsIHRoZXkgYXJlIHF1aXRlIGlzb2xhdGVk
IGFuZCBjb3VsZAo+IGJlIHVzZWQgYnkgb3RoZXIgYXJjaGl0ZWN0dXJlIGluIHRoZSBmdXR1cmUu
IFNvIG1vdmUgYWxsIHRoZSBoZWxwZXJzIGluCj4geGVuL21tLmguCj4gCj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkFja2VkLWJ5OiBHZW9yZ2Ug
RHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
