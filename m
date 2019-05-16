From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH] AMD/IOMMU: adjust IOMMU list head
 initialization
Date: Thu, 16 May 2019 05:53:10 -0600
Message-ID: <5CDD4F26020000780022F9DC@prv1-mh.provo.novell.com>
References: <5CADB95A0200007800226174@prv1-mh.provo.novell.com>
 <8c5dd813-4166-1ed1-e52b-87323430c4ec@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hREwj-00051Z-EM
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:53:13 +0000
In-Reply-To: <8c5dd813-4166-1ed1-e52b-87323430c4ec@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA0LjE5IGF0IDEyOjEyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTAvMDQvMjAxOSAxMDozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IERvIHRoaXMg
c3RhdGljYWxseSwgd2hpY2ggd2lsbCBhbGxvdyBhY2Nlc3NpbmcgdGhlIChlbXB0eSkgbGlzdCBl
dmVuCj4+IHdpdGhvdXQgaGF2aW5nIGNvbWUgdGhyb3VnaCBhY3BpX2l2cnNfaW5pdCgpLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gUmV2
aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpTbyBq
dXN0IGxpa2UgZG9uZSBhIG1pbnV0ZSBhZ28gZm9yICJBTUQvSU9NTVU6IGRvbid0IG9wZW4tY29k
ZQpmb3JfZWFjaF9hbWRfaW9tbXUoKSIgSSBpbnRlbmQgdG8gY29tbWl0IHRoaXMgdHJpdmlhbCBw
YXRjaCBpbiBhCmRheSBvciB0d28gd2l0aG91dCBtYWludGFpbmVyIGFjaywgdW5sZXNzIEkgaGVh
ciBiYWNrIG90aGVyd2lzZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
