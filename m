From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC v2 8/9] HACK libxl_exec: Check QEMU status via
 QMP instead of xenstore
Date: Mon, 16 Apr 2018 19:09:48 +0100
Message-ID: <20180416180948.GK2208@perard>
References: <20180416173227.22671-1-anthony.perard@citrix.com>
 <20180416173227.22671-9-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vmis=hf=citrix.com=prvs=6372a2554=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1f88Zy-0002M2-9b
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 18:10:14 +0000
Content-Disposition: inline
In-Reply-To: <20180416173227.22671-9-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMTYsIDIwMTggYXQgMDY6MzI6MjZQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gLWFkZC1mZCwgdG8gY3JlYXRlIGEgZmRzZXQgd2hpY2ggaXMgdXNlIGxhdGVyLgo+
IC1jaGFyZGV2ICdmaWxlLHBhdGg9L2Rldi9mZHNldC8xLGFwcGVuZD10cnVlJywgdGhpcyBvcGVu
IGEgY2hhciBkZXZpY2UKPiBvbiB0aGUgd3JpdGUtZW5kIG9mIHRoZSBwaXBlLCB0ZWxsIHFlbXUg
dGhhdCB0aGUgRkQgaXMgd3JpdGUtb25seSwgYW5kCj4gbm90IHRvIHJ1biB0cnVuY2F0ZSBvbiBp
dC4KPiAtbW9uLCBqdXN0IHN0YXJ0IHRoZSBRTVAgc2VydmVyIG9uIHRoaXMgbmV3IGNoYXJkZXYu
CgpUaGVyZSBtaWdodCBiZSBhIGJldHRlciB3YXkgdGhhbiB0aGlzLiBCdXQgdGhlIG5ldyB3YXkg
b25seSBleGlzdCBpbgoyLjEyLCBhbmQgaXMgbm90IGRvY3VtZW50ZWQuLi4gKGluIC0taGVscCku
CgpXaXRoIFFFTVUgY29tbWl0IDA5MzU3MDBmODU0NDAzM2ViYmQ0MWUxZjEzY2Q1MjhmOGE1OGQy
NGQgKGNoYXI6IGFsbG93CnBhc3NpbmcgcHJlLW9wZW5lZCBzb2NrZXQgZmlsZSBkZXNjcmlwdG9y
IGF0IHN0YXJ0dXApLgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
