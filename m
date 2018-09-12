From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: xenbus: remove redundant condition
 check before debugfs_remove_recursive
Date: Tue, 11 Sep 2018 23:01:45 -0700 (PDT)
Message-ID: <20180911.230145.1517187819257402271.davem__30372.2169287086$1536732028$gmane$org@davemloft.net>
References: <1536413706-31838-1-git-send-email-zhongjiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hhve=l2=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1fzyDj-0005m0-IF
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 06:01:47 +0000
In-Reply-To: <1536413706-31838-1-git-send-email-zhongjiang@huawei.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: zhongjiang@huawei.com
Cc: xen-devel@lists.xenproject.org, paul.durrant@citrix.com, wei.liu2@citrix.com, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogemhvbmcgamlhbmcgPHpob25namlhbmdAaHVhd2VpLmNvbT4KRGF0ZTogU2F0LCA4IFNl
cCAyMDE4IDIxOjM1OjA2ICswODAwCgo+IGRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZSBoYXMgdGFr
ZW4gdGhlIElTX0VSUl9PUl9OVUxMIGludG8gYWNjb3VudC4gSnVzdAo+IHJlbW92ZSB0aGUgdW5u
ZWNlc3NhcnkgY29uZGl0aW9uIGNoZWNrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IHpob25nIGppYW5n
IDx6aG9uZ2ppYW5nQGh1YXdlaS5jb20+CgpBcHBsaWVkIHRvIG5ldC1uZXh0LgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
