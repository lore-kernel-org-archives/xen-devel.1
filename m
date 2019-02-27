From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 2/6] xen: introduce DEFINE_SYMBOL
Date: Wed, 27 Feb 2019 01:27:48 -0700
Message-ID: <5C764A04020000780021A904@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1902251243530.4000@sstabellini-ThinkPad-X260>
 <1551127822-25886-2-git-send-email-sstabellini@kernel.org>
 <23669.27990.559784.995763@mariner.uk.xensource.com>
 <5C7573BA020000780021A6D7@prv1-mh.provo.novell.com>
 <23669.30767.727170.597533@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zqed=RC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyuZJ-00010s-6T
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 08:27:57 +0000
In-Reply-To: <23669.30767.727170.597533@mariner.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAyLjE5IGF0IDE4OjMyLCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gSmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSCB2MTAgMi82XSB4ZW46IGludHJvZHVj
ZSBERUZJTkVfU1lNQk9MIik6Cj4+IE9uIDI2LjAyLjE5IGF0IDE3OjQ2LCA8aWFuLmphY2tzb25A
Y2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4gSSBhbSBub3QgYXdhcmUgb2YgYSBzdGFuZGFyZCBDIHR5
cGUgd2hpY2ggY291bGQgYmUgdXNlZCBpbnN0ZWFkIG9mCj4+ID4gdGhpcyBzdHJ1Y3QuICBCdXQg
SSB0aGluayB5b3UgY2FuIHVzZSB0aGUgYHBhY2tlZCcgYXR0cmlidXRlIHRvIGdldAo+PiA+IHRo
ZSByaWdodCBiZWhhdmlvdXIuICBUaGUgR0NDIG1hbnVhbCBzYXlzOgo+PiA+IAo+PiA+ICB8IEFs
aWdubWVudCBjYW4gYmUgZGVjcmVhc2VkIGJ5IHNwZWNpZnlpbmcgdGhlICdwYWNrZWQnIGF0dHJp
YnV0ZS4KPj4gPiAgfCBTZWUgYmVsb3cuCj4gLi4uCj4+IFVudGlsIEkndmUgbG9va2VkIGF0IHRo
aXMgKGFnYWluKSBub3csIEkgd2Fzbid0IGV2ZW4gYXdhcmUgdGhhdAo+PiBvbmUgY2FuIGNvbWJp
bmUgcGFja2VkIGFuZCBhbGlnbmVkIGF0dHJpYnV0ZXMgaW4gYSBzZW5zaWJsZQo+PiB3YXkuIE1h
eSBJIHN1Z2dlc3QgdGhhdCwgYmVjYXVzZSBvZiB0aGlzIGJlaW5nIGEgdGhlb3JldGljYWwKPj4g
aXNzdWUgb25seSBhdCB0aGlzIHBvaW50LCB3ZSBsaW1pdCBvdXJzZWx2ZXMgdG8gdGhlIGJ1aWxk
IHRpbWUKPj4gYXNzZXJ0aW9uIHlvdSBzdWdnZXN0Pwo+IAo+IEkgYW0gbm90IHN1Z2dlc3Rpbmcg
Y29tYmluaW5nIGBwYWNrZWQnIGFuZCBgYWxpZ25lZCcuICBJIGFtIHN1Z2dlc3RpbmcKPiBvbmx5
IGBwYWNrZWQnIChidXQgYmFzZWQgb24gdGV4dCB3aGljaCBpcyBpbiB0aGUgbWFudWFsIHNlY3Rp
b24gZm9yCj4gYGFsaWduZWQnKS4gIEJ1dCBJIGFtIGhhcHB5IHdpdGggYSBidWlsZC10aW1lIGFz
c2VydGlvbiBpZiB5b3UgZG9uJ3QKPiB3YW50IHRvIGFkZCBgcGFja2VkJy4gIFRoYXQgaXMganVz
dCBhcyBzYWZlLgoKQnV0ICJwYWNrZWQiIGFsb25lIHJlZHVjZXMgYWxpZ25tZW50IHRvIHRoZSBt
aW5pbXVtLCBpLmUuIG9uZSBieXRlLgpUaGF0IHdvdWxkIGltbWVkaWF0ZWx5IGJyZWFrIHRoZSBi
dWlsZCB0aW1lIGFzc2VydGlvbiB5b3UndmUgc3VnZ2VzdGVkCnRvIGFkZC4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
