From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: xen-pciback: Reset MSI-X state when
 exposing a device
Date: Wed, 05 Dec 2018 09:26:32 -0700
Message-ID: <5C07FC380200007800203394__45026.2645645582$1544027132$gmane$org@prv1-mh.provo.novell.com>
References: <1543976357-1053-1-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=winm=oo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUa0W-0005OF-6H
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 16:26:40 +0000
In-Reply-To: <1543976357-1053-1-git-send-email-chao.gao@intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEyLjE4IGF0IDAzOjE5LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiAt
LS0gYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jCj4gKysrIGIvZHJpdmVycy94
ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYwo+IEBAIC04Nyw2ICs4Nyw1NSBAQCBzdGF0aWMgc3Ry
dWN0IHBjaXN0dWJfZGV2aWNlICpwY2lzdHViX2RldmljZV9hbGxvYyhzdHJ1Y3QgcGNpX2RldiAq
ZGV2KQo+ICAJcmV0dXJuIHBzZGV2Owo+ICB9Cj4gIAo+ICsvKgo+ICsgKiBSZXNldCBYZW4gaW50
ZXJuYWwgTVNJLVggc3RhdGUgYnkgaW52b2tpbmcgUEhZU0RFVk9QX3tyZWxlYXNlLCBwcmVwYXJl
fV9tc2l4Lgo+ICsgKi8KPiAraW50IHBjaXN0dWJfbXNpeF9yZXNldChzdHJ1Y3QgcGNpX2RldiAq
ZGV2KQo+ICt7Cj4gKyNpZmRlZiBDT05GSUdfUENJX01TSQo+ICsJaWYgKGRldi0+bXNpeF9jYXAp
IHsKPiArCQlzdHJ1Y3QgcGh5c2Rldl9wY2lfZGV2aWNlIHBwZGV2ID0gewo+ICsJCQkuc2VnID0g
cGNpX2RvbWFpbl9ucihkZXYtPmJ1cyksCj4gKwkJCS5idXMgPSBkZXYtPmJ1cy0+bnVtYmVyLAo+
ICsJCQkuZGV2Zm4gPSBkZXYtPmRldmZuCj4gKwkJfTsKPiArCQlpbnQgZXJyOwo+ICsJCXUxNiB2
YWw7Cj4gKwo+ICsJCS8qCj4gKwkJICogRG8gYSB3cml0ZSBmaXJzdCB0byBmbHVzaCBYZW4ncyBp
bnRlcm5hbCBzdGF0ZSB0byBoYXJkd2FyZQo+ICsJCSAqIHN1Y2ggdGhhdCB0aGUgZm9sbG93aW5n
IHJlYWQgY2FuIGluZmVyIHdoZXRoZXIgTVNJLVggbWFza2FsbAo+ICsJCSAqIGJpdCBpcyBzZXQg
YnkgWGVuLgo+ICsJCSAqLwo+ICsJCXBjaV9yZWFkX2NvbmZpZ193b3JkKGRldiwgZGV2LT5tc2l4
X2NhcCArIFBDSV9NU0lYX0ZMQUdTLCAmdmFsKTsKPiArCQlwY2lfd3JpdGVfY29uZmlnX3dvcmQo
ZGV2LCBkZXYtPm1zaXhfY2FwICsgUENJX01TSVhfRkxBR1MsIHZhbCk7Cj4gKwo+ICsJCXBjaV9y
ZWFkX2NvbmZpZ193b3JkKGRldiwgZGV2LT5tc2l4X2NhcCArIFBDSV9NU0lYX0ZMQUdTLCAmdmFs
KTsKPiArCQlpZiAoISh2YWwgJiBQQ0lfTVNJWF9GTEFHU19NQVNLQUxMKSkKPiArCQkJcmV0dXJu
IDA7CgpJJ20gYWdyZWVpbmcgd2l0aCBwcmlvciBjb21tZW50czogSSBkb24ndCBzZWUgd2h5IHlv
dSBuZWVkCnRoaXMgY29uZGl0aW9uYWwuCgo+ICsJCXByX2luZm8oIlJlc2V0IE1TSS1YIHN0YXRl
IGZvciBkZXZpY2UgJTA0eDolMDJ4OiUwMnguJWRcbiIsCj4gKwkJCXBwZGV2LnNlZywgcHBkZXYu
YnVzLCBQQ0lfU0xPVChwcGRldi5kZXZmbiksCj4gKwkJCVBDSV9GVU5DKHBwZGV2LmRldmZuKSk7
Cj4gKwo+ICsJCWVyciA9IEhZUEVSVklTT1JfcGh5c2Rldl9vcChQSFlTREVWT1BfcmVsZWFzZV9t
c2l4LCAmcHBkZXYpOwo+ICsJCWlmIChlcnIpIHsKPiArCQkJZGV2X3dhcm4oJmRldi0+ZGV2LCAi
TVNJLVggcmVsZWFzZSBmYWlsZWQgKCVkKVxuIiwKPiArCQkJCSBlcnIpOwo+ICsJCQlyZXR1cm4g
ZXJyOwo+ICsJCX0KPiArCj4gKwkJZXJyID0gSFlQRVJWSVNPUl9waHlzZGV2X29wKFBIWVNERVZP
UF9wcmVwYXJlX21zaXgsICZwcGRldik7Cj4gKwkJaWYgKGVycikgewo+ICsJCQlkZXZfZXJyKCZk
ZXYtPmRldiwgIk1TSS1YIHByZXBhcmF0aW9uIGZhaWxlZCAoJWQpXG4iLAo+ICsJCQkJZXJyKTsK
ClBsZWFzZSBjYW4geW91IG1ha2UgYm90aCBsb2cgbWVzc2FnZXMgZGlzdGluZ3Vpc2hhYmxlIGZy
b20KdGhlIHByZS1leGlzdGluZyBvbmVzLCB0byBhaWQgZGlhZ25vc2lzIG9mIHBvc3NpYmxlIHBy
b2JlbG1zPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
