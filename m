From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] drivers/block/xen-blkback/common.h: use
 DIV_ROUND_UP instead of reimplementing its function
Date: Wed, 12 Sep 2018 02:14:26 -0600
Message-ID: <5B98CAE202000078001E79CC__40658.516836311$1536739993$gmane$org@prv1-mh.provo.novell.com>
References: <1536731100-56054-1-git-send-email-zhongjiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mhj0=l2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g00IC-0001TP-Ko
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 08:14:32 +0000
In-Reply-To: <1536731100-56054-1-git-send-email-zhongjiang@huawei.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>, xen-devel <xen-devel@lists.xenproject.org>, zhong jiang <zhongjiang@huawei.com>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA5LjE4IGF0IDA3OjQ1LCA8emhvbmdqaWFuZ0BodWF3ZWkuY29tPiB3cm90ZToK
PiAtLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5oCj4gKysrIGIvZHJpdmVy
cy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaAo+IEBAIC02NSw3ICs2NSw3IEBACj4gIAkoWEVO
X1BBR0VTX1BFUl9JTkRJUkVDVF9GUkFNRSAvIFhFTl9QQUdFU19QRVJfU0VHTUVOVCkKPiAgCj4g
ICNkZWZpbmUgTUFYX0lORElSRUNUX1BBR0VTIFwKPiAtCSgoTUFYX0lORElSRUNUX1NFR01FTlRT
ICsgU0VHU19QRVJfSU5ESVJFQ1RfRlJBTUUgLSAxKS9TRUdTX1BFUl9JTkRJUkVDVF9GUkFNRSkK
PiArCQlESVZfUk9VTkRfVVAoTUFYX0lORElSRUNUX1NFR01FTlRTLCBTRUdTX1BFUl9JTkRJUkVD
VF9GUkFNRSkKPiAgI2RlZmluZSBJTkRJUkVDVF9QQUdFUyhfc2VncykgRElWX1JPVU5EX1VQKF9z
ZWdzLCBYRU5fUEFHRVNfUEVSX0lORElSRUNUX0ZSQU1FKQoKTXkgZmlyc3QgcmVhY3Rpb24gd2Fz
IHRvIHN1Z2dlc3QKCiNkZWZpbmUgTUFYX0lORElSRUNUX1BBR0VTIElORElSRUNUX1BBR0VTKE1B
WF9JTkRJUkVDVF9TRUdNRU5UUykKCmJ1dCB0aGF0IHdvdWxkbid0IG1hdGNoIHdoYXQncyB0aGVy
ZSBjdXJyZW50bHkgKG5vdGUgdGhlIHR3byBkaWZmZXJlbnQKZGl2aXNvcnMpLiBJIGNhbid0IHJl
YWxseSBkZWNpZGUgd2hldGhlciB0aGF0J3MganVzdCB1bmZvcnR1bmF0ZSBuYW1pbmcKb2YgdGhl
IHR3byBtYWNyb3MsIG9yIGFuIGFjdHVhbCBidWcuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
