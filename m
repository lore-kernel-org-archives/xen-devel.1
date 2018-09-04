From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen-swiotlb: use actually allocated size on
 check physical contiguous
Date: Wed, 5 Sep 2018 00:36:09 +0100
Message-ID: <717bd7ec-229d-02dc-e696-7ede026dbe92__42375.7702032619$1536104106$gmane$org@citrix.com>
References: <d578b69a-848b-2c86-175a-1b1933d82a36@oracle.com>
 <f3befca2-fc65-81b8-c9ed-311de7967958@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wdzn=ls=citrix.com=prvs=778137930=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fxKro-0000e6-3N
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 23:36:16 +0000
In-Reply-To: <f3befca2-fc65-81b8-c9ed-311de7967958@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: John Sobecki <john.sobecki@oracle.com>, Joe Jin <joe.jin@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDkvMTggMDA6MTQsIERvbmdsaSBaaGFuZyB3cm90ZToKPiBCZWxvdyBtb2R1bGUgd291
bGQgaGVscCBwZW9wbGUgcmVwcm9kdWNlIHRoZSBpc3N1ZSB0byB1bmRlcnN0YW5kIHRoZSBzeW1w
dG9tOgo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL2ZpbmFsbHlqdXN0aWNlL3BhdGNoc2V0L2Jsb2Iv
bWFzdGVyL3hlbi1zd2lvdGxiLXBhbmljLmMKPgo+IEluIGFkZGl0aW9uLCBvbiB0aGUgeGVuIGh5
cGVydmlzb3Igc2lkZSwgdGhlIG1lbW9yeV9leGNoYW5nZSgpIGluIHhlbiBoeXBlcnZpc29yCj4g
ZG9lcyBub3QgY2hlY2sgaWYgdGhlIHRoZSBwZm4gb2YgaW5wdXQgbWZuIGJlbG9uZyB0byB0aGUg
c2FtZSBleHRlbnQgYXJlCj4gY29udGludW91cyBpbiBndWVzdCBkb21haW4uIEFzIGEgcmVzdWx0
LCB0aGUgd3JvbmcgcGFnZSBpcyBzdG9sZW4gZnJvbSBndWVzdCBkb21haW4uCj4KPiBDYW4gd2Ug
YXNzdW1lIGl0IGlzIGZpbmUgdG8gbm90IGNoZWNrIGlmIHBmbiBvZiBtZm4gYXJlIGNvbnRpbnVv
dXMgaW4geGVuCj4gaHlwZXJ2aXNvcj8KClRoZSBwdXJwb3NlIG9mIHRoZSBtZW1vcnlfZXhjaGFu
Z2UgaHlwZXJjYWxsIGlzIHRvIGV4Y2hhbmdlIGFueQphcmJpdHJhcnkgc2V0IG9mIGd1ZXN0IGZy
YW1lcyB3aXRoIGFuIGVxdWl2YWxlbnRseSBzaXplZCBzZXQgZnJhbWVzIHdpdGgKZGlmZmVyZW50
IHByb3BlcnRpZXMuCgpUaGUgcHJhY3RpY2FsIHVzZSBpcyBmb3IgUFYgZ3Vlc3RzIHRvIGJlIGFi
bGUgdG8gY3JlYXRlIGEgRE1BIGJ1ZmZlcgp3aGljaCBpcyBwaHlzaWNhbGx5IGNvbnRpbnVvdXMu
wqAgWGVuIGRvZXMgbm90LCBhbmQgaW5kZWVkIHNob3VsZCBub3QsCmNhcmUgYWJvdXQgdGhlIHBy
b3BlcnRpZXMgb2YgdGhlIGlucHV0IGZyYW1lIGxpc3QuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
