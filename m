From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] mem_access: Fix npfec.kind propagation
Date: Fri, 5 Oct 2018 14:00:31 +0300
Message-ID: <81f65685-d9fc-4939-542f-47427f862ded@bitdefender.com>
References: <20180927112536.6909-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/9nw=mr=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g8NqX-00040H-0X
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 11:00:37 +0000
In-Reply-To: <20180927112536.6909-1-george.dunlap@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alexandru Isaila <aisaila@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>
List-Id: xen-devel@lists.xenproject.org

T24gOS8yNy8xOCAyOjI1IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IFRoZSBuYW1lIG9mIHRo
ZSAid2l0aF9nbGEiIGZsYWcgaXMgY29uZnVzaW5nOyBpdCBoYXMgbm90aGluZyB0byBkbwo+IHdp
dGggdGhlIGV4aXN0ZW5jZSBvciBsYWNrIHRoZXJlb2Ygb2YgYSBmYXVsdGluZyBHTEEsIGJ1dCBy
YXRoZXIgd2hlcmUKPiB0aGUgZmF1bHQgb3JpZ2luYXRlZC4gIFRoZSBucGZlYy5raW5kIHZhbHVl
IGlzIGFsd2F5cyB2YWxpZCwgYW5kCj4gc2hvdWxkIHRodXMgYmUgcHJvcGFnYXRlZCwgcmVnYXJk
bGVzcyBvZiB3aGV0aGVyIGdsYV92YWxpZCBpcyBzZXQgb3IKPiBub3QuCj4gCj4gSW4gcGFydGlj
dWxhciwgZ2xhX3ZhbGlkIHdpbGwgbmV2ZXIgYmUgc2V0IG9uIEFNRCBzeXN0ZW1zOyBidXQKPiBu
cGZlYy5raW5kIHdpbGwgc3RpbGwgYmUgdmFsaWQgYW5kIHNob3VsZCBzdGlsbCBiZSBwcm9wYWdh
dGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVm
ZW5kZXIuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBA
Y2l0cml4LmNvbT4KCkFja2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZl
bmRlci5jb20+CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
