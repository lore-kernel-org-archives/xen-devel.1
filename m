From: Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v4 1/2] xen/PVH: Set up GS segment for stack
 canary
Date: Tue, 22 May 2018 09:45:57 -0400
Message-ID: <CAMzpN2iMrEqee+8yGP_qk-qAuXf+_o6vrOUSDTvX=8JAUDT5Fg__31544.3287291147$1526996682$gmane$org@mail.gmail.com>
References: <20180522035445.16911-1-boris.ostrovsky@oracle.com>
 <20180522035445.16911-2-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=npos=ij=gmail.com=brgerst@srs-us1.protection.inumbo.net>)
 id 1fL7by-0005bn-Vn
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 13:45:59 +0000
Received: by mail-it0-x242.google.com with SMTP id q4-v6so25415736ite.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 May 2018 06:45:58 -0700 (PDT)
In-Reply-To: <20180522035445.16911-2-boris.ostrovsky@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMjEsIDIwMTggYXQgMTE6NTQgUE0sIEJvcmlzIE9zdHJvdnNreQo8Ym9yaXMu
b3N0cm92c2t5QG9yYWNsZS5jb20+IHdyb3RlOgo+IFdlIGFyZSBtYWtpbmcgY2FsbHMgdG8gQyBj
b2RlIChlLmcuIHhlbl9wcmVwYXJlX3B2aCgpKSB3aGljaCBtYXkgdXNlCj4gc3RhY2sgY2FuYXJ5
IChzdG9yZWQgaW4gR1Mgc2VnbWVudCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBPc3Ryb3Zz
a3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IC0tLQo+ICBhcmNoL3g4Ni94ZW4veGVu
LXB2aC5TIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4
Ni94ZW4veGVuLXB2aC5TIGIvYXJjaC94ODYveGVuL3hlbi1wdmguUwo+IGluZGV4IGUxYTVmYmUu
LjAxNjkzNzQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYveGVuL3hlbi1wdmguUwo+ICsrKyBiL2Fy
Y2gveDg2L3hlbi94ZW4tcHZoLlMKPiBAQCAtNTQsNiArNTQsOSBAQAo+ICAgKiBjaGFyZ2Ugb2Yg
c2V0dGluZyB1cCBpdCdzIG93biBzdGFjaywgR0RUIGFuZCBJRFQuCj4gICAqLwo+Cj4gKyNkZWZp
bmUgUFZIX0dEVF9FTlRSWV9DQU5BUlkgICA0Cj4gKyNkZWZpbmUgUFZIX0NBTkFSWV9TRUwgICAg
ICAgICAoUFZIX0dEVF9FTlRSWV9DQU5BUlkgKiA4KQo+ICsKPiAgRU5UUlkocHZoX3N0YXJ0X3hl
bikKPiAgICAgICAgIGNsZAo+Cj4gQEAgLTk4LDYgKzEwMSwxMiBAQCBFTlRSWShwdmhfc3RhcnRf
eGVuKQo+ICAgICAgICAgLyogNjQtYml0IGVudHJ5IHBvaW50LiAqLwo+ICAgICAgICAgLmNvZGU2
NAo+ICAxOgo+ICsgICAgICAgLyogU2V0IGJhc2UgYWRkcmVzcyBpbiBzdGFjayBjYW5hcnkgZGVz
Y3JpcHRvci4gKi8KPiArICAgICAgIG1vdiAkTVNSX0dTX0JBU0UsJWVjeAo+ICsgICAgICAgbW92
ICRjYW5hcnksICVyYXgKPiArICAgICAgIGNkcQo+ICsgICAgICAgd3Jtc3IKCkNEUSBvbmx5IHNp
Z24tZXh0ZW5kcyBFQVggdG8gUkFYLiAgV2hhdCB5b3UgcmVhbGx5IHdhbnQgaXMgdG8gbW92ZSB0
aGUKaGlnaCAzMi1iaXRzIHRvIEVEWCAob3IgemVybyBFRFggaWYgd2UgY2FuIGd1YXJhbnRlZSBp
dCBpcyBsb2FkZWQKYmVsb3cgNEcpLgoKLS0KQnJpYW4gR2Vyc3QKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
