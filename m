From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH] gic:vgic: avoid excessive conversions
Date: Mon, 19 Nov 2018 14:02:41 +0200
Message-ID: <81077db3-73a0-6037-cb20-a5dd1510c95e@gmail.com>
References: <1542386727-30311-1-git-send-email-andrii.anisov@gmail.com>
 <fb41738a-282e-a633-ff60-ac3fca664cee@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sool=n6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gOiGM-0005lL-PV
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 12:02:46 +0000
Received: by mail-ed1-x52e.google.com with SMTP id f23so15902004edb.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Nov 2018 04:02:45 -0800 (PST)
In-Reply-To: <fb41738a-282e-a633-ff60-ac3fca664cee@arm.com>
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKCk9uIDE2LjExLjE4IDE5OjI3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoICFsaXN0X2VtcHR5KCZwLT5pbmZsaWdodCkgJiYKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAhdGVzdF9iaXQoR0lDX0lSUV9HVUVTVF9WSVNJ
QkxFLCAmcC0+c3RhdHVzKSApCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdpY19yYWlzZV9n
dWVzdF9pcnEodiwgcC0+aXJxLCBwLT5scGlfcHJpb3JpdHkpOwo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnaWNfcmFpc2VfZ3Vlc3RfaXJxKHYsIHApOwo+Cj4gVGhlIGludGVyZmFjZSBpcyBu
b3QgYmVoYXZpbmcgdGhlIHNhbWUgd2F5IG5vdy4gSSB1bmRlcnN0YW5kIHRoYXQgCj4gbm9ib2R5
IGlzIHVzaW5nIHRoZSAzIHBhcmFtZXRlcnMgYnV0IHRoYXQncyBhY3R1YWxseSBhIGJ1ZyB3aXRo
IHRoZSBJVFMuCj4KPiBCZWNhdXNlIHRoZSBMUEkgd2lsbCBub3QgYmUgc2V0IHdpdGggZXhwZWN0
ZWQgcHJpb3JpdHkuCkJ1dCBpdCBpcyBub3QgdGhlIGlzc3VlIG9mIHRoZSBpbnRlcmZhY2UsIHlv
dSBrbm93LiBLZWVwaW5nIGluIG1pbmQgdGhhdCAKYm90aCBhbiBpbmZsaWdodCBhbmQgYW4gbHJf
cGVuZGluZyBxdWV1ZXMgYXJlIHNvcnRlZCBieSBwLT5wcmlvcml0eSwgdGhlIApmaWVsZCBwLT5s
cGlfcHJpb3JpdHkgbG9va3Mgb2RkIGFueXdheS4KCj4+IC1leHRlcm4gdm9pZCBnaWNfcmFpc2Vf
Z3Vlc3RfaXJxKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgaXJxLAo+PiAtwqDCoMKgwqDC
oMKgwqAgdW5zaWduZWQgaW50IHByaW9yaXR5KTsKPj4gLWV4dGVybiB2b2lkIGdpY19yYWlzZV9p
bmZsaWdodF9pcnEoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCAKPj4gdmlydHVhbF9pcnEp
Owo+PiArZXh0ZXJuIHZvaWQgZ2ljX3JhaXNlX2d1ZXN0X2lycShzdHJ1Y3QgdmNwdSAqdiwgc3Ry
dWN0IHBlbmRpbmdfaXJxICpwKTsKPj4gK2V4dGVybiB2b2lkIGdpY19yYWlzZV9pbmZsaWdodF9p
cnEoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCAKPj4gcGVuZGluZ19pcnEgKm4pOwo+Cj4gVGhhdCBj
b2RlIGlzIG5vdCBnb2luZyB0byBjb21waWxlIHdpdGggdGhlIG5ldyB2R0lDIGFzIHBlbmRpbmdf
aXJxIAo+IG9ubHkgZXhpc3RzIGZvciB0aGUgY3VycmVudCB2R0lDLgoKWWVwLCBJIGRpZCBtaXNz
IHRoYXQuCgpJIGd1ZXNzIHdyYXBwaW5nIGl0IHdpdGggYCNpZm5kZWYgQ09ORklHX05FV19WR0lD
YCBtdXN0IGJlIGVub3VnaCBoZXJlLiAKVGhvc2UgdHdvIGZ1bmN0aW9ucyBhcmUgbm90IHVzZWQg
YnksIG5vciBkZWZpbmVkIGJ5IG5ldy12Z2ljLgoKCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlz
b3YuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
