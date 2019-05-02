From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2] x86/vmx: correctly gather gs_shadow
 value for current vCPU
Date: Thu, 2 May 2019 07:14:25 -0600
Message-ID: <CABfawh=8KdyEgnW8kdy02JrLpW-MJE0X2JYGJ0EsWEdV_J8csQ@mail.gmail.com>
References: <20190501235203.1179-1-tamas@tklengyel.com>
 <3b239422-9639-2691-19fe-2a7a00f7a52f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bVeI=TC=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hMBYH-0002ms-LN
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:15:05 +0000
Received: by mail-wm1-f49.google.com with SMTP id j13so2791930wmh.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 06:15:03 -0700 (PDT)
In-Reply-To: <3b239422-9639-2691-19fe-2a7a00f7a52f@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCA0OjQ2IEFNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gMDIvMDUvMjAxOSAwMDo1MiwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5j
IGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiA+IGluZGV4IDI4M2ViN2IzNGQuLjUxNTRl
Y2MyYTggMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+ID4gKysr
IGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiA+IEBAIC03NzksMTIgKzc3OSwxNyBAQCBz
dGF0aWMgdm9pZCB2bXhfbG9hZF9jcHVfc3RhdGUoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCBodm1f
aHdfY3B1ICpkYXRhKQo+ID4KPiA+ICBzdGF0aWMgdm9pZCB2bXhfc2F2ZV92bWNzX2N0eHQoc3Ry
dWN0IHZjcHUgKnYsIHN0cnVjdCBodm1faHdfY3B1ICpjdHh0KQo+ID4gIHsKPiA+ICsgICAgaWYg
KCB2ID09IGN1cnJlbnQgKQo+ID4gKyAgICAgICAgdm14X3NhdmVfZ3Vlc3RfbXNycyh2KTsKPiA+
ICsKPiA+ICAgICAgdm14X3NhdmVfY3B1X3N0YXRlKHYsIGN0eHQpOwo+ID4gICAgICB2bXhfdm1j
c19zYXZlKHYsIGN0eHQpOwo+ID4gIH0KPiA+Cj4gPiAgc3RhdGljIGludCB2bXhfbG9hZF92bWNz
X2N0eHQoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCBodm1faHdfY3B1ICpjdHh0KQo+ID4gIHsKPiA+
ICsgICAgQVNTRVJUKHYgIT0gY3VycmVudCk7Cj4KPiBJJ2QgbGVhdmUgYSBjb21tZW50IGFsb25n
IHRoZSBsaW5lcyBvZiAvKiBOb3QgY3VycmVudGx5IHNhZmUgdG8gdXNlIGluCj4gY3VycmVudCBj
b250ZXh0LiAqLwo+Cj4gQ2FuIGJlIGZpeGVkIHVwIG9uIGNvbW1pdC4KPgo+IFRoaXMgdmVyc2lv
biBpcyBtdWNoIGNsZWFuZXIsIGFyY2hpdGVjdHVyYWxseSBzcGVha2luZywgc28gUmV2aWV3ZWQt
Ynk6Cj4gQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPgo+IEknbGwg
ZHJvcCB0aGUgcHJldmlvdXMgdmVyc2lvbiBvdXQgb2YgeDg2LW5leHQuCgpUaGFua3MsClRhbWFz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
