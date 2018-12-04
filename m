From: Chris Brannon <cmb@prgmr.com>
Subject: HVM driver domains do not appear to be usable with
 stubdomains
Date: Tue, 04 Dec 2018 10:10:54 -0800
Message-ID: <874lbt2mdt.fsf@prgmr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=v2ks=on=prgmr.com=cmb@srs-us1.protection.inumbo.net>)
 id 1gUF9u-0006Pz-2p
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 18:10:58 +0000
Received: from localhost (97-115-118-92.ptld.qwest.net [97.115.118.92])
 (Authenticated sender: cmb)
 by mail.prgmr.com (Postfix) with ESMTPSA id F34F628C00E
 for <xen-devel@lists.xenproject.org>; Tue,  4 Dec 2018 17:11:18 -0500 (EST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCkkgc2V0IHVwIGEgbmV0d29yayBkcml2ZXIgZG9tYWluIGZvciBhIGRvbTA7IGl0IHVzZXMg
SFZNCnZpcnR1YWxpemF0aW9uLiAgSXQgd29ya2VkIHZlcnkgd2VsbCB3aGVuIG5vdCB1c2luZyBh
IGRldmljZSBtb2RlbApzdHViZG9tYWluLCBidXQgd2hlbiBJIHJlcXVlc3RlZCB0aGUgdXNlIG9m
IGEgZGV2aWNlIG1vZGVsIHN0dWJkb21haW4gaW4KbXkgeGwuY2ZnIGZpbGUsIHRoZSBkb21VIHJl
ZnVzZWQgdG8gYm9vdC4gIEl0IGdhdmUgdGhlIGZvbGxvd2luZyBlcnJvcgptZXNzYWdlLgoKWzc2
NTk0LjE5NTQwNF0geGVuX3BjaWJhY2s6IHZwY2k6IDAwMDA6MDU6MDAuMDogYXNzaWduIHRvIHZp
cnR1YWwgc2xvdCAwCls3NjU5NC4xOTU5MjddIHBjaWJhY2sgMDAwMDowNTowMC4wOiByZWdpc3Rl
cmluZyBmb3IgMzUKWzc2NTk0LjIzMDU5Ml0geGVuLXBjaWJhY2sgcGNpLTM0LTA6IDIyIENvdWxk
bid0IGxvY2F0ZSBQQ0kgZGV2aWNlCiAgICAoMDAwMDowNTowMC4wKSEgcGVyaGFwcyBhbHJlYWR5
IGluLXVzZT8KCkl0IHNlZW1zIHRvIG1lIHRoYXQgWGVuIGlzIHRyeWluZyB0byBwYXNzIHRoZSBQ
Q0kgZGV2aWNlIHRvIGJvdGggdGhlCmRvbVUgYW5kIHRoZSBzdHViZG9tYWluLCBhbmQgdGhhdCBp
cyB3aHkgaXQgaXMgZmFpbGluZy4gIEhhcyBhbnlvbmUKbWFuYWdlZCB0byBnZXQgYW4gSFZNIGRy
aXZlciBkb21haW4gcnVubmluZyB3aXRoIGEgc3R1YmRvbWFpbj8gIElmIHNvLApob3cgZGlkIHlv
dSBkbyBpdD8gIE9yIGlzIGl0IGV4cGVjdGVkIHRoYXQgSFZNIGRyaXZlciBkb21haW5zIHdvbid0
IHdvcmsKd2l0aCBzdHViZG9tYWlucz8KCi0tIENocmlzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
