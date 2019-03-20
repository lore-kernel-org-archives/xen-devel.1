From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 08/10] xen/arm: optee: add support for
 RPC commands
Date: Wed, 20 Mar 2019 15:36:04 +0000
Message-ID: <87sgvh8snx.fsf@epam.com>
References: <20190307210404.12346-1-volodymyr_babchuk@epam.com>
 <20190307210404.12346-9-volodymyr_babchuk@epam.com>
 <3a9ffca5-5139-a607-8647-af9397a2f264@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jssr=RX=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1h6dGB-0001OJ-OF
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2019 15:36:07 +0000
In-Reply-To: <3a9ffca5-5139-a607-8647-af9397a2f264@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <vlad.babchuk@gmail.com>
List-Id: xen-devel@lists.xenproject.org

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+PiAgICAgICBpZiAoIHNobV9ycGMt
Pmd1ZXN0X3BhZ2UgKQo+PiAgICAgICAgICAgcHV0X3BhZ2Uoc2htX3JwYy0+Z3Vlc3RfcGFnZSk7
Cj4+ICsKPgo+IFNwdXJpb3VzIGNoYW5nZS4KCkdvb2QgY2F0Y2guIFRoYW5rIHlvdS4KCj4KPj4g
KyAgICAgICAgLyoKPj4gKyAgICAgICAgICogVE9ETzogV2l0aCBjdXJyZW50IGltcGxlbWVudGF0
aW9uLCBPUC1URUUgd2lsbCBub3QgaXNzdWUKPj4gKyAgICAgICAgICogUlBDIHRvIGZyZWUgdGhp
cyBidWZmZXIuIEd1ZXN0IGFuZCBPUC1URUUgd2lsbCBiZSBvdXQgb2YKPj4gKyAgICAgICAgICog
c3luYzogZ3Vlc3QgYmVsaWV2ZXMgdGhhdCBpdCBwcm92aWRlZCBidWZmZXIgdG8gT1AtVEVFLAo+
PiArICAgICAgICAgKiB3aGlsZSBPUC1URUUgdGhpbmtzIG9mIG9wcG9zaXRlLiBJZGVhbGx5LCB3
ZSBuZWVkIHRvCj4+ICsgICAgICAgICAqIGVtdWxhdGUgUlBDIHdpdGggT1BURUVfTVNHX1JQQ19D
TURfU0hNX0ZSRUUgY29tbWFuZC4KPj4gKyAgICAgICAgICovCj4gQ2FuIHRoaXMgY29uZGl0aW9u
IGhhcHBlbiBpZiBYZW4gcnVucyBvdXQgb2YgbWVtb3J5PwoKWWVzLCB0aGlzIGlzIG9uZSBvZiBy
ZWFzb25zIHdoeSB0cmFuc2xhdGVfbm9uY29udGlnKCkgbWlnaHQgZmFpbC4gSXQKdXNlcyBib3Ro
IHhlbmhlYXAgdG8gYWxsb2NhdGUgZGF0YSBzdHJ1Y3R1cmUgYW5kIGRvbWhlYXAgdG8gYWxsb2Nh
dGUKcGFnZWxpc3RzIGJ1ZmZlcnMuIEFueSBvZiB0aG9zZSBjYW4gZmFpbCwgcmVzdWx0aW5nIGlu
IGluY29uc2lzdGVuY3kuCgpZb3UgZ2F2ZSBtZSBpZGVhIHRvIHB1dCBnZHByaW50aygpIHdpdGgg
YmlnIGZhdCB3YXJuaW5nIHRoZXJlLgoKLS0gCkJlc3QgcmVnYXJkcyxWb2xvZHlteXIgQmFiY2h1
awpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
