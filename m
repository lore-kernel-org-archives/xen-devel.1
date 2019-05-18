From: Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] config.sub: Update config.sub to latest
 version
Date: Sat, 18 May 2019 10:51:43 +0100
Message-ID: <CAK9nU=r9=6VysMPSQXWnQS1ge_7S9aRNeBRPyhmPW0bXbTD8ew@mail.gmail.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
 <20190516111330.GA32248@aepfle.de>
 <20190516113902.GZ2798@zion.uk.xensource.com>
 <20190516151819.168c6b36.olaf@aepfle.de>
 <20190516133037.GH2798@zion.uk.xensource.com>
 <CAKmqyKPjkTJEHe_AR7sqZ+Od34A6ZTU4-N0+rYpLAS1h2HoL6g@mail.gmail.com>
 <20190517163756.GP2798@zion.uk.xensource.com>
 <CAKmqyKPp-vPFYxykbAEJ+8KfyUbhhNBJC0jOrmWkNPzFcZEw5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qPpN=TS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hRw0a-00051L-Vh
 for xen-devel@lists.xenproject.org; Sat, 18 May 2019 09:52:05 +0000
Received: by mail-lj1-f195.google.com with SMTP id h21so8317129ljk.13
 for <xen-devel@lists.xenproject.org>; Sat, 18 May 2019 02:52:03 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id h25sm2204548ljb.80.2019.05.18.02.52.00
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 May 2019 02:52:00 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id n22so6978192lfe.12
 for <xen-devel@lists.xenproject.org>; Sat, 18 May 2019 02:52:00 -0700 (PDT)
In-Reply-To: <CAKmqyKPp-vPFYxykbAEJ+8KfyUbhhNBJC0jOrmWkNPzFcZEw5g@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alistair Francis <alistair23@gmail.com>
Cc: Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAxNyBNYXkgMjAxOSBhdCAyMzo0MywgQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIy
M0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPaywgSSBoYXZlIHVwZGF0ZWQgdGhlIHBh
dGNoIHRvIHJlbW92ZSB0aGUgY29uZmlndXJlIHNjcmlwdCwgYnV0IHdlCj4gPiA+IHN0aWxsIGFy
ZSBzdHVjayB3aXRoIGNvbmZpZy5zdWIgYW5kIGNvbmZpZy5ndWVzcyBhcyB3ZSBhcmUgdXNpbmcg
dGhlCj4gPiA+IEFDX0NBTk9OSUNBTF9IT1NUIG1hY3JvIFsxXS4gSSB3aWxsIHNlbmQgYSB2MiB0
aGF0IHJlbW92ZXMgdGhlCj4gPiA+IGNvbmZpZ3VyZSBzY3JpcHQsIGJ1dCB0aGlzIHBhdGNoIGlz
IHN0aWxsIHJlcXVpcmVkLgo+ID4gPgo+ID4gPiAxOiBodHRwczovL3d3dy5nbnUub3JnL3NvZnR3
YXJlL2F1dG9jb25mL21hbnVhbC9hdXRvY29uZi5odG1sI0Nhbm9uaWNhbGl6aW5nCj4gPiA+Cj4g
Pgo+ID4gQmVmb3JlIHlvdSBnbyBhd2F5IGFuZCBkbyB3b3JrLCBwbGVhc2Ugd2FpdCBmb3IgcmVw
bHkgZnJvbSBJYW4uCj4KPiBJIGhhZCBhbHJlYWR5IGRvbmUgYWxsIHRoZSB3b3JrIHNvIEkgc2Vu
dCBhIHYyLiBXZSBjYW4gaGF2ZSB0aGUKPiBkaXNjdXNzaW9uIHRoZXJlLCBpdCBzdGlsbCBoYXMg
dGhpcyBwYXRjaCAobW9yZSBvciBsZXNzKSBhcyBwYXRjaCAxLgo+CgpPSy4gVGhhdCdzIGZpbmUg
YnkgbWUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
