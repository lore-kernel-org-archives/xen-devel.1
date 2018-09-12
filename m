From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] xen-netback: remove unecessary condition
 check before debugfs_remove_recursive
Date: Tue, 11 Sep 2018 23:02:26 -0700 (PDT)
Message-ID: <20180911.230226.177479593974408935.davem__24129.6681379483$1536732068$gmane$org@davemloft.net>
References: <1536414822-32911-1-git-send-email-zhongjiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hhve=l2=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1fzyEO-0005pv-Uo
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 06:02:28 +0000
In-Reply-To: <1536414822-32911-1-git-send-email-zhongjiang@huawei.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: zhongjiang@huawei.com
Cc: xen-devel@lists.xenproject.org, paul.durrant@citrix.com, wei.liu2@citrix.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogemhvbmcgamlhbmcgPHpob25namlhbmdAaHVhd2VpLmNvbT4KRGF0ZTogU2F0LCA4IFNl
cCAyMDE4IDIxOjUzOjQyICswODAwCgo+IGRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZSBoYXMgdGFr
ZW4gSVNfRVJSX09SX05VTEwgaW50byBhY2NvdW50LiBTbyBqdXN0Cj4gcmVtb3ZlIHRoZSBjb25k
aXRpb24gY2hlY2sgYmVmb3JlIGRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiB6aG9uZyBqaWFuZyA8emhvbmdqaWFuZ0BodWF3ZWkuY29tPgoKQXBwbGllZCB0byBu
ZXQtbmV4dC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
