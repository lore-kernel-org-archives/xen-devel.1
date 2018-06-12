From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2] xen/netfront: raise max number of slots
 in xennet_get_responses()
Date: Tue, 12 Jun 2018 15:43:24 -0700 (PDT)
Message-ID: <20180612.154324.84720221873990983.davem__40043.2631992318$1528843337$gmane$org@davemloft.net>
References: <20180612065753.10569-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=o9ot=i6=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1fSs0d-0002bt-3Z
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 22:43:27 +0000
In-Reply-To: <20180612065753.10569-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jgross@suse.com
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpEYXRlOiBUdWUsIDEyIEp1biAy
MDE4IDA4OjU3OjUzICswMjAwCgo+IFRoZSBtYXggbnVtYmVyIG9mIHNsb3RzIHVzZWQgaW4geGVu
bmV0X2dldF9yZXNwb25zZXMoKSBpcyBzZXQgdG8KPiBNQVhfU0tCX0ZSQUdTICsgKHJ4LT5zdGF0
dXMgPD0gUlhfQ09QWV9USFJFU0hPTEQpLgo+IAo+IEluIG9sZCBrZXJuZWwteGVuIE1BWF9TS0Jf
RlJBR1Mgd2FzIDE4LCB3aGlsZSBub3dhZGF5cyBpdCBpcyAxNy4gVGhpcwo+IGRpZmZlcmVuY2Ug
aXMgcmVzdWx0aW5nIGluIGZyZXF1ZW50IG1lc3NhZ2VzICJ0b28gbWFueSBzbG90cyIgYW5kIGEK
PiByZWR1Y2VkIG5ldHdvcmsgdGhyb3VnaHB1dCBmb3Igc29tZSB3b3JrbG9hZHMgKGZhY3RvciAx
MCBiZWxvdyB0aGF0IG9mCj4gYSBrZXJuZWwteGVuIGJhc2VkIGd1ZXN0KS4KPiAKPiBSZXBsYWNp
bmcgTUFYX1NLQl9GUkFHUyBieSBYRU5fTkVUSUZfTlJfU0xPVFNfTUlOIGZvciBjYWxjdWxhdGlv
biBvZgo+IHRoZSBtYXggbnVtYmVyIG9mIHNsb3RzIHRvIHVzZSBzb2x2ZXMgdGhhdCBwcm9ibGVt
ICh0ZXN0cyBzaG93ZWQgbm8KPiBtb3JlIG1lc3NhZ2VzICJ0b28gbWFueSBzbG90cyIgYW5kIHRo
cm91Z2hwdXQgd2FzIGFzIGhpZ2ggYXMgd2l0aCB0aGUKPiBrZXJuZWwteGVuIGJhc2VkIGd1ZXN0
IHN5c3RlbSkuCj4gCj4gUmVwbGFjZSBNQVhfU0tCX0ZSQUdTLTIgYnkgWEVOX05FVElGX05SX1NM
T1RTX01JTi0xIGluCj4gbmV0ZnJvbnRfdHhfc2xvdF9hdmFpbGFibGUoKSBmb3IgbWFraW5nIGl0
IGNsZWFyZXIgd2hhdCBpcyByZWFsbHkgYmVpbmcKPiB0ZXN0ZWQgd2l0aG91dCBhY3R1YWxseSBt
b2RpZnlpbmcgdGhlIHRlc3RlZCB2YWx1ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9y
aXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgpBcHBsaWVkLCB0aGFua3MuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
