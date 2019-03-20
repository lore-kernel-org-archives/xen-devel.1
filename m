From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxc: fix HVM core dump
Date: Wed, 20 Mar 2019 15:40:22 +0000
Message-ID: <20190320154022.GS14641@zion.uk.xensource.com>
References: <20190319160231.17120-1-wei.liu2@citrix.com>
 <23698.17642.853194.637427@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OKdL=RX=citrix.com=prvs=975c6da73=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h6dKg-00028l-Dn
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2019 15:40:46 +0000
Content-Disposition: inline
In-Reply-To: <23698.17642.853194.637427@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Igor Druzhinin <igor.druzhinin@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMjAsIDIwMTkgYXQgMDE6NDk6MzBQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJbUEFUQ0hdIGxpYnhjOiBmaXggSFZNIGNvcmUgZHVtcCIp
Ogo+ID4gZjk2OWJjOWZjOTYgZm9yYmlkIGdldF9hZGRyZXNzX3NpemUgY2FsbCBvbiBIVk0gZ3Vl
c3RzLCBiZWNhdXNlIHRoYXQKPiA+IGRpZG4ndCBtYWtlIHNlbnNlLiBJdCBicm9rZSBjb3JlIGR1
bXAgZnVuY3Rpb25hbGl0eSBvbiBIVk0gYmVjYXVzZQo+ID4gbGlieGMgdW5jb25kaXRpb25hbGx5
IGFza2VkIGZvciBndWVzdCB3aWR0aC4KPiAuLi4KPiA+ICsgICAgaWYgKCAhYXV0b190cmFuc2xh
dGVkX3BoeXNtYXAgJiYKPiA+ICsgICAgICAgICB4Y19kb21haW5fZ2V0X2d1ZXN0X3dpZHRoKHhj
aCwgZG9taWQsICZkaW5mby0+Z3Vlc3Rfd2lkdGgpICE9IDAgKQo+ID4gKyAgICB7Cj4gPiArICAg
ICAgICBQRVJST1IoIkNvdWxkIG5vdCBnZXQgYWRkcmVzcyBzaXplIGZvciBkb21haW4iKTsKPiA+
ICsgICAgICAgIGdvdG8gb3V0Owo+ID4gKyAgICB9Cj4gCj4gRGlkIHlvdSBjb25zaWRlciBhbmQg
cmVqZWN0IHRoZSBvcHRpb24gb2Ygd3JpdGluZzoKPiAKPiAgICAgaWYgKCBhdXRvX3RyYW5zbGF0
ZWRfcGh5c21hcCApIHsKPiAgICAgICAgICAuLi4geGNfZG9tYWluX2dldF9ndWVzdF93aWR0aCgs
LCZkaW5mby0+Z3Vlc3Rfd2lkdGgsLCkgLi4uCj4gICAgIH0gZWxzZSB7Cj4gICAgICAgICAgZGlu
Zm8tPmd1ZXN0X3dpZHRoID0gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpCj4gICAgIH0KPiAKPiBUaGlz
IGlzIHBlcmhhcHMgbGVzcyBsaWtlbHkgdG8gbGVhdmUgZGluZm8tPmd1ZXN0X3dpZHRoIGFzIGFu
Cj4gdW5pbml0aWFsaXNlZCBoYXphcmQuCgpXb3JrcyBmb3IgbWUgdG9vLgoKV2VpLgoKPiAKPiBJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
