From: Amit Tomer <amittomer25@gmail.com>
Subject: Re: [PATCH v1] xen/arm: Add MVEBU UART driver for
 Armada 3700 SoC
Date: Fri, 30 Mar 2018 16:15:36 +0530
Message-ID: <CABHD4K-3J4nWwFkTFfMnc3jKZ_MKbB95s8SrVfnZ42xfDAb5AQ@mail.gmail.com>
References: <1521221662-6782-1-git-send-email-amittomer25@gmail.com>
 <89bac393-8535-d954-e6df-054fc647fb4b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hjb3=gu=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1f1rXO-0003uO-Mz
 for xen-devel@lists.xenproject.org; Fri, 30 Mar 2018 10:45:38 +0000
Received: by mail-ot0-x242.google.com with SMTP id j8-v6so1664244ota.7
 for <xen-devel@lists.xenproject.org>; Fri, 30 Mar 2018 03:45:37 -0700 (PDT)
In-Reply-To: <89bac393-8535-d954-e6df-054fc647fb4b@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, George Dunlap <George.Dunlap@eu.citrix.com>, tim@xen.org, ian.jackson@eu.citrix.com, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgo+IEkgdGVzdGVkIHRoaXMgb24gbXkgYm9hcmQgYW5kIGl0IHdvcmtzIGxpa2UgZXhw
ZWN0ZWQuIEkgd291bGQgdmVyeSBtdWNoCj4gbGlrZSB0byBzZWUgdGhpcyBkcml2ZXIgc3RpbGwg
aW4gNC4xMS4KClRoYW5rcyBmb3IgbG9va2luZyBpbnRvIGl0IGFuZCBNYW55IFRoYW5rcyBmb3Ig
dGVzdGluZyBpdCBvdXQuCgo+Cj4gU29tZSAobWlub3IpIGNvbW1lbnRzIG9uIHRoZSBjb2RlIGJl
bG93Lgo+Cj4gT24gMTYvMDMvMTggMTc6MzQsIEFtaXQgU2luZ2ggVG9tYXIgd3JvdGU6Cj4+IFRo
aXMgcGF0Y2ggYWRkcyBkcml2ZXIgZm9yIFVBUlQgY29udHJvbGxlciBmb3VuZCBvbiBBcm1hZGEg
MzcwMCBTb0MuCj4KPiBDYW4geW91IHBsZWFzZSBtZW50aW9uICJNYXJ2ZWxsIiBpbiB0aGUgc3Vi
amVjdD8KCk9rLgoKPiBUaGVzZSBzaG91bGQgYmUgaW5kZW50ZWQgYnkgb25lIHRhYiAocGx1cyB0
d28gc3BhY2VzIGZvciB0aGUgaGVscCB0ZXh0KS4KPiBJdCdzIG5vdCBvYnZpb3VzIC0gSSBnb3Qg
dGhpcyB3cm9uZyBteXNlbGYgdGhlIG90aGVyIGRheSA7LSksIGJ1dCBpdCdzCj4gaG93IHRoZSBy
ZXN0IG9mIHRoZSBmaWxlIHdvcmtzLgoKT2suCgo+IE5vIG5lZWQgZm9yIHRoZSBicmFja2V0cy4K
Ck9rLgoKPiBJbmRlbnRhdGlvbi4KCk9rLgoKPiBTbyB3aHkgZG8gd2UgbmVlZCB0aGlzIGluY2x1
ZGUgZmlsZSwgaW4gYSBzaGFyZWQgZGlyZWN0b3J5Pwo+IEFsbCB0aG9zZSBiaXRzIGFyZSBwcml2
YXRlIHRvIHRoZSBVQVJUIGRyaXZlciBhbmQgZG9uJ3QgbmVlZCB0byBiZQo+IGV4cG9zZWQgdG8g
WGVuIGF0IGFsbC4KPiBJZiBpdCdzIGFib3V0IHRoZSBlYXJseXByaW50ayBzdXBwb3J0OiB0aGF0
J3MganVzdCB0d28gdmFsdWVzIG5lZWRlZAo+IHRoZXJlLCBub3RoaW5nIHdvcnRoIGEgbmV3IGlu
Y2x1ZGUgZmlsZSwgSSB0aGluay4KPiBTbyBJIHdvdWxkIHJlY29tbWVuZCB0byBkZWNsYXJlIHRo
ZSByZXF1aXJlZCBjb25zdGFudHMgZGlyZWN0bHkgaW4gdGhlCj4gZHJpdmVyIGZpbGUuCgpZZXMs
IEkgdGhvdWdodCBlYXJseXByaW50ayBjb3VsZCBhbHNvIHVzZSBhIGNvdXBsZSBvZiBjb21tb24g
ZGVmaW5lcyBhbmQgb3RoZXIKZHJpdmVycyBkbyB0aGUgc2FtZSB3YXkuCgoKVGhhbmtzCi1BbWl0
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
