From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v4] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Tue, 25 Sep 2018 10:36:20 -0600
Message-ID: <CABfawhky-DWCZios8eqnw-vG_imCz4zuHWOVZgnQpFdJxCKdsA@mail.gmail.com>
References: <20180903154734.25361-1-apop@bitdefender.com>
 <CABfawh=MDOR=gDD7L5fb98p3iPEWdp63NgJEQaZMVFPczB-PBg@mail.gmail.com>
 <e96fa011-6355-4b23-0190-556a9c2ce48f@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mcb4=mh=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1g4qKb-0008IS-JZ
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 16:37:01 +0000
Received: by mail-ed1-f67.google.com with SMTP id h4-v6so19904701edi.6
 for <xen-devel@lists.xenproject.org>; Tue, 25 Sep 2018 09:37:00 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49])
 by smtp.gmail.com with ESMTPSA id d26-v6sm5164742edp.44.2018.09.25.09.36.58
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Sep 2018 09:36:58 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id y13-v6so9574924wmi.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Sep 2018 09:36:58 -0700 (PDT)
In-Reply-To: <e96fa011-6355-4b23-0190-556a9c2ce48f@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Adrian Pop <apop@bitdefender.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMjUsIDIwMTggYXQgOTowNCBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gT24gOS8xOS8xOCA2OjI5IFBNLCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPiBPbiBNb24sIFNlcCAzLCAyMDE4IGF0IDk6NDcgQU0gQWRyaWFu
IFBvcCA8YXBvcEBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+ID4+IGRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oIGIveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1f
b3AuaAo+ID4+IGluZGV4IGJiYmE5OWU1ZjUuLmJiYjBhYTk4NGEgMTAwNjQ0Cj4gPj4gLS0tIGEv
eGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaAo+ID4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1
YmxpYy9odm0vaHZtX29wLmgKPiA+PiBAQCAtMjM0LDYgKzIzNCw3IEBAIHN0cnVjdCB4ZW5faHZt
X2FsdHAybV92aWV3IHsKPiA+PiAgdHlwZWRlZiBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fdmlldyB4
ZW5faHZtX2FsdHAybV92aWV3X3Q7Cj4gPj4gIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9o
dm1fYWx0cDJtX3ZpZXdfdCk7Cj4gPj4KPiA+PiArI2lmIF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9O
X18gPCAweDAwMDQwYTAwCj4gPj4gIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zZXRfbWVtX2FjY2Vz
cyB7Cj4gPj4gICAgICAvKiB2aWV3ICovCj4gPj4gICAgICB1aW50MTZfdCB2aWV3Owo+ID4+IEBA
IC0yNDUsNiArMjQ2LDE5IEBAIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zZXRfbWVtX2FjY2VzcyB7
Cj4gPj4gIH07Cj4gPj4gIHR5cGVkZWYgc3RydWN0IHhlbl9odm1fYWx0cDJtX3NldF9tZW1fYWNj
ZXNzIHhlbl9odm1fYWx0cDJtX3NldF9tZW1fYWNjZXNzX3Q7Cj4gPj4gIERFRklORV9YRU5fR1VF
U1RfSEFORExFKHhlbl9odm1fYWx0cDJtX3NldF9tZW1fYWNjZXNzX3QpOwo+ID4+ICsjZW5kaWYg
LyogX19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXyA8IDB4MDAwNDBhMDAgKi8KPiA+PiArCj4gPj4g
K3N0cnVjdCB4ZW5faHZtX2FsdHAybV9tZW1fYWNjZXNzIHsKPiA+PiArICAgIC8qIHZpZXcgKi8K
PiA+PiArICAgIHVpbnQxNl90IHZpZXc7Cj4gPj4gKyAgICAvKiBNZW1vcnkgdHlwZSAqLwo+ID4+
ICsgICAgdWludDE2X3QgaHZtbWVtX2FjY2VzczsgLyogeGVubWVtX2FjY2Vzc190ICovCj4gPgo+
ID4gQSBzdHJ1Y3R1cmUgbmFtZSB3aXRoICJtZW1fYWNjZXNzIiBoYXZpbmcgYSB2YXJpYWJsZSBu
YW1lCj4gPiAiaHZtbWVtX2FjY2VzcyIgYW5kIGEgY29tbWVudCBzYXlpbmcgInhlbm1lbV9hY2Nl
c3MiLiBUaGlzIGlzCj4gPiBjb25mdXNpbmcuIEkgdW5kZXJzdGFuZCB0aGF0IHlvdSBjb3B5L3Bh
c3RlZCB0aGlzIGZyb20gdGhlIGV4aXN0aW5nIG9wCj4gPiBidXQgaXQgZG9lc24ndCBsb29rIGdv
b2QuIFBlcmhhcHMgZml4IGJvdGggaWYgd2UgYXJlIHRvdWNoaW5nIGl0Pwo+ID4gQWxzbywgaW4g
cHVibGljL21lbW9yeS5oIHRoZSB3aWR0aCBvZiBhY2Nlc3MgaXMgdWludDhfdCBzbyBJJ20gbm90
Cj4gPiBzdXJlIHdoeSB0aGUgZGlzY3JlcGFuY3kuCj4KPiBUaGUgdWludDE2X3QgaGFzIGJlZW4g
cHJvYmFibHkgY2hvc2VuIHRvIGJlIHRoYXQgYmVjYXVzZSBpdCBzaW1wbGlmaWVzCj4gcGFkZGlu
Zy4gSSBjYW4gcmVuYW1lICJodm1tZW1fYWNjZXNzIiB0byBzaW1wbHkgImFjY2VzcyIuIFNob3Vs
ZCBJIGp1c3QKPiByZW1vdmUgdGhlIGNvbW1lbnQsIG9yIGRvIHlvdSB0aGluayBzb21ldGhpbmcg
ZWxzZSBpcyBtb3JlIGFwcHJvcHJpYXRlPwoKSnVzdCByZW5hbWluZyB0aGUgdmFyaWFibGUgc2hv
dWxkIHN1ZmZpY2UsIHRoZSBjb21tZW50IGlzIGhlbHBmdWwgdG8KZXhwbGFpbiB3aGF0IHZhbHVl
cyBnbyBpbiB0aGUgZmllbGQuCgpUaGFua3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
