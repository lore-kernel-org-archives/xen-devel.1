From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v5 1/3] x86/mm: Change default value for
 suppress #VE in set_mem_access()
Date: Tue, 11 Sep 2018 12:08:42 -0600
Message-ID: <CABfawhmzq2hB5Mg0=20pN3xsCBE0XR=mO0rg6g0QRWucZcm=XA@mail.gmail.com>
References: <20180903154836.25708-1-apop@bitdefender.com>
 <20180903154836.25708-2-apop@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xxmq=lz=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1fzn6I-0005D3-T6
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 18:09:22 +0000
Received: by mail-ed1-f68.google.com with SMTP id s10-v6so19946985edb.11
 for <xen-devel@lists.xenproject.org>; Tue, 11 Sep 2018 11:09:21 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43])
 by smtp.gmail.com with ESMTPSA id i19-v6sm9951531edg.64.2018.09.11.11.09.19
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Sep 2018 11:09:19 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id z96-v6so27021665wrb.8
 for <xen-devel@lists.xenproject.org>; Tue, 11 Sep 2018 11:09:19 -0700 (PDT)
In-Reply-To: <20180903154836.25708-2-apop@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Adrian Pop <apop@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Vlad-Ioan TOPAN <itopan@bitdefender.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBTZXAgMywgMjAxOCBhdCA5OjQ4IEFNIEFkcmlhbiBQb3AgPGFwb3BAYml0ZGVmZW5k
ZXIuY29tPiB3cm90ZToKPgo+IEZyb206IFZsYWQgSW9hbiBUb3BhbiA8aXRvcGFuQGJpdGRlZmVu
ZGVyLmNvbT4KPgo+IFRoZSBkZWZhdWx0IHZhbHVlIGZvciB0aGUgInN1cHByZXNzICNWRSIgYml0
IHNldCBieSBzZXRfbWVtX2FjY2VzcygpCj4gY3VycmVudGx5IGRlcGVuZHMgb24gd2hldGhlciB0
aGUgY2FsbCBpcyBtYWRlIGZyb20gdGhlIHNhbWUgZG9tYWluICh0aGUKPiBiaXQgaXMgc2V0IHdo
ZW4gY2FsbGVkIGZyb20gYW5vdGhlciBkb21haW4gYW5kIGNsZWFyZWQgaWYgY2FsbGVkIGZyb20K
PiB0aGUgc2FtZSBkb21haW4pLiBUaGlzIHBhdGNoIGNoYW5nZXMgdGhhdCBiZWhhdmlvciB0byBp
bmhlcml0IHRoZSBvbGQKPiBzdXBwcmVzcyAjVkUgYml0IHZhbHVlIGlmIGl0IGlzIGFscmVhZHkg
c2V0IGFuZCB0byBzZXQgaXQgdG8gMQo+IG90aGVyd2lzZSwgd2hpY2ggaXMgc2FmZXIgYW5kIG1v
cmUgcmVsaWFibGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBWbGFkIElvYW4gVG9wYW4gPGl0b3BhbkBi
aXRkZWZlbmRlci5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBvcCA8YXBvcEBiaXRkZWZl
bmRlci5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgfCAzICstLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyBiL3hlbi9hcmNoL3g4Ni9tbS9t
ZW1fYWNjZXNzLmMKPiBpbmRleCA4NGQyNjBlYmQ4Li5lMTUyMmEwYjc1IDEwMDY0NAo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vbWVt
X2FjY2Vzcy5jCj4gQEAgLTI4NCw4ICsyODQsNyBAQCBpbnQgcDJtX3NldF9hbHRwMm1fbWVtX2Fj
Y2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcDJtX2RvbWFpbiAqaHAybSwKPiAgICAgICAg
ICB9Cj4gICAgICB9Cj4KPiAtICAgIHJldHVybiBhcDJtLT5zZXRfZW50cnkoYXAybSwgZ2ZuLCBt
Zm4sIFBBR0VfT1JERVJfNEssIHQsIGEsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGN1
cnJlbnQtPmRvbWFpbiAhPSBkKTsKCkNvdWxkIHlvdSBhZGQgYSBjb21tZW50IGhlcmUgc2F5aW5n
ICJpbmhlcml0IHRoZSBvbGQgc3VwcHJlc3MgI1ZFIGJpdAp2YWx1ZSBpZiBpdCBpcyBhbHJlYWR5
IHNldCBhbmQgdG8gc2V0IGl0IHRvIDEgb3RoZXJ3aXNlIiB0byBleHBsYWluCnRoZSBtZWFuaW5n
IG9mIHRoZSBtYWdpYyAtMSB2YWx1ZT8KClRoYW5rcywKVGFtYXMKCj4gKyAgICByZXR1cm4gYXAy
bS0+c2V0X2VudHJ5KGFwMm0sIGdmbiwgbWZuLCBQQUdFX09SREVSXzRLLCB0LCBhLCAtMSk7Cj4g
IH0KPgo+ICBzdGF0aWMgaW50IHNldF9tZW1fYWNjZXNzKHN0cnVjdCBkb21haW4gKmQsIHN0cnVj
dCBwMm1fZG9tYWluICpwMm0sCj4gLS0KPiAyLjE4LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
